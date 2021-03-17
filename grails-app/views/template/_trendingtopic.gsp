
<head xmlns="http://www.w3.org/1999/html">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="posts">
    <div class="card" style="border: 2px solid black;" id="sr">
        <div class="card-header">Trending topics</div>
<g:each in="${trend}"  var="tr">
        <div class="card-body" >
            <div class="container mt-6" style="border:  2px solid black;">
%{--            <g:if test="${topicList}">--}%


                <div class="media border p-3" >
%{--                    <img src="img.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">--}%

                    <div class="media-body" >

                        <div class="row">
%{--                            <g:img dir="images/profilePicture" class="pImage" file='${tt.createdBy.photo}' alt="Missing Image" />--}%
                            <img class="card-img-top" src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
                                 alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px">
                            <div class="col-sm-4">
                                <strong class="card-text post_textsize">${tr.createdBy.userName}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <g:link controller="topic" action="topicshow"  params="[tName: tr.id]">${tr.name}</g:link>
                            <div class="col-sm-4">
                                <a class="subscribe${tr.id}" onclick="sub(${tr.id})">Subscribe</a>
                                <a class="unsubscribe${tr.id}" onclick="unsub(${tr.id})"></a>
                            </div>
                        <div class="col-sm-3">
                            <strong class="post_textsize">Subscriptions</strong>
                            <p>
                                <ls:topicCount userId="${session.user.id}"></ls:topicCount>
                            </p>
                        </div>
                        <div class="col-sm-3">
                            <strong class="post_textsize">post</strong>
                            <p>
                                50
                            </p>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Serious</option>
                                    <option value="1">Not Serious</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <g:if test="${session.user.id == tr.createdBy.id}">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>private</option>
                                        <option value="1">public</option>
                                    </select>
                                </g:if>
                            </div>
                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <g:if test="${session.user.id == tr.createdBy.id}">
                                            <i class="fa fa-edit fa-lg" aria-hidden="true"></i>
                                        </g:if>
                                    </div>
                                    <div class="col-sm-4">
                                        <g:if test="${session.user.id == tr.createdBy.id}">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </g:if>
                                    </div>
                                    <div class="col-sm-4">
                                        <i class="fa fa-envelope fa-lg" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter-square"></i></a>

                </div>

            </div>
            </div>
        </div>

                </g:each>


            </div>
        </div>
<div class="row" id="searchview">
    <p>.</p>
    </div>
<script>
    function sub(id)
    {
        $.ajax({
                method: 'post',
                url: "http://localhost:8091/subscription/save",
                data: {topicid: id},
                datatype: "JSON",
                success: function (result) {
                    $(".subscribe" + result).hide()
                        $(".unsubscribe" + result).text("unsubscribe")
                },
            });
        };
    function unsub(id)
    {
        $.ajax({
            method: 'post',
            url: "http://localhost:8091/subscription/delete",
            data: {topicid: id},
            datatype: "JSON",
            success: function (result) {
                $(".subscribe" + result).text("subscribe")
                    $(".unsubscribe" + result).hide()
            },
        });
    };

</script>

</body>




