from django.urls import path
from . import views

urlpatterns = [
    path('signup', views.sign_up_veiw, name='signup'),
    path('login' , views.sign_in_veiw, name='login' )
]
