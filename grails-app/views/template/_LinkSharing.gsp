<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <asset:stylesheet href="nav.css"/>
    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <br>
    <h2><i class="fas fa-link fa-2x"></i>LINK SHARING</h2>

    <ul class="nav justify-content-end">
        <li class="nav-item">
            <button type="button" class="nav-link" style="color: pink;" data-toggle="modal"
                    data-target="#shareDocs"><i class="fas fa-file-upload fa-2x"></i>
            </button>
        </li>
        &nbsp
        <li class="nav-item">
            <button type="button" class="nav-link" style="color: pink;" data-toggle="modal"
                    data-target="#createTopic"><i class="fas fa-greater-than fa-2x"></i>
            </button>
        </li>
        &nbsp
        <li class="nav-item">
            <button type="button" class="nav-link" style="color: pink;" data-toggle="modal"
                    data-target="#shareLink"><i class="fas fa-link fa-2x"></i>
            </button>
        </li>
        &nbsp
        <li class="nav-item">
            <button type="button" class="nav-link" style="color: pink;" data-toggle="modal"
                    data-target="#sendinvite"><i class="fas fa-share fa-2x"></i>
            </button>
        </li>
        &nbsp
        <li class="nav-item">
            <div class="searchbar">
                <div class="search-container">
                    <g:form action="/action_page.php">
                        <input type="text" placeholder="Search for link" name="search">
                        <button type="submit"> <i class="fas fa-search"></i> search</button>
                    </g:form>
                </div>
            </div>
        </li>
        &nbsp
        <li class="nav-item">

            %{--            <select name="USERNAME" >username--}%
            %{--                <option name="profile" value="public">Profile</option>--}%
            %{--                <option name="posts" value="private">Posts</option>--}%
            %{--                <option name="Topic" value="public">Topic</option>--}%
            %{--                <option name="Users" value="private">Users</option>--}%
            %{--                <option name="Logout" value=""></option>--}%

            %{--            </select>--}%
            <div class="dropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    Hi! ${session.user.userName}
                </button>
                <div class="dropdown-menu">
                    <g:link controller="user" action="profile">Profile</g:link><br>
                    <g:link controller="user" action="index">Users</g:link><br>
                    <g:link controller="user" action="index">Topics</g:link><br>
                    <g:link controller="user" action="index">Posts</g:link><br>
                    <g:link controller="user" action="index">logout</g:link><br>
                </div>
            </div>
        </li>
        &nbsp
        &nbsp
    </ul>

</div>

<!-- MODAL FOR CREATE TOPIC -->



<div class="modal fade" id="createTopic" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topic</h4>
            </div>
            <div class="modal-body">
                <g:form name="create_topic" controller="topic"  action="save" method="POST">
                    <div class="form-group">
                        <label for="topicname">
                            Topic-Name</label>
                        <input type="text" class="form-control" id="topicname"
                               placeholder="Enter a topic name" name="name" value="${topic?.name}" >
                        <g:hiddenField name="createdBy" value="${session.user}"/>
                    </div>
                    <h5>Visibility</h5>
                    <select name="visibility" required>
                        <option name="public" value="PUBLIC">Public</option>
                        <option name="private" value="PRIVATE">Private</option>
                    </select>

                    <td colspan="2" class="col-lg-3">

                        <button type="submit" class="btn btn-primary btn-block">Save</button>
                        <button type="submit" class="btn btn-primary btn-block">Cancel
                        </button>
                    </td>
                </g:form>
            </div>
        </div>

    </div>
</div>


<div class="modal fade" id="shareLink" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">shareLink</h4>
            </div>
            <div class="modal-body">
                <g:form name="create_topic" controller="topic" method="post" action="createTopic">

                    <div class="form-group">
                        <label for="link">Link</label>
                        <input type="text" class="form-control" id="link" placeholder="provide a valid link"
                               name="link">
                    </div>
                    <div class="form-group">
                        <label for="desc">Description</label>
                        <textarea rows="3" cols="29" size="30" id="desc" placeholder="provide description"
                                  name="linkDescription" required></textarea>

                    </div>
                    <div class="form-group">
                        <h6>Topic</h6>
                        <select name="" style="min-width: 285px">
                            <option></option>
                        </select>
                    </div>

                    <td colspan="2" class="col-lg-3">
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Share
                        </submitButton>
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Cancel
                        </submitButton>
                    </td>


                </g:form>


            </div>

        </div>

    </div>
</div>


<!-- MODAL FOR SHARE DOCUMENT -->

<div class="modal fade" id="shareDocs" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Documents</h4>
            </div>
            <div class="modal-body">
                <form name="create_topic" controller="topic" method="post" action="createTopic">

                    <div class="form-group">
                        <label for="doc">Browse Document:</label>
                        <input type="file" id="doc" name="doc" accept="image/*">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea rows="3" cols="29" size="30" id="description" placeholder="provide description"
                                  name="linkDescription" required></textarea>

                    </div>
                    <div class="form-group">
                        <h6>Topic</h6>
                        <select name="" style="min-width: 285px">
                            <option></option>
                        </select>
                    </div>

                    <td colspan="2" class="col-lg-3">
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Share
                        </submitButton>
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Cancel
                        </submitButton>
                    </td>


                </form>


            </div>

        </div>

    </div>
</div>



<!-- MODAL FOR SEND INVITATION -->


<div class="modal fade" id="sendinvite" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Invittation</h4>
            </div>
            <div class="modal-body">
                <form name="create_topic" controller="topic" method="post" action="createTopic">

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>

                    <div class="form-group">
                        <h6>Topic</h6>
                        <select name="" style="min-width: 285px">
                            <option></option>
                        </select>
                    </div>

                    <td colspan="2" class="col-lg-3">
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Share
                        </submitButton>
                        <submitButton name="submit" class="btn btn-primary btn-block" value="save">Cancel
                        </submitButton>
                    </td>


                </form>


            </div>

        </div>

    </div>
</div>

</body>