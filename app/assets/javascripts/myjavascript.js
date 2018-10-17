$(document).ready(() => {

    // POST PAGE 

    //SHOW  ALL POST ON MY WATCHLIST TEAMS
    $('#postmyWatchlist').on('click', ()=> {
        $('.watchlistCommentDiv').toggle();
        $('.allCommentDiv').toggle();
        // $('.watchlistCommentDiv').hide()
    });

    //SHOW  ALL TEAMS POST
    $('#postAllTeams').on('click', ()=> { 
        $('.watchlistCommentDiv').toggle();
        $('.allCommentDiv').toggle();
    });

    //SHOW  ALL TEAMS IN MY WATCHLIST
    $('#postTrendingTeams').on('click', ()=> {
        alert("no trending teams");
        // $('.watchlistCommentDiv').toggle();
        // $('.allCommentDiv').toggle();
    });





    // MY TEAMS PAGE
    //SHOW  ALL POST ON MY WATCHLIST TEAMS
   $('.myteamsWatchlist').on('click', ()=> {
        $('.teamMainDiv').toggle();
        $('.myteamsTeamsDiv').toggle();
        // $('.watchlistCommentDiv').toggle();
        // $('.allCommentDiv').toggle();
        // $('.watchlistCommentDiv').hide()
    });

    //SHOW  ALL TEAMS POST
    $('.myteamsAll').on('click', ()=> { 
        $('.teamMainDiv').toggle();
        $('.myteamsTeamsDiv').toggle();
    });

    //SHOW  ALL TEAMS IN MY WATCHLIST
        $('.myteamsTrending').on('click', ()=> { 
        alert("no trending teams");
        // $('.watchlistCommentDiv').toggle();
        // $('.allCommentDiv').toggle();
    });



    // MY myTEAMS PAGE
    //SHOW  ALL POST ON MY WATCHLIST TEAMS
   $('.myteamsWatchlist').on('click', ()=> {
        $('.teamMainMyteamsDiv').toggle();
        $('.myteamsDiv').toggle();
    // $('.watchlistCommentDiv').toggle();
    // $('.allCommentDiv').toggle();
    // $('.watchlistCommentDiv').hide()
    });

    //SHOW  ALL TEAMS POST
    $('.myteamsAll').on('click', ()=> { 
        $('.teamMainMyteamsDiv').toggle();
        $('.myteamsDiv').toggle();
    });

    //SHOW  ALL TEAMS IN MY WATCHLIST
        $('.myteamsTrending').on('click', ()=> { 
        alert("no trending teams");
        // $('.watchlistCommentDiv').toggle();
        // $('.allCommentDiv').toggle();
    });


});