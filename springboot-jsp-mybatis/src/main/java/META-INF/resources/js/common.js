	$(function() {
			
			$("#changeTheme").change(
					function() {

						var obj = URIUtil.parse(location.search);
					//	window.document.location.href = "home?theme="
					//			+ this.options[this.selectedIndex].value;

						obj.theme=$(this).val();
						window.location.href = location.pathname+"?"+ URIUtil.stringify(obj)+"#"+location.hash;
					});

		});


