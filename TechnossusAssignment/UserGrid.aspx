<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGrid.aspx.cs" Inherits="TechnossusAssignment.UserGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>


</head>
<body>
	<style>
		.vl {
			border-left: 6px solid grey;
			height: 500px;
		}

		.loader {
			border: 16px solid #f3f3f3; /* Light grey */
			border-top: 16px solid #3498db; /* Blue */
			border-radius: 50%;
			width: 120px;
			height: 120px;
			animation: spin 2s linear infinite;
			position: fixed;
			top: 35%;
			left: 45%;
			z-index: 100;
		}

		@keyframes spin {
			0% {
				transform: rotate(0deg);
			}

			100% {
				transform: rotate(360deg);
			}
		}
	</style>
	<script type="text/javascript" src="scripts/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="Content/bootstrap.css" />
	<link rel="stylesheet" href="Content/bootstrap-grid.css" />
	<script type="text/javascript" src="scripts/bootstrap.js"></script>
	<script type="text/javascript" src="scripts/knockout-3.4.2.js"></script>
	<script type="text/javascript" src="scripts/knockout.simpleGrid.3.0.js"></script>
	<script type="text/javascript" src="scripts/TechnosusJs.js"></script>

	<form id="form1" runat="server">
		<div id="loader" class="loader"></div>
		<h1 class="h1" style="margin-left: 5%;">Technossus Assignment</h1>
		<table style="width: 100%">
			<tr style="width: 100%">
				<td style="width: 45%">
					<div style="margin-left: 10%; margin-top: 3%;">
						<div class="input-group" style="width: 33%;">

							<input id="email" type="text" class="form-control" name="email" placeholder="UserName" />
						</div>
						<div class="input-group" style="width: 33%; margin-top: 8px; margin-bottom: 8px;">

							<input id="msg" type="text" class="form-control" name="msg" placeholder="Skill" />
						</div>
						<button class="btn" data-bind='click: reBind'>
							Search
						</button>
						<br />
						<div data-bind='simpleGrid: gridViewModel' class="table" style="width: 33%"></div>
						<br />

					</div>
				</td>
				<td style="width: 10%">
					<div class="vl"></div>
				</td>
				<td style="width: 45%">
					<div>
						<div class="input-group" style="width: 50%;">
							<input id="txtUsername" type="text" class="form-control" name="email" placeholder="UserName" />
						</div>
						<div class="input-group" style="width: 50%; margin-top: 5px;">
							<input id="txtAddress" type="text" class="form-control" name="msg" placeholder="Address" />
						</div>
						<div style="width: 50%; margin-top: 5px;">
							<select class="border" multiple="multiple" id="txtSkill" style="height: 150px; width: 250px;" name="msg"></select>
						</div>
						<button class="btn" data-bind='click: addItem' style="margin-top: 3px;">
							Add item
						</button>
					</div>
				</td>
			</tr>
		</table>


	</form>
</body>
</html>
