// This encapsulates javascript
$(function(){

	$(window).load(function() {
        $(document).ready(function() {
            collage();
            $('.Collage').collageCaption();
        });
    });

    // Here we apply the actual CollagePlus plugin
    function collage() {
        $('.Collage').removeWhitespace().collagePlus({
            'targetHeight': 400,
            'effect': 'effect-2',
            'direction': 'vertical'
        });
    };

    // For browser resizing
    var resizeTimer = null;
    $(window).bind('resize', function() {
        // hide all the images until we resize them
        $('.Collage .Image_Wrapper').css("opacity", 0);
        // set a timer to re-apply the plugin
        if (resizeTimer) clearTimeout(resizeTimer);
        resizeTimer = setTimeout(collage, 200);
    });

})