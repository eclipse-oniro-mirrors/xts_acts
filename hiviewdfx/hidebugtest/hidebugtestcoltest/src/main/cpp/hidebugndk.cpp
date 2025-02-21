/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <hidebug/hidebug.h>
#include <hidebug/hidebug_type.h>

static napi_value GetTotalMem(napi_env env, napi_callback_info info)
{
    napi_value totalMem;
    HiDebug_SystemMemInfo sysMemInfo;
    OH_HiDebug_GetSystemMemInfo(&sysMemInfo);
    napi_create_uint32(env, sysMemInfo.totalMem, &totalMem);
    return totalMem;
}

static napi_value GetFreeMem(napi_env env, napi_callback_info info)
{
    napi_value freeMem;
    HiDebug_SystemMemInfo sysMemInfo;
    OH_HiDebug_GetSystemMemInfo(&sysMemInfo);
    napi_create_uint32(env, sysMemInfo.freeMem, &freeMem);
    return freeMem;
}

static napi_value GetAvailableMem(napi_env env, napi_callback_info info)
{
    napi_value availableMem;
    HiDebug_SystemMemInfo sysMemInfo;
    OH_HiDebug_GetSystemMemInfo(&sysMemInfo);
    napi_create_uint32(env, sysMemInfo.availableMem, &availableMem);
    return availableMem;
}

static napi_value GetPss(napi_env env, napi_callback_info info)
{
    napi_value pss;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.pss, &pss);
    return pss;
}

static napi_value GetVss(napi_env env, napi_callback_info info)
{
    napi_value vss;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.vss, &vss);
    return vss;
}

static napi_value GetRss(napi_env env, napi_callback_info info)
{
    napi_value rss;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.rss, &rss);
    return rss;
}

static napi_value GetSharedDirty(napi_env env, napi_callback_info info)
{
    napi_value sharedDirty;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.sharedDirty, &sharedDirty);
    return sharedDirty;
}

static napi_value GetPrivateDirty(napi_env env, napi_callback_info info)
{
    napi_value privateDirty;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.privateDirty, &privateDirty);
    return privateDirty;
}

static napi_value GetSharedClean(napi_env env, napi_callback_info info)
{
    napi_value sharedClean;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.sharedClean, &sharedClean);
    return sharedClean;
}

static napi_value GetPrivateClean(napi_env env, napi_callback_info info)
{
    napi_value privateClean;
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfo(&nativeMemInfo);
    napi_create_uint32(env, nativeMemInfo.privateClean, &privateClean);
    return privateClean;
}

static napi_value GetRssLimit(napi_env env, napi_callback_info info)
{
    napi_value rssLimit;
    HiDebug_MemoryLimit memoryLimit;
    OH_HiDebug_GetAppMemoryLimit(&memoryLimit);
    napi_create_bigint_uint64(env, memoryLimit.rssLimit, &rssLimit);
    return rssLimit;
}

static napi_value GetVssLimit(napi_env env, napi_callback_info info)
{
    napi_value vssLimit;
    HiDebug_MemoryLimit memoryLimit;
    OH_HiDebug_GetAppMemoryLimit(&memoryLimit);
    napi_create_bigint_uint64(env, memoryLimit.vssLimit, &vssLimit);
    return vssLimit;
}

static napi_value GetSysCpuUsage(napi_env env, napi_callback_info info)
{
    napi_value sysCpuUsage;
    double cpuUsage = OH_HiDebug_GetSystemCpuUsage();
    napi_create_double(env, cpuUsage, &sysCpuUsage);
    return sysCpuUsage;
}

static napi_value GetAppThreadCpuUsage(napi_env env, napi_callback_info info)
{
    napi_value res;
    napi_create_array(env, &res);
    size_t idx = 0;
    HiDebug_ThreadCpuUsagePtr threadCpuUsage = OH_HiDebug_GetAppThreadCpuUsage();
    HiDebug_ThreadCpuUsagePtr curThreadCpuUsage = threadCpuUsage;
    while (curThreadCpuUsage != nullptr) {
        napi_value obj = nullptr;
        napi_create_array(env, &obj);
        auto threadIdValue = curThreadCpuUsage->threadId;
        auto cpuUsageValue = curThreadCpuUsage->cpuUsage;
        
        napi_value threadId;
        napi_create_uint32(env, threadIdValue, &threadId);
        napi_set_named_property(env, obj, "threadId", threadId);

        napi_value cpuUsage;
        napi_create_double(env, cpuUsageValue, &cpuUsage);
        napi_set_named_property(env, obj, "cpuUsage", cpuUsage);
        
        napi_set_element(env, res, idx, obj);
        idx ++;
        curThreadCpuUsage = curThreadCpuUsage->next;
    }
    OH_HiDebug_FreeThreadCpuUsage(&threadCpuUsage);
    return res;
}

static napi_value GetAppCpuUsage(napi_env env, napi_callback_info info)
{
    napi_value appCpuUsage;
    double cpuUsage = OH_HiDebug_GetAppCpuUsage();
    napi_create_double(env, cpuUsage, &appCpuUsage);
    return appCpuUsage;
}

static napi_value StartAppTraceCapture(napi_env env, napi_callback_info info)
{
    napi_value ret;
    size_t argc = 3; // arg total：3
    napi_value args[3] = {nullptr}; // arg total：3

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
    napi_valuetype valuetype2;
    napi_typeof(env, args[2], &valuetype2); // arg number：2
    
    uint32_t flag;
    napi_get_value_uint32(env, args[0], &flag);
    uint64_t tags = HIDEBUG_TRACE_TAG_ARK;
    uint32_t limitSize;
    napi_get_value_uint32(env, args[1], &limitSize);
    uint32_t length;
    napi_get_value_uint32(env, args[2], &length); // arg number：2
    char fileName[length];

    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(HiDebug_TraceFlag(flag),
                                                                  tags, limitSize, fileName, length);
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

static napi_value GetAppTraceCaptureFile(napi_env env, napi_callback_info info)
{
    napi_value ret;
    size_t argc = 3;                // arg total：3
    napi_value args[3] = {nullptr}; // arg total：3

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);
    napi_valuetype valuetype2;
    napi_typeof(env, args[2], &valuetype2); // arg number：2

    uint32_t flag;
    napi_get_value_uint32(env, args[0], &flag);
    uint64_t tags = HIDEBUG_TRACE_TAG_ARK;
    uint32_t limitSize;
    napi_get_value_uint32(env, args[1], &limitSize);
    uint32_t length;
    napi_get_value_uint32(env, args[2], &length); // arg number：2
    char fileName[length];

    OH_HiDebug_StartAppTraceCapture(HiDebug_TraceFlag(flag), tags, limitSize, fileName, length);
    napi_create_string_utf8(env, fileName, length, &ret);
    return ret;
}

static napi_value StartAppTraceCaptureTag(napi_env env, napi_callback_info info)
{
    napi_value ret;

    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = 0;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;

    char fileName[length];

    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

static napi_value StopAppTraceCapture(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_ErrorCode errorCode = OH_HiDebug_StopAppTraceCapture();
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getTotalMem", nullptr, GetTotalMem, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getFreeMem", nullptr, GetFreeMem, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAvailableMem", nullptr, GetAvailableMem, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getPss", nullptr, GetPss, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getVss", nullptr, GetVss, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getRss", nullptr, GetRss, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getSharedDirty", nullptr, GetSharedDirty, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getPrivateDirty", nullptr, GetPrivateDirty, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getSharedClean", nullptr, GetSharedClean, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getPrivateClean", nullptr, GetPrivateClean, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getRssLimit", nullptr, GetRssLimit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getVssLimit", nullptr, GetVssLimit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getSysCpuUsage", nullptr, GetSysCpuUsage, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAppThreadCpuUsage", nullptr, GetAppThreadCpuUsage, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAppCpuUsage", nullptr, GetAppCpuUsage, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startAppTraceCapture", nullptr, StartAppTraceCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAppTraceCaptureFile", nullptr, GetAppTraceCaptureFile, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startAppTraceCaptureTag", nullptr,
          StartAppTraceCaptureTag, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "stopAppTraceCapture", nullptr, StopAppTraceCapture, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "hidebug",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
