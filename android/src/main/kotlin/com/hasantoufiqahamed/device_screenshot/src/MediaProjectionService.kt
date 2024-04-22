package com.hasantoufiqahamed.device_screenshot.src

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat

class MediaProjectionService : Service() {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "MediaProjectionForegroundServiceChannel"
        const val ACTION_STOP_SERVICE = "MediaProjectionForegroundServiceStop"
        const val NOTIFICATION_ID = 1
    }

//    private var iconResourceId: String? = null

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//        Log.d("icicic::", "${intent?.getStringExtra("iconResourceId")}")
//        this.iconResourceId = intent?.getStringExtra("iconResourceId")
        return when (intent?.action) {
            ACTION_STOP_SERVICE -> {
                stopSelf()
                START_NOT_STICKY
            }

            else -> {
                START_STICKY
            }
        }
    }

//    private fun getDrawableResourceId(context: Context, drawableName: String): Int {
//        return context.resources.getIdentifier(drawableName, "drawable", context.packageName)
//    }

    @RequiresApi(Build.VERSION_CODES.O)
    override fun onCreate() {
        super.onCreate()

        createNotificationChannel()


        val builder = NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
            .setContentTitle("Foreground Service")
            .setContentText("Running")

//        Log.d("icon:::", "${iconResourceId}")
//
//        if (iconResourceId != "") {
//            builder.setSmallIcon(getDrawableResourceId(this, this.iconResourceId!!))
//        }

        val notification = builder.build()


        startForeground(NOTIFICATION_ID, notification)
    }

    fun closeNotification() {
        val stopIntent = Intent(this, MediaProjectionService::class.java)
        stopIntent.action = ACTION_STOP_SERVICE
        startService(stopIntent)
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun createNotificationChannel() {
        val channelName = "Media Projection Foreground Service Channel"
        val channelDescription = "Channel for Media Projection Foreground Service"

        val channel = NotificationChannel(
            NOTIFICATION_CHANNEL_ID,
            channelName,
            NotificationManager.IMPORTANCE_DEFAULT
        ).apply {
            description = channelDescription
            // Add additional configuration here if needed
        }

        val notificationManager =
            getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.createNotificationChannel(channel)
    }
}