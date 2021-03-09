 <%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <br />
    <br />
    <div style="padding-top:50px;">


        <div class="col-md-9" >
            <h5 class="proNameViewCart" runat="server" id="h4Noitems"> </h5>
            <asp:Repeater ID="rptrCartProducts" runat="server">
               <ItemTemplate>
            <%--show cart starts here--%>
            <div class="media" style="border: 1px solid black;">
                <div class="media-left">
                    <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                                <img width="110px" class="media-object" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'"/>
                            </a>
                </div>

                <div class="media-body">
                    <h4 class="heading"><%#Eval("PName") %></h4>
                     <p class="proPriceDiscountView">Category: <%#Eval("CatNamee") %></p>
                     <span class="proPriceView"><%#Eval("PSelPrice","{0:c}") %></span>
                     <span class="proOgPriceView"><%#Eval("PPrice","{0:0,00}") %></span>

                    <p>
                        <asp:Button  ID="btnRemoveItem" OnClick="btnRemoveItem_Click" CssClass="RemoveButton1" runat="server" Text="REMOVE" />
                    </p>

                </div>

            </div>
                   </ItemTemplate>
                </asp:Repeater>
            <%--show cart ends here--%>
        </div>

        <div class="col-md-3 " runat="server" id="divpricedetails">

            <div style="border-bottom: 1px solid #eaeaec;">
                <h5 class="proNameViewCart">PRICE DETAILS:</h5>
                <div>
                    <label>Cart Total:</label>
                    <span class="float-right priceGray float-right" id="spanCartTotal" runat="server"></span>
                </div>
                <div>
                    <label>Cart Discount:</label>
                    <span class="float-right priceGreen float-right" id="spanDiscount" runat="server"></span>
                </div>
            </div>
            <div>
                <div class="proPriceView">
                    <label>Total:</label>
                     <span class="float-right float-right" id="spanTotal" runat="server"></span>
                </div>
                <div>


                    <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click" CssClass="buyNowbtn" runat="server" Text="BUY NOW" />

                </div>

            </div>

        </div>

    </div>


</asp:Content>

