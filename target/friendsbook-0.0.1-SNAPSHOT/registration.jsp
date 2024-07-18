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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="commonJSControllers.js"></script>
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

        <script>

            $(document).ready(function() {
              $("#loading").hide();
                    $('#myForm').submit(function(event) {
                        event.preventDefault();
                        $("#error").hide();
                      $("#loading").show();
                        $.ajax({
                            type: 'POST',
                            url: "registerUser",
                            data: convertFormToJSON($("#myForm")),
                            success: function (data) {
                                var response=$.parseJSON(data)
                                if(!(response.status === '200')){
                                        showErrorAlert(response.error);
                                }else if(response.status === '200'){
                                    $("#exampleModal").modal('show');
                                }
                            },
                            error: function (data) {
                                alert(data);
                                console.log(data);
                                alert("error");
                            }
                        });
                  });

                    $("#OTPVerify").click(function(){
                    var data='{"otp":"'+$("#otp").val()+'"}';
                    console.log(data);
                        $.ajax({
                                                    type: 'POST',
                                                     url: "otpVerify",
                                                    data: convertFormToJSON($("#otpForm")),
                                                    success: function (data) {
                                                        var response=$.parseJSON(data)
                                                        if(!(response.status === '200')){
                                                                showErrorAlert(response.error);
                                                        }else if(response.status === '200'){
                                                            alert("Registered Successfully");
                                                            window.location.replace("uploadDp.jsp");
                                                        }
                                                    },
                                                    error: function (data) {
                                                        alert(data);
                                                        console.log(data);
                                                        alert("error");
                                                    }
                                                });
                    });
                });

                function showErrorAlert(msg){
                    $("#error").show();
                    $("#error").text(msg);

                }
        </script>
</head>
<body>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
          <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
              <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                <div class="card-body p-4 p-md-5">
                  <div class = "row">
                    <div class = "col"> <a href=""><h3 class="mb-4 pb-2 pb-md-0 mb-md-5"><i class="fa fa-facebook">riendsBook</i></h3></a></div>
                    <div id="loading" class = "col">
                      <div class = "spinner-border text-primary">

                      </div>&nbsp;&nbsp;<b>Submitting Response Please Wait...</b>
                    </div>
                  </div>
                    <div class="alert alert-danger" role="alert" id="error" style="display:none">

                    </div>
                  <form id="myForm" >

                    <div class="row">
                      <div class="col-md-6 mb-4">

                        <div data-mdb-input-init class="form-outline">
                          <input type="text" name="firstName" class="form-control form-control-lg" required/>
                          <label class="form-label" for="firstName">First Name</label>
                        </div>

                      </div>
                      <div class="col-md-6 mb-4">

                        <div data-mdb-input-init class="form-outline">
                          <input type="text" name="lastName" class="form-control form-control-lg" required />
                          <label class="form-label" for="lastName">Last Name</label>
                        </div>

                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 mb-4 d-flex align-items-center">

                        <div data-mdb-input-init class="form-outline datepicker w-100">
                          <input type="date" class="form-control form-control-lg" name="birthdayDate"required />
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
                          <input type="email" name="emailAddress" class="form-control form-control-lg" required/>
                          <label class="form-label" for="emailAddress">Email</label>
                        </div>


                      </div>
                      <div class="row">
                                            <div class="col-md-6 mb-4">

                                              <div data-mdb-input-init class="form-outline">
                                                <input type="password" name="password" class="form-control form-control-lg" required/>
                                                <label class="form-label" for="firstName">Password</label>
                                              </div>

                                            </div>
                                            <div class="col-md-6 mb-4">

                                              <div data-mdb-input-init class="form-outline">
                                                <input type="password" name="confirmPassword" class="form-control form-control-lg" required/>
                                                <label class="form-label" for="lastName">Confirm Password</label>
                                              </div>

                                            </div>
                                          </div>
                      <div class="col-md-6 mb-4 pb-2">



                      </div>
                    </div>



                    <div class="mt-4 pt-2">
                      <input data-mdb-ripple-init class="btn btn-primary btn-lg" type="submit"  value="Sign Up" />
                    </div>

                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>





      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Verify OTP</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form id="otpForm">
              <input type="text" id="otp" name="otp">
              </form>
            </div>
            <div class="modal-footer">

              <button type="button" class="btn btn-primary" id="OTPVerify">Verify

              </button>

            </div>
          </div>
        </div>
      </div>
</body>
</html>