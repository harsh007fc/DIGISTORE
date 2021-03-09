<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container">
         <br />
         <br />
            <div class="form-horizontal">
                <br />
         <br />
                <h2 align="center">Add Sub-Category</h2>
                <hr />


                <div class="form-group">
                    <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Main Category ID"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" ErrorMessage="Enter Valid Category ID " ControlToValidate="ddlMainCatID" CssClass="text-danger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>




                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub-Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtSubCategory"   runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategoryName" runat="server" ErrorMessage="Enter Valid Sub-Category" ControlToValidate="txtSubCategory" CssClass="text-danger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnAddSubCategory" CssClass="btn btn-success" runat="server" Text="Add &raquo;" OnClick="btnAddSubCategory_Click" /> 
                     
                    </div>
                </div>



                

                


            </div>


         <h4>Sub-Categories</h4>
         <hr />

         <div class="panel panel-default">
             <div class="panel-heading">All Sub-Categories </div>

             <asp:Repeater ID="rptrSubCat" runat="server">

                 <HeaderTemplate>
                     <table class="table">
                 <thead>
                     <tr>
                         <th>#</th>
                         <th>Sub-Category</th>
                         <th>Main-Category</th>
                         <th>Edit</th>
                     </tr>
                 </thead>
                 <tbody>
                 </HeaderTemplate>
                 <ItemTemplate>
                     <tr>
                         <th><%# Eval("SubCatId") %></th>
                         <td><%# Eval("SubCatName") %></td>
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

