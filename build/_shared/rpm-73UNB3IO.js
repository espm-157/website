import{b as o}from"/build/_shared/chunk-2NH4LW52.js";var a,c,i,g,t,l,p,f,u,h,m,d=o(()=>{a=/^-+$/,c=/^(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)  ?\d{1,2} \d{2}:\d{2}(:\d{2})? [A-Z]{3,4} \d{4} - /,i=/^[\w+.-]+@[\w.-]+/,g={name:"rpmchanges",token:function(r){return r.sol()&&(r.match(a)||r.match(c))?"tag":r.match(i)?"string":(r.next(),null)}},t=/^(i386|i586|i686|x86_64|ppc64le|ppc64|ppc|ia64|s390x|s390|sparc64|sparcv9|sparc|noarch|alphaev6|alpha|hppa|mipsel)/,l=/^[a-zA-Z0-9()]+:/,p=/^%(debug_package|package|description|prep|build|install|files|clean|changelog|preinstall|preun|postinstall|postun|pretrans|posttrans|pre|post|triggerin|triggerun|verifyscript|check|triggerpostun|triggerprein|trigger)/,f=/^%(ifnarch|ifarch|if)/,u=/^%(else|endif)/,h=/^(\!|\?|\<\=|\<|\>\=|\>|\=\=|\&\&|\|\|)/,m={name:"rpmspec",startState:function(){return{controlFlow:!1,macroParameters:!1,section:!1}},token:function(r,e){var n=r.peek();if(n=="#")return r.skipToEnd(),"comment";if(r.sol()){if(r.match(l))return"header";if(r.match(p))return"atom"}if(r.match(/^\$\w+/)||r.match(/^\$\{\w+\}/))return"def";if(r.match(u))return"keyword";if(r.match(f))return e.controlFlow=!0,"keyword";if(e.controlFlow){if(r.match(h))return"operator";if(r.match(/^(\d+)/))return"number";r.eol()&&(e.controlFlow=!1)}if(r.match(t))return r.eol()&&(e.controlFlow=!1),"number";if(r.match(/^%[\w]+/))return r.match("(")&&(e.macroParameters=!0),"keyword";if(e.macroParameters){if(r.match(/^\d+/))return"number";if(r.match(")"))return e.macroParameters=!1,"keyword"}return r.match(/^%\{\??[\w \-\:\!]+\}/)?(r.eol()&&(e.controlFlow=!1),"def"):(r.next(),null)}}});d();export{g as rpmChanges,m as rpmSpec};
