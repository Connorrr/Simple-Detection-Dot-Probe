#File: 			DPT.sce
#Description:	Contains trial objects
#Programmer:	Connor Reid (Psy Technician)
#Created@:		15/07/2016
#LastMod@:		15/07/2016
#ModifiedBy:	Connor Reid
#Copyright@: 	School Of Psychology, Griffith University
#-------------------------------------------------------------------

pcl_file = "DPT.pcl";
scenario = "DPT";
response_matching = simple_matching;

default_font_size = 20;
default_text_color=255,255,255;
default_background_color = 0,0,0;
active_buttons = 3;
button_codes = 1,2,3;		

#write_codes = true;		#write codes to port
#pulse_width = 20; 		#if port is parallel

begin;

############### Text #########################################

text{
	caption = "In the following task you will see a fixation cross “+” in the center of your screen. Please use this fixation cross to focus your vision.
You will be presented with two words, one above and one below the center of the screen for a very brief amount of time.
After the words are presented to you, you will see either . or ..
If you see . , please press the Left Arrow key on your keyboard as quickly as you can
If you see .. , please press the Right Arrow key on your keyboard as quickly as you can

Please place your index and middle finger on the Left and Right Arrow key now.

Before completing the trials, you will be presented with practice trials.

Press the spacebar when you are ready to continue.";
}instructions_text;

text{
	caption = "That is the end of the Practice Trials.\n\n\n\n  Instructions:\nIf you see . , please press the Left Arrow key on your keyboard as quickly as you can\n
If you see .. , please press the RightArrow key on your keyboard as quickly as you can

Please place your index and middle finger on the Left and Right Arrow key now.

Press the spacebar when you are ready to continue.";

}instructions_text2;

text{
	caption = "Blah";
	font_size = 50;
}top_text;

text{
	caption = "Blerg";
	font_size = 50;
}bottom_text;

text{
	caption = "Congratulations!  You have finished all trials.  Thank you for your participation.";
}goodbye_text;

text{
	caption = "+"; font_size = 40; font_color = 255,255,0;
}fixation_text;

########################### Pictures #########################

picture{
	text instructions_text; x = 0; y = 0;
}instructions_pic;

picture{
	text instructions_text2; x = 0; y = 0;
}instructions_pic2;

picture{
	text top_text; x = 0; y = 100;
	text bottom_text; x = 0; y = -100;
	#text fixation_text; x = 0; y = 0;
}main_pic;

picture{
	text fixation_text; x = 0; y = 0;
}fixation_pic;

picture{
	text{caption = "<"; font_size = 50;}response_text; x = 0; y = 0;
	#text fixation_text; x = 0; y = 0;
}response_pic;

picture{
	text goodbye_text; x = 0; y = 0;
}goodbye_pic;

###################### Trials ################################

trial{
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture instructions_pic;
}instructions_trial;

trial{
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
	picture instructions_pic2;
}instructions_trial2;

trial{
	trial_duration = 500;
	trial_type = fixed;
	picture fixation_pic;
}fixation_trial;

trial{
	trial_duration = 200;
	trial_type = fixed;
	picture main_pic;
}main_trial;

trial{
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1,2;
	stimulus_event{
		picture response_pic;
		response_active = true;
	}response_event;
}response_trial;

trial{
	trial_duration = 3000;
	trial_type = fixed;
	picture goodbye_pic;
}goodbye_trial;