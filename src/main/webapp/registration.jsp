<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Registration.css">
    <style>
    .gradient-custom {

        background: whitesmoke;


        }

        .card-registration .select-input.form-control[readonly]:not([disabled]) {
        font-size: 1rem;
        line-height: 2.15;
        padding-left: .75em;
        padding-right: .75em;
        }
        .card-registration .select-arrow {
        top: 13px;
        }

        </style>
</head>
<body>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
          <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
              <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                <div class="card-body p-4 p-md-5">
                  <a href=""><h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><i class="fa fa-facebook">riendsBook</i></h3></a>

                  <form action="registerUser" method="post">

                    <div class="row">
                      <div class="col-md-6 mb-4">

                        <div data-mdb-input-init class="form-outline">
                          <input type="text" name="firstName" class="form-control form-control-lg" />
                          <label class="form-label" for="firstName">First Name</label>
                        </div>

                      </div>
                      <div class="col-md-6 mb-4">

                        <div data-mdb-input-init class="form-outline">
                          <input type="text" name="lastName" class="form-control form-control-lg" />
                          <label class="form-label" for="lastName">Last Name</label>
                        </div>

                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 mb-4 d-flex align-items-center">

                        <div data-mdb-input-init class="form-outline datepicker w-100">
                          <input type="date" class="form-control form-control-lg" name="birthdayDate" />
                          <label for="birthdayDate" class="form-label">Birthday</label>
                        </div>

                      </div>
                      <div class="col-md-6 mb-4">

                        <h6 class="mb-2 pb-1">Gender: </h6>

                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender"
                            value="Female" checked />
                          <label class="form-check-label" for="femaleGender">Female</label>
                        </div>

                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender"
                            value="Male" />
                          <label class="form-check-label" for="maleGender">Male</label>
                        </div>

                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender"
                            value="Others" />
                          <label class="form-check-label" for="otherGender">Other</label>
                        </div>

                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 mb-4 pb-2">

                        <div data-mdb-input-init class="form-outline">
                          <input type="email" name="emailAddress" class="form-control form-control-lg" />
                          <label class="form-label" for="emailAddress">Email</label>
                        </div>


                      </div>
                      <div class="row">
                                            <div class="col-md-6 mb-4">

                                              <div data-mdb-input-init class="form-outline">
                                                <input type="text" name="password" class="form-control form-control-lg" />
                                                <label class="form-label" for="firstName">Password</label>
                                              </div>

                                            </div>
                                            <div class="col-md-6 mb-4">

                                              <div data-mdb-input-init class="form-outline">
                                                <input type="text" name="confirmPassword" class="form-control form-control-lg" />
                                                <label class="form-label" for="lastName">Confirm Password</label>
                                              </div>

                                            </div>
                                          </div>
                      <div class="col-md-6 mb-4 pb-2">



                      </div>
                    </div>



                    <div class="mt-4 pt-2">
                      <input data-mdb-ripple-init class="btn btn-primary btn-lg" type="submit" value="Sign Up" />
                    </div>

                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>