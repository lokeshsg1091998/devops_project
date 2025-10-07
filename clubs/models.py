from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Clubs(models.Model):
    host=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
    name=models.CharField(max_length=20)
    description=models.TextField(default='This Is A Club')
    members=models.ManyToManyField(User,related_name='members',blank=True)
    created_on=models.DateTimeField(auto_now_add=True)
    
    def __str__(self) -> str:
        return self.name

class Messages(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    club=models.ForeignKey(Clubs,on_delete=models.CASCADE)
    body=models.TextField(default='Enter Description')
    created_on=models.DateTimeField(auto_now_add=True)
