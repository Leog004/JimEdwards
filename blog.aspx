<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/newImages/hd_shopbl2.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2>Our Blogs</h2>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li>Blog</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->

        <!-- Page Content -->
        <main class="page-content">

            <!-- Blogs Area -->
            <div class="tm-section tm-blog-area tm-padding-section bg-white">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="row mt-50-reverse">

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-thumb">
                                                <img src="assets/images/blog/blog-image-1.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details.html">A fishing vessel is a boat or ship
                                                    used to
                                                    catch fish in the sea</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-blog-media tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-imageslider">
                                                <img src="assets/images/blog/blog-image-2.jpg" alt="blog image">
                                                <img src="assets/images/blog/blog-image-3.jpg" alt="blog image">
                                                <img src="assets/images/blog/blog-image-4.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details-gallery.html">A fishing reel is a cylindrical device
                                                    attached to a fishing rod.</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details-gallery.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-blog-media tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="embed-responsive embed-responsive-16by9">
                                                <iframe class="embed-responsive-item"
                                                    src="https://www.youtube.com/embed/Sv511KEiIJQ"
                                                    allowfullscreen></iframe>
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details-video.html">Ice fishing can be done at any time.
                                                    Ice
                                                    fishing gear is highly specialized.</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details-video.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-blog-media tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="embed-responsive embed-responsive-16by9">
                                                <iframe class="embed-responsive-item"
                                                    src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/149481409&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details-audio.html">A fishing vessel is a boat or ship
                                                    used to
                                                    catch fish in the sea</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details-audio.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-thumb">
                                                <img src="assets/images/blog/blog-image-5.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details.html">What are the proper dress to wear when
                                                    you fishing?</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-thumb">
                                                <img src="assets/images/blog/blog-image-6.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details.html">What is the difference between ice
                                                    fishing
                                                    and fly fishing?</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-thumb">
                                                <img src="assets/images/blog/blog-image-7.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details.html">What are the warm weather
                                                    international
                                                    fishing destinations?</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                                <!-- Blog Single Item -->
                                <div class="col-lg-6 col-md-6 col-12 mt-50">
                                    <div class="tm-blog tm-scrollanim">
                                        <div class="tm-blog-topside">
                                            <div class="tm-blog-thumb">
                                                <img src="assets/images/blog/blog-image-8.jpg" alt="blog image">
                                            </div>
                                            <a href="#" class="tm-blog-metahighlight"><i class="ion-chatbubbles"></i> 3
                                                Comments</a>
                                        </div>
                                        <div class="tm-blog-content">
                                            <h6 class="tm-blog-title"><a href="blog-details.html">What are the fishing rules between a
                                                    fresh-
                                                    water and saltwater? .</a></h6>
                                            <ul class="tm-blog-meta">
                                                <li><a href="#"><i class="ion-android-person"></i> Jennifer Muir</a>
                                                </li>
                                                <li><i class="ion-android-calendar"></i> March 06, 2019</li>
                                            </ul>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis
                                                nisl,
                                                at aliquam dolor. Morbi in iaculis nunc nulla velit imperdiet
                                                sollicitudin.</p>
                                            <a href="blog-details.html" class="tm-readmore">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <!--// Blog Single Item -->

                            </div>

                            <div class="tm-pagination mt-50">
                                <ul>
                                    <li><a href="blog.html"><i class="ion-ios-arrow-left"></i></a></li>
                                    <li class="is-active"><a href="blog.html">1</a></li>
                                    <li><a href="blog.html">2</a></li>
                                    <li><a href="blog.html">3</a></li>
                                    <li><a href="blog.html"><i class="ion-ios-arrow-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="widgets widgets-blog">

                                <!-- Single Widget -->
                                <div class="single-widget widget-search">
                                    <h6 class="widget-title">Search</h6>
                                    <form action="#" class="widget-search-form">
                                        <input type="text" placeholder="Enter your keyword...">
                                        <button type="submit"><i class="ion-android-search"></i></button>
                                    </form>
                                </div>
                                <!--// Single Widget -->

                                <!-- Single Widget -->
                                <div class="single-widget widget-categories">
                                    <h6 class="widget-title">Categories</h6>
                                    <ul>
                                        <li><a href="#">Fishing accessories</a></li>
                                        <li><a href="#">Fishing competitions</a></li>
                                        <li><a href="#">Fishing boats</a></li>
                                        <li><a href="#">Fishing equipments</a></li>
                                        <li><a href="#">Fishing guidence</a></li>
                                        <li><a href="#">Fishing tour</a></li>
                                        <li><a href="#">Fishing deal</a></li>
                                    </ul>
                                </div>
                                <!--// Single Widget -->

                                <!-- Single Widget -->
                                <div class="single-widget widget-recentpost">
                                    <h6 class="widget-title">Recent Posts</h6>
                                    <ul>
                                        <li>
                                            <a href="blog-details.html" class="widget-recentpost-image">
                                                <img src="assets/images/blog/blog-image-1-thumb.jpg"
                                                    alt="blog thumbnail">
                                            </a>
                                            <div class="widget-recentpost-content">
                                                <h6><a href="blog-details.html">The basics fishing guide</a></h6>
                                                <span>January 15, 2019</span>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="blog-details.html" class="widget-recentpost-image">
                                                <img src="assets/images/blog/blog-image-2-thumb.jpg"
                                                    alt="blog thumbnail">
                                            </a>
                                            <div class="widget-recentpost-content">
                                                <h6><a href="blog-details.html">Fishing Rods and Poles</a></h6>
                                                <span>Janury 14, 2019</span>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="blog-details.html" class="widget-recentpost-image">
                                                <img src="assets/images/blog/blog-image-3-thumb.jpg"
                                                    alt="blog thumbnail">
                                            </a>
                                            <div class="widget-recentpost-content">
                                                <h6><a href="#blog-details.html">Whenbuying a new boat</a></h6>
                                                <span>January 13, 2019</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!--// Single Widget -->

                                <!-- Single Widget -->
                                <div class="single-widget widget-archives">
                                    <h6 class="widget-title">Archives</h6>
                                    <ul>
                                        <li><a href="#">October 2018</a></li>
                                        <li><a href="#">November 2018</a></li>
                                        <li><a href="#">December 2018</a></li>
                                        <li><a href="#">January 2019</a></li>
                                        <li><a href="#">February 2019</a></li>
                                        <li><a href="#">March 2019</a></li>
                                        <li><a href="#">April 2019</a></li>
                                    </ul>
                                </div>
                                <!--// Single Widget -->

                                <!-- Popular Tags -->
                                <div class="single-widget widget-tags">
                                    <h6 class="widget-title">Popular Tags</h6>
                                    <ul>
                                        <li><a href="#">Fishing</a></li>
                                        <li><a href="#">Boats</a></li>
                                        <li><a href="#">Gear</a></li>
                                        <li><a href="#">Accessories</a></li>
                                        <li><a href="#">Store</a></li>
                                        <li><a href="#">Trips</a></li>
                                        <li><a href="#">Fisherman</a></li>
                                        <li><a href="#">Hooks</a></li>
                                    </ul>
                                </div>
                                <!--// Popular Tags -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Blogs Area -->



        </main>


</asp:Content>
