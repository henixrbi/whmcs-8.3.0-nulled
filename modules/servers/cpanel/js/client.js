function doEmailCreate() {
    jQuery("#btnCreateLoader").addClass('fa-spinner fa-spin').removeClass('fa-plus');
    jQuery("#emailCreateSuccess").slideUp();
    jQuery("#emailCreateFailed").slideUp();
    WHMCS.http.jqClient.post(
        "clientarea.php",
        "action=productdetails&modop=custom&a=CreateEmailAccount&" + jQuery("#frmCreateEmailAccount").serialize(),
        function( data ) {
            jQuery("#btnCreateLoader").removeClass('fa-spinner fa-spin').addClass('fa-plus');
            if (data.success) {
                jQuery('#cpanel-email-prefix').val('');
                jQuery('#cpanel-email-password').val('');
                jQuery("#emailCreateSuccess").hide().removeClass('hidden')
                    .slideDown();
            } else {
                jQuery("#emailCreateFailedErrorMsg").html(data.errorMsg);
                jQuery("#emailCreateFailed").hide().removeClass('hidden')
                    .slideDown();
            }
        }
    );
}

(function ($) {
    $(document).ready(function() {
        $('#btnInstallWordpress').click(function() {
            var icon = $(this).find('i');

            icon.removeClass('fa-plus').addClass('fa-spinner fa-spin');

            $('#wordPressInstallResultRow').slideUp(function() {
                $('#wordPressInstallResultRow').find('.alert').hide();
            });

            $('#btnInstallWordpress').attr('disabled', 'disabled');

            WHMCS.http.jqClient.jsonPost({
                url: 'clientarea.php',
                data: {
                    action: 'installWordpress',
                    serviceId: $('#cPanelWordPress').data('service-id'),
                    token: csrfToken,
                    blog_title: $('#wpNewBlogTitle').val(),
                    path: $('#wpNewPath').val(),
                    admin_pass: $('#wpAdminPass').val()
                },
                success: function(data) {
                    $('#wordPressInstances').append(
                        $('<option>')
                            .attr('value', data.instanceUrl)
                            .text(
                                data.blogTitle
                                + (data.path ? ' (' + data.path + ')' : '')
                            )
                    );

                    $('#newWordPressLink').attr('href', data.instanceUrl);
                    $('#newWordPressAdminLink').attr('href', data.instanceUrl + '/wp-login.php');

                    $('#wordpressInstanceRow').slideDown();

                    $('#wordPressInstallResultRow').find('.alert-success').show();
                    $('#wordPressInstallResultRow').slideDown();

                    $('#wpNewBlogTitle').val('');
                    $('#wpAdminPass').val('');
                    $('#wpNewPath').val('').trigger('keyup');
                },
                error: function(data) {
                    $('#wordPressInstallResultRow').find('.alert-danger').text(data).show();
                    $('#wordPressInstallResultRow').slideDown();
                },
                always: function() {
                    icon.removeClass('fa-spinner fa-spin').addClass('fa-plus');
                    $('#btnInstallWordpress').removeAttr('disabled');
                }
            });
        });

        $('#btnGoToWordPressHome').click(function() {
            window.open($('#wordPressInstances').val());
        });

        $('#btnGoToWordPressAdmin').click(function() {
            window.open($('#wordPressInstances').val() + '/wp-login.php');
        });

        var wpDomain = $('#cPanelWordPress').data('wp-domain');

        $('#wpNewPath').keyup(function() {
            var path = $('#wpNewPath').val().replace(/[^a-z\d\-_\.]/ig, '').toLowerCase();
            $('#newWordPressFullUrlPreview').text('https://' + wpDomain + '/' + path);
        });
    });

})(jQuery);
