#include "jvmti.h"

JNIEXPORT jint JNICALL Agent_OnLoad(JavaVM *jvm, char *options, void *reserved){
	jvm -> GetEnv((void **) &gb_jvmti, JVMTI_VERSION_1_0);

	gb_capa.can_generate_method_exit_events = 1;
	gb_capa.can_access_local_variables=1;
	gb_capa.can_get_monitor_info=1;
	gb_jvmti -> AddCapabilities(&gb_capa);

	callbacks.MethodEntry = &callbackMethodEntry;
	callbacks.MethodExit = &callbackMethodExit;
	gb_jvmti -> SetEventCallbacks(&callbacks, sizeof(callbacks));

	gb_jvmti -> SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_METHOD_ENTRY, NULL);
	gb_jvmti -> SetEventNotificationMode(JVMTI_ENABLE, JVMTI_EVENT_METHOD_EXIT,NULL);
	return JNI_OK;
}

static void JNICALL callbackMethodEntry(jvmtiEnv *jvmti_env, JNIEvn * evn, jthread thr, jmethodID method) {
	gb_jvmti -> RawMonitorEnter(gb_lock);
	if (strcmp(name,"start")==0 || strcmp(name,"interrupt")==0
					|| strcmp(name,"join")==0 || strcmp(name,"stop")==0
					|| strcmp(name,"suspend")==0 ||strcmp(name,"resume")==0){
		gb_jvmti -> GetLocalObject(thr,0,0,&thd_ptr);
		gb_jvmti -> GetObjectHashCode(thd_ptr, &hash_code);
	}
	gb_jvmti -> RawMonitorExit(gb_lock);
}

static void JNICALL callbackMethodEntry(jvmtiEnv *jvmti_env, JNIEnv * env,jthread thr, jmethodID method){
	if(strcmp(name,"notify")==0 || strcmp(name, "notifyAll")==0){
		gb_jvmti -> GetOwnedMonitorInfo(thr, &owned_monitor_count, &owned_monitors_ptr);
		for(int index=0;index<owned_monitor_count;index++){
			jvmtiMonitorUsage *info_ptr = NULL;
			info_ptr = (jvmtiMonitorUsage *)malloc(sizeof(jvmtiMonitorUsage));
			gb_jvmti -> GetObjectMonitorUsage(*(owned_monitors_ptr+index),info_ptr);
			insertElem(&inf_head, &inf_tail, info_ptr);
		}
	}
}

static void JNICALL callbackMethodExit(jvmtiEnv *jvmti_env, JNIEnv *env,jthread thr, jmethodID method){
	if(info_ptr->notify_waiter_count!=inf_head->info_ptr->notify_waiter_count){
		for(int i=0;i<inf_head->info_ptr->notify_waiter_count;i++){
			for(int j=0;j<info_ptr->notify_waiter_count;j++){
				if(inf_head->info_ptr->notify_waiters+i!=info_ptr->notify_waiters+j){
					isObj = false;
					break;
				}
			}
			if(isObj==true){
				GetObjectHashCode(*(inf_head->info_ptr->notify_waiters+i), &hash_code);
				insertElem(&ctx_head, &ctx_tail, thr_hash_code, hash_code, name);
			}
		}
	}
}
