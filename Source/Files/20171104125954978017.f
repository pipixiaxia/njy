body { font: normal 100% Helvetica, Arial, sans-serif; }
.content
{
}
.content .d_list
{
    border-bottom-style: solid;
    border-bottom-color: #C0C0C0;
    border-bottom-width: 1px;
    line-height: 42px;
    height:auto!important;
    min-height:42px;
}
.content h1
{
    font-size: 1.3em;
}
.content h2
{
    font-size: 1.1em;
}
.content .d_inf
{
    line-height: 20px;
    height:auto!important;
    min-height:20px;
}
.content span
{
    font-size: 1.2em;
}
.content .input
{
    float: right;
    height: 40px;
    line-height: 40px;
    border-style: none;
}
.content .input input
{
    font-size: 1.1em;
    border-style: none;
    -webkit-user-modify: read-write-plaintext-only;
    text-align: right;
}

.content .d_items
{
    border-bottom-style: none;
}

.content select
{
   width:120px;
   font-size: 1.1em;
}

.icon
{
    vertical-align: middle;
    margin-right: 5px;
}

.content .d_button
{
    line-height: 58px;
    height: auto !important;
    min-height: 58px;
    text-align: center;
}

input[type="submit"]:enabled
{
    border-style: none;
    background-color: #3498db;
    width: 200px;
    display: inline-block;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 1em;
    text-align: center;
    text-decoration: none;
    color: #fff;
    position: relative;
    padding-bottom: 10px;
    padding-top: 10px;
    background-image: linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
    background-image: -o-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
    background-image: -moz-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
    background-image: -webkit-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
    background-image: -ms-linear-gradient(bottom, rgb(44,160,202) 0%, rgb(62,184,229) 100%);
    background-image: -webkit-gradient(	linear,	left bottom,	left top,	color-stop(0, rgb(44,160,202)),	color-stop(1, rgb(62,184,229))	);
    -webkit-border-bottom-right-radius: 5px;
    -webkit-border-bottom-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -webkit-border-top-left-radius: 5px;
    -moz-border-radius-bottomright: 5px;
    -moz-border-radius-bottomleft: 5px;
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
}
input[type="submit"]:disabled
{
    border-style: none;
    background-color: #CCCCCC;
    width: 200px;
    display: inline-block;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 1em;
    text-align: center;
    text-decoration: none;
    color: #fff;
    position: relative;
    padding-bottom: 10px;
    padding-top: 10px;
    background-image: linear-gradient(bottom, rgb(204,204,204) 0%, rgb(192,192,192) 100%);
    background-image: -o-linear-gradient(bottom, rgb(204,204,204) 0%, rgb(192,192,192) 100%);
    background-image: -moz-linear-gradient(bottom, rgb(204,204,204) 0%, rgb(192,192,192) 100%);
    background-image: -webkit-linear-gradient(bottom, rgb(204,204,204) 0%, rgb(192,192,192) 100%);
    background-image: -ms-linear-gradient(bottom, rgb(204,204,204) 0%, rgb(192,192,192) 100%);
    background-image: -webkit-gradient(	linear,	left bottom,	left top,	color-stop(0, rgb(204,204,204)),	color-stop(1, rgb(192,192,192))	);
    -webkit-border-bottom-right-radius: 5px;
    -webkit-border-bottom-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -webkit-border-top-left-radius: 5px;
    -moz-border-radius-bottomright: 5px;
    -moz-border-radius-bottomleft: 5px;
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
}
.wait_div
{
    padding: 20px;
    margin: 20px;
    vertical-align: middle;
    text-align: center;
    display: none;
}
/* ==================================================================== */
/* CHECKBOX ---------------------------------------------------- */
/* ==================================================================== */
input[type="checkbox"] {
	display: none;
}

input[id^="ck_sex"] + label {
	cursor: pointer;
	font-size: 1em;
}

[id^="ck_sex"] + label
{
    background-color: #FFF;
    border-radius: 7px;
    display: inline-block;
    position: relative;
    margin-top: 5px;
    margin-right: 10px;
    background: #F7836D;
    width: 55px;
    padding: 4px 9px;
    height: 22px;
    box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.1), 0 0 10px rgba(245, 146, 146, 0.4);
    line-height: 22px;
}

[id^="ck_sex"] + label:before {
	content: ' ';
	position: absolute;
	background: #FFF;
	top: 0px;
	z-index: 99999;
	left: 0px;
	width: 24px;
	color: #FFF;
	height: 30px;
	border-radius: 7px;
	box-shadow: 0 0 1px rgba(0,0,0,0.6);
}

[id^="ck_sex"] + label:after
{
    content: '女';
    position: absolute;
    left: 37px;
    font-size: 1.2em;
    color: white;
    font-weight: bold;
    border-radius: 100px;
    padding-right: 1px;
    padding-left: 1px;
}

[id^="ck_sex"]:checked + label {
	background: #67A5DF;
	box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.1), 0 0 10px rgba(146, 196, 245, 0.4);
}

[id^="ck_sex"]:checked + label:after {
	content: '男';
	left: 16px;
}

[id^="ck_sex"]:checked + label:before {
	content: ' ';
	position: absolute;
	z-index: 99999;
	left: 49px;
}


[id^="ck_sex"] + label:after {
	left: 35px;	
}	

/* ==================================================================== */
/* CHECKBOX  END---------------------------------------------------- */
/* ==================================================================== */
/* ==================================================================== */
/* CK_ITEM  BEGIN---------------------------------------------------- */
/* ==================================================================== */
[id="ck_item"] td
{
    width: 50%;
    overflow: hidden;
}

/* Prevent text and blocks selection */
[id^="ck_item_"].labelauty + label ::selection { background-color: rgba(255, 255, 255, 0); }
[id^="ck_item_"].labelauty + label ::-moz-selection { background-color: rgba(255, 255, 255, 0); }

/* Hide original checkboxes. They are ugly! */
[id^="ck_item_"].labelauty { display: none !important; }

/*
 * Let's style the input
 * Feel free to work with it as you wish!
 */
[id^="ck_item_"].labelauty + label
{
    display: table;
    font-size: 1em;
    padding: 0px;
    background-color: #efefef;
    color: #b3b3b3;
    cursor: pointer;
    border-radius: 3px 3px 3px 3px;
    -moz-border-radius: 3px 3px 3px 3px;
    -webkit-border-radius: 3px 3px 3px 3px;
    transition: background-color 0.25s;
    -moz-transition: background-color 0.25s;
    -webkit-transition: background-color 0.25s;
    -o-transition: background-color 0.25s;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -o-user-select: none;
    line-height: 48px;
    width: 100%;
    height: 48px;
    vertical-align: middle;
    text-align: center;
    overflow: hidden;
}

/* Stylish text inside label */

[id^="ck_item_"].labelauty + label > span.labelauty-unchecked,
[id^="ck_item_"].labelauty + label > span.labelauty-checked
{
	display: inline-block;
	line-height: 16px;
	vertical-align: middle;
}


/* When there's a label, add a little margin to the left */
[id^="ck_item_"].labelauty + label > span.labelauty-unchecked-image + span.labelauty-unchecked,
[id^="ck_item_"].labelauty + label > span.labelauty-checked-image + span.labelauty-checked
{
	margin-left: 0px;
}

/* When not Checked */
[id^="ck_item_"].labelauty:not(:checked):not([disabled]) + label:hover
{
	background-color: #eaeaea;
	color: #a7a7a7;
}
[id^="ck_item_"].labelauty:not(:checked) + label > span.labelauty-checked-image
{
	display: none;
}

[id^="ck_item_"].labelauty:not(:checked) + label > span.labelauty-checked
{
	display: none;
}

/* When Checked */
[id^="ck_item_"].labelauty:checked + label
{
	background-color: #3498db;
	color: #ffffff;
}

[id^="ck_item_"].labelauty:checked:not([disabled]) + label:hover
{
	background-color: #72c5fd;
}
[id^="ck_item_"].labelauty:checked + label > span.labelauty-unchecked-image
{
	display: none;
}

[id^="ck_item_"].labelauty:checked + label > span.labelauty-unchecked
{
	display: none;
}

[id^="ck_item_"].labelauty:checked + label > span.labelauty-checked
{
	display: inline-block;
}

[id^="ck_item_"].labelauty.no-label:checked + label > span.labelauty-checked
{
	display: block;
}

/* When Disabled */
[id^="ck_item_"].labelauty[disabled] + label
{
	opacity: 0.5;
}

/* Add a background to (un)checked images */
[id^="ck_item_"].labelauty + label > span.labelauty-unchecked-image
{
	/*background-image: url(../images/input-unchecked.png );*/
}

[id^="ck_item_"].labelauty + label > span.labelauty-checked-image
{
	/*background-image: url(../images/input-checked.png );*/
}