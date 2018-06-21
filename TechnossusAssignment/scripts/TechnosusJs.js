
$(document).ready(function () {
	var url = 'http://localhost:8001';
			$('#loader').show();
			var initialData = [];

			$.ajax({
				url: url + "/Api/TechnosusApi/Get",
				dataType: 'json',
				async: false,
				success: function (data) {
					//console.log($.parseJSON(data));
					initialData = $.parseJSON(data);
				}
			});
			$.ajax({
				url: url + "/Api/TechnosusApi/GetSkill",
				dataType: 'json',
				async: false,
				success: function (data) {
					//console.log($.parseJSON(data));
					var skillSet = $.parseJSON(data);
					for (var i = 0; i <= skillSet.length - 1; i++) {

						$('#txtSkill').append($('<option>', {
							value: skillSet[i].Id,
							text: skillSet[i].Skill
						}));
					}
				}
			});


			var PagedGridModel = function (items) {
				this.items = ko.observableArray(items);

				this.addItem = function () {
					if($('#txtUsername').val()=='')
					{
						alert('Enter User Name');
						return false;
					}
					if( $('#txtAddress').val()=='')
					{
						alert('Enter Address');
						return false;
					}
					if ($('#txtSkill').val().toString() == '') {
						alert('Make Skill Selection');
						return false;
					}
					$('#loader').show();
					$.ajax({
						type: "POST",
						url: url + "/Api/TechnosusApi/SaveUser",
						dataType: 'json',
						data: { Name: $('#txtUsername').val(), Address: $('#txtAddress').val(), SkillIds: $('#txtSkill').val().toString() },
						success: function () {							
							alert('Data Saves Successfully');
							alert('Click Search Button To reload the grid');
							$('#loader').hide();
							$('#txtUsername').val('');
							$('#txtAddress').val('');
							$('#txtSkill').val('');
						}
					});

					
					
				};

				this.reBind = function () {
					$('#loader').show();
					if ($('#email').val() == '') { var name = "Empty"; } else { var name = $('#email').val(); }
					if ($('#msg').val() == '') { var msz = "Empty"; } else { var msz = $('#msg').val(); }
					$.ajax({
						url: url + "/Api/TechnosusApi/GetFilter/" + name + "/" + msz + "",
						dataType: 'json',
						async: false,
						success: function (data) {
							initialData = $.parseJSON(data);
						}
					});
					this.items.removeAll();
					for (var i = 0; i <= initialData.length - 1; i++) {
						console.log(initialData[i]);
						this.items.push(initialData[i]);
					}
					$('#loader').hide();
				};

				this.gridViewModel = new ko.simpleGrid.viewModel({
					data: this.items,
					columns: [
						{ headerText: "User Name", rowText: "Name" },
						{ headerText: "Address", rowText: "Address" },
						{ headerText: "Skills", rowText: "Skill" }
					],
					pageSize: 6
				});
			};

			ko.applyBindings(new PagedGridModel(initialData));
			$('#loader').hide();
		});

