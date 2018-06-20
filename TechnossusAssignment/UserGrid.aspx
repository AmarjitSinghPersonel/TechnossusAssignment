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
     		var initialData=[];
     	//	var jqxhr = $.getJSON("http://localhost:8001/Api/TechnosusApi/Get",function (data) {
		////console.log(data);
		//initialData = data;
		////console.log(initialData);
     	//	});
			
     		$.ajax({
     			url: "http://localhost:8001/Api/TechnosusApi/Get",
     			dataType: 'json',
     			async: false,     			
     			success: function (data) {
     				//console.log($.parseJSON(data));
     				initialData = $.parseJSON(data);
     			}
     		});
	//console.log(initialData);

    // var initialData = [
    //    { Username: "Well-Travelled Kitten", Skills: 352},
    //    { Username: "Speedy Coyote", Skills: 89},
    //    { Username: "Furious Lizard", Skills: 152 },
    //    { Username: "Indifferent Monkey", Skills: 1},
    //    { Username: "Brooding Dragon", Skills: 0},
    //    { Username: "Ingenious Tadpole", Skills: 39450},
    //    { Username: "Optimistic Snail", Skills: 420}
     		//];
	//var initialData = [{ "Id": 1, "Name": "Amarjit", "Address": "Rajwal", "Skill": "CSharp,VB.Net" }, { "Id": 2, "Name": "Pamarjit", "Address": "Vpo - Rajwal", "Skill": "CSharp,VB.Net" }, { "Id": 3, "Name": "Rishi", "Address": "Talwar", "Skill": "CSharp,SQL" }, { "Id": 4, "Name": "Tapan", "Address": "Roorkee", "Skill": "SQL,CSharp" }, { "Id": 5, "Name": "Rajinder", "Address": "Danger kherda", "Skill": "Linq,CSharp" }];
     		
    var PagedGridModel = function(items) {
        this.items = ko.observableArray(items);
 
        this.addItem = function() {
        	this.items.push({ Name: "New item", Address: 'Address', Skill: 0 });
			
        };
 
        this.reBind = function () {
        	//alert('cc');
        	$.ajax({
        		url: "http://localhost:8001/Api/TechnosusApi/Get",
        		dataType: 'json',
        		async: false,
        		success: function (data) {
        			//console.log($.parseJSON(data));
        			initialData = $.parseJSON(data);
        			
        		}
        	});
        	this.items.removeAll();
        	//this.items.push(initialData);
        	
        	ko.utils.arrayForEach(initialData, function (item) {
        		console.log(item);
        		ko.observableArray(items).push({ "Id": 1, "Name": "Amarjit", "Address": "Rajwal", "Skill": "CSharp,VB.Net" });
        	});
			
        };
 
        this.gridViewModel = new ko.simpleGrid.viewModel({
            data: this.items,
            columns: [
                { headerText: "User Name", rowText: "Name" },
				{ headerText: "Address", rowText: "Address" },
				{ headerText: "Skills", rowText: "Skill" }
				
               // { headerText: "Price", rowText: function (item) { return "$" + item.price.toFixed(2) } }
            ],
            pageSize: 8
        });
    };
    console.log(initialData); 
  	ko.applyBindings(new PagedGridModel(initialData));    
});

   </script>
    <script type="text/javascript">
    

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
