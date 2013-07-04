<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="nanke._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>《 Web编程 》 课程作业</h2>
            </hgroup>
            <p>
                本次课程除了大作业的项目还有五个小作业。作业一即申请此域名，作业二为制作一个静态网页。<mark>该部分已完成，未显示</mark>
                <br />
                作业三、四 、五访问一下链接
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>作业:</h3>
    <ol class="round">
        <li class="one">
            <h5>作业三</h5>
            设计一个在客户端进行用户名和密码的非空判断程序。<br />
            使用了一些css代码和部分js代码
            <a runat="server" href="~/Account/Login.aspx">Learn more…</a>
        </li>
        <li class="two">
            <h5>作业四</h5>
            用C#语言编写99乘法表，主要用了一个Table控件，在后台Page_Load函数中调整该控件
            <a runat="server" href="~/Account/MulTable.aspx">Learn more…</a>
        </li>
        <li class="three">
            <h5>作业五</h5>
            实现在线人数和网站访问量统计 +　制作注册页面进行服务器端验证<br />
            在线人数和网站访问量统计主要利用session 和　全局的Application实现.
            <a runat="server" href="~/Account/Register.aspx">Learn more…</a>
        </li>
    </ol>
</asp:Content>
