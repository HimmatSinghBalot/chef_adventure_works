<%@ Page language="c#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
void Page_Load(Object sender, EventArgs e) 
{ 
   SqlConnection cnn = new 
       SqlConnection("server=.;database=adventureworks;uid=sa;pwd=!sql2014"); 
   SqlDataAdapter da = new SqlDataAdapter("SELECT NAME,PRODUCTNUMBER FROM PRODUCTION.PRODUCT", cnn); 
   DataSet ds = new DataSet(); 
   da.Fill(ds, "product"); 
   Repeater1.DataSource = ds.Tables["product"];
   Repeater1.DataBind();
}
</script>
<html>
<body>
   <form id="WebForm2" method="post" runat="server">
      <asp:Repeater id="Repeater1" runat="server">
         <ItemTemplate>
         <%# DataBinder.Eval(Container.DataItem,"NAME") %><br>
    	 </ItemTemplate>
      </asp:Repeater>
   </form>
</body>
</html>
				