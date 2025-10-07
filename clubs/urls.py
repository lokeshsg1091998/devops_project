from django.urls import path
from . import views

urlpatterns = [
    path('login/',views.loginpage,name='login'),
    path('logout/',views.logoutuser,name='logout'),
    path('register/',views.registeruser,name='register'),
    path('',views.index,name='index'),
    path('home/',views.home,name='home'),
    path('club/<int:pk>/',views.club,name='club'),
    path('createclub/',views.createclub,name='createclub'),
    path('updateclub/<int:pk>/',views.updateclub,name='updateclub'),
    path('deleteclub/<int:pk>/',views.deleteclub,name='deleteclub'),
]

