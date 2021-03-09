﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div style="padding-top: 50px">
        <div class="col-md-5">
            <div style="max-width: 480px" class="thumbnail">
                <%-- product image slidere startes here--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <asp:Repeater ID="rptrImage" runat="server">
                            <ItemTemplate>
                                <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                    <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'">
                                    <%--<div class="carousel-caption">
                                01
                            </div>--%>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <%--product image slider ends here--%>
            </div>
        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                <ItemTemplate>
                    <div class="divDet1">
                        <h1 class="proNameView"><%# Eval("PName") %></h1>
                        <span class="proOgPriceView">Rs.<%#Eval("PPrice") %></span><span class="proPriceDiscount"><%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %></span><p class="proPriceView">Rs. <%#Eval("PSelPrice") %></p>
                    </div>

                    <div class="divDet1">
                        <h5 class="h5desc">Category</h5>
                        <div>
                            <asp:RadioButtonList ID="rblCategory" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="4gb,dual core" Text="4gb,dual core"></asp:ListItem>
                                <asp:ListItem Value="8gb,i7" Text="8gb,i7"></asp:ListItem>
                                <asp:ListItem Value="4/64gb" Text="4/64gb"></asp:ListItem>
                                <asp:ListItem Value="6/128gb" Text="6/128gb"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="divDet1">
                        <asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddtoCart_Click" />
                         <asp:Label ID="lblerror" Cssclass="text-danger" runat="server" ></asp:Label>

                    </div>
                    <div class="divDet1">
                        <h5 class="h5desc">Description</h5>
                        <p><%#Eval("PDescription") %>  </p>
                        <h5 class="h5desc">Product detail</h5>
                        <p><%#Eval("PproductDetails") %> </p>
                    </div>
                    <div>
                        <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery":""  %>    </p>
                        <p><%# ((int)Eval("30DayRet")==1)? "30 Days Returns":""  %></p>
                        <p><%# ((int)Eval("COD")==1)? "Cash on Delivery":"" %></p>
                    </div>

                    <asp:HiddenField ID="hfCatID" runat="server" Value='<% #Eval("PCategoryID")%>' />
                    <asp:HiddenField ID="hfSubCatID" runat="server" Value='<% #Eval("PSubcategoryID")%>' />
                    

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

