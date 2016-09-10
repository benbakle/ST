function pageLoad(sender, args) {
    $(document).ready(function () {

        //QUICKPRICE MENU CLICK//

        //RTD
        $(".rtd_button").on("click", function () {
            $(".step_2").fadeIn(glb_step_easeIn);
            RenderRTDDisplay();
            return false;
        });
        function RenderRTDDisplay() {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_material_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".sheath_fitting_panel" },
                { div: ".spacerNine" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];

            $(".step_1").fadeOut(glb_step_easeOut);
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("R");
            $(".sensor_build_panel").children(".desc_label").text("Standard RTD");

            DisableRadioGroup(".head_Termination", true)
            $(".head_Termination").hide().prev("h4").hide();
        };


        //RTD WELL ASSEMBLY
        $(".rtd_well_assembly").on("click", function () {
            $(".modal-popup").hide();
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".tw_assembly_type_panel" },
                { div: ".tw_assembly_material_panel" },
                { div: ".spacerThree" },
                { div: ".tw_type_panel" },
                { div: ".tw_lag_panel" },
                { div: ".tw_bore_panel" },
                { div: ".spacerFive" },
                { div: ".tw_thread_panel" },
                { div: ".spacerSix" },
                { div: ".tw_standard_insertion_panel" },
                { div: ".spacerSeven" },
                { div: ".tw_material_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];

            $(".step_1").fadeOut(glb_step_easeOut);
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("R");
            $(".sensor_build_panel").children(".desc_label").text("RTD Thermowell Assembly");

            DisableRadioGroup(".sheathTerm_Bulk", true);
            $(".sheathTerm_Bulk").prev("h4").hide();
            $(".sheathTerm_Bulk").hide()

            DisableRadioGroup(".sheathTerm_Leadwire", true);
            $(".sheathTerm_Leadwire").prev("h4").hide();
            $(".sheathTerm_Leadwire").hide();

            DisableRadioGroup(".sheathTerm_Plug", true);
            $(".sheathTerm_Plug").prev("h4").hide();
            $(".sheathTerm_Plug").hide();

            $(".sheathTerm_Heads").show();

            $(".step_2").fadeIn(glb_step_easeIn);

            $(".step2_tab").removeClass("inactive").attr("disabled", false);
            return false;
        });


        //RTD WELL REPLACEMENT
        $(".rtd_well_replacement").on("click", function () {
            $(".modal-popup").hide();
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".tw_assembly_type_panel" },
                { div: ".tw_assembly_material_panel" },
                { div: ".spacerThree" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];

            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("R");
            $(".sensor_build_panel").children(".desc_label").text("RTD Thermowell Assembly");

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "K", false);
            DisableRadioOption("diameter", "N", false);

            DisableRadioGroup(".sheathTerm_Bulk", true);
            $(".sheathTerm_Bulk").prev("h4").hide();
            $(".sheathTerm_Bulk").hide()

            DisableRadioGroup(".sheathTerm_Leadwire", true);
            $(".sheathTerm_Leadwire").prev("h4").hide();
            $(".sheathTerm_Leadwire").hide();

            DisableRadioGroup(".sheathTerm_Plug", true);
            $(".sheathTerm_Plug").prev("h4").hide();
            $(".sheathTerm_Plug").hide();

            $(".sheathTerm_Heads").show();

            $(".step_2").fadeIn(glb_step_easeIn);

            $(".step2_tab").removeClass("inactive").attr("disabled", false);
            return false;
        });

        //MGO
        $(".mgo_button").on("click", function () {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".calibration_panel" },
                { div: ".thermocouple_type_panel" },
                { div: ".junction_type_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_material_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".sheath_fitting_panel" },
                { div: ".spacerNine" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut)
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("M");
            $(".sensor_build_panel").children(".desc_label").text("Standard MgO");

            DisableRadioOption("leadwire", "B", false);
            DisableRadioOption("leadwire", "C", false);

            DisableRadioGroup(".head_Termination", true)
            $(".head_Termination").hide().prev("h4").hide();

            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //MGO WELL ASSEMBLY
        $(".mgo_well_assembly").on("click", function () {
            $(".modal-popup").hide();
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".calibration_panel" },
                { div: ".thermocouple_type_panel" },
                { div: ".junction_type_panel" },
                { div: ".spacerTwo" },
                { div: ".tw_assembly_type_panel" },
                { div: ".tw_assembly_material_panel" },
                { div: ".spacerThree" },
                { div: ".tw_type_panel" },
                { div: ".tw_lag_panel" },
                { div: ".tw_bore_panel" },
                { div: ".spacerFive" },
                { div: ".tw_thread_panel" },
                { div: ".spacerSix" },
                { div: ".tw_standard_insertion_panel" },
                { div: ".spacerSeven" },
                { div: ".tw_material_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);
            $(".step_2").fadeIn(glb_step_easeIn);
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("M");
            $(".sensor_build_panel").children(".desc_label").text("MgO Thermowell Assembly");

            DisableRadioGroup(".sheathTerm_Bulk", true);
            $(".sheathTerm_Bulk").prev("h4").hide();
            $(".sheathTerm_Bulk").hide()

            DisableRadioGroup(".sheathTerm_Leadwire", true);
            $(".sheathTerm_Leadwire").prev("h4").hide();
            $(".sheathTerm_Leadwire").hide();

            DisableRadioGroup(".sheathTerm_Plug", true);
            $(".sheathTerm_Plug").prev("h4").hide();
            $(".sheathTerm_Plug").hide();

            $(".sheathTerm_Heads").show();
            $(".step_2").fadeIn(glb_step_easeIn);

            $(".step2_tab").removeClass("inactive").attr("disabled", false);
            return false;
        });

        //MGO WELL REPLACEMENT
        $(".mgo_well_replacement").on("click", function () {
            $(".modal-popup").hide();
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".calibration_panel" },
                { div: ".thermocouple_type_panel" },
                { div: ".junction_type_panel" },
                { div: ".spacerTwo" },
                { div: ".tw_assembly_type_panel" },
                { div: ".tw_assembly_material_panel" },
                { div: ".spacerThree" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);
            $(".step_2").fadeIn(glb_step_easeIn);
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("M");
            $(".sensor_build_panel").children(".desc_label").text("MgO Thermowell Assembly");

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "K", false);
            DisableRadioOption("diameter", "N", false);

            DisableRadioGroup(".sheathTerm_Bulk", true);
            $(".sheathTerm_Bulk").prev("h4").hide();
            $(".sheathTerm_Bulk").hide()

            DisableRadioGroup(".sheathTerm_Leadwire", true);
            $(".sheathTerm_Leadwire").prev("h4").hide();
            $(".sheathTerm_Leadwire").hide();

            DisableRadioGroup(".sheathTerm_Plug", true);
            $(".sheathTerm_Plug").prev("h4").hide();
            $(".sheathTerm_Plug").hide();

            $(".sheathTerm_Heads").show();
            $(".step_2").fadeIn(glb_step_easeIn);

            $(".step2_tab").removeClass("inactive").attr("disabled", false);
            return false;
        });

        //Plastics
        $(".plastics_button").on("click", function () {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".plastics_termination_panel" },
                { div: ".calibration_panel" },
                { div: ".thermocouple_type_panel" },
                { div: ".junction_type_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".plastics_sheath_fitting_panel" },
                { div: ".spacerEleven" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("P");
            $(".sensor_build_panel").children(".desc_label").text("Standard Plastics / Packaging Industry");

            DisableRadioOption("junctionType", "E", true);

            DisableRadioGroup(".thermocouple_Type", true);
            DisableRadioOption("thermocoupleType", "0", false);
            DisableRadioOption("thermocoupleType", "4", false);

            DisableRadioGroup(".sheath_Diameter", true);
            DisableRadioOption("diameter", "G", false);
            DisableRadioOption("diameter", "I", false);
            DisableRadioOption("diameter", "K", false);

            DisableRadioOption("leadwire", "B", false);
            DisableRadioOption("leadwire", "C", false);

            DisableRadioOption("sheathTerm", "X", true);
            DisableRadioOption("sheathTerm", "Y", true);
            DisableRadioOption("sheathTerm", "Z", true);
            DisableRadioOption("sheathTerm", "4", true);
            DisableRadioOption("sheathTerm", "6", true);
            DisableRadioOption("sheathTerm", "7", true);
            DisableRadioOption("sheathTerm", "8", true);


            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //Plastics RTD
        $(".plastics_rtd_button").on("click", function () {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".plastics_termination_panel" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".plastics_sheath_fitting_panel" },
                { div: ".spacerEleven" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("F");
            $(".sensor_build_panel").children(".desc_label").text("Plastic Style RTD");

            DisableRadioOption("elementSingleDual", "dual", true);

            DisableRadioOption("sheathTerm", "X", true);
            DisableRadioOption("sheathTerm", "Y", true);
            DisableRadioOption("sheathTerm", "Z", true);
            DisableRadioOption("sheathTerm", "4", true);
            DisableRadioOption("sheathTerm", "6", true);
            DisableRadioOption("sheathTerm", "7", true);
            DisableRadioOption("sheathTerm", "8", true);

            DisableRadioOption("plasticsTerm", "J", true);
            DisableRadioOption("plasticsTerm", "L", true);

            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //CIP/DAIRY
        $(".cip_button").on("click", function () {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".reduced_tip_diameter_panel" },
                { div: ".sheath_material_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".cip_cap_panel" },
                { div: ".spacerNine" },
                { div: ".sanitary_well_panel" },
                { div: ".spacerTen"},
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("R");
            $(".sensor_build_panel").children(".desc_label").text("Sanitary RTD");


            DisableRadioGroup(".sheathTerm_Bulk", true);
            $(".sheathTerm_Bulk").prev("h4").hide();
            $(".sheathTerm_Bulk").hide();

            DisableRadioGroup(".sheathTerm_Leadwire", true);
            DisableRadioOption("sheathTerm", "D", false);
            $(".sheathTerm_Leadwire").hide();

            DisableRadioGroup(".sheathTerm_Plug", true);
            $(".sheathTerm_Plug").prev("h4").hide();
            $(".sheathTerm_Plug").hide();

            DisableRadioGroup(".head_Termination", true)
            $(".head_Termination").hide().prev("h4").hide();

            $(".sheathTerm_Heads").show();
            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //SIP INSERTION PROBES
        $(".sip_button").on("click", function () {
            var display_classes = [
                { div: ".penetration_panel" },
                { div: ".spacerOne" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".penetration_probe_style_panel" },
                { div: ".penetration_sheath_diameter_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);

            DisableRadioGroup(".head_Termination", true)
            $(".head_Termination").hide().prev("h4").hide();
            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //QUICK CONNNECT RTD
        $(".qc_button").on("click", function () {
            var display_classes = [
                { div: ".sensor_build_panel" },
                { div: ".sheath_termination_panel" },
                { div: ".spacerOne" },
                { div: ".element_type_panel" },
                { div: ".element_coefficient_panel" },
                { div: ".temperature_panel" },
                { div: ".spacerTwo" },
                { div: ".sheath_diameter_panel" },
                { div: ".sheath_material_panel" },
                { div: ".sheath_length_panel" },
                { div: ".fractional_length_panel" },
                { div: ".spacerSix" },
                { div: ".sheath_fitting_panel" },
                { div: ".spacerNine" },
                { div: ".qc_option_panel" }
            ];
            $(".step_1").fadeOut(glb_step_easeOut);
            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("QC");
            $(".sensor_build_panel").children(".desc_label").text("Quick Connect RTD");

            $(".sheath_termination_panel").children(".value_textbox").val("A").attr("disabled", true);
            $(".sheath_termination_panel").children(".desc_label").text("4-Pin Nickel Plated Connector");

            DisableRadioGroup(".sheath_Fixed_Hex_Nipples", true);
            $(".sheath_Fixed_Hex_Nipples").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Spring_Loaded_Hex_Nipples", true);
            $(".sheath_Spring_Loaded_Hex_Nipples").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_304_Hex_Bushings", true);
            $(".sheath_304_Hex_Bushings").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Adj_Comp_Fittings", true);
            $(".sheath_Adj_Comp_Fittings").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_ReAdj_Comp_Fittings", true);
            $(".sheath_ReAdj_Comp_Fittings").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Flange_Bayonet", true);
            $(".sheath_Flange_Bayonet").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Bend", true);
            $(".sheath_Bend").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Flat_Pads", true);
            $(".sheath_Flat_Pads").hide().prev("h4").hide();

            DisableRadioGroup(".sheath_Radius_Pads", true);
            $(".sheath_Radius_Pads").hide().prev("h4").hide();

            $(".sheath_316_Hex_Bushings").show();
            $(".step_2").fadeIn(glb_step_easeIn);
            return false;
        });

        //EXTENSIONS
        $(".extension_button").on("click", function () {
            var display_classes = [
                { div: ".extension_type_panel" },
                { div: ".extension_config_rtd_panel" },
                { div: ".extension_placeholder_panel" },
                { div: ".spacerTwo" },
                { div: ".extension_termination_panel" },
                { div: ".spacerThree" },
                { div: ".leadwire_panel" },
                { div: ".leadwire_length_panel" },
                { div: ".leadwire_termination_panel" },
                { div: ".spacerTen" },
                { div: ".option1_panel" },
                { div: ".optionSpacer" },
                { div: ".option2_panel" },
                { div: ".special_codes_panel" },
            ];
            $(".step_1").fadeOut(glb_step_easeOut);

            DisplayElements(display_classes);
            $(".sensor_build_panel").children(".value_textbox").val("R");
            $(".sensor_build_panel").children(".desc_label").text("Standard RTD");
            $(".step_2").fadeIn(glb_step_easeIn);

            //show coil cords as option
            DisableRadioGroup(".leadwire_CoilCord", false);
            $(".leadwire_CoilCord").prev("h4").css("display", "block");

            DisableRadioGroup(".head_Termination", true)
            $(".head_Termination").hide().prev("h4").hide();

            return false;
        });


        //PAGE SETUP JAVASCRIPT
        $("#MainContent_AddFitting_HyperLink").on("click", function () {
            $(".spacerFitting").stop().slideToggle();
            $(".sheath_fitting2_panel").stop().slideToggle();

        });

        $("#MainContent_CancelDeleteComponentFromCostup_HyperLink").on("click", function () {
            $("#MainContent_deleteComponentFromCostupConfirm").slideUp();
        });

        $("#DeleteCompany_LinkButton").on("click", function () {
            $("#deleteCompany").slideDown();
        });

        $("#CancelDeleteCompany_LinkButton").on("click", function () {
            $("#deleteCompany").slideUp();
        });

        $("#MainContent_DeleteCostUp_HyperLink").on("click", function () {
            $("#deleteCostUp").slideDown();
        });

        $("#MainContent_CancelDeleteCostup_HyperLink").on("click", function () {
            $("#deleteCostUp").slideUp();
        });

        $("#MainContent_DeleteUser_HyperLink").on("click", function () {
            $("#deleteUser").slideDown();
        });
        $("#MainContent_CancelDeleteUser_HyperLink").on("click", function () {
            $("#deleteUser").slideUp();
        });
        $("#MainContent_CancelDeleteUser_HyperLink").on("click", function () {
            $("#deleteUser").slideUp();
        });

        $("#MainContent_RemoveDist_HyperLink").on("click", function () {
            $("#removeDist").slideDown();
        });
        $("#MainContent_CancelRemoveDist_HyperLink").on("click", function () {
            $("#removeDist").slideUp();
        });

        $("#MainContent_DeleteTopic_HyperLink").on("click", function () {
            $("#deleteTopic").slideDown();
        });
        $("#MainContent_CancelDeleteTopic_HyperLink").on("click", function () {
            $("#deleteTopic").slideUp();
        });


        ToggleToolTip("click", ".value_textbox", ".radio_list", glb_radio_list_easeIn);
        $('a[rel]').modalPopup();


        $(".radio_group").prev("h4").children(".arrow").html("&#9660");
        $(".show_default").prev("h4").children(".arrow").html("&#9650");

        $(".qp_button").on("mouseover", function () {
            $(this).stop().fadeTo("slow", 0.65);
        });
        $(".qp_button").on("mouseout", function () {
            $(this).stop().fadeTo("slow", 1);
        });

        $(".single_select .radio_list h4").on("click", function () {
            var radio_list = $(this).closest(".radio_list");
            var radio_group = $(this).next(".radio_group");

            $(radio_group).stop().slideToggle("normal", function () {
                $(radio_list).toggleRadioGroup();
            });

            return false;
        });
        
        $("#MainContent_ToggleBreakDown_HyperLink").on("click", function () {
            $("#MainContent_BreakDown_Panel").stop().slideToggle("normal", function () {
                if ($(this).siblings(".small-link").html() == "(show breakdown)") {
                    $(this).siblings(".small-link").html("(hide breakdown)");
                }
                else {
                    $(this).siblings(".small-link").html("(show breakdown)");
                }
            });

        });

        //CREATE DISABLE PROPERTY FOR LINKS
        $('a').click(function (e) {
            var dis = $(this).attr('disabled');
            if (dis === 'disabled') {
                e.preventDefault();
            }
        });

        //HANDLES STEPS
        $(".qp_button").on("click", function () {
            if (!$(this).hasClass("rtd_well_button") && !$(this).hasClass("mgo_well_button")) {
                $(".step2_tab").removeClass("inactive");
            }
            $(".formiscomplete_hidden").val("false");
        });

        //STEP 1 TAB CLICK
        $(".step1_tab").on("click", function () {
            $(".complete_form").css("display","none");
            $(".formiscomplete_hidden").val("false");
            $(".step2_tab").addClass("inactive").attr("disabled", true);
            $(".step3_tab").addClass("inactive").attr("disabled", true);

            $(".step_2").fadeOut();
            $(".step_3").fadeOut();

            $(".step_1").delay(250).fadeIn();

            $(".value_textbox").css({ "outline": "none" });

           
            return false;
        });

        //STEP 2 TAB CLICK
        $(".step2_tab").on("click", function () {
            //if (!$(this).hasClass("inactive")) {
            if ($(".formiscomplete_hidden").val() == "true") {
                $(".step3_tab").addClass("inactive");
                $(".step_3").fadeOut(glb_step_easeIn, function () {
                    DisplayElements();
                    $(".step_2").fadeIn(glb_step_easeIn);
                });
            }
            return false;
        });

        //GET PRICE BUTTON CLICK
        $(".get_price").on("click", function () {
            $(".complete_form").css("display", "none");
            if (FormIsComplete()) {
                $(".formiscomplete_hidden").val("true");
                SetCompiledPartNumber();
                SetCompiledDescription();
                //StoreStep2Display();
                GetSnapShot();
            }
            else {
                $(".complete_form").slideDown();
                return false;
            }
        });

        function FormIsComplete() {
            var iscomplete = true;
            $(".value_textbox").each(function () {
                if ($(this).is(":visible") && !$(this).hasClass("optional_textbox")) {
                    if ($(this).val() == "") {
                        iscomplete = false;
                        $(this).css({ "outline": "1px solid #DD3C10" });
                    }
                    else {
                        $(this).css({ "outline": "none" });
                    }
                }
            });
            return iscomplete;
        };


        $(".textbox_clear").on("click", function () {
            $(".value_textbox").each(function () {
                if ($(this).attr("disabled") != "disabled") {
                    $(this).val("");
                    $(this).siblings(".desc_label").text("");
                }
            });
            return false;
        });



    });
};