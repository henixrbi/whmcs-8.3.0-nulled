<?php

namespace WHMCS\Module\Widget;

use WHMCS\Module\AbstractWidget;

/**
 * Billing Widget.
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2021
 * @license https://www.whmcs.com/eula/ WHMCS Eula
 */
class Billing extends AbstractWidget
{
    protected $title = 'Billing';
    protected $description = 'An overview of billing.';
    protected $weight = 150;
    protected $cache = true;
    protected $requiredPermission = 'View Income Totals';

    public function getData()
    {
        $incomeStats = getAdminHomeStats('income');
        foreach ($incomeStats['income'] as $key => $value) {
            $incomeStats['income'][$key] = $value->toPrefixed();
        }
        return $incomeStats;
    }

    public function generateOutput($data)
    {
        $incomeToday = $data['income']['today'];
        $incomeThisMonth = $data['income']['thismonth'];
        $incomeThisYear = $data['income']['thisyear'];
        $incomeAllTime = $data['income']['alltime'];

        return <<<EOF
<div class="row">
    <div class="col-sm-6 bordered-right">
        <div class="item">
            <div class="data color-green">{$incomeToday}</div>
            <div class="note">Today</div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="item">
            <div class="data color-orange">{$incomeThisMonth}</div>
            <div class="note">This Month</div>
        </div>
    </div>
    <div class="col-sm-6 bordered-right bordered-top">
        <div class="item">
            <div class="data color-pink">{$incomeThisYear}</div>
            <div class="note">This Year</div>
        </div>
    </div>
    <div class="col-sm-6 bordered-top">
        <div class="item">
            <div class="data">{$incomeAllTime}</div>
            <div class="note">All Time</div>
        </div>
    </div>
</div>
EOF;
    }
}
