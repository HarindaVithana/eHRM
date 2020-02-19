<?php
if ($mode == '1') {
    $editMode = false;
    $disabled = '';
} else {
    $editMode = true;
    $disabled = 'disabled="disabled"';
}
$encrypt = new EncryptionHandler();
?>
<?php
require_once ROOT_PATH . '/lib/common/LocaleUtil.php';
?>
<script type="text/javascript" src="<?php echo public_path('../../scripts/jquery/jquery.min.js') ?>"></script>
<script type="text/javascript" src="<?php echo public_path('../../scripts/jquery/jquery-ui.min.js') ?>"></script>
<link href="<?php echo public_path('../../themes/orange/css/jquery/jquery-ui.css') ?>" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="<?php echo public_path('../../scripts/jquery/jquery.validate.js') ?>"></script>
<script type="text/javascript" src="<?php echo public_path('../../scripts/time.js') ?>"></script>
<script type="text/javascript" src="<?php echo public_path('../../scripts/jquery.placeholder.js') ?>"></script>
<?php
$sysConf = OrangeConfig::getInstance()->getSysConf();
$inputDate = $sysConf->getDateInputHint();
$dateDisplayHint = $sysConf->dateDisplayHint;
$format = LocaleUtil::convertToXpDateFormat($sysConf->getDateFormat());
?>
<div class="formpage4col" >
    <div class="navigation">
        <style type="text/css">
            div.formpage4col input[type="text"]{
                width: 180px;
            }
        </style>

    </div>
    <div id="status"></div>
    <div class="outerbox">
        <?php if ($mode == '1') {
        ?>
            <div class="mainHeading"><h2><?php echo __("Define Notice") ?></h2></div>
        <?php echo message(); ?>
        <?php } else {
        ?>
            <div class="mainHeading"><h2><?php echo __("Edit Notice") ?></h2></div>
        <?php echo message(); ?>
        <?php } ?>
        <form name="frmSave" id="frmSave" method="post"  action="">
            <div class="leftCol">
                &nbsp;
            </div>
            <div class="centerCol">
                <label class="languageBar"><?php echo __("English") ?></label>
            </div>
            <div class="centerCol">
                <label class="languageBar"><?php echo __("Sinhala") ?></label>
            </div>
            <div class="centerCol">
                <label class="languageBar"><?php echo __("Tamil") ?></label>
            </div>
            <br class="clear"/>
            <div class="leftCol">
                <label for="txtLocationCode"><?php echo __("Notice Title") ?> <span class="required">*</span></label>
            </div>
            <div class="centerCol">
                <input id="txtName"  name="txtName" type="text"  class="formInputText" value="<?php echo $disAct->notice_name; ?>" maxlength="50" />
            </div>


            <div class="centerCol">
                <input id="txtNamesi"  name="txtNamesi" type="text"  class="formInputText"  value="<?php echo $disAct->notice_name_si; ?>" maxlength="50" />
            </div>
            <div class="centerCol">

                <input id="txtNameta"  name="txtNameta" type="text"  class="formInputText"  value="<?php echo $disAct->notice_name_ta; ?>" maxlength="50" />
            </div>
            <input type="hidden" name="txtHiddenID" value="<?php echo $disAct->notice_code; ?>" />
            <br class="clear"/>

            <div class="leftCol">
                <label class="controlLabel" for="txtLocationCode"><?php echo __("Description") ?> <span class="required">*</span></label>
            </div>
            <div class="centerCol">
                <textarea id='txtDes' name='txtDes'  class="formTextArea"
                          rows="5" cols="20"  ><?php echo $disAct->notice_desc; ?></textarea>
            </div>
            <div class="centerCol">
                <textarea id='txtDesSi' name='txtDesSi'  class="formTextArea"
                          rows="5" cols="20"  ><?php echo $disAct->notice_desc_si; ?></textarea>
            </div>
            <div class="centerCol">
                <textarea id='txtDesTa' name='txtDesTa'  class="formTextArea"
                          rows="5" cols="20"  ><?php echo $disAct->notice_desc_ta; ?></textarea>
            </div>
            <br class="clear"/>

            <div class="leftCol">
                <label class="controlLabel" for="txtcomment"><?php echo __("Date from") ?><span class="required">*</span></label>
            </div>
            <div class="centerCol">

                <input id="fromdate" type="text" class="formInputText" value="<?php echo $disAct->from_date ?>" placeholder="<?php echo $dateDisplayHint; ?>" name="fromdate">

                <div style="display: none;" class="demo-description"></div>
            </div>


            <div class="centerCol">
                <label class="controlLabel" for="txtcomment"><?php echo __("Date To") ?><span class="required">*</span></label>
            </div>
            <div class="centerCol">

                <input id="todate" type="text" class="formInputText" value="<?php echo $disAct->to_date ?>" placeholder="<?php echo $dateDisplayHint; ?>" name="todate">

                <div style="display: none;" class="demo-description"></div>
            </div>

            <br class="clear"/>
            <div class="formbuttons">
                <input type="button" class="<?php echo $editMode ? 'editbutton' : 'savebutton'; ?>" name="EditMain" id="editBtn"
                       value="<?php echo $editMode ? __("Edit") : __("Save"); ?>"
                       title="<?php echo $editMode ? __("Edit") : __("Save"); ?>"
                       onmouseover="moverButton(this);" onmouseout="moutButton(this);"/>
                <input type="reset" class="clearbutton" id="btnClear" tabindex="5"
                       onmouseover="moverButton(this);" onmouseout="moutButton(this);"<?php echo $disabled; ?>
                       value="<?php echo __("Reset"); ?>" />
                <input type="button" class="backbutton" id="btnBack"
                       value="<?php echo __("Back") ?>" tabindex="10" />
            </div>
        </form>
    </div>
    <div class="requirednotice"><?php echo __("Fields marked with an asterisk") ?><span class="required"> * </span> <?php echo __("are required") ?></div>
    <br class="clear" />
</div>


        <script type="text/javascript">


            $(document).ready(function() {
                $("#txtName").focus();
                $("#fromdate").placeholder();
                $("#todate").placeholder();
                buttonSecurityCommon(null,"editBtn",null,null);

                $("#fromdate").datepicker({ dateFormat: '<?php echo $inputDate; ?>',onClose: function(dateText, inst) {
                        $('#fromdate').focus();
                        $('#fromdate').blur();


                    } });
                $("#todate").datepicker({ dateFormat: '<?php echo $inputDate; ?>',onClose: function(dateText, inst) {
                        $('#todate').focus();
                        $('#todate').blur();

                    } });

                jQuery.validator.addMethod("orange_date",
                function(value, element, params) {

                    //var hint = params[0];
                    var format = params[0];

                    // date is not required
                    if (value == '') {

                        return true;
                    }
                    var d = strToDate(value, "<?php echo $format ?>");


                    return (d != false);

                }, ""
            );


                jQuery.validator.addMethod("dateValidation",
                function(value, element) {
                    var hint = '<?php echo $inputDate; ?>';
                    var format = '<?php echo $format; ?>';
                    var fromdate = strToDate($('#fromdate').val(), format)
                    var todate = strToDate($('#todate').val(), format);

                    if (fromdate && todate && (fromdate > todate)) {
                        return false;
                    }
                    return true;
                }, ""
            );

<?php if ($mode == 0) { ?>
                    $("#editBtn").show();
                    buttonSecurityCommon(null,null,"editBtn",null);
                    $('#frmSave :input').attr('disabled', true);
                    $('#editBtn').removeAttr('disabled');
                    $('#btnBack').removeAttr('disabled');
<?php } ?>

                //Validate the fo9990rm
                $("#frmSave").validate({

                    rules: {
                        txtName:{required: true,maxlength:50,noSpecialCharsOnly:true },
                        txtNamesi:{maxlength:50,noSpecialCharsOnly:true},
                        txtNameta:{maxlength:50,noSpecialCharsOnly:true},
                        txtDes:{required: true,maxlength:200,noSpecialCharsOnly:true},
                        txtDesSi:{maxlength:200,noSpecialCharsOnly:true},
                        txtDesTa:{maxlength:200,noSpecialCharsOnly:true},
                        fromdate:{required:true,orange_date:true,dateValidation:true},
                        todate:{required:true,orange_date:true,dateValidation:true}

                    },
                    messages: {                        
                        txtName:{required: "<?php echo __("Notice Name is required") ?>",maxlength: "<?php echo __("Maximum length should be 50 characters") ?>",noSpecialCharsOnly:"<?php echo __("No invalid characters are allowed") ?>"},
                        txtDes:{required:"<?php echo __("This field is required.") ?>",maxlength:"<?php echo __("Maximum 100 Characters") ?>",noSpecialCharsOnly:"<?php echo __("Special Characters are not allowed") ?>"},
                        txtDesSi:{maxlength:"<?php echo __("Maximum 100 Characters") ?>",noSpecialCharsOnly:"<?php echo __("Special Characters are not allowed") ?>"},
                        txtDesTa: {maxlength:"<?php echo __("Maximum 100 Characters") ?>",noSpecialCharsOnly:"<?php echo __("Special Characters are not allowed") ?>"},
                        fromdate: {required:"<?php echo __("Start Date is required") ?>",orange_date:"<?php echo __("Please specify valid  date"); ?>",dateValidation:"<?php echo __("Please specify valid  date") ?>",yearValidation:"<?php echo __("Date is not in the Training Year") ?>"},
                        todate: {required:"<?php echo __("End Date is required") ?>",orange_date:"<?php echo __("Please specify valid  date"); ?>",dateValidation: "<?php echo __("Please specify valid  date") ?>"}

                    }
                });

                // When click edit button
                $("#frmSave").data('edit', <?php echo $editMode ? '1' : '0' ?>);

                // When click edit button
                $("#editBtn").click(function() {
                    var editMode = $("#frmSave").data('edit');
                    if (editMode == 1) {
                        // Set lock = 1 when requesting a table lock
                        location.href="<?php echo url_for('admin/saveNotice?id=' . $disAct->notice_code . '&lock=1') ?>";
                    }
                    else {
                        $('#frmSave').submit();
                    }

                });

                //When click reset buton
                $("#btnClear").click(function() {
                    location.href="<?php echo url_for('admin/saveNotice?id=' . $disAct->notice_code . '&lock=0') ?>";
                });

                //When Click back button
                $("#btnBack").click(function() {
                    location.href = "<?php echo url_for(public_path('../../symfony/web/index.php/admin/listNotice')) ?>";

        });

    });
</script>



