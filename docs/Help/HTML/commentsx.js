/*! 
User comments script functions for Premium Pack Version 2.32 for Help & Manual 6
Support for XCommentPro commenting system
Copyright (c) 2008-2013 by Tim Green 
All rights reserved. 
*/
var commentsOpen="closed";var $cBox,$cLink1,$cLink2;var iOx=/ipad|iphone/gi;var comments_xcomment=comments_type.toLowerCase()=="xcomment"?true:false;var commentsWidth=function(){var a=$cBox.width();var c=$(document).width();var b=0;if(a>842&&c>912){b=a-842;$cBox.css({right:"",width:"842px"})}else{if(c<912){$cBox.css({right:40+"px",width:""})}}};function showComments(){var a;if($cBox.is(":visible")){$cBox.slideUp(400,function(){$("div#atocIcon").show();$cLink1.css("visibility","visible");$cLink2.css("visibility","visible");commentsOpen="closed"});return false}else{commentsWidth();$cBox.slideDown(400);$("div#atocIcon").hide();$cLink1.css("visibility","hidden");$cLink2.css("visibility","hidden");commentsOpen="open";return false}}function doXcomment(){if(!cookiesEnabled){alert("Cookies must be enabled in your browser for user comments.");return}$(window).bind("unload",function(){setCookie("commentsOpen",commentsOpen,"seconds",3)});commentsOpen=(getCookie("commentsOpen")==="open")?"open":"closed";if(!$("span.xcSpanNoMessages").length>0){if($("span.xcSpanPagination").length>0){(function(){var b=parseInt($($("a.xcPaginationLinks")[$("a.xcPaginationLinks").length-1]).html(),10);var a=parseInt($("span.xcSpanCurrentPageNum").html().replace(/\(|\)/g,""),10);b=b>a?b:a;$("span.comments").html(b+" "+comments_pages)})()}else{$("span.comments").html($("div.xcDivCommentHeader").length)}}if(commentsOpen==="open"){showComments()}}$(document).ready(function(){var b;try{b=parent.hmWebHelp.server}catch(a){b=false}if(window.frameElement&&b){if(window.frameElement.id=="hmcontent"){$cLink1=$("a#commentToggle1");$cLink2=$("a#commentToggle2");$cBox=$("div#commentsWrapper");$(window).bind("resize",commentsWidth);doXcomment()}else{$("p.commentPara").hide()}}else{$("p.commentPara").hide()}});