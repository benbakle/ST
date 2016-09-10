//JQUERY PLUGIN FUNCTIONS
(function ($) {
    //CREATE RADIO BUTTON LIST WITH JSON DATA
    $.fn.radioButtonList = function (JSON_list) {
        var div_id = $(this);
        var i = 0;
        var checked;
        var radio_html = ""
        while (JSON_list.length > i) {
            if (JSON_list[i].checked == "checked") {
                checked = "checked = 'checked'";
            }
            else {
                checked = "";
            }

            if (JSON_list[i].disabled == true) {
                disabled = "disabled='disabled'";
            }
            else {
                disabled = ""
            }
            radio_html = radio_html + "<input type='radio'" +
									" value='" + JSON_list[i].value +
									"' name='" + JSON_list[i].name +
									"' " + disabled +
									" " + checked + " " + "><span class='desc'>" + JSON_list[i].label + "</span><br>";
            i++;
        }
        $(div_id).html(radio_html);
    };

    //SET TEXTBOX CODE WITH RADIO BUTTON CLICK
    $.fn.setCodeValueByRadio = function () {
        var textbox;
        $(this).on("click", function () {
            $(this).parents(".radio_list").fadeOut(glb_radio_list_easeOut);
            textbox = $(this).closest(".single_select").children(".value_textbox")
            radio_value = $(this).attr("value");
            SetValue(textbox, radio_value);
            RenderCodeChange($(this).parents(".code"), radio_value);
        });
    };

    //SET RADIO BUTTONS WITH TEXTBOX VALUE
    $.fn.setCodeValueByTextbox = function () {

        $(this).on("blur", function (e) {
            var radio_value = $(this).val().trim().toUpperCase();
            SetValue($(this), radio_value);
            RenderCodeChange($(this).parents(".code"), radio_value);

        });

        $(this).on("keydown", function (e) {
            $(this).siblings(".radio_list").hide();
        });
    };

    //TOGGLE RADIO GROUP DISPLAY
    $.fn.toggleRadioGroup = function () {
        var arrow;
        var visible;
        $(this).children(".radio_group").each(function () {
            arrow = $(this).prev("h4").children(".arrow");
            visible = $(this).is(":visible");

            if (visible) {
                arrow.html("&#9650");
            }
            else {
                arrow.html("&#9660");
            }
        });
    };


    //ELEMENT TYPES//

    //HANDLES ELEMENT TYPE RADIO BUTTON CLICKS (ENABLE/DISABLE)
    $.fn.handleElementTypeRadio = function () {
        $(this).on("click", function () {

            var checked = $(this).val();
            var isLowTemp = $(".temperature_panel").children(".value_textbox").val == "M";
            switch (checked) {
                case "2":
                    if (isLowTemp) {
                        DisableRadioGroup(".element_SingleDual", false);
                    }
                    break;
                case "3":
                    if (isLowTemp) {
                        DisableRadioGroup(".element_SingleDual", false);
                    }
                    break;
                case "4":
                    $(".element_type_panel input[name=elementSingleDual][value='single']").prop("checked", true);
                    $(".element_type_panel input[name=elementSingleDual][value='dual']").attr("disabled", true);
                    DisableRadioGroup(".element_Resistance", false);
                    break;
                case "single":
                    DisableRadioGroup(".element_Resistance", false);
                    break;
                case "dual":
                    $(".element_type_panel input[name=elementResistance][value='Copper_10']").attr("disabled", true);
                    $(".element_type_panel input[name=elementResistance][value='Nickel_120']").attr("disabled", true);
                    $(".element_type_panel input[name=elementResistance][value='Nickel_604']").attr("disabled", true);
                    $(".element_type_panel input[name=elementResistance][value='100_Ohm']").prop("checked", true);
                    break;
            }
        });
    };

    //GETS ELEMENT TYPE BY RADIO BUTTON
    $.fn.writeElementTypeByRadio = function () {
        $(this).on("click", function () {
            $(this).parents(".radio_list").fadeOut(glb_radio_list_easeOut);
            var config = $("input[name=elementConfig]:radio:checked");
            var config_value = config.val();
            var config_desc = config.next(".desc").text();

            var singleDual = $("input[name=elementSingleDual]:radio:checked");
            var singleDual_value = singleDual.val();
            var singleDual_desc = singleDual.next(".desc").text().split(" ")[0];

            var resistance = $("input[name=elementResistance]:radio:checked")
            var resistance_value = resistance.val();
            var resistance_desc = resistance.next(".desc").text();

            var element_type_desc = singleDual_desc + " " + config_desc + ", " + resistance_desc;
            var element_type_code = "";

            var i = 0;
            while (i < element_Type.length) {
                if ((element_Type[i].config == config_value) && (element_Type[i].singleDual == singleDual_value) && (element_Type[i].resistance == resistance_value)) {
                    element_type_code = element_Type[i].value;
                    break;
                }
                i++;
            }
            DisplayValues($(".element_type_panel").children(".value_textbox"), element_type_code, element_type_desc);
            return false
        });

    };
    //GET ELEMENT TYPE RADIO BUTTON BY TEXT INPUT
    $.fn.writeElementTypeByTextbox = function () {
        $(this).on("blur", function () {
            HandleElementTypeTrigger($(this));
        });

        $(this).on("keydown", function (e) {
            if (e.keyCode == 9 || e.keyCode == 13) {
                $(this).siblings(".radio_list").fadeOut(glb_radio_list_easeOut);
                $(this).parent(".code").next(".code").children(".value_textbox").select();
                return false;
            }
        });
    };




    //ELEMENT COEFFICIENT//

    //HANDLES COEFFICIENT RADIO BUTTON CLICKS (ENABLE/DISABLE)
    $.fn.handleElementCoefficientRadio = function () {
        $(this).on("click", function () {
            var checked = $(this).val();
            switch (checked) {
                case "385":
                    DisableRadioGroup(".element_Accuracy", false);
                    break;
                case "392":
                    DisableRadioGroup(".element_Accuracy", false);
                    break;
                case "375":
                    $(".element_coefficient_panel input[name=elementAccuracy][value='0.04']").attr("disabled", true);
                    $(".element_coefficient_panel input[name=elementAccuracy][value='0.01']").attr("disabled", true);
                    $("input:radio[name=elementAccuracy]").val(["0.5"]);
                    break;
            }
        });
    };


    //SETS COEFFICIENT BY RADIO
    $.fn.writeCoefficientByRadio = function () {
        $(this).on("click", function () {
            $(this).parents(".radio_list").fadeOut(glb_radio_list_easeOut);
            var curve = $("input[name=elementCurve]:radio:checked");
            var curve_value = curve.val();
            var curve_desc = curve.next(".desc").text();

            var accuracy = $("input[name=elementAccuracy]:radio:checked");
            var accuracy_value = accuracy.val();
            var accuracy_desc = accuracy.next(".desc").text();

            var element_coefficient_desc = curve_desc + ", " + accuracy_desc;
            var element_coefficient_code = "";

            var i = 0;
            while (i < element_Coefficient.length) {
                if ((element_Coefficient[i].curve == curve_value) && (element_Coefficient[i].accuracy == accuracy_value)) {
                    element_coefficient_code = element_Coefficient[i].value;
                    break;
                }
                i++;
            }
            DisplayValues($(".element_coefficient_panel").children(".value_textbox"), element_coefficient_code, element_coefficient_desc);
            return false;
        });

    };
    //SETS COEFFICIENT RADIO BY TEXTBOX
    $.fn.writeCoefficientByTextbox = function () {
        $(this).on("blur", function () {
            HandleCoefficientTrigger($(this));
        });

        $(this).on("keydown", function (e) {
            if (e.keyCode == 9 || e.keyCode == 13) {
                $(this).siblings(".radio_list").fadeOut(glb_radio_list_easeOut);
                $(this).parent(".code").next(".code").children(".value_textbox").select();
                return false;
            }
        });
    };

    //SHEATH LENGTH//

    //GETS SHEATH LENGTH BY FRACTIONAL RADIO CLICK
    $.fn.writeSheathLengthByRadio = function () {
        $(this).on("click", function () {
            var length = GetLengthTextboxDisplay($(".sheath_length_panel").children(".value_textbox").val());
            var fractional = $(this).val();
            var desc = SetSheathLengthDesc(length, fractional);
        });
    };
    //GETS SHEATH LENGTH BY TEXTBOX
    $.fn.writeSheathLengthByTextBox = function () {
        $(this).on("blur", function () {
            HandleSheathLengthTrigger();
        });

        $(this).on("keydown", function (e) {
            if (e.keyCode == 9 || e.keyCode == 13) {
                HandleSheathLengthTrigger();
            }
        });
    };
    //LEADWIRE LENGTH//

    //SETS LEADWIRE LENGTH
    $.fn.writeLeadwireLength = function () {
        $(this).on("blur", function () {
            var value = $(this).val().trim();
            var val_len = value.length;
            var desc;
            if ($.isNumeric(value)) {
                switch (val_len) {
                    case 1:
                        value = "00" + value;
                        break;
                    case 2:
                        value = "0" + value;
                        break;
                }
                desc = (value * 1) + " Inches of Leadwire Length";
            }
            else {
                value = "";
                desc = "";
            }
            $(".leadwire_length_panel").children(".radio_list").fadeOut(glb_radio_list_easeOut);
            DisplayValues($(this), value, desc);
        });
    };

    //SETS LEADWIRE BEYOND FLEX
    $.fn.writeLeadwireBeyondFlex = function () {
        $(this).on("blur", function () {
            var value = $(this).val().trim();
            var desc;

            if ($.isNumeric(value)) {
                value = value * 1;
                var val_len = value.toString().length;

                if (value == 0 || value == 4) {
                    value = "";
                    desc = "";
                }
                else {

                    switch (val_len) {
                        case 1:
                            value = "00" + value;
                            break;
                        case 2:
                            value = "0" + value;
                            break;
                    }

                    desc = (value * 1) + " Inches of Leadwire Beyond the Flex";
                }
            }
            else {
                value = "";
                desc = "";
            }
            $(".flex_panel").children(".radio_list").fadeOut(glb_radio_list_easeOut);
            DisplayValues($(this), value, desc);

        });
    };


    //THERMOWELL ASSEMBLY TYPE//	

    //HANDLES THERMOWELL ASSEMBLY TYPE RADIO BUTTON CLICKS (ENABLE/DISABLE)
    $.fn.handleTWAssemblyTypeRadio = function () {
        $(this).on("click", function () {
            var checked = $(this).val();
            switch (checked) {
                case "1":
                    DisableRadioGroup(".thermowell_Extension", true);
                    $(".tw_assembly_type_panel input[name=thermowellExtension][value='01']").prop("checked", true).attr("disabled", false);
                    break;
                case "2":
                    DisableRadioGroup(".thermowell_Extension", false);
                    break;
                case "3":
                    DisableRadioGroup(".thermowell_Extension", true);
                    $(".tw_assembly_type_panel input[name=thermowellExtension][value='03']").prop("checked", true).attr("disabled", false);
                    break;
                case "4":
                    DisableRadioGroup(".thermowell_Extension", true);
                    $(".tw_assembly_type_panel input[name=thermowellExtension][value='04']").prop("checked", true).attr("disabled", false);
                    $(".tw_assembly_type_panel input[name=thermowellExtension][value='05']").attr("disabled", false);
                    $(".tw_assembly_type_panel input[name=thermowellExtension][value='06']").attr("disabled", false);
                    break;
            }
        });
    };
    //WRITES THERMOWELL ASSEMBLY TYPE BY RADIO CLICK
    $.fn.writeThermowellAssemblyTypeByRadio = function () {
        $(this).on("click", function () {
            $(this).parents(".radio_list").fadeOut(glb_radio_list_easeOut);
            var textbox = $(".tw_assembly_type_panel").children(".value_textbox");
            var tw_type = $("input[name=thermowellConfig]:radio:checked");
            var tw_type_val = tw_type.val();
            var tw_type_desc = tw_type.next(".desc").text().split(")").slice(1).join(")").trim();

            var tw_ext = $("input[name=thermowellExtension]:radio:checked");
            var tw_ext_val = tw_ext.val();
            var tw_ext_desc = tw_ext.next(".desc").text().split(")").slice(1).join(")").trim();

            var val = tw_type_val + tw_ext_val;
            var desc = tw_type_desc + ", " + tw_ext_desc;

            DisplayValues(textbox, val, desc);

            return false;
        });
    };
    //THERMOWELL ASSEMBLY TYPE BY RADIO TEXTBOX
    $.fn.writeThermowellAssemblyTypeByTextbox = function () {
        $(this).on("blur", function () {
            var text_input = $(this).val().trim();
            var desc = "";
            if ($.isNumeric(text_input)) {
                var tw_config = text_input.substring(0, 1);
                var tw_ext = text_input.substring(1, 3);

                switch (tw_config) {
                    case "1":
                        if (tw_ext != "01") {
                            text_input = "";
                        }
                        else {
                            DisableRadioGroup(".thermowell_Extension", true);
                            $("input[name=thermowellExtension][value='01']").attr("disabled", false);

                        }
                        break;
                    case "2":
                        DisableRadioGroup(".thermowell_Config", false);
                        DisableRadioGroup(".thermowell_Extension", false);
                        break;

                    case "3":
                        if (tw_ext != "03") {
                            text_input = "";
                        }
                        else {
                            DisableRadioGroup(".thermowell_Extension", true);
                            $("input[name=thermowellExtension][value='03']").attr("disabled", false);
                        }
                        break;
                    case "4":
                        if ((tw_ext != "04") && (tw_ext != "05") && (tw_ext != "06")) {
                            text_input = "";
                        }
                        else {
                            DisableRadioGroup(".thermowell_Extension", true);
                            $("input[name=thermowellExtension][value='04']").attr("disabled", false);
                            $("input[name=thermowellExtension][value='05']").attr("disabled", false);
                            $("input[name=thermowellExtension][value='06']").attr("disabled", false);
                        }
                        break;
                    default:
                        text_input = "";
                        break;
                }

                if (text_input != "") {
                    $("input[name=thermowellConfig][value='" + tw_config + "']").prop("checked", true);
                    $("input[name=thermowellExtension][value='" + tw_ext + "']").prop("checked", true);
                    desc = $("input[name=thermowellConfig]:radio:checked").next(".desc").text().split(")").slice(1).join(")").trim() + ", " +
                           $("input[name=thermowellExtension]:radio:checked").next(".desc").text().split(")").slice(1).join(")").trim();
                }
            }
            else {
                text_input = "";
            }
            DisplayValues($(this), text_input, desc);
        });

        $(this).on("keydown", function (e) {
            if (e.keyCode == 9 || e.keyCode == 13) {
                $(this).siblings(".radio_list").fadeOut(glb_radio_list_easeOut);
                $(this).parent(".code").next(".code").children(".value_textbox").select();
                return false;
            }
        });
    };



}(jQuery));

//GLOBAL DEFINITIONS//
glb_step_easeIn = "fast";
glb_step_easeOut = "fast";

glb_radio_list_easeIn = "fast";
glb_radio_list_easeOut = "fast";


//JQUERY FUNCTIONS//
function HasTransition(value) {
    return (value == "D") || (value == "E") || (value == "F") || (value == "G");
};

function HasFlex(value) {
    return value == "N" || value == "K" || value == "5" || value == "E" || value == "8" || value == "B" || value == "H" || value == "T" || value == "R";
};

function IsHeadStyle(value) {
    return value == "T" || value == "W" || value == "1" || value == "2" || value == "5";
};






function DisplayElements(value_snapshot_JSON) {
    var radio_button_snapshot_JSON;
    var radio_group_snapshot_JSON;
    var has_values = false;

    ResetStep2();

    //Re-Render all Radio Lists
    RenderCodeEvents();

    //attach events to single select radio buttons
    $(".single_select input:radio").setCodeValueByRadio();
    $(".single_select .value_textbox").setCodeValueByTextbox();

    //hide coil cords as option
    DisableRadioGroup(".leadwire_CoilCord", true);
    $(".leadwire_CoilCord").prev("h4").css("display", "none");

    if ($(".formiscomplete_hidden").val() == "true") {
        value_snapshot_JSON = JSON.parse($(".valuesnapshot_hidden").val());
        DisplayValueSnapShot(value_snapshot_JSON);

        radio_group_snapshot_JSON = JSON.parse($(".radiogroupsnapshot_hidden").val());
        DisplayRadioGroupSnapShot(radio_group_snapshot_JSON);

        radio_button_snapshot_JSON = JSON.parse($(".radiobuttonsnapshot_hidden").val());
        DisplayRadioButtonSnapShot(radio_button_snapshot_JSON);


    }
    else {
        for (i = 0; i < value_snapshot_JSON.length; i++) {
            $(value_snapshot_JSON[i].div).fadeIn();

        }
    }
};

function DisplayValueSnapShot(value_display) {
    for (i = 0; i < value_display.length; i++) {
        codeDiv = value_display[i].div;
        $(codeDiv).children(".value_textbox").val(value_display[i].value);
        $(codeDiv).children(".desc_label").text(value_display[i].desc);
        $(codeDiv).fadeIn();
    }
};
function DisplayRadioButtonSnapShot(radio_button_display) {
    for (i = 0; i < radio_button_display.length; i++) {
        //if (radio_button_display[i].radio_group == ".sheath_Fixed_Hex_Nipples") {
        //    alert(radio_button_display[i].radio_value + " " + radio_button_display[i].radio_checked);
        //}


        $(radio_button_display[i].radio_group).children("input:radio[name='" + radio_button_display[i].radio_name + "'][value='" + radio_button_display[i].radio_value + "']").prop("checked", radio_button_display[i].radio_checked);
        $(radio_button_display[i].radio_group).children("input:radio[name='" + radio_button_display[i].radio_name + "'][value='" + radio_button_display[i].radio_value + "']").attr("disabled", radio_button_display[i].radio_disabled);
    };
};

function DisplayRadioGroupSnapShot(radio_group_display) {
    for (i = 0; i < radio_group_display.length; i++) {
        $(radio_group_display[i].radio_group).css("display", radio_group_display[i].radio_group_display);
        $(radio_group_display[i].radio_group).prev("h4").css("display", radio_group_display[i].radio_group_header);
    };
};

function GetSnapShot() {
    var value_snapshot_JSON = GetValueSnapShot();
    var radio_snapshot_JSON = GetRadioButtonSnapShot();
    var radio_group_snapshot_JSON = GetRadioGroupSnapShot();

    $(".valuesnapshot_hidden").val(JSON.stringify(value_snapshot_JSON));
    $(".radiobuttonsnapshot_hidden").val(JSON.stringify(radio_snapshot_JSON));
    $(".radiogroupsnapshot_hidden").val(JSON.stringify(radio_group_snapshot_JSON));
};

function GetValueSnapShot() {
    var value_snapshot_JSON = [];
    $(".code").each(function () {
        if ($(this).is(":visible")) {
            codeDiv = $(this).attr("class");
            codeDiv = "." + codeDiv.substr(0, codeDiv.indexOf(" "));
            value_snapshot_JSON.push({ div: codeDiv, value: $(this).children(".value_textbox").val(), desc: $(this).children(".desc_label").text() });
        }
    });
    return value_snapshot_JSON;
}

function GetRadioButtonSnapShot() {
    var radio_button_snapshot_JSON = [];
    $("input:radio").each(function () {
        if ($(this).parent(".radio_group").parent(".radio_list").parent(".code").is(":visible")) {
            radio_button_snapshot_JSON.push({ radio_group: "." + $(this).parent(".radio_group").attr("class").split(' ')[0], radio_name: $(this).attr("name"), radio_value: $(this).val(), radio_disabled: $(this).is(":disabled"), radio_checked: $(this).is(":checked") });
        }
    });
    return radio_button_snapshot_JSON;
};

function GetRadioGroupSnapShot() {
    var radio_group_snapshot_JSON = [];
    $(".radio_group").each(function () {
        if ($(this).parent(".radio_list").parent(".code").is(":visible")) {
            radio_group_snapshot_JSON.push({ radio_group: "." + $(this).attr("class").split(' ')[0], radio_group_display: $(this).css("display"), radio_group_header: $(this).prev("h4").css("display") });
        }
    });
    return radio_group_snapshot_JSON;
};


function DisplayValues(textbox, value, desc) {
    $(textbox).val(value);
    $(textbox).siblings(".desc_label").text(desc).css("display", "none").fadeIn();
};

function DisableRadioGroup(radio_group, enable) {
    $(radio_group).children("input:radio").each(function () {
        $(this).attr("disabled", enable);
    });
};

function DisableRadioOption(name, value, disable) {
    $("input[name=" + name + "][value=" + value + "]").attr("disabled", disable);
};


function GetLabelByValue(JSON_array, value) {
    var i = 0;
    found = false;
    while (i < JSON_array.length) {
        if (JSON_array[i].value != value) {
            i++;
        }
        else {
            found = true;
            break;
        }
    }
    if (found) {
        return JSON_array[i].label;
    }
    else {
        return "null";
    }
};

function GetLengthTextboxDisplay(sheath_length) {
    sheath_length = sheath_length.trim();
    switch (true) {
        case (!($.isNumeric(sheath_length))):
            sheath_length = "00";
            break;
        case (sheath_length.length < 2):
            sheath_length = "0" + sheath_length;
            break;
    }
    return sheath_length;
};
function IsCoilCord(value) {
    if (value.length == 4 && value.substring(0, 2) == "CC") {
        return true;
    }
    else {
        return false;
    }
};

function RenderDisplayByLeadwireType(value) {
    switch (true) {
        case HasFlex(value):
            $(".flex_panel").slideDown();
            $(".leadwire_length_panel").slideDown();
            break;
        case IsCoilCord(value):
            $(".flex_panel").slideUp();
            $(".leadwire_length_panel").slideUp();
            break;
        default:
            $(".flex_panel").slideUp();
            $(".leadwire_length_panel").slideDown();
            break;
    };


};

function HandleCoefficientTrigger(textbox) {

    var textbox_value = $(textbox).val().trim().toUpperCase();
    var i = 0;

    while (i < element_Coefficient.length) {
        if (!(element_Coefficient[i].value == textbox_value)) {
            i++;
        }
        else {
            break;
        }
    }
    if (i < element_Coefficient.length) {
        $("input[name=elementCurve][value='" + element_Coefficient[i].curve + "']").prop("checked", true);
        $("input[name=elementAccuracy][value='" + element_Coefficient[i].accuracy + "']").prop("checked", true);

        var curve = $("input[name=elementCurve]:radio:checked");
        var curve_desc = curve.next(".desc").text();

        var accuracy = $("input[name=elementAccuracy]:radio:checked");
        var accuracy_desc = accuracy.next(".desc").text();

        var element_coefficient_desc = curve_desc + ", " + accuracy_desc;
    }
    else {
        textbox_value = "";
        element_coefficient_desc = "";
    }

    DisplayValues($(textbox), textbox_value, element_coefficient_desc);
};

function HandleElementTypeTrigger(textbox) {
    var textbox_value = $(textbox).val().trim().toUpperCase();
    var i = 0;

    while (i < element_Type.length) {
        if (!(element_Type[i].value == textbox_value)) {
            i++;
        }
        else {
            break;
        }
    }

    if (i < element_Type.length) {
        $("input[name=elementConfig][value='" + element_Type[i].config + "']").prop("checked", true);
        $("input[name=elementSingleDual][value='" + element_Type[i].singleDual + "']").prop("checked", true).prop("disabled", false);
        $("input[name=elementResistance][value='" + element_Type[i].resistance + "']").prop("checked", true).prop("disabled", false);;

        var config = $("input[name=elementConfig]:radio:checked");
        var config_desc = config.next(".desc").text();

        var singleDual = $("input[name=elementSingleDual]:radio:checked")
        var singleDual_desc = singleDual.next(".desc").text().split(" ")[0];

        var resistance = $("input[name=elementResistance]:radio:checked")
        var resistance_desc = resistance.next(".desc").text();

        var element_type_desc = singleDual_desc + " " + config_desc + ", " + resistance_desc;
    }
    else {
        textbox_value = "";
        element_type_desc = "";
    }
    DisplayValues($(textbox), textbox_value, element_type_desc);


};

function HandleSheathLengthTrigger() {
    var length = GetLengthTextboxDisplay($(".sheath_length_panel").children(".value_textbox").val());
    var fractional = $(".fractional_length_panel").children(".value_textbox").val().trim().toUpperCase();
    var desc = SetSheathLengthDesc(length, fractional);
};

function RenderCodeChange(code_div, value) {
    switch (true) {
        case code_div.hasClass("sheath_termination_panel"):
            RenderDisplayBySheathTerm(value);
            break;
        case code_div.hasClass("plastics_termination_panel"):
            RenderDisplayByPlasticsSheathTerm(value);
            break;
        case code_div.hasClass("temperature_panel"):
            RenderDisplayByTemp(value);
            break;
        case code_div.hasClass("thermocouple_type_panel"):
            RenderDisplayByThermocoupleType(value);
            break;
        case code_div.hasClass("sheath_diameter_panel"):
            RenderDisplayBySheathDiameter(value);
            break;
        case code_div.hasClass("leadwire_panel"):
            RenderDisplayByLeadwireType(value);
            break;
        case code_div.hasClass("tw_type_panel"):
            RenderDisplayByThermowellType(value);
            break;
        case code_div.hasClass("extension_type_panel"):
            RenderDisplayByExtType(value);
            break;
        case code_div.hasClass("sanitary_well_panel"):
            RenderDisplayBySanitaryWell(value);
            break;
        case code_div.hasClass("penetration_panel"):
            RenderDisplayByPenetrationStyle(value);
            break;
    }
};

function RenderDisplayByPenetrationStyle(value) {
    if (value == "TIP") {
        $(".element_type_panel").slideUp();
        $(".element_coefficient_panel").slideUp();
        $(".temperature_panel").slideUp();
        $(".calibration_panel").slideDown();
        $(".thermocouple_type_panel").slideDown();
        $(".junction_type_panel").slideDown();
       
    } else {
        $(".element_type_panel").slideDown();
        $(".element_coefficient_panel").slideDown();
        $(".temperature_panel").slideDown();
        $(".calibration_panel").slideUp();
        $(".thermocouple_type_panel").slideUp();
        $(".junction_type_panel").slideUp();

    };

}


function RenderDisplayBySanitaryWell(value) {
    if (value == "SW") {
        SetValue($(".sheath_diameter_panel").children(".value_textbox"), "O");
        $(".reduced_tip_diameter_panel").slideUp();
        DisableRadioGroup(".sheath_Diameter", true);
        DisableRadioOption("diameter", "O", false);
    }
    else {
        DisableRadioGroup(".sheath_Diameter", false);
        DisableRadioOption("diameter", "D", true);
    }

}

function RenderDisplayByExtType(value) {
    DisplayValues($(".extension_termination_panel .value_textbox"), "", "");
    switch (value) {
        case "R":
            $(".extension_config_rtd_panel").slideDown();
            $(".extension_config_tc_panel").slideUp();
            $(".extension_termination_panel").slideDown();
            $(".extension_qc_termination_panel").slideUp();
            break;
        case "Q":
            $(".extension_config_rtd_panel").slideDown();
            $(".extension_config_tc_panel").slideUp();
            $(".extension_termination_panel").slideUp();
            $(".extension_qc_termination_panel").slideDown();
            break;
        case "J": case "K": case "E": case "T":
            $(".extension_config_rtd_panel").slideUp();
            $(".extension_config_tc_panel").slideDown();
            $(".extension_termination_panel").slideDown();
            $(".extension_qc_termination_panel").slideUp();
            break;

    };


    $(".extension_config_panel input:radio").setCodeValueByRadio();
    $(".extension_config_panel .value_textbox").setCodeValueByTextbox();
    $(".extension_termination_panel input:radio").setCodeValueByRadio();
    $(".extension_config_panel").children(".value_textbox").val("").siblings(".desc_label").text("");

};




function RenderDisplayByPlasticsSheathTerm(value) {

    var show_array = [
        { div: ".sheath_diameter_panel", show: false }, //0
        { div: ".sheath_length_panel", show: false }, //1				
        { div: ".fractional_length_panel", show: false }, //2			
        { div: ".spade_material_panel", show: false }, //3			
        { div: ".ring_type_panel", show: false }, //4
        { div: ".stud_size_panel", show: false }, //5
        { div: ".gasket_size_panel", show: false }, //6
        { div: ".fork_style_panel", show: false }, //7
        { div: ".nozzle_bolt_panel", show: false }, //8
        { div: ".pipe_clamp_panel", show: false }, //9
        { div: ".plastics_sheath_fitting_panel", show: false }, //10
        { div: ".placeholder1", show: false }, //11
        { div: ".placeholder2", show: false }, //12
        { div: ".placeholder3", show: false } //13
    ];

    DisableRadioOption("junctionType", "U", false);
    DisableRadioGroup(".sheath_Fractional_Length", false);

    switch (value) {

        case "A": case "B": case "C":
            show_array[0].show = true;  //sheath_diameter_panel
            show_array[1].show = true;  //sheath_length_panel
            show_array[2].show = true; //fractional_length_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "I", false);
            SetValue($(".sheath_diameter_panel").children(".value_textbox"), "I");
            break;

        case "D": case "E": case "F": case "G": case "H": case "I":
            show_array[0].show = true;  //sheath_diameter_panel
            show_array[1].show = true;  //sheath_length_panel
            show_array[2].show = true; //fractional_length_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "G", false);
            DisableRadioOption("diameter", "I", false);
            DisableRadioOption("diameter", "K", false);
            break;

        case "J":
            show_array[3].show = true;  //spade_material_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel 
            show_array[11].show = true; //placeholder1
            show_array[12].show = true; //placeholder2
            show_array[13].show = true; //placeholder3

            DisableRadioOption("junctionType", "U", true);
            SetValue($(".junction_type_panel").children(".value_textbox"), "G");
            break;

        case "K":
            show_array[4].show = true;  //ring_type_panel
            show_array[5].show = true;  //stud_size_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel 
            show_array[11].show = true; //placeholder1
            show_array[12].show = true; //placeholder2

            DisableRadioOption("junctionType", "U", true);
            SetValue($(".junction_type_panel").children(".value_textbox"), "G");
            break;

        case "L":
            show_array[6].show = true;  //gasket_size_panel
            show_array[7].show = true;  //fork_style_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel 
            show_array[11].show = true; //placeholder1
            show_array[12].show = true; //placeholder2

            DisableRadioOption("junctionType", "U", true);
            SetValue($(".junction_type_panel").children(".value_textbox"), "G");
            break;

        case "M": case "N": case "O":
            show_array[0].show = true;  //sheath_diameter_panel
            show_array[1].show = true;  //sheath_length_panel
            show_array[2].show = true; //fractional_length_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "G", false);
            DisableRadioOption("diameter", "I", false);

            $(".sheath_length_panel").children(".value_textbox").val("00");
            break;

        case "R":
            show_array[0].show = true; //sheath_diameter_panel
            show_array[1].show = true; //sheath_length_panel
            show_array[2].show = true; //fractional_length_panel
            show_array[8].show = true; //nozzle_bolt_panel

            DisableRadioOption("junctionType", "U", true);
            SetValue($(".junction_type_panel").children(".value_textbox"), "G");

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "G", false);
            SetValue($(".sheath_diameter_panel").children(".value_textbox"), "G");

            $(".sheath_length_panel").children(".value_textbox").val("01").siblings(".desc_label").text("1 Inch Sheath");

            DisableRadioGroup(".sheath_Fractional_Length", true);
            DisableRadioOption("fractionalLength", "A", false);
            SetValue($(".fractional_length_panel").children(".value_textbox"), "A");
            break;

        case "U":
            show_array[9].show = true;  //pipe_clamp_panel
            show_array[10].show = true; //plastics_sheath_fitting_panel
            show_array[11].show = true; //placeholder1
            show_array[12].show = true; //placeholder2

            DisableRadioOption("junctionType", "U", true);
            SetValue($(".junction_type_panel").children(".value_textbox"), "G");
            break;
    }
    if (value != "") {
        for (i = 0; i < show_array.length; i++) {
            if (show_array[i].show) {
                $(show_array[i].div).slideDown();
            }
            else {
                $(show_array[i].div).slideUp();
            }
        }
    }
};

function RenderDisplayBySheathDiameter(value) {
    var sensor_build = $(".sensor_build_panel").children(".value_textbox").val();
    var thermocouple_type = $("input:radio[name='thermocoupleType']:checked").val()
    var allowReducedSheath = $(".sensor_build_panel").children(".desc_label").text() == "Sanitary RTD" && $(".sanitary_well_panel").children(".value_textbox").val() != "SW" && $(".sheath_termination_panel").children(".value_textbox").val() != "D";


    switch (sensor_build) {
        case "P":
            if (thermocouple_type == "4" && value == "G") {
                DisableRadioGroup(".leadwire_Fiberglass", true);
                SetValue($(".leadwire_panel").children(".value_textbox"), "");
            }
            else {
                $(".leadwire_Fiberglass").radioButtonList(leadwire_Fiberglass);
                DisableRadioOption("leadwire", "B", false);
                DisableRadioOption("leadwire", "C", false);
                //re-attach click event to radio
                $(".leadwire_panel input:radio").setCodeValueByRadio();
            }
            break;

        default:
            DisableRadioGroup(".reduced_Sheath_Diameter", false);

            switch (value) {
                case "K":
                    DisableRadioGroup(".sheath_Spring_Loaded_Hex_Nipples", false);

                    DisableRadioOption("reducedDiameter", "K", true);
                    DisableRadioOption("reducedDiameter", "N", true);
                    if (allowReducedSheath) {
                        $(".reduced_tip_diameter_panel").slideDown()
                    }
                    break;

                case "N":
                    DisableRadioGroup(".sheath_Spring_Loaded_Hex_Nipples", true);
                    SetValue($(".sheath_fitting_panel").children(".value_textbox"), "");

                    DisableRadioOption("reducedDiameter", "N", true);
                    if (allowReducedSheath) {
                        $(".reduced_tip_diameter_panel").slideDown()
                    }
                    break;

                case "O":
                    DisableRadioGroup(".sheath_Spring_Loaded_Hex_Nipples", true);
                    SetValue($(".sheath_fitting_panel").children(".value_textbox"), "");

                    if (allowReducedSheath) {
                        $(".reduced_tip_diameter_panel").slideDown();
                    }
                    break;

                case "E": case "G": case "I":
                    DisableRadioGroup(".sheath_Spring_Loaded_Hex_Nipples", true);
                    SetValue($(".sheath_fitting_panel").children(".value_textbox"), "");

                    DisableRadioGroup(".reduced_Sheath_Diameter", true);
                    if (allowReducedSheath) {
                        $(".reduced_tip_diameter_panel").slideUp()
                    }
                    break;

            }

    }


}

function RenderDisplayBySheathTerm(value) {
    sensor_build = $(".sensor_build_panel").children(".desc_label").text();

    //clear temperature textbox
    SetValue($(".temperature_panel").children(".value_textbox"), "");

    //clear leadwire type textbox
    SetValue($(".leadwire_panel").children(".value_textbox"), "");
    switch (sensor_build) {
        case ("Standard RTD"): case ("Standard MgO"):
            switch (true) {
                case valueInRadioGroup(sheathTerm_Bulk, value) && $(".sheathTerm_Bulk").prev("h4").css("display") == "block":
                    $(".leadwire_panel").slideUp();
                    $(".leadwire_length_panel").slideUp();
                    $(".flex_panel").slideUp();
                    $(".leadwire_termination_panel").slideUp();
                    $(".bulk_strip_length_panel").slideDown();
                    $(".sheath_fitting_panel").slideUp();
                    $(".spacerNine").slideUp();

                    DisableRadioGroup(".temperature", true);
                    DisableRadioOption("temperature", "H", false);
                    SetValue($(".temperature_panel").children(".value_textbox"), "H");

                    break;

                case valueInRadioGroup(sheathTerm_Leadwire, value):

                    $(".leadwire_panel").slideDown();
                    $(".leadwire_length_panel").slideDown();
                    $(".leadwire_termination_panel").slideDown();
                    $(".bulk_strip_length_panel").slideUp();
                    $(".sheath_fitting_panel").slideDown();
                    $(".spacerNine").slideDown();

                    DisableRadioGroup(".temperature", false);

                    break;

                case valueInRadioGroup(sheathTerm_Plug, value): case valueInRadioGroup(sheathTerm_Heads, value) && (!$(".tw_assembly_type_panel").is(":visible")):
                    $(".leadwire_panel").slideUp();
                    $(".leadwire_length_panel").slideUp();
                    $(".flex_panel").slideUp();
                    $(".leadwire_termination_panel").slideUp();
                    $(".bulk_strip_length_panel").slideUp();
                    $(".sheath_fitting_panel").slideDown();
                    $(".spacerNine").slideUp();

                    DisableRadioGroup(".temperature", false);

                    break;
            }
            break;
        case ("Sanitary RTD"):
            switch (true) {
                case valueInRadioGroup(sheathTerm_Leadwire, value):
                    $(".reduced_tip_diameter_panel").slideUp();
                    $(".sanitary_well_panel").slideUp();
                    $(".leadwire_panel").slideDown();
                    $(".leadwire_length_panel").slideDown();
                    $(".leadwire_termination_panel").slideDown();

                    //$(".spacerEleven").slideDown();
                    DisableRadioOption("cipCaps", "TR", true);
                    break;

                case valueInRadioGroup(sheathTerm_Heads, value):
                    $(".reduced_tip_diameter_panel").slideDown();
                    $(".sanitary_well_panel").slideDown();
                    $(".leadwire_panel").slideUp();
                    $(".leadwire_length_panel").slideUp();
                    $(".leadwire_termination_panel").slideUp();

                    //$(".spacerEleven").slideUp();

                    DisableRadioOption("cipCaps", "TR", false);
                    break;
            }
    }
};

function RenderDisplayByTemp(value) {

    DisableRadioOption("elementSingleDual", "dual", false);
    switch (value) {
        case "L":
            $(".leadwire_Teflon").radioButtonList(leadwire_Teflon);
            DisableRadioGroup(".leadwire_Fiberglass", true);
            $(".leadwire_PVC").radioButtonList(leadwire_PVC);
            break;
        case "M":
            //no medium temp duplex								
            DisableRadioOption("elementSingleDual", "dual", true);
            var elementSingleDual = $("input:radio[name='elementSingleDual']:checked");
            var dualIsSelected = elementSingleDual.val() == "dual";
            if (dualIsSelected) {
                $(".element_type_panel").children(".value_textbox").val("").siblings(".desc_label").text("");
                $("input:radio[name=elementSingleDual][value='single']").prop("checked", true);
            }

            //allow teflon with "M" series only when a transition is used
            if (!(HasTransition($(".sheath_termination_panel").children(".value_textbox").val()))) {
                DisableRadioGroup(".leadwire_Teflon", true);
            }
            else {
                $(".leadwire_Teflon").radioButtonList(leadwire_Teflon);
            }

            $(".leadwire_Fiberglass").radioButtonList(leadwire_Fiberglass);
            DisableRadioGroup(".leadwire_PVC", true);
            break;

        case "H":
            DisableRadioGroup(".leadwire_Teflon", true);
            DisableRadioGroup(".leadwire_PVC", true);
            $(".leadwire_Fiberglass").radioButtonList(leadwire_Fiberglass);

            break;
    }


    SetValue($(".leadwire_panel").children(".value_textbox"), "");
    $(".leadwire_panel input:radio").setCodeValueByRadio();

};

function RenderDisplayByThermocoupleType(value) {
    var sensor_build = $(".sensor_build_panel").children(".value_textbox").val();
    var sheath_diameter = $("input:radio[name='diameter']:checked").val()
    if (sensor_build == "P") {
        if (value == "4" && sheath_diameter == "G") {
            DisableRadioGroup(".leadwire_Fiberglass", true);
            SetValue($(".leadwire_panel").children(".value_textbox"), "");
        }
        else {
            $(".leadwire_Fiberglass").radioButtonList(leadwire_Fiberglass);
            DisableRadioOption("leadwire", "B", false);
            DisableRadioOption("leadwire", "C", false);
            //re-attach click event to radio
            $(".leadwire_panel input:radio").setCodeValueByRadio();
        }
    }
};

function RenderDisplayByThermowellType(value) {
    switch (value) {
        case "R": case "S": case "H":
            $(".tw_lag_panel").slideDown();
            $(".spacerSix").slideDown();
            $(".tw_thread_panel").slideDown();
            $(".tw_standard_insertion_panel").slideDown();
            $(".tw_flanged_insertion_panel").slideUp();
            $(".tw_flange_size_panel").slideUp();
            $(".tw_rating_panel").slideUp();
            $(".tw_flange_type_panel").slideUp();
            $(".spacerEight").slideUp();

            break;
        case "FS": case "FH":
            $(".tw_lag_panel").slideUp();
            $(".spacerSix").slideUp();
            $(".tw_thread_panel").slideUp();
            $(".tw_standard_insertion_panel").slideUp();
            $(".tw_flanged_insertion_panel").slideDown();
            $(".tw_flange_size_panel").slideDown();
            $(".tw_rating_panel").slideDown();
            $(".tw_flange_type_panel").slideDown();
            $(".spacerEight").slideDown();

            break;
    }
};

function ResetStep2() {
    //hide all code selectors
    $(".code").each(function () {
        $(this).hide();
    });

    //re-enable "enablable" textboxes
    $(".sheath_termination_panel").children(".value_textbox").attr("disabled", false);

    //clear all textboxes	
    $(".value_textbox").each(function () {
        if (!($(this).is(":disabled"))) {
            $(this).val("");
        }
    });

    //clear all descriptions
    $(".desc_label").each(function () {
        $(this).text("");
    });

    //show all radio group headers and display groups
    $(".radio_group").each(function () {
        $(this).prev("h4").show();
        if ($(this).hasClass("show_default")) {
            $(this).show();
        }
        else {
            $(this).hide();
        }
    });

};

function SetCompiledDescription() {
    var desc = "";
    $(".desc_label").each(function () {
        if ($(this).is(":visible")) {
            desc = desc + $(this).text() + ", "
        }
    });

    $(".desc_hidden").val(desc.substring(0, desc.length - 2));

}

function SetCompiledPartNumber() {

    var partnumber = "";
    var hasHeadTerm = false;
    var panel;
    var value;

    $(".value_textbox").each(function () {
        panel = $(this).parents(".code")
        value = $(this).val();

        if ($(this).is(":visible")) {
            switch (true) {
                case (panel.hasClass("flex_panel")):
                    if (value != "") {
                        partnumber = partnumber + "(" + value + ")";
                    }
                    break;
                case (panel.hasClass("special_codes_panel")):
                    if (value != "") {
                        partnumber = partnumber + " (" + value + ")";
                    }
                    break;
                case (panel.hasClass("leadwire_termination_panel")):
                    if (IsHeadStyle(value)) {
                        partnumber = partnumber + "(" + value + "/";
                        hasHeadTerm = true;
                    }
                    else {
                        partnumber = partnumber + value;
                    }
                    break;
                case (panel.hasClass("spacerTen")):
                    if (!hasHeadTerm) {
                        partnumber = partnumber + value;
                    }
                    break;

                case (panel.hasClass("plastics_sheath_fitting_panel")):
                    if (hasHeadTerm) {
                        partnumber = partnumber + value + ")";
                    }
                    else if (value == "") {
                        partnumber = partnumber.substring(0, partnumber.length - 1);
                    }
                    else {
                        partnumber = partnumber + value;
                    }
                    break;
                case (panel.hasClass("option1_panel")): case (panel.hasClass("option2_panel")): case (panel.hasClass("sanitary_well_panel")):
                    if (value != "") {
                        partnumber = partnumber + value;
                    }
                    else {
                        partnumber = partnumber.substring(0, partnumber.length - 1);
                    }
                    break;
                default:
                    partnumber = partnumber + $(this).val();
            }

        }

    });

    $(".partnumber_hidden").val(partnumber);
}

function SetSheathLengthDesc(length, fractional) {
    var length_desc;
    var fractional_desc
    var desc;

    if ((length == "") || (fractional == "")) {
        desc = "";
    }
    else {
        length_desc = (length * 1);
        if (length_desc == "0") { length_desc = "" };

        fractional_desc = GetLabelByValue(sheath_Fractional_Length, fractional);

        if (fractional_desc == "(A) None") { fractional_desc = "" };

        if (fractional_desc != "" && fractional_desc != "null") {
            fractional_desc = fractional_desc.split(")").slice(1).join(")").trim();
        }
        if ((length_desc == "") && (fractional_desc == "") && (fractional_desc != "null")) {
            desc = "No Sheath";
        }
        else if ((length_desc == "") && (fractional_desc != "") && (fractional_desc != "null")) {
            desc = fractional_desc + " Sheath";
        }
        else if ((length_desc != "") && (fractional_desc == "") && (fractional_desc != "null")) {
            desc = length_desc + " Inch Sheath";
        }
        else if ((length_desc != "") && (fractional_desc != "") && (fractional_desc != "null")) {
            desc = length_desc + "-" + fractional_desc + " Sheath";
        }
        else {
            desc = "";
        }
    }

    var length_textbox = $(".sheath_length_panel").children(".value_textbox");
    var fractional_textbox = $(".fractional_length_panel").children(".value_textbox");
    var length_desc_div = length_textbox.siblings(".desc_label");


    length_textbox.val(length);
    if (desc != "") {
        fractional_textbox.val(fractional);
    }
    else {
        fractional_textbox.val("");
    }
    length_desc_div.css("display", "none").text(desc).fadeIn();
};

function SetValue(textbox, radio_value) {
    var exists = false;
    var radio_desc;
    var $radio_value;
    var radio_list = $(textbox).siblings(".radio_list");
    var radio_element = $(radio_list).children("div").children("input:radio");

    $(radio_element).each(function () {
        if ($(this).attr("value") == radio_value && !($(this).is(":disabled"))) {
            radio_desc = $(this).next(".desc").text();
            radio_desc = radio_desc.split(")").slice(1).join(")");
            $radio_value = radio_value;
            var radio_group = $(this).parents(".radio_group");
            $(this).prop("checked", true);

            $(radio_element).parents(".radio_group").css("display", "none");
            $(radio_element).parents(".radio_group").prev("h4").children(".arrow").html("&#9660");
            $(radio_group).css("display", "block");
            $(radio_group).prev("h4").children(".arrow").html("&#9650");


            return false;
        }
        else {
            $radio_value = "";
            radio_desc = "";
            $(this).prop("checked", false);
        }
    });
    DisplayValues(textbox, $radio_value, radio_desc);

};

function ToggleToolTip(selector, trigger, container, easing) {
    if (easing == "") { easing = "fast" };

    $(trigger).on(selector, function () {
        $(this).next(container).stop().fadeIn(easing);
    });
    $(document).on("mouseup", function (e) {
        container = $(container);
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.stop().fadeOut(easing);
        }
    });
    return false;
};

function valueInRadioGroup(JSON_array, value) {
    var found = false;
    for (var i = 0; i < JSON_array.length; i++) {
        if (JSON_array[i].value == value) {
            found = true;
            break;
        }
    }
    return found;
};



function RenderCodeEvents() {
    //PENETRATION (SIP) STYLE
    $(".penetration_Styles").radioButtonList(penetration_Styles);

    //SHEATH TERMINATION
    $(".sheathTerm_Bulk").radioButtonList(sheathTerm_Bulk);
    $(".sheathTerm_Leadwire").radioButtonList(sheathTerm_Leadwire);
    $(".sheathTerm_Plug").radioButtonList(sheathTerm_Plug);
    $(".sheathTerm_Heads").radioButtonList(sheathTerm_Heads);

    //PLASTICS TERMINATION
    $(".plastics_Termination").radioButtonList(plastics_Termination);

    //ELEMENT TYPE
    $(".element_Config").radioButtonList(element_Config);
    $(".element_SingleDual").radioButtonList(element_SingleDual);
    $(".element_Resistance").radioButtonList(element_Resistance);

    $(".element_type_panel input:radio").handleElementTypeRadio();
    $(".submit_element_type").writeElementTypeByRadio();
    $(".element_type_panel .value_textbox").writeElementTypeByTextbox();

    //ELEMENT ACCURACY & TEMPERATURE COEFFICIENT
    $(".element_Curve").radioButtonList(element_Curve);
    $(".element_Accuracy").radioButtonList(element_Accuracy);

    $(".element_coefficient_panel input:radio").handleElementCoefficientRadio();
    $(".submit_element_coefficient").writeCoefficientByRadio();
    $(".element_coefficient_panel .value_textbox").writeCoefficientByTextbox();

    //TEMPERATURE
    $(".temperature").radioButtonList(temperature);

    //CALIBRATION
    $(".calibration").radioButtonList(calibration);

    //THERMOCOUPLE TYPE
    $(".thermocouple_Type").radioButtonList(thermocouple_Type);

    //JUNCTION TYPE
    $(".junction_Type").radioButtonList(junction_Type);

    //EXTENSION TYPE
    $(".extension_RTD_Type").radioButtonList(extension_RTD_Type);
    $(".extension_TC_Type").radioButtonList(extension_TC_Type);

    //EXTENSION CONFIGURATION
    $(".extension_Config_RTD").radioButtonList(extension_Config_RTD);
    $(".extension_Config_TC").radioButtonList(extension_Config_TC);

    //EXTENSION LEADWIRE TERMINATION
    $(".extension_Termination").radioButtonList(leadwire_Termination);
    $(".extension_QC_Termination").radioButtonList(extension_QC_Termination);

    //PIPE CLAMPS
    $(".pipe_Clamp").radioButtonList(pipe_Clamp);

    //SHEATH DIAMETER
    $(".sheath_Diameter").radioButtonList(sheath_Diameter);

    //PENETRATION SHEATH DIAMETER
    $(".penetration_Diameter").radioButtonList(penetration_Diameter);

    //PENETRATION PROBE STYLE
    $(".penetration_Probe_Style").radioButtonList(penetration_Probe_Style);

    //REDUCED TIP SHEATH DIAMETER
    $(".reduced_Sheath_Diameter").radioButtonList(reduced_Sheath_Diameter);

    //THERMOWELL ASSEMBLY TYPE
    $(".thermowell_Config").radioButtonList(thermowell_Config);
    $(".thermowell_Extension").radioButtonList(thermowell_Extension);

    $(".tw_assembly_type_panel input:radio").handleTWAssemblyTypeRadio();
    $(".submit_tw_assembly_type").writeThermowellAssemblyTypeByRadio();
    $(".tw_assembly_type_panel .value_textbox").writeThermowellAssemblyTypeByTextbox();

    //THERMOWELL ASSEMBLY MATERIAL
    $(".tw_Assembly_Material").radioButtonList(tw_Assembly_Material);

    //SHEATH MATERIAL
    $(".sheath_Material").radioButtonList(sheath_Material);

    //THERMOWELL TYPE
    $(".thermowell_Type").radioButtonList(thermowell_Type);

    //THERMOWELL LAG
    $(".thermowell_Lag").radioButtonList(thermowell_Lag);

    //THERMOWELL BORE
    $(".thermowell_Bore").radioButtonList(thermowell_Bore);

    //THERMOWELL PROCESS THREAD
    $(".thermowell_Thread").radioButtonList(thermowell_Thread);

    //THERMOWELL FLANGE SIZE
    $(".thermowell_Flange_Size").radioButtonList(thermowell_Flange_Size);

    //THERMOWELL RATING
    $(".thermowell_Rating").radioButtonList(thermowell_Rating);

    //THERMOWELL FLANGE TYPE
    $(".thermowell_Flange_Type").radioButtonList(thermowell_Flange_Type);

    //SHEATH LENGTH
    $(".sheath_length_panel .value_textbox").writeSheathLengthByTextBox();

    //SHEATH FRACTIONAL LENGTH
    $(".sheath_Fractional_Length").radioButtonList(sheath_Fractional_Length);
    $(".fractional_length_panel .value_textbox").writeSheathLengthByTextBox();
    $(".fractional_length_panel input:radio").writeSheathLengthByRadio();

    //PLASTICS SPADE MATERIAL
    $(".spade_Material").radioButtonList(spade_Material);

    //PLASTICS RING TYPE
    $(".ring_Type").radioButtonList(ring_Type);

    //PLASTICS STUD SIZE
    $(".stud_Size").radioButtonList(stud_Size);

    //PLASTICS SPARK PLUG GASKET SIZE
    $(".gasket_Size").radioButtonList(gasket_Size);

    //PLASTICS SPARK PLUG GASKET FORK STYLE
    $(".fork_Style").radioButtonList(fork_Style);

    //PLASTICS NOZZLE BOLT SIZE
    $(".nozzle_Bolt").radioButtonList(nozzle_Bolt);

    //PLASTICS PIPE CLAMP
    $(".pipe_Clamp").radioButtonList(pipe_Clamp);

    //PLASTICS PIPE CLAMP
    $(".bulk_Strip_Length").radioButtonList(bulk_Strip_Length);

    //THERMOWELL STANDARD INSERTION LENGTH
    $(".tw_Standard_Insertion").radioButtonList(tw_Standard_Insertion);

    //THERMOWELL FLANGED INSERTION LENGTH
    $(".tw_Flanged_Insertion").radioButtonList(tw_Flanged_Insertion);

    //THERMOWELL MATERIAL
    $(".tw_Material").radioButtonList(tw_Material);

    //SHEATH FITTING
    $(".sheath_Fitting_None").radioButtonList(sheath_Fitting_None);
    $(".sheath_Fixed_Hex_Nipples").radioButtonList(sheath_Fixed_Hex_Nipples);
    $(".sheath_Spring_Loaded_Hex_Nipples").radioButtonList(sheath_Spring_Loaded_Hex_Nipples);
    $(".sheath_Spring_Loaded_Hex_Nipples").append("<div class='note'>*Spring loaded hex nipples are only available in a 1/4 inch (K) sheath. (call for more options)</div>");
    $(".sheath_304_Hex_Bushings").radioButtonList(sheath_304_Hex_Bushings);
    $(".sheath_304_Hex_Bushings").append("<div class='note'>*Use Code (013) at end of part number to mount threads towards cold end.</div>");
    $(".sheath_316_Hex_Bushings").radioButtonList(sheath_316_Hex_Bushings);
    $(".sheath_316_Hex_Bushings").append("<div class='note'>*Use Code (013) at end of part number to mount threads towards cold end.</div>");
    $(".sheath_Adj_Comp_Fittings").radioButtonList(sheath_Adj_Comp_Fittings);
    $(".sheath_ReAdj_Comp_Fittings").radioButtonList(sheath_ReAdj_Comp_Fittings);
    $(".sheath_Flange_Bayonet").radioButtonList(sheath_Flange_Bayonet);
    $(".sheath_Bend").radioButtonList(sheath_Bend);
    $(".sheath_Bend").append("<div class='note'>*Include bend hot length when ordering.</div>");
    $(".sheath_Flat_Pads").radioButtonList(sheath_Flat_Pads);
    $(".sheath_Radius_Pads").radioButtonList(sheath_Radius_Pads);
    $(".sheath_Radius_Pads").append("<div class='note'>*Include weld pad radius when ordering.</div>");


    $(".plastics_sheath_Fixed_Hex_Nipples").radioButtonList(sheath_Fixed_Hex_Nipples);
    $(".plastics_sheath_316_Hex_Bushings").radioButtonList(sheath_316_Hex_Bushings);
    $(".plastics_sheath_316_Hex_Bushings").append("<div class='note'>*Use Code (013) at end of part number to mount threads towards cold end.</div>");
    $(".plastics_sheath_Adj_Comp_Fittings").radioButtonList(sheath_Adj_Comp_Fittings);
    $(".plastics_sheath_ReAdj_Comp_Fittings").radioButtonList(sheath_ReAdj_Comp_Fittings);

    //SANITARY WELL OPTION
    $(".sanitary_Well").radioButtonList(sanitary_Well);
    $(".sanitary_Well").append('<div class="note">*Only available with 1/2" (O) sheath OD.</div>');
    //CIP CAPS
    $(".cip_Caps").radioButtonList(cip_Caps);
    $(".thermo_Replacement").radioButtonList(thermo_Replacement);

    //LEADWIRE
    $(".leadwire_Teflon").radioButtonList(leadwire_Teflon);
    $(".leadwire_Fiberglass").radioButtonList(leadwire_Fiberglass);
    $(".leadwire_PVC").radioButtonList(leadwire_PVC);
    $(".leadwire_CoilCord").radioButtonList(leadwire_CoilCord);


    //LEADWIRE LENGTH
    $(".leadwire_length_panel .value_textbox").writeLeadwireLength();

    //LEADWIRE BEYOND FLEX LENGTH
    $(".flex_panel .value_textbox").writeLeadwireBeyondFlex();

    //LEADWIRE TERMINATION
    $(".leadwire_Termination").radioButtonList(leadwire_Termination);
    //LEADWIRE TERMINATION
    $(".head_Termination").radioButtonList(sheathTerm_Heads);
    $(".head_Termination").append("<div class='note'>*Hex Nipple or Bushing is required when using a head as a leadwire termination</div>");


    //QUICK CONNECT OPTIONS
    $(".qc_Options").radioButtonList(qc_Options);

    //SPECIAL OPTIONS
    $(".option1_Transmitter").radioButtonList(option1_Transmitter);
    $(".option1_Head").radioButtonList(option1_Head);
    $(".option1_Sheath").radioButtonList(option1_Sheath);
    $(".option1_Plug").radioButtonList(option1_Plug);
    $(".option1_Fitting").radioButtonList(option1_Fitting);
    $(".option1_Leadwire").radioButtonList(option1_Leadwire);

    $(".option2_Transmitter").radioButtonList(option2_Transmitter);
    $(".option2_Head").radioButtonList(option2_Head);
    $(".option2_Sheath").radioButtonList(option2_Sheath);
    $(".option2_Plug").radioButtonList(option2_Plug);
    $(".option2_Fitting").radioButtonList(option2_Fitting);
    $(".option2_Leadwire").radioButtonList(option2_Leadwire);

    //3 DIGIT CODES
    $(".special_Codes").radioButtonList(special_Codes);
};
