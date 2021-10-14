<?php

namespace WHMCS\Module\Widget;

use WHMCS\Carbon;
use WHMCS\Log\Activity as ActivityLog;
use WHMCS\Module\AbstractWidget;

/**
 * Activity Widget.
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2021
 * @license https://www.whmcs.com/eula/ WHMCS Eula
 */
class Activity extends AbstractWidget
{
    protected $title = 'Activity';
    protected $description = 'Recent system activity.';
    protected $weight = 120;
    protected $cache = true;
    protected $requiredPermission = 'View Activity Log';

    public function getData()
    {
        return localAPI('GetActivityLog', array('limitstart' => 0, 'limitnum' => 10));
    }

    public function generateOutput($data)
    {
        $log = new ActivityLog();

        $output = '';
        foreach ($data['activity']['entry'] as $entry) {

            $date = Carbon::createFromFormat('Y-m-d H:i:s', $entry['date']);

            $description = $entry['description'];
            if ($entry['userid']) {
                $userLabel = ' - User ID: ' . $entry['userid'];
                if (!strpos($description, $userLabel)) {
                    $description .= $userLabel;
                }
            }

            $output .= '
                <div class="feed-element">
                    <div>
                        <small class="pull-right text-navy">' . $date->diffForHumans() . '</small>
                        <strong>' . $entry['username'] . '</strong>
                        <div>' . $log->autoLink($description) . '</div>
                        <small class="text-muted">' . $entry['ipaddress'] . '</small>
                    </div>
                </div>';
        }

        return <<<EOF
<div class="widget-content-padded">
    {$output}
</div>
EOF;
    }
}
