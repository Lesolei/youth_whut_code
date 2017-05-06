﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master/admin.master" AutoEventWireup="true"
    CodeBehind="TuShuoLGList.aspx.cs" Inherits="AUTO.youth_admin.TuShuoLG.TuShuoLGList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="box">
        <div id="box_top">
            <asp:LinkButton ID="addTalk" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'"
                OnClick="addTalk_Click">添加图说理工</asp:LinkButton>
            图片标题：<asp:TextBox ID="txtWord" runat="server"></asp:TextBox>
            图片作者：<asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
            <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'"
                OnClick="lbtnSearch_Click">搜索</asp:LinkButton>
            <asp:LinkButton ID="lbtnCheck" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'"
                OnClick="lbtnCheck_Click">审核</asp:LinkButton>
            <asp:LinkButton ID="lbtnReCheck" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'"
                OnClick="lbtnReCheck_Click">反审核</asp:LinkButton>
            <asp:LinkButton ID="lbtnDelete" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'"
                OnClientClick="return confirm('您确定删除所选的吗？')" OnClick="lbtnDelete_Click">删除</asp:LinkButton>
        </div>
        <div id="box_middle">
            <asp:GridView ID="gvwData" runat="server" AutoGenerateColumns="false" CssClass="table"
                HorizontalAlign="Center" DataKeyNames="talk_id">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1+pageSize*(pageIndex-1) %>
                        </ItemTemplate>
                        <ItemStyle CssClass="table_head" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkbAll" runat="server" CssClass="check_all" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkbOne" runat="server" CssClass="check_one" />
                        </ItemTemplate>
                        <ItemStyle CssClass="table_head" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="标题">
                        <ItemTemplate>
                            <%# Eval("talk_title")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发布人">
                        <ItemTemplate>
                            <%# Eval("publisher")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发布时间">
                        <ItemTemplate>
                            <%# FormatTime((DateTime)Eval("publish_time"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑">
                        <ItemTemplate>
                            <%# Eval("last_updater")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑时间">
                        <ItemTemplate>
                            <%# FormatTime((DateTime) Eval("last_update_time"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核状态">
                        <ItemTemplate>
                            <%#Eval("is_check") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核人">
                        <ItemTemplate>
                            <%# Eval("checker")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核时间">
                        <ItemTemplate>
                            <%# FormatTime((DateTime) Eval("check_time"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CssClass="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'"
                                CommandArgument='<%#Eval("talk_id") %>' OnClick="lbtnEdit_Click">编辑</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    没有返回任何数据！
                </EmptyDataTemplate>
                <HeaderStyle CssClass="table_head" />
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataRowStyle Font-Size="16px" ForeColor="Red" Font-Bold="true" />
            </asp:GridView>
        </div>
    </div>
    <div id="pp" class="easyui-pagination" style="background: #efefef; border: 1px solid #ccc;"
        data-options="
        total:<%=pageTotal%>,
        onSelectPage:function(pageIndex, pageSize){
             $('#<%=hfPageIndex.ClientID %>').val(pageIndex);
             $('#<%=hfPageSize.ClientID %>').val(pageSize);
             $('#<%=btnHide.ClientID %>').click();
        },
        showRefresh:false,
        pageNumber:<%=pageIndex %>,
        pageSize:<%=pageSize %>
    ">
    </div>
    <div style="display: none;">
        <asp:HiddenField ID="hfPageIndex" runat="server" />
        <asp:HiddenField ID="hfPageSize" runat="server" />
        <asp:Button ID="btnHide" runat="server" Text="" OnClick="btnHide_Click" />
    </div>
</asp:Content>
