<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="nanke.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
        <script lang="javascript" type="text/javascript">
            function submit() {
                if (document.getElementById("name").value.length == 0) {
                    document.getElementById("namehint").style.display = "block";
                }
                else if (document.getElementById("password").value.length == 0) {
                    document.getElementById("passwordhint").style.display = "block";
                }
                else {
                    window.alert("log in success");
                }
            }
            function displaynh() {
                if (document.getElementById("name").value.length == 0) {
                    document.getElementById("namehint").style.display = "block";
                }
            }
            function displayph() {
                if (document.getElementById("password").value.length == 0) {
                    document.getElementById("passwordhint").style.display = "block";
                }
            }
            function hidenh() {
                document.getElementById("namehint").style.display = "none";
            }
            function hideph() {
                document.getElementById("passwordhint").style.display = "none";
            }
    </script>
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
        <h2>客户端进行用户名和密码的非空判断</h2>
    <fieldset>
        <legend> log in form</legend>

    <ol>
        <li>
            <label class="control-label" for="inputEmail">Name</label> 
            <input type="text" id="name" placeholder="Name" onblur ="displaynh()" onfocus="hidenh()">
            <span class="field-validation-error" id="namehint" style="display:none">Please enter the name</span>
            <br />
        </li>

        <li>
            <label class="control-label" for="inputPassword">Password</label>
            <input type="password" id="password" placeholder="Password" onblur="displayph()" onfocus="hideph()">
            <span class="field-validation-error" id="passwordhint" style="display:none">Please enter the password</span>
            <br />

        </li>

        <li>
            <label > <input type="checkbox" /> Remember me </label> <br />
            <button onclick="submit()">log in</button>
            <br />
        </li>

    </ol>
            </fieldset>
    <!--</section> -->



</asp:Content>
