/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avmuxer.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "avScreenCaptureRecorder"

#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))


#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_30 30

static napi_value OHAvCapabilityByCategoryH265(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backParam = FAIL;
    OH_AVCapability *capability = nullptr;
    OH_AVRange qualityRange;
    OH_AVErrCode checkParam;
    LOGI("OH_AVCodec_GetCapabilityByCategory get capability");
    capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (capability != nullptr) {
        backParam = SUCCESS;
        LOGE("OH_AVCodec_GetCapabilityByCategory get capability SUCCESS");
    }
    LOGI("OH_AVCodec_GetCapabilityByCategory get capability :%{public}d", capability);
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value OHAVMuxerByAddTrackH265(napi_env env, napi_callback_info info)
{
    int returnValue = SUCCESS;
    int videoTrackId = -1;
    OH_AVOutputFormat format = AV_OUTPUT_FORMAT_MPEG_4;
    int fileDescribe = open("/data/storage/el2/base/haps/entry_test/files/demo.mp4",
    O_CREAT | O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, format);
    OH_AVFormat *formatVideo = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, 1280, 720);
    LOGI("OH_AVMuxer_AddTrack get format");
    int ret = OH_AVMuxer_AddTrack(muxer, &videoTrackId, formatVideo);
    if (ret != AV_ERR_OK) {
        returnValue = FAIL;
        LOGE("OH_AVMuxer_AddTrack get format failed %{public}d", ret);
    }
    LOGI("OH_AVMuxer_AddTrack get format :%{public}d", ret);
    napi_value result = nullptr;
    
    OH_AVFormat_Destroy(formatVideo);
    OH_AVMuxer_Destroy(muxer);
    muxer = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OHAvCapabilityByCategoryH265", nullptr, OHAvCapabilityByCategoryH265, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "OHAVMuxerByAddTrackH265", nullptr, OHAVMuxerByAddTrackH265, nullptr, nullptr, nullptr,
            napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
