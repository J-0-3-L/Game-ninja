<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ninja Gold Game</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    />
  </head>
  <body>
    <h3>Your Gold: <span id="goldCount">${sessionScope.gold}</span></h3>
    <div class="row row-cols-1 row-cols-md-3 g-4 justify-content-center pt-5">
      <div class="card m-4" style="width: 14rem">
        <div class="card-body text-center">
          <h3 class="card-title">Form</h3>
          <p class="card-text">(earns 10-20 gold)</p>
          <form method="post" action="/process_money">
            <input type="hidden" name="location" value="farm" />
            <button type="submit" class="btn btn-primary">Find Gold!</button>
          </form>
        </div>
      </div>

      <div class="card m-4" style="width: 14rem">
        <div class="card-body text-center">
          <h3 class="card-title">Cave</h3>
          <p class="card-text">(earns 5-10 gold)</p>
          <form method="post" action="/process_money">
            <input type="hidden" name="location" value="cave" />
            <button type="submit" class="btn btn-primary">Find Gold!</button>
          </form>
        </div>
      </div>

      <div class="card m-4" style="width: 14rem">
        <div class="card-body text-center">
          <h3 class="card-title">House</h3>
          <p class="card-text">(earns 2-5 gold)</p>
          <form method="post" action="/process_money">
            <input type="hidden" name="location" value="house" />
            <button type="submit" class="btn btn-primary">Find Gold!</button>
          </form>
        </div>
      </div>

      <div class="card m-4" style="width: 14rem">
        <div class="card-body text-center">
          <h3 class="card-title">Casino!</h3>
          <p class="card-text">(earns/takes 0-50 gold)</p>
          <form method="post" action="/process_money">
            <input type="hidden" name="location" value="casino" />
            <button type="submit" class="btn btn-primary">Find Gold!</button>
          </form>
        </div>
      </div>
    </div>
    <div>
      <h3>Activities:</h3>
      <ul>
        <c:forEach items="${sessionScope.activities}" var="activity">
          <li>${activity}</li>
        </c:forEach>
      </ul>
      <form method="post" action="/reset">
        <button type="submit" class="btn btn-danger">Reset</button>
      </form>
    
    </div>
  </body>
</html>
