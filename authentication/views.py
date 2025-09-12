from django.shortcuts import render
from django.http import HttpRequest

# --- Constatnts --- #
SIGN_UP_HTML: str = "auth/sign-up.html"
SIGN_IN_HTML: str = "auth/sign-in.html"
BASE_AUTH_HTML: str = "auth/auth.html"


# --- Pages --- #
## Base Auth page
def auth_veiw(request: HttpRequest):
    return render(request, BASE_AUTH_HTML)


## Sign up page
def sign_up_veiw(request: HttpRequest):
    return render(request, SIGN_UP_HTML)


## Log/Sign in page
def sign_in_veiw(request: HttpRequest):
    return render(request, SIGN_IN_HTML)
