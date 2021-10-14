<?php

namespace WHMCS\Module\Widget;

use WHMCS\Carbon;
use WHMCS\Module\AbstractWidget;
use WHMCS\User\AdminLog;

/**
 * Staff Widget.
 *
 * @copyright Copyright (c) WHMCS Limited 2005-2021
 * @license https://www.whmcs.com/eula/ WHMCS Eula
 */
class Staff extends AbstractWidget
{
    protected $title = 'Staff Online';
    protected $description = 'An overview of staff.';
    protected $weight = 300;
    protected $cache = true;
    protected $cacheExpiry = 60;

    public function getData()
    {
        return AdminLog::with('admin')->online()->get();
    }

    public function generateOutput($data)
    {
        $staffOutput = '';
        //phpcs:disable
        foreach ($data as $session) {
            $staffOutput .= '<div class="staff">'
                . '<img src="https://www.gravatar.com/avatar/' . $session['admin']['gravatarHash'] . '?s=60&d=mp" width="60" height="60" alt="Gravatar"/>'
                . '<div class="name">' . $session['admin']['firstname'] . ' ' . $session['admin']['lastname'] . '</div>'
                . '<div class="note text-muted">'
                . Carbon::createFromFormat('Y-m-d H:i:s', $session['lastvisit'])->diffForHumans() . '</div>'
                . '</div>';
        }
        //phpcs:enable

        return <<<EOF
    <div class="widget-staff-container clearfix">
        {$staffOutput}
    </div>
EOF;
    }
}
