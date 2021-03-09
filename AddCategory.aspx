<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container">
         <br />
         <br />
            <div class="form-horizontal">
                <br />
         <br />
                <h2 align="center">Add Category</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtCategory"   runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" runat="server" ErrorMessage="Enter Valid Category" ControlToValidate="txtCategory" CssClass="text-danger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddCategory" CssClass="btn btn-success" runat="server" Text="Add &raquo;" OnClick="btnAddCategory_Click"  /> 
                     
                    </div>
                </div>



                

                


            </div>


        <h4>Categories</h4>
         <hr />

         <div class="panel panel-default">
             <div class="panel-heading">All Categories </div>

             <asp:Repeater ID="rptrCategory" runat="server">

                 <HeaderTemplate>
                     <table class="table">
                 <thead>
                     <tr>
                         <th>#</th>
                         <th>Categories</th>
                         <th>Edit</th>
                     </tr>
                 </thead>
                 <tbody>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr>
                         <th><%# Eval("CatID") %></th>
                         <td><%# Eval("CatName") %></td>
                         <td>Edit</td>
                     </tr>
                 </ItemTemplate>
                 <FooterTemplate>
                     </tbody>
                      </table>
                 </FooterTemplate>


             </asp:Repeater>
           
         </div>


        </div>



</asp:Content>

