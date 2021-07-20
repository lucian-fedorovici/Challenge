<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="WebApplication.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
          TODO - add an Access list component showing the library name 
          as the primary information and its rating as secondary information

          https://tagcomponents-dev.accessacloud.com/dev/tag-docs/#/
        -->
    <tag-list
        left-icon='Badge2'
        left-icon-accent='atoll'
        primary-field='name'>
    </tag-list>
    <!-- 
          TODO - add a green Access button containing the text "Add Employee"
        -->

    <!-- 
          TODO - add a modal form for Add\Updte Employee
        -->

    <script>
        var tagList = document.querySelector('tag-list');
        tagList.componentOnReady().then(function () {
            tagList.setData([
                { name: 'Jordan Pickford' },
                { name: 'Kyle Walker' },
                { name: 'John Stones' },
                { name: 'Harry Maguire' },
                { name: 'Luke Shaw' }
            ]);
        });
    </script>
</asp:Content>
