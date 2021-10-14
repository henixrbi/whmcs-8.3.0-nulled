<div id="oxSuccess" class="alert alert-success w-hidden"></div>
<div id="oxLoadError" class="alert alert-success w-hidden"></div>

<div class="card mb-4">
    <div class="card-body">
        <h3 class="card-title">{lang key='store.ox.manage'}</h3>
        <p>{lang key='ox.intro'}</p>

        <div class="btn-toolbar justify-content-between mb-1" role="toolbar">
            <div class="btn-group" role="group">
                <form action="{$upgradeUrl}" method="post">
                    <input type="hidden" name="isproduct" value="{$isService}">
                    <input type="hidden" name="serviceid" value="{$model->id}">
                    <button type="submit" class="btn btn-secondary btn-sm">
                        <i class="fal fa-arrow-circle-up fa-fw"></i>
                        {lang key='upgrade'}
                    </button>
                </form>
            </div>
            <div class="btn-group btn-group-sm" role="group">
                <button id="btnAddAccount" type="button" class="btn btn-primary btn-sm">
                    <i class="fal fa-plus"></i>
                    {lang key='ox.createUser'}
                </button>
                <button id="btnRefresh" type="button" class="btn btn-sm btn-default disabled" disabled="disabled">
                    <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                    {lang key='ox.refresh'}
                </button>
            </div>
        </div>

        <div id="accountCount">{lang key='ox.accountCount' number='-' limit=$model->qty}</div>

        <table class="table table-striped" style="display: table">
            <thead>
                <tr>
                    <th>{lang key='ox.emailAddress'}</th>
                    <th class="w-25">{lang key='ox.mailboxSize'}</th>
                    <th class="w-50 invisible">
                        <div class="btn-group" role="group" aria-disabled="true">
                            <button class="btn btn-default btn-sm" aria-disabled="true">{lang key='ox.manageAccount'}</button>
                            <button class="btn btn-default btn-sm" aria-disabled="true">{lang key='ox.setPassword'}</button>
                            <button class="btn btn-danger btn-sm" aria-disabled="true">{lang key='ox.delete'}</button>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody id="tableBodyAccounts">
                 <tr class="loading">
                    <td class="text-center" colspan="3">
                        <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                        {lang key='loading'}
                    </td>
                </tr>
                <tr class="no-accounts w-hidden">
                    <td class="text-center" colspan="3">{lang key='ox.noAccounts'}</td>
                </tr>
            </tbody>
            <tr class="clone w-hidden" data-account-id="" data-account="" data-first-name="" data-last-name="" data-display-name="">
                <td><span class="account"></span>@{$domain}</td>
                <td><span class="limit"></span>GB</td>
                <td class="text-right">
                    <div class="btn-group" role="group">
                        <button class="btn btn-default btn-sm manage-account">{lang key='ox.manageAccount'}</button>
                        <button class="btn btn-default btn-sm set-ox-password">{lang key='ox.setPassword'}</button>
                        <button class="btn btn-danger btn-sm ox-delete">{lang key='ox.delete'}</button>
                    </div>
                </td>
            </tr>
        </table>

    </div>
</div>

<ul class="nav nav-tabs responsive-tabs-sm">
    <li class="nav-item">
        <a href="#retrievalsettings" class="nav-link active" data-toggle="tab">
            <i class="far fa-envelope fa-fw"></i>
            {lang key='ox.settings.retrieval'}
        </a>
    </li>
    <li class="nav-item">
        <a href="#davsettings" class="nav-link"  data-toggle="tab">
            <i class="far fa-calendar-alt fa-fw"></i>
            {lang key='ox.settings.davSettings'}
        </a>
    </li>
    <li class="nav-item">
        <a href="#usage" class="nav-link"  data-toggle="tab">
            <i class="far fa-file-alt fa-fw"></i>
            {lang key='ox.settings.usageInstructions'}
        </a>
    </li>
    <li class="nav-item w-hidden" id="migrationNav">
        <a href="#migration" class="nav-link"  data-toggle="tab">
            <i class="far fa-file-alt fa-fw"></i>
            {lang key='ox.settings.migrationTitle'}
        </a>
    </li>
</ul>
<div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
<div class="tab-content product-details-tab-container w-text-09 mb-4">
    <div class="tab-pane fade show active" id="retrievalsettings">
        <p>{lang key='ox.settings.retrievalIntro'}</p>
        <table class="table">
            <tbody>
                <tr>
                    <td>{lang key='ox.settings.username'}</td>
                    <td>{lang key='ox.settings.email' domain=$domain}</td>
                </tr>
                <tr>
                    <td>{lang key='clientareapassword'}</td>
                    <td>{lang key='ox.settings.password'}</td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.pop'}</td>
                    <td>
                        <span class="pop-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="pop-port"></span>
                    </td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.incoming'}</td>
                    <td>
                        <span class="incoming-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="incoming-port"></span>
                    </td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.outgoing'}</td>
                    <td>
                        <span class="outgoing-hostname">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span><br>
                        <span class="outgoing-port"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade" id="davsettings">
        <p>{lang key='ox.settings.davSettingsIntro'}</p>
        <table class="table">
            <tbody>
                <tr>
                    <td>{lang key='ox.settings.username'}</td>
                    <td>{lang key='ox.settings.email' domain=$domain}</td>
                </tr>
                <tr>
                    <td>{lang key='clientareapassword'}</td>
                    <td>{lang key='ox.settings.caldavPassword'}</td>
                </tr>
                <tr>
                    <td>{lang key='ox.settings.serverUrl'}</td>
                    <td>
                        <span class="calendar-server">
                            <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                            {lang key='loading'}
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade" id="usage">
        <table class="table">
            <thead id="tablePanelUsageHead">
                <tr class="loading">
                    <td>
                        <i class="fas fa-sync-alt fa-spin" aria-hidden="true"></i>
                        {lang key='loading'}
                    </td>
                </tr>
            </thead>
            <tbody id="tablePanelUsage">
            </tbody>
        </table>
    </div>
    <div class="tab-pane fade w-hidden" id="migration">
        <p>{lang key="ox.settings.migrationIntro"}</p>
        <div>
            <a class="migration-url btn btn-info btn-block btn-lg" href="#" target="_blank"
                >{lang key="ox.settings.migrationLaunch"}</a>
        </div>
    </div>
</div>

<form id="frmOxAddAccount" action="{$addAccountUrl}" method="post">
    <div class="modal fade" id="modalAddAccount">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalAddAccountTitle">
                        {lang key='ox.createUser'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputFirstName">{lang key='orderForm.firstName'}</label>
                                <input id="inputFirstName" type="text" autocomplete="off" class="form-control required" name="first">
                                <span class="field-error-msg">{lang key='ox.required.firstName'}</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputLastName">{lang key='orderForm.lastName'}</label>
                                <input id="inputLastName" type="text" autocomplete="off" class="form-control required" name="last">
                                <span class="field-error-msg">{lang key='ox.required.lastName'}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputDisplayName">{lang key='ox.displayName'}</label>
                                <input id="inputDisplayName" type="text" autocomplete="off" class="form-control required" name="display">
                                <span class="field-error-msg">{lang key='ox.required.displayName'}</span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputEmailAddress">{lang key='orderForm.emailAddress'}</label>
                                <div class="input-group">
                                    <input id="inputEmailAddress" type="text" autocomplete="off" class="form-control required" name="email">
                                    <div class="input-group-append"><span class="input-group-text">@{$domain}</span></div>
                                </div>
                                <span class="field-error-msg">{lang key='ox.required.email'}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputPassword">{lang key='clientareapassword'}</label>
                                <div class="input-group">
                                    <input type="password" class="form-control required" name="password" id="inputPassword" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-default generate-password" data-targetfields="inputPassword,inputConfirmPassword">
                                            {lang key="generatePassword.btnShort"}
                                        </button>
                                    </div>
                                </div>
                                <span class="field-error-msg">{lang key='ox.required.password'}</span>
                                <div class="password-strength-meter">
                                    <div class="progress" style="height: 10px; margin-top: 10px">
                                        <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                        </div>
                                    </div>
                                    <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key="pwstrength"}: {lang key="pwstrengthenter"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputConfirmPassword">{lang key='clientareaconfirmpassword'}</label>
                                <input id="inputConfirmPassword" type="password" autocomplete="off" class="form-control required match" data-match-field="inputPassword" name="password2">
                                <span class="field-error-msg">{lang key='ox.required.passwordMatch'}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='orderForm.add'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxManageAccount" action="{$manageAccountUrl}" method="post">
    <div class="modal fade" id="modalManageAccount">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalManageAccountTitle">
                        {lang key='ox.manageAccount'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden"></div>
                    <div class="form-group">
                        <label for="inputManageDisplayName">{lang key='ox.displayName'}</label>
                        <input id="inputManageDisplayName" type="text" autocomplete="off" class="form-control required" name="display">
                        <span class="field-error-msg">{lang key='ox.required.displayName'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputManageFirstName">{lang key='orderForm.firstName'}</label>
                        <input id="inputManageFirstName" type="text" autocomplete="off" class="form-control required" name="first">
                        <span class="field-error-msg">{lang key='ox.required.firstName'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputManageLastName">{lang key='orderForm.lastName'}</label>
                        <input id="inputManageLastName" type="text" autocomplete="off" class="form-control required" name="last">
                        <span class="field-error-msg">{lang key='ox.required.lastName'}</span>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='clientareasavechanges'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxSetPassword" action="{$setPasswordUrl}" method="post">
    <div class="modal fade" id="modalSetPassword">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalSetPasswordTitle">
                        {lang key='ox.setPasswordFor'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalSetPasswordBody">
                    <div class="alert alert-danger modal-error w-hidden"></div>
                    <div class="form-group">
                        <label for="inputChangePassword">{lang key='clientareapassword'}</label>
                        <div class="input-group">
                            <input type="password" class="form-control required" name="password" id="inputChangePassword" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default generate-password" data-targetfields="inputChangePassword,inputChangePasswordConfirm">
                                    {lang key="generatePassword.btnShort"}
                                </button>
                            </div>
                        </div>

                        <div class="password-strength-meter">
                            <div class="progress" style="height: 10px; margin-top: 10px">
                                <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                </div>
                            </div>
                            <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key="pwstrength"}: {lang key="pwstrengthenter"}</p>
                        </div>
                        <span class="field-error-msg">{lang key='ox.required.password'}</span>
                    </div>
                    <div class="form-group">
                        <label for="inputChangePasswordConfirm">{lang key='clientareaconfirmpassword'}</label>
                        <input id="inputChangePasswordConfirm" type="password" autocomplete="off" class="form-control required match" data-match-field="inputChangePassword" name="password2">
                        <span class="field-error-msg">{lang key='ox.required.passwordMatch'}</span>
                    </div>
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary ox-submit-button">
                        {lang key='ox.setPassword'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<form id="frmOxDeleteAccount" action="{$deleteAccountUrl}" method="post">
    <div class="modal fade" id="modalDeleteAccount">
        <input type="hidden" value="" name="account">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header card-header bg-primary text-light">
                    <h4 class="modal-title" id="modalDeleteAccountTitle">
                        {lang key='ox.deleteAccount'}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body card-body" id="modalDeleteAccountBody">
                    <div class="alert alert-danger modal-error w-hidden"></div>
                    {lang key='ox.deleteAccountQuestion'}
                </div>
                <div class="modal-footer card-footer">
                    <div class="float-left loader w-hidden">
                        <i class="fas fa-sync-alt fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-danger ox-submit-button" id="btnDoDelete">
                        {lang key='ox.delete'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    function loadAccounts(force) {
        var trLoading = jQuery('tr.loading'),
            divError = jQuery('#oxLoadError'),
            trNoAccounts = jQuery('tr.no-accounts');

        force = force || 0;

        if (divError.is(':visible')) {
            divError.hide();
        }

        jQuery('#btnRefresh').addClass('disabled')
            .prop('disabled', 'disabled')
            .find('i')
            .addClass('fa-spin');

        clearAccounts();
        trNoAccounts.hide();
        if (trLoading.not(':visible')) {
            trLoading.show();
        }
        WHMCS.http.jqClient.jsonPost({
            url: '{$listAccountsUrl}',
            data: {
                token: csrfToken,
                force: force
            },
            success: function(data) {
                if (data.failedMessage) {
                    jQuery('#oxLoadError').text(data.failedMessage).show();
                } else {
                    if (typeof data.accounts.length === "undefined" || data.accounts.length === 0) {
                        trNoAccounts.show();
                    } else {
                        jQuery.each(data.accounts, function(index, account) {
                            addAccountToTable(account);
                        });
                    }
                }
            },
            always: function() {
                trLoading.hide();
                updateAccountsDisplay();
                jQuery('#btnRefresh').removeClass('disabled').prop('disabled', false)
                    .find('i').removeClass('fa-spin');
            }
        });
    }

    function addAccountToTable(data) {
        var tableBody = jQuery('#tableBodyAccounts'),
            clone = jQuery('tr.clone').clone();

        clone.attr('id', '');
        clone.find('.account')
            .text(data.username);
        clone.find('.limit')
            .text(data.quota);
        clone.attr('data-account-id', data.id)
            .attr('data-first-name', data.first_name)
            .attr('data-last-name', data.last_name)
            .attr('data-display-name', data.display_name)
            .attr('data-account', data.username + '@{$domain}');
        clone.addClass('account-entry').removeClass('clone').show();
        tableBody.append(clone);
    }

    function clearAccounts() {
        jQuery('#tableBodyAccounts .account-entry').remove();
    }

    function updateAccountsDisplay() {
        var trNoAccounts = jQuery('#tableBodyAccounts tr.no-accounts'),
            accountsCount = jQuery('#accountCount').find('.number');
        var count = jQuery('#tableBodyAccounts tr.account-entry').length;
        if (count == 0) {
            trNoAccounts.show();
        } else {
            trNoAccounts.hide();
        }
        accountsCount.text(count);
    }

    function loadConfiguration(force) {
        var tabNames = ['Usage'];
        var tabs = [];
        tabNames.forEach(function(tabName) {
            var tabSpec = {
                'panel': jQuery('#tablePanel' + tabName),
                'header': jQuery('#tablePanel' + tabName + 'Head'),
            };
            tabs.push(tabSpec);
            if (tabSpec.header.find('tr.loading').not(':visible')) {
                tabSpec.header.find('tr.loading').show();
            }
        });

        force = force || 0;
        WHMCS.http.jqClient.jsonPost({
            url: '{$configurationUrl}',
            data: {
                force: force,
                token: csrfToken
            },
            success: function(data) {
                var error = '{lang|addslashes key="unavailable"}';
                if (data.settings) {
                    jQuery('.incoming-hostname').text(data.settings.incoming.hostname);
                    jQuery('.incoming-port').text(data.settings.incoming.port);
                    jQuery('.pop-hostname').text(data.settings.pop.hostname);
                    jQuery('.pop-port').text(data.settings.pop.port);
                    jQuery('.outgoing-hostname').text(data.settings.outgoing.hostname);
                    jQuery('.outgoing-port').text(data.settings.outgoing.port);
                    jQuery('.calendar-server').text(data.settings.calendar.hostname);
                } else {
                    jQuery('.incoming-hostname').text(error);
                    jQuery('.incoming-port').text(error);
                    jQuery('.pop-hostname').text(error);
                    jQuery('.pop-port').text(error);
                    jQuery('.outgoing-hostname').text(error);
                    jQuery('.outgoing-port').text(error);
                    jQuery('.calendar-server').text(error);
                }
                if (data.usage) {
                    var tabSpec = tabs[tabNames.indexOf('Usage')];
                    tabSpec.panel.find('tr').remove();
                    jQuery.each(data.usage, function (index, value) {
                        tabSpec.panel.append(
                            '<tr><td>' + value + '</td></tr>'
                        );
                    });
                }
                if (data.migration_tool) {
                    jQuery('.migration-url').attr('href', data.migration_tool.url);
                    jQuery('#migration, #migrationNav').removeClass('w-hidden');
                }
            },
            always: function() {
                tabs.forEach(function(tabSpec) {
                    tabSpec.header.find('tr.loading').hide();
                });
            }
        });
    }
    jQuery(document).on('ready', function() {
        loadAccounts();
        loadConfiguration();
        window.langPasswordStrength = "{lang key="pwstrength"}";
        window.langPasswordWeak = "{lang key="pwstrengthweak"}";
        window.langPasswordModerate = "{lang key="pwstrengthmoderate"}";
        window.langPasswordStrong = "{lang key="pwstrengthstrong"}";

        jQuery("#inputPassword,#inputChangePassword").keyup(registerFormPasswordStrengthFeedback);
        jQuery('button.btn-add').width(function() {
            return jQuery(this).outerWidth(true);
        }).find('span.loading').toggleClass('loading').toggle();
        jQuery('#modalAddAccount,#modalSetPassword').on('shown.bs.modal', function() {
            jQuery('.modal-backdrop.fade.show').css('zIndex', 1030);
            jQuery(this).css('zIndex', 1035);
        });
        jQuery(document)
            .on('click', '#btnRefresh', function() {
                jQuery(this).addClass('disabled').prop('disabled', true);
                loadAccounts(true);
                loadConfiguration(true);
            })
            .on('click', '#btnAddAccount', function() {
                jQuery('#modalAddAccount').modal('show');
            })
            .on('click', '.manage-account', function() {
                var tr = jQuery(this).closest('tr'),
                    accountId = tr.data('account-id'),
                    account = tr.data('account'),
                    modalManageAccount = jQuery('#modalManageAccount');

                modalManageAccount.find('input[name="account"]').val(accountId);
                modalManageAccount.find('span.email').text(account);
                jQuery('#inputManageDisplayName').val(tr.attr('data-display-name'));
                jQuery('#inputManageFirstName').val(tr.attr('data-first-name'));
                jQuery('#inputManageLastName').val(tr.attr('data-last-name'));
                modalManageAccount.modal('show');
            })
            .on('click', '.set-ox-password', function() {
                var accountId = jQuery(this).closest('tr').data('account-id'),
                    account = jQuery(this).closest('tr').data('account'),
                    modalSetPassword = jQuery('#modalSetPassword');

                modalSetPassword.find('input[name="account"]').val(accountId);
                modalSetPassword.find('span.email').text(account);
                modalSetPassword.modal('show');
            })
            .on('click', '.ox-delete', function() {
                var accountId = jQuery(this).closest('tr').data('account-id'),
                    account = jQuery(this).closest('tr').data('account'),
                    modalDeleteAccount = jQuery('#modalDeleteAccount');

                modalDeleteAccount.find('input[name="account"]').val(accountId);
                modalDeleteAccount.find('span.email').text(account);
                modalDeleteAccount.modal('show');
            })
            .on('click', '.ox-submit-button', function() {
                var frm = jQuery(this).closest('form'),
                    formId = frm.attr('id'),
                    modal = frm.find('div.modal'),
                    formData = frm.serialize(),
                    oxError = modal.find('.modal-error'),
                    oxSuccess = jQuery('#oxSuccess'),
                    err = false;

                oxError.hide().text('');
                oxSuccess.hide();

                frm.find('.form-group').removeClass('has-error');
                frm.find('.field-error-msg').hide();

                frm.find('.required').each(function() {
                    if (jQuery(this).val() === '') {
                        if (jQuery(this).hasClass('match')) {
                            jQuery(this).setInputError("{lang key='ox.required.passwordMatchMissing'}");
                        }
                        jQuery(this).showInputError();
                        err = true;
                    }
                });

                frm.find('.match').each(function() {
                    var matchInput = jQuery(this).data('match-field');
                    if (jQuery('#' + matchInput).val() !== jQuery(this).val()) {
                        jQuery(this).setInputError("{lang key='ox.required.passwordMatch'}").showInputError();
                        err = true;
                    }
                });
                if (formId === 'frmOxAddAccount') {
                    var verify = jQuery('#inputConfirmPassword');
                    if (jQuery('#inputPassword').val() !== verify.val()) {
                        verify.showInputError();
                        err = true;
                    }
                }
                if (formId === 'frmOxSetPassword') {
                    var verify2 = jQuery('#inputChangePasswordConfirm');
                    if (jQuery('#inputChangePassword').val() !== verify2.val()) {
                        verify2.showInputError();
                        err = true;
                    }
                }
                if (!err) {
                    modal.find('.loader').show();
                    WHMCS.http.jqClient.jsonPost({
                        url: frm.attr('action'),
                        data: formData,
                        success: function(data) {
                            if (data.success === true) {
                                var accountId = frm.find('input[name="account"]').val();
                                var tr = jQuery('tr[data-account-id="' + accountId + '"]');
                                oxSuccess.text(data.successMessage).show();
                                if (formId === 'frmOxDeleteAccount') {
                                    tr.slideUp().remove();
                                } else if (formId === 'frmOxAddAccount') {
                                    addAccountToTable(data);
                                }
                                if (formId === 'frmOxManageAccount') {
                                    tr.attr('data-display-name', data.display_name);
                                    tr.attr('data-first-name', data.first_name);
                                    tr.attr('data-last-name', data.last_name);
                                }
                                frm.find('input').not('[name="token"]').each(function() {
                                    jQuery(this).val('');
                                });
                                modal.modal('hide');
                            } else {
                                oxError.text(data.failedMessage);
                                oxError.show();
                            }
                        },
                        always: function() {
                            updateAccountsDisplay();
                            modal.find('.loader').hide();
                        }
                    });
                }
            });
    });
</script>
