<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGrid.aspx.cs" Inherits="TechnossusAssignment.UserGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        
    </title>
    
   
</head>
<body>
   <script type="text/javascript" src="scripts/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="Content/bootstrap.css" />
    <link rel="stylesheet" href="Content/bootstrap-grid.css" />
    <script type="text/javascript" src="scripts/bootstrap.js"></script>        
    <script type="text/javascript" src="scripts/knockout-3.4.2.js"></script>
    <script type="text/javascript" src="scripts/knockout.simpleGrid.3.0.js"></script>
     <script type="text/javascript">

$( document ).ready(function() {
  

            var initialData = [
        { name: "Well-Travelled Kitten", sales: 352, price: 75.95 },
        { name: "Speedy Coyote", sales: 89, price: 190.00 },
        { name: "Furious Lizard", sales: 152, price: 25.00 },
        { name: "Indifferent Monkey", sales: 1, price: 99.95 },
        { name: "Brooding Dragon", sales: 0, price: 6350 },
        { name: "Ingenious Tadpole", sales: 39450, price: 0.35 },
        { name: "Optimistic Snail", sales: 420, price: 1.50 }
    ];
 
    var PagedGridModel = function(items) {
        this.items = ko.observableArray(items);
 
        this.addItem = function() {
            this.items.push({ name: "New item", sales: 0, price: 100 });
        };
 
        this.reBind = function () {
            initialData = [
        { name: "Amarjit", sales: 352, price: 75.95 },
        { name: "Singh", sales: 89, price: 190.00 },      
        ];

        };
 
        this.gridViewModel = new ko.simpleGrid.viewModel({
            data: this.items,
            columns: [
                { headerText: "User Name", rowText: "name" },
                { headerText: "Skills", rowText: "sales" },
                { headerText: "Price", rowText: function (item) { return "$" + item.price.toFixed(2) } }
            ],
            pageSize: 8
        });
    };
      ko.applyBindings(new PagedGridModel(initialData));
 });
  
   </script>
    
    <form id="form1" runat="server">
        <h1 class="h1" style="margin-left:5%;">Technossus Assignment</h1>
        <div style="margin-left:30%; margin-top:7%;">
            <div data-bind='simpleGrid: gridViewModel' class="table"> </div>
 
            <button class="btn" data-bind='click: addItem'>
                Add item
            </button>
             <button class="btn" data-bind='click: reBind'>
                Search
            </button>
            
 
          
        </div>
    </form>
</body>
</html>
