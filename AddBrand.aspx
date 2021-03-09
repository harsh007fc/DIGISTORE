<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="container">
         <br />
         <br />
            <div class="form-horizontal">
                <br />
         <br />
                <h2 align="center">Add Brand</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Brand Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtBrand"   runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" ErrorMessage="Enter Valid Brandname" ControlToValidate="txtBrand" CssClass="text-danger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add &raquo;" OnClick="btnAddBrand_Click" /> 
                     
                    </div>
                </div>



                

                


            </div>

         <%--showing table of brands start--%>
         <h4>Brands</h4>
         <hr />

         <div class="panel panel-default">
             <div class="panel-heading">All Brands</div>

             <asp:Repeater ID="rptrBrands" runat="server">

                 <HeaderTemplate>
                     <table class="table">
                 <thead>
                     <tr>
                         <th>#</th>
                         <th>Brand</th>
                         <th>Edit</th>
                     </tr>
                 </thead>
                 <tbody>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr>
                         <th><%# Eval("BrandID") %></th>
                         <td><%# Eval("Name") %></td>
                         <td>Edit</td>
                     </tr>
                 </ItemTemplate>
                 <FooterTemplate>
                     </tbody>
                      </table>
                 </FooterTemplate>


             </asp:Repeater>
           
         </div>
          <%-- Showing table ends--%>

        </div>



</asp:Content>

