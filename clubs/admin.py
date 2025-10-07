from django.contrib import admin
from .models import Clubs,Messages

# Register your models here.

class message_list(admin.ModelAdmin):
    list_display=['body','user_id','club_id']

admin.site.register(Clubs)
admin.site.register(Messages,message_list)