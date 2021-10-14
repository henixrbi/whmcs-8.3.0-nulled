<?php

namespace WHMCS\Module\Widget;

use WHMCS\Module\AbstractWidget;

/**
 * Health Widget.
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2021
 * @license https://www.whmcs.com/eula/ WHMCS Eula
 */
class Health extends AbstractWidget
{
    protected $title = 'System Health';
    protected $description = 'An overview of System Health.';
    protected $weight = 500;
    protected $cache = true;
    protected $requiredPermission = 'Health and Updates';

    public function getData()
    {
        return localApi('GetHealthStatus', array());
    }

    public function generateOutput($data)
    {
        if (
            !is_array($data)
            ||
            empty($data['result'])
            ||
            $data['result'] === 'error'
        ) {
            /*
             * A previous version may have cached an erroneous response due to PHP 7.4 not being itemized
             * in Php environment class. We can retry obtaining that data
             */
            $data = $this->fetchData(true);
        }

        $countSuccess = count($data['checks']['success'] ?? []);
        $countWarnings = count($data['checks']['warning'] ?? []);
        $countDanger = count($data['checks']['danger'] ?? []);

        $totalCount = $countSuccess + $countDanger;

        $countPercent = $totalCount > 0
            ? round (($countSuccess / $totalCount) * 100, 0)
            : 100; // fallback to avoid dividing by 0

        $ratingMsg = '<span style="color:#49a94d;">Good</span>';
        $ratingIcon = '<i class="pe-7s-help2" style="color:#49a94d;"></i>';
        if ($countPercent < 50) {
            $ratingMsg = '<span class="color-pink">Poor</span>';
            $ratingIcon = '<i class="pe-7s-close-circle color-pink"></i>';
        }

        return <<<EOF
<div class="widget-content-padded icon-stats">

    <div class="row">
        <div class="col-sm-7">
            <div class="item">
                <div class="icon-holder text-center">
                    {$ratingIcon}
                </div>
                <div class="data">
                    <div class="note">
                        Overall Rating
                    </div>
                    <div class="number">
                        {$ratingMsg}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5 text-right">
            <a href="systemhealthandupdates.php" class="btn btn-default btn-sm">
                <i class="fas fa-arrow-right"></i> View Issues
            </a>
        </div>
    </div>

    <div class="clear:both;"></div>

    <div class="progress">
        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="{$countPercent}" aria-valuemin="0" aria-valuemax="100" style="width: {$countPercent}%">
            <span class="sr-only">{$countPercent}% Complete (success)</span>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6 text-center">
            <i class="fas fa-exclamation-triangle"></i> {$countWarnings} Warnings
        </div>
        <div class="col-sm-6 text-center text-danger">
            <i class="fas fa-times"></i> {$countDanger} Needing Attention
        </div>
    </div>

</div>
EOF;
    }
}
