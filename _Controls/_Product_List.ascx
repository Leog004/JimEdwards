<%@ Control Language="C#" AutoEventWireup="true" CodeFile="_Product_List.ascx.cs" Inherits="_Controls_Product_List" %>



            <asp:Panel ID="Products_panel" runat="server"></asp:Panel>

            <!-- Products Area -->
            <%--<div id="tm-shop-area" class="tm-section tm-products-area tm-padding-section bg-white">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8 col-md-9 col-12">
                            <div class="tm-sectiontitle text-center">
                                <h2>Fishing Accessories</h2>
                                <span class="tm-sectiontitle-divider">
                                    <img src="./assets/images/icons/icon-divider-img.png" alt="section divider">
                                </span>
                                <p>Lorem Ipsum is a latin placeholder text commonly used to fulfill certain areas of
                                    your website or app where content is not the main concern of the developer.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row tm-products-slider">

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-1.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Wobbler</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price"><del>$499.50</del> $299.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-2.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Rods</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price">$69.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-3.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Reel</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price"><del>$99.50</del> $79.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-4.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Hook</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price">$29.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-1.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Wobbler</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price"><del>$499.50</del> $299.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-2.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Rods</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price">$69.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-3.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Reel</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price"><del>$99.50</del> $79.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                        <!-- Single Product -->
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="tm-product text-center tm-scrollanim">
                                <div class="tm-product-topside">
                                    <img src="./assets/images/products/product-image-4.jpg" alt="product image">
                                    <ul class="tm-product-actions">
                                        <li><a href="#"><i class="ion-android-cart"></i> Add to cart</a></li>
                                        <li><button data-fancybox data-src="#tm-product-quickview"><i
                                                    class="ion-eye"></i></button></li>
                                        <li><a href="#"><i class="ion-heart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="tm-product-bottomside">
                                    <h6 class="tm-product-title"><a href="product-details.html">Fishing Hook</a></h6>
                                    <div class="tm-ratingbox">
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span class="is-active"><i class="ion-android-star"></i></span>
                                        <span><i class="ion-android-star"></i></span>
                                    </div>
                                    <span class="tm-product-price">$29.99</span>
                                </div>
                            </div>
                        </div>
                        <!--// Single Product -->

                    </div>
                </div>
            </div>--%>
            <!--// Products Area -->