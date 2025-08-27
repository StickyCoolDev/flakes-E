from django.shortcuts import render

# Sign up page
def sign_up_veiw(request):
    return render(request, 'auth/sign-up.html')
