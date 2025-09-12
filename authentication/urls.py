from django.urls import path
from . import views
from allauth.account.views import LoginView


urlpatterns = [
    path("", views.auth_veiw, name="Auth"),
    path(
        "signup/", LoginView.as_view(template_name="auth/sign-up.html"), name="signup"
    ),
    path("login/", LoginView.as_view(template_name="auth/sign-in.html"), name="login"),
]
