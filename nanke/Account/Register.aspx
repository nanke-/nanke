<%@ Page Title="Register" Language="C#" MasterPageFile="~/Register.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="nanke.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent1">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>注册页面：服务器端验证</h2>
    </hgroup>
    <asp:Label runat="server">当前在线人数: </asp:Label> <br />
    <asp:Label runat="server" ID="onlineNum"></asp:Label> <br />
    <asp:Label runat="server">总访问量： </asp:Label> <br />
    <asp:Label runat="server" ID="statNum"></asp:Label>
    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                <ContentTemplate>
                    <p class="message-info">
                        Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
                    </p>

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend>Registration Form</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="UserName">用户名</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Email">电子邮箱</asp:Label>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ErrorMessage="The email address field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="PhoneNum">联系电话</asp:Label>
                                <asp:TextBox runat="server" ID="PhoneNum"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneNum" Display="Dynamic"
                                     ErrorMessage="格式错误(3位数字区号横杠8位电话号码)" ForeColor="Red" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}"></asp:RegularExpressionValidator>
                                
                            </li>

                            <li>
                                <asp:Label runat="server" AssociatedControlID="PostNum">邮政编码</asp:Label>
                                <asp:TextBox runat="server" ID="PostNum"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="PostNum" Display="Dynamic"
                                     ErrorMessage="格式错误(6位数字)" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                
                            </li>
                            

                            <li>
                                <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="The password field is required." />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="MoveNext" Text="Register" />
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>