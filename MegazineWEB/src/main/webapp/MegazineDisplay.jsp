<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>List of Megazines</title>
<!-- Include Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center mb-4">List of Megazines</h1>
		<button id="add-button" type="button" class="btn btn-primary">Add</button>

		<button id="delete-button" type="button" class="btn btn-danger">Delete</button>
		<br> <br>
		<hr>

		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Publisher</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="meg" items="${megs}">
					<tr>
						<td>${meg.getID()}</td>
						<td>${meg.getTitle()}</td>
						<td>${meg.getPublisher()}</td>
						<td>${meg.getPrice()}</td>
						<td>
							<button class="btn btn-info edit-button" data-id="${meg.getID()}"
								data-title="${meg.getTitle()}"
								data-publisher="${meg.getPublisher()}"
								data-price="${meg.getPrice()}">Edit</button>
						</td>
					</tr>
					<tr class="edit-form" id="edit-form" hidden>
						<td colspan="5">
							<form method="post"
								action="${pageContext.request.contextPath}/MegazineController">
								<input type="hidden" name="action" value="update"> <input
									type="hidden" name="id" value="${meg.getID()}">
								<div class="form-group">
									<label for="title">Title:</label> <input type="text"
										class="form-control" id="title" name="title"
										value="${meg.getTitle()}" required>
								</div>
								<div class="form-group">
									<label for="publisher">Publisher:</label> <input type="text"
										class="form-control" id="publisher" name="publisher"
										value="${meg.getPublisher()}" required>
								</div>
								<div class="form-group">
									<label for="price">Price:</label> <input type="number"
										step="0.01" class="form-control" id="price" name="price"
										value="${meg.getPrice()}" required>
								</div>
								<button type="submit" class="btn btn-primary">Update</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- Form to add new Megazine -->

		<form method="post"
			action="${pageContext.request.contextPath}/MegazineController"
			id="add-form" hidden>
			<input type="hidden" name="action" value="add">
			<div class="form-group">
				<label for="id">ID:</label> <input type="text" class="form-control"
					id="id" name="id" required>
			</div>
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title" required>
			</div>
			<div class="form-group">
				<label for="publisher">Publisher:</label> <input type="text"
					class="form-control" id="publisher" name="publisher" required>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number" step="0.01"
					class="form-control" id="price" name="price" required>
			</div>
			<button type="submit" class="btn btn-primary">Add</button>
		</form>

		<!-- Form to delete a Megazine -->

		<form method="post"
			action="${pageContext.request.contextPath}/MegazineController"
			id="delete-form" hidden>
			<input type="hidden" name="action" value="delete">
			<div class="form-group">
				<label for="id">ID:</label> <input type="text" class="form-control"
					id="id" name="id" required>
			</div>
			<button type="submit" class="btn btn-danger">Delete</button>
		</form>
	</div>
	<!-- Include Bootstrap 4 JavaScript and jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#add-button').click(function() {
				$('#add-form').removeAttr('hidden');
			});

			$('#delete-button').click(function() {
				$('#delete-form').removeAttr('hidden');
			});
			$('.edit-button').click(function() {
				var row = $(this).closest('tr');
				var id = row.find('[data-id]').data('id');
				var title = row.find('[data-title]').data('title');
				var publisher = row.find('[data-publisher]').data('publisher');
				var price = row.find('[data-price]').data('price');

				$('#edit-form').removeAttr('hidden');
				$('#edit-form [name="id"]').val(id);
				$('#edit-form [name="title"]').val(title);
				$('#edit-form [name="publisher"]').val(publisher);
				$('#edit-form [name="price"]').val(price);
			});
		});
	</script>
</body>
</html>
