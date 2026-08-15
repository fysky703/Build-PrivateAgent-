package com.privateagent.agent
import android.app.Activity
import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.os.Bundle
import android.widget.TextView

class MainActivity : Activity() {
 override fun onCreate(state: Bundle?) {
  super.onCreate(state)
  val dpm=getSystemService(DevicePolicyManager::class.java)
  val admin=ComponentName(this,AgentDeviceAdminReceiver::class.java)
  val t=TextView(this)
  t.text="PrivateAgent Agent\n\nDevice Owner: ${dpm.isDeviceOwnerApp(packageName)}\nDevice Admin: ${dpm.isAdminActive(admin)}\n\nThis Agent is ready for managed-device integration."
  t.textSize=20f; t.setTextColor(0xffffffff.toInt()); t.setPadding(40,70,40,40); t.setBackgroundColor(0xff07090d.toInt())
  setContentView(t)
 }
}
