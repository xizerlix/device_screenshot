package com.hasantoufiqahamed.device_screenshot

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat

class MediaProjectionService : Service() {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "MediaProjectionForegroundServiceChannel"
        const val ACTION_STOP_SERVICE = "MediaProjectionForegroundServiceStop"
        const val NOTIFICATION_ID = 1
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
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


    @RequiresApi(Build.VERSION_CODES.O)
    override fun onCreate() {
        super.onCreate()

        createNotificationChannel()

//        val intent = Intent(this, MediaProjectionService::class.java).apply {
//            action = ACTION_STOP_SERVICE
//        }
//        val deleteIntent =
//            PendingIntent.getService(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)
//
//        val pendingIntent = PendingIntent.getActivity(
//            applicationContext, 0, Intent(
//                baseContext,
//                MainActivity::class.java
//            ), PendingIntent.FLAG_IMMUTABLE
//        )


        val notification = NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)
            .setContentTitle("Foreground Service")
            .setContentText("Running")
//            .setSmallIcon(R.drawable.camera)
//            .setContentIntent(pendingIntent)
//            .addAction(
//                NotificationCompat.Action(
//                    R.drawable.close_24,
//                    "Stop",
//                    deleteIntent
//                )
//            )
            .build()

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