<!-- ================================================== -->
<!-- =============== BEGIN FIXED HEADER SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";

  function menuAffix() {

      var menuBeforeAffix = jQuery('body main > header .navbar').height();

      var scrollTop       = jQuery('body main > header .navbar').scrollTop();

      jQuery('body main > header').css('padding-top', menuBeforeAffix);

      jQuery('header.top-slider .tp-banner-container').css('margin-top', - menuBeforeAffix);

      jQuery('.affix-menu').affix({
        offset: {
          top: scrollTop
        }
      });

  };

  jQuery('.affix-menu').each(function(){

    menuAffix();

  });

  jQuery(window).resize(function(){

    jQuery('.affix-menu').each(function(){

        menuAffix();

      });

  });

});
<!-- ================================================== -->
<!-- =============== END FIXED HEADER SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN SLIDER REVOLUTION SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function() { "use strict";
    jQuery(function(){
        jQuery('.tp-banner').revolution(
            {
                delay:9000,
                startwidth:1170,
                startheight:670,
                hideTimerBar:"on",
                hideThumbs:0,
                fullWidth:"on",
                forceFullWidth:"on"
            }
        );
    });
    jQuery(function(){
        jQuery('.tp-banner-800').revolution(
            {
                delay:9000,
                startwidth:1135,
                startheight:800,
                hideTimerBar:"on",
                hideThumbs:0
            }
        );
    });
    jQuery(function(){
        jQuery('.tp-banner-750').revolution(
            {
                delay:9000,
                startwidth:1135,
                startheight:750,
                hideTimerBar:"on",
                hideThumbs:0
            }
        );
    });
    jQuery(function(){
        jQuery('.tp-banner-890').revolution(
            {
                delay:9000,
                startwidth:1135,
                startheight:890,
                hideTimerBar:"on",
                hideThumbs:0
            }
        );
    });
});
<!-- ================================================== -->
<!-- =============== END SLIDER REVOLUTION SETTINGS ================ -->
<!-- ================================================== -->
    

<!-- ================================================== -->
<!-- =============== BEGIN PRETTYPHOTO SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function() { "use strict";

    jQuery("*[data-gal^='prettyPhoto']").prettyPhoto({hook: 'data-gal'});

});
<!-- ================================================== -->
<!-- =============== END PRETTYPHOTO SETTINGS ================ -->
<!-- ================================================== -->
    

<!-- ================================================== -->
<!-- =============== BEGIN FIXED FOOTER SETTINGS ================ -->
<!-- ================================================== -->
jQuery('body.fixed-footer').each(function(){ "use strict";

    var mb = jQuery('body .footer').outerHeight();

    jQuery(this).css("margin-bottom",mb)

});

jQuery(window).resize(function(){ "use strict";
    
    jQuery('body.fixed-footer').each(function(){

        var mb = jQuery('body .footer').outerHeight();

        jQuery(this).css("margin-bottom",mb)

    });
    
});
<!-- ================================================== -->
<!-- =============== END FIXED FOOTER SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN OWL CAROUSEL SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function() { "use strict";
    
    jQuery('.departaments-owl ul').owlCarousel({
        items:4,
        lazyLoad:true,
        merge: true,
        navigationText: ["",""],
        navigation: true,
        responsive:{
          1600:{
            items:4
          },
          1366:{
            items:3
          },
          1024:{
            items:2
          },
          480:{
            items:1
          }
        }
      });
    
    jQuery('.departaments-owl_1 ul').owlCarousel({
        items:4,
        lazyLoad:true,
        merge: true,
        navigationText: ["",""],
        navigation: true,
        responsive:{
          1600:{
            items:4
          },
          1366:{
            items:3
          },
          1024:{
            items:2
          },
          480:{
            items:1
          }
        }
      });

  jQuery('.owl-carousel').each(function(){

    jQuery("#owl-twitter").owlCarousel({
        navigation : true, // Show next and prev buttons
        navigationText: false,
        slideSpeed : 300,
        paginationSpeed : 400,
        rewindSpeed : 1000,
        singleItem: true,
        autoPlay : true,
        stopOnHover : false,
        rewindNav : true,
        scrollPerPage : false,
        baseClass : "owl-carousel",
        theme : "owl-theme",
        lazyLoad : false,
        lazyFollow : true,
        lazyEffect : "fade",
        autoHeight : false,
        jsonPath : false, 
        jsonSuccess : false,
        dragBeforeAnimFinish : true,
        mouseDrag : true,
        touchDrag : true,
        transitionStyle : false,
        addClassActive : false,
        beforeUpdate : false,
        afterUpdate : false,
        beforeInit: false, 
        afterInit: false, 
        beforeMove: false, 
        afterMove: false,
        afterAction: false,
        startDragging : false,
        afterLazyLoad : false
    });

    jQuery("#owl-testimonial-1").owlCarousel({
        navigation : true, // Show next and prev buttons
        navigationText: false,
        slideSpeed : 300,
        paginationSpeed : 400,
        rewindSpeed : 1000,
        singleItem: true,
        autoPlay : true,
        stopOnHover : false,
        rewindNav : true,
        scrollPerPage : false,
        baseClass : "owl-carousel",
        theme : "owl-theme",
        lazyLoad : false,
        lazyFollow : true,
        lazyEffect : "fade",
        autoHeight : false,
        jsonPath : false, 
        jsonSuccess : false,
        dragBeforeAnimFinish : true,
        mouseDrag : true,
        touchDrag : true,
        transitionStyle : false,
        addClassActive : false,
        beforeUpdate : false,
        afterUpdate : false,
        beforeInit: false, 
        afterInit: false, 
        beforeMove: false, 
        afterMove: false,
        afterAction: false,
        startDragging : false,
        afterLazyLoad : false
    });

    jQuery("#owl-testimonial-2").owlCarousel({
        navigation : true, // Show next and prev buttons
        navigationText: false,
        slideSpeed : 300,
        paginationSpeed : 400,
        rewindSpeed : 1000,
        singleItem: true,
        autoPlay : true,
        stopOnHover : false,
        rewindNav : true,
        scrollPerPage : false,
        baseClass : "owl-carousel",
        theme : "owl-theme",
        lazyLoad : false,
        lazyFollow : true,
        lazyEffect : "fade",
        autoHeight : false,
        jsonPath : false, 
        jsonSuccess : false,
        dragBeforeAnimFinish : true,
        mouseDrag : true,
        touchDrag : true,
        transitionStyle : false,
        addClassActive : false,
        beforeUpdate : false,
        afterUpdate : false,
        beforeInit: false, 
        afterInit: false, 
        beforeMove: false, 
        afterMove: false,
        afterAction: false,
        startDragging : false,
        afterLazyLoad : false
    });

    jQuery("#owl-testimonial-3").owlCarousel({
        navigation : true, // Show next and prev buttons
        navigationText: false,
        slideSpeed : 300,
        paginationSpeed : 400,
        rewindSpeed : 1000,
        singleItem: true,
        autoPlay : true,
        stopOnHover : false,
        rewindNav : true,
        scrollPerPage : false,
        baseClass : "owl-carousel",
        theme : "owl-theme",
        lazyLoad : false,
        lazyFollow : true,
        lazyEffect : "fade",
        autoHeight : false,
        jsonPath : false, 
        jsonSuccess : false,
        dragBeforeAnimFinish : true,
        mouseDrag : true,
        touchDrag : true,
        transitionStyle : false,
        addClassActive : false,
        beforeUpdate : false,
        afterUpdate : false,
        beforeInit: false, 
        afterInit: false, 
        beforeMove: false, 
        afterMove: false,
        afterAction: false,
        startDragging : false,
        afterLazyLoad : false
    });

    jQuery("#owl-latest_news_1").owlCarousel({
        // Most important owl features
    items : 4,
    itemsCustom : false,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,4],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
 
    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,
 
    //Autoplay
    autoPlay : true,
    stopOnHover : false,
 
    // Navigation
    navigation : true,
    navigationText : false,
    rewindNav : true,
    scrollPerPage : false,
 
    //Pagination
    pagination : false,
    paginationNumbers: false,
 
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
 
    // CSS Styles
    baseClass : "owl-carousel",
    theme : "owl-theme",
 
    //Lazy load
    lazyLoad : false,
    lazyFollow : true,
    lazyEffect : "fade",
 
    //Auto height
    autoHeight : false,
 
    //JSON 
    jsonPath : false, 
    jsonSuccess : false,
 
    //Mouse Events
    dragBeforeAnimFinish : true,
    mouseDrag : true,
    touchDrag : true,
 
    //Transitions
    transitionStyle : false,
 
    // Other
    addClassActive : false,
 
    //Callbacks
    beforeUpdate : false,
    afterUpdate : false,
    beforeInit: false, 
    afterInit: false, 
    beforeMove: false, 
    afterMove: false,
    afterAction: false,
    startDragging : false,
    afterLazyLoad : false
    });

jQuery("#owl-latest_news_2").owlCarousel({
        // Most important owl features
    items : 3,
    itemsCustom : false,
    itemsDesktop : [1199,3],
    itemsDesktopSmall : [980,3],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
 
    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,
 
    //Autoplay
    autoPlay : true,
    stopOnHover : false,
 
    // Navigation
    navigation : true,
    navigationText : false,
    rewindNav : true,
    scrollPerPage : false,
 
    //Pagination
    pagination : false,
    paginationNumbers: false,
 
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
 
    // CSS Styles
    baseClass : "owl-carousel",
    theme : "owl-theme",
 
    //Lazy load
    lazyLoad : false,
    lazyFollow : true,
    lazyEffect : "fade",
 
    //Auto height
    autoHeight : false,
 
    //JSON 
    jsonPath : false, 
    jsonSuccess : false,
 
    //Mouse Events
    dragBeforeAnimFinish : true,
    mouseDrag : true,
    touchDrag : true,
 
    //Transitions
    transitionStyle : false,
 
    // Other
    addClassActive : false,
 
    //Callbacks
    beforeUpdate : false,
    afterUpdate : false,
    beforeInit: false, 
    afterInit: false, 
    beforeMove: false, 
    afterMove: false,
    afterAction: false,
    startDragging : false,
    afterLazyLoad : false
    });

jQuery("#owl-doctors_1").owlCarousel({
        // Most important owl features
    items : 3,
    itemsCustom : false,
    itemsDesktop : [1199,3],
    itemsDesktopSmall : [980,3],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
 
    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,
 
    //Autoplay
    autoPlay : true,
    stopOnHover : false,
 
    // Navigation
    navigation : true,
    navigationText : false,
    rewindNav : true,
    scrollPerPage : false,
 
    //Pagination
    pagination : false,
    paginationNumbers: false,
 
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
 
    // CSS Styles
    baseClass : "owl-carousel",
    theme : "owl-theme",
 
    //Lazy load
    lazyLoad : false,
    lazyFollow : true,
    lazyEffect : "fade",
 
    //Auto height
    autoHeight : false,
 
    //JSON 
    jsonPath : false, 
    jsonSuccess : false,
 
    //Mouse Events
    dragBeforeAnimFinish : true,
    mouseDrag : true,
    touchDrag : true,
 
    //Transitions
    transitionStyle : false,
 
    // Other
    addClassActive : false,
 
    //Callbacks
    beforeUpdate : false,
    afterUpdate : false,
    beforeInit: false, 
    afterInit: false, 
    beforeMove: false, 
    afterMove: false,
    afterAction: false,
    startDragging : false,
    afterLazyLoad : false
    });

jQuery("#owl-doctors_2").owlCarousel({
        // Most important owl features
    items : 4,
    itemsCustom : false,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,4],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
 
    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,
 
    //Autoplay
    autoPlay : true,
    stopOnHover : false,
 
    // Navigation
    navigation : true,
    navigationText : false,
    rewindNav : true,
    scrollPerPage : false,
 
    //Pagination
    pagination : false,
    paginationNumbers: false,
 
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
 
    // CSS Styles
    baseClass : "owl-carousel",
    theme : "owl-theme",
 
    //Lazy load
    lazyLoad : false,
    lazyFollow : true,
    lazyEffect : "fade",
 
    //Auto height
    autoHeight : false,
 
    //JSON 
    jsonPath : false, 
    jsonSuccess : false,
 
    //Mouse Events
    dragBeforeAnimFinish : true,
    mouseDrag : true,
    touchDrag : true,
 
    //Transitions
    transitionStyle : false,
 
    // Other
    addClassActive : false,
 
    //Callbacks
    beforeUpdate : false,
    afterUpdate : false,
    beforeInit: false, 
    afterInit: false, 
    beforeMove: false, 
    afterMove: false,
    afterAction: false,
    startDragging : false,
    afterLazyLoad : false
    });

jQuery("#owl-our_top_doctors").owlCarousel({
        // Most important owl features
    items : 4,
    itemsCustom : false,
    itemsDesktop : [1199,4],
    itemsDesktopSmall : [980,4],
    itemsTablet: [768,2],
    itemsTabletSmall: false,
    itemsMobile : [479,1],
    singleItem : false,
    itemsScaleUp : false,
 
    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,
 
    //Autoplay
    autoPlay : true,
    stopOnHover : false,
 
    // Navigation
    navigation : true,
    navigationText : false,
    rewindNav : true,
    scrollPerPage : false,
 
    //Pagination
    pagination : false,
    paginationNumbers: false,
 
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,
 
    // CSS Styles
    baseClass : "owl-carousel",
    theme : "owl-theme",
 
    //Lazy load
    lazyLoad : false,
    lazyFollow : true,
    lazyEffect : "fade",
 
    //Auto height
    autoHeight : false,
 
    //JSON 
    jsonPath : false, 
    jsonSuccess : false,
 
    //Mouse Events
    dragBeforeAnimFinish : true,
    mouseDrag : true,
    touchDrag : true,
 
    //Transitions
    transitionStyle : false,
 
    // Other
    addClassActive : false,
 
    //Callbacks
    beforeUpdate : false,
    afterUpdate : false,
    beforeInit: false, 
    afterInit: false, 
    beforeMove: false, 
    afterMove: false,
    afterAction: false,
    startDragging : false,
    afterLazyLoad : false
    });

  });
 
});
<!-- ================================================== -->
<!-- =============== END OWL CAROUSEL SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN VIDEO YOUTUBE SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";
    jQuery('.vdyt').fitVids();
});
<!-- ================================================== -->
<!-- =============== END VIDEO YOUTUBE SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN VIDEO BACKGROUND SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";
    jQuery(function(){
        jQuery(".player").mb_YTPlayer();
    });
});
<!-- ================================================== -->
<!-- =============== END VIDEO BACKGROUND SETTINGS ================ -->
<!-- ================================================== -->

<!-- ================================================== -->
<!-- =============== BEGIN ROYAL SLIDER SETTINGS ================ -->
<!-- ================================================== -->
jQuery(function() { "use strict";
    jQuery('.rsMetrix').royalSlider({
        arrowsNavAutoHide: false,
        autoScaleSliderHeight: 425,
        thumbsFitInViewport: false,
        startSlideId: 0,
        globalCaption: false,
        autoScaleSlider: true,
        loop: false,
        navigateByClick: true,
        arrowsNav:true,
        arrowsNavHideOnTouch: true,
        controlNavigation: false,
        preloadNearbyImages:true,
        imageScalePadding: 0
    });

    jQuery('.rsMedic_1').royalSlider({
        arrowsNavAutoHide: false,
        autoScaleSliderHeight: 500,
        thumbsFitInViewport: false,
        startSlideId: 0,
        globalCaption: false,
        autoScaleSlider: true,
        loop: false,
        navigateByClick: true,
        arrowsNav:true,
        arrowsNavHideOnTouch: true,
        controlNavigation: false,
        preloadNearbyImages:true,
        imageScalePadding: 0
    });

    jQuery('.rsMedic').royalSlider({
        arrowsNavAutoHide: false,
        autoScaleSliderHeight: 425,
        thumbsFitInViewport: false,
        startSlideId: 0,
        globalCaption: false,
        autoScaleSlider: true,
        loop: false,
        navigateByClick: true,
        arrowsNav:true,
        arrowsNavHideOnTouch: true,
        controlNavigation: false,
        preloadNearbyImages:true,
        imageScalePadding: 0,
        autoPlay: {
          enabled: true,
          delay: 900,
          pauseOnHover: true
        }
    });
});

<!-- ================================================== -->
<!-- =============== END ROYAL SLIDER SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== START ISOTOPE ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";

  function isotope() {

    var container = jQuery('.isotope-container');

    container.imagesLoaded(function() {
      container.isotope();
    });

    jQuery('.alternate-divs').imagesLoaded(function() {
      jQuery('.alternate-divs').isotope();
    });

    jQuery('.alternate-divs').isotope();

    container.isotope();

    var jQueryoptionSets = jQuery('.filter-isotope .option-set'),
        jQueryoptionLinks = jQueryoptionSets.find('a');

    jQueryoptionLinks.click(function(){
      var jQuerythis = jQuery(this);
      if ( jQuerythis.hasClass('selected') ) {
         return false;
      }
      var jQueryoptionSet = jQuerythis.parents('.option-set');
      jQueryoptionSet.find('.selected').removeClass('selected');
      jQuerythis.addClass('selected');

      var options = {},
          key = jQueryoptionSet.attr('data-option-key'),
          value = jQuerythis.attr('data-option-value');
      value = value === 'false' ? false : value;
      options[ key ] = value;
      if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
        changeLayoutMode( jQuerythis, options )
      } else {
        container.isotope( options );
      }

        return false;
    });

    function hoverEvents() {

      jQuery(this).css('overflow','inherit')

    };

    function unHoverEvents() {

      jQuery(this).css('overflow','hidden')

    };

    container.hover(hoverEvents,unHoverEvents);

  };

  isotope();

  jQuery(window).resize(function(){

    isotope();

  });

});
<!-- ================================================== -->
<!-- =============== END ISOTOPE ================ -->
<!-- ================================================== -->

<!-- ================================================== -->
<!-- =============== START CIRCLES SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";
    jQuery('.pie-progress-charts').each(function(){
        //Circles 1
        Circles.create({
          id:         'circle-1',
          percentage: 75,
          radius:     110,
          width:      3,
          number:     75,
          text:       '%',
          colors:     ['#eaeaea', '#8cd5fa'],
          duration:   1000
        });

        //Circles 2
        Circles.create({
          id:         'circle-2',
          percentage: 31,
          radius:     110,
          width:      3,
          number:     31,
          text:       '%',
          colors:     ['#eaeaea', '#8cd5fa'],
          duration:   1000
        });

        //Circles 3
        Circles.create({
          id:         'circle-3',
          percentage: 23,
          radius:     110,
          width:      3,
          number:     23,
          text:       '%',
          colors:     ['#eaeaea', '#8cd5fa'],
          duration:   1000
        });

        //Circles 4
        Circles.create({
          id:         'circle-4',
          percentage: 86,
          radius:     110,
          width:      3,
          number:     86,
          text:       '%',
          colors:     ['#eaeaea', '#8cd5fa'],
          duration:   1000
        });
    });
});
<!-- ================================================== -->
<!-- =============== END CIRCLES SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN BEFORE AFTER SETTINGS ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";
      jQuery('#contains').beforeAfter({
        animateIntro : true,
        introDelay : 2000,
        introDuration : 500,
        showFullLinks : false
      });
});
<!-- ================================================== -->
<!-- =============== END BEFORE AFTER SETTINGS ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN TRIGGER TOP-NAV ================ -->
<!-- ================================================== -->
jQuery('ul.navi li').click(function(){ "use strict";
    jQuery('.top-nav').slideToggle();
    if(jQuery('ul.navi li a i').hasClass('fa-angle-down')) {
        jQuery('ul.navi li a i').removeClass('fa-angle-down');
        jQuery('ul.navi li a i').addClass('fa-angle-up');
    } else {
        jQuery('ul.navi li a i').removeClass('fa-angle-up');
        jQuery('ul.navi li a i').addClass('fa-angle-down');
    }
});
<!-- ================================================== -->
<!-- =============== END TRIGGER TOP-NAV ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN SELECTED ISOTOPE ================ -->
<!-- ================================================== -->
jQuery('.option-set').each(function( i, listGroup) { "use strict";
    var $listGroup = jQuery(listGroup);
        $listGroup.on('click', 'li' > 'a', function() {
        $listGroup.find('selected').removeClass('selected');
        jQuery(this).addClass('selected');
    });
});
<!-- ================================================== -->
<!-- =============== END SELECTED ISOTOPE ================ -->
<!-- ================================================== -->


<!-- ================================================== -->
<!-- =============== BEGIN TOOLTIP ISOTOPE ================ -->
<!-- ================================================== -->
jQuery(document).ready(function(){ "use strict";
     jQuery('.thumbnail.thumbnail_awesome_team > ul > li > a').tooltip({
        placement: 'top',
        html: 'true' 
    });
    jQuery('table.table_1 tbody > tr > td.toolt:first-child > div').tooltip({
        placement: 'top',
        html: 'true' 
    });
    jQuery('table.table_1 tbody > tr > td.toolt:nth-last-child(n+3) > div').tooltip({
        placement: 'right',
        html: 'true' 
    });
    jQuery('table.table_1 tbody > tr > td.toolt:nth-last-child(-n+2) > div').tooltip({
        placement: 'left',
        html: 'true' 
    });
    jQuery('table.table_2 tbody > tr > td.toolt:nth-last-child(n+3) > div').tooltip({
        placement: 'right',
        html: 'true' 
    });
    jQuery('table.table_2 tbody > tr > td.toolt:nth-last-child(-n+2) > div').tooltip({
        placement: 'left',
        html: 'true' 
    });
});
<!-- ================================================== -->
<!-- =============== END TOOLTIP ISOTOPE ================ -->
<!-- ================================================== -->