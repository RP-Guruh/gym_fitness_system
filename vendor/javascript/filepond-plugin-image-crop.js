var t={};(function(e,n){t=n()})(0,(function(){var t=function isImage(t){return/^image/.test(t.type)};var e=function plugin(e){var n=e.addFilter,r=e.utils;var a=r.Type,o=r.isFile,i=r.getNumericAspectRatioFromString;var u=function allowCrop(e,n){return!(!t(e.file)||!n("GET_ALLOW_IMAGE_CROP"))};var f=function isObject(t){return"object"===typeof t};var c=function isNumber(t){return"number"===typeof t};var p=function updateCrop(t,e){return t.setMetadata("crop",Object.assign({},t.getMetadata("crop"),e))};n("DID_CREATE_ITEM",(function(t,e){var n=e.query;t.extend("setImageCrop",(function(e){if(u(t,n)&&f(center)){t.setMetadata("crop",e);return e}}));t.extend("setImageCropCenter",(function(e){if(u(t,n)&&f(e))return p(t,{center:e})}));t.extend("setImageCropZoom",(function(e){if(u(t,n)&&c(e))return p(t,{zoom:Math.max(1,e)})}));t.extend("setImageCropRotation",(function(e){if(u(t,n)&&c(e))return p(t,{rotation:e})}));t.extend("setImageCropFlip",(function(e){if(u(t,n)&&f(e))return p(t,{flip:e})}));t.extend("setImageCropAspectRatio",(function(e){if(u(t,n)&&"undefined"!==typeof e){var r=t.getMetadata("crop");var a=i(e);var o={center:{x:.5,y:.5},flip:r?Object.assign({},r.flip):{horizontal:false,vertical:false},rotation:0,zoom:1,aspectRatio:a};t.setMetadata("crop",o);return o}}))}));n("DID_LOAD_ITEM",(function(e,n){var r=n.query;return new Promise((function(n,a){var u=e.file;if(!o(u)||!t(u)||!r("GET_ALLOW_IMAGE_CROP"))return n(e);var f=e.getMetadata("crop");if(f)return n(e);var c=r("GET_IMAGE_CROP_ASPECT_RATIO");e.setMetadata("crop",{center:{x:.5,y:.5},flip:{horizontal:false,vertical:false},rotation:0,zoom:1,aspectRatio:c?i(c):null});n(e)}))}));return{options:{allowImageCrop:[true,a.BOOLEAN],imageCropAspectRatio:[null,a.STRING]}}};var n="undefined"!==typeof window&&"undefined"!==typeof window.document;n&&document.dispatchEvent(new CustomEvent("FilePond:pluginloaded",{detail:e}));return e}));var e=t;export default e;
