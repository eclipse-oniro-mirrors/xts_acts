/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "napi/native_api.h"
#include <multimedia/drm_framework/native_drm_common.h>
#include <multimedia/drm_framework/native_drm_err.h>
#include <multimedia/drm_framework/native_mediakeysystem.h>
#include <multimedia/drm_framework/native_mediakeysession.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <string.h>

#define BLUE_AREA "com.clearplay.drm"
#define YELLOW_AREA "com.wiseplay.drm"
static const char* judge_uuid() {
    bool isSupport = OH_MediaKeySystem_IsSupported(BLUE_AREA); 
    if(isSupport == 1) {
            return BLUE_AREA;
    } else {
            return YELLOW_AREA;
    }
}
// avcodec
static napi_value Test_VideoDecoder_SetDecryptionConfig(napi_env env, napi_callback_info info) {
    napi_value res;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    size_t codecStringLen = 0;
    char *codecString = nullptr;
    size_t sessionStringLen = 0;
    char *sessionString = nullptr;   
    bool secureVideoPath = 0;
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;    
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &codecStringLen);
    codecString = new char[codecStringLen + 1];
    napi_get_value_string_utf8(env, args[0], codecString, codecStringLen + 1, &codecStringLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &sessionStringLen);
    sessionString = new char[sessionStringLen + 1];
    napi_get_value_string_utf8(env, args[1], sessionString, sessionStringLen + 1, &sessionStringLen);
    napi_get_value_bool(env, args[2], &secureVideoPath);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel,&drmKeySession);   
    MediaKeySession *session_ptr = nullptr;
    if(strcmp(sessionString," ") != 0){
        session_ptr = drmKeySession;
    }       
    OH_AVCodec *codec_ptr = nullptr;
    if(strcmp(codecString," ") != 0){
        codec_ptr = OH_VideoDecoder_CreateByName("OMX.hisi.video.decoder.avc.seure");
    }
    OH_VideoDecoder_SetDecryptionConfig(codec_ptr, session_ptr,secureVideoPath);
    OH_AudioCodec_SetDecryptionConfig(codec_ptr, session_ptr,secureVideoPath); 
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK  && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) { //
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }    
    napi_create_int32(env, ret, &res);
    return res;
}
static napi_value Test_AVDemuxer_GetMediaKeySystemInfo(napi_env env, napi_callback_info info) {
    napi_value res;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t demuxerStringLen = 0;
    char *demuxerString = nullptr;
    size_t infoStringLen = 0;
    char *infoString = nullptr;   
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;    
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &demuxerStringLen);
    demuxerString = new char[demuxerStringLen + 1];
    napi_get_value_string_utf8(env, args[0], demuxerString, demuxerStringLen + 1, &demuxerStringLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &infoStringLen);
    infoString = new char[infoStringLen + 1];
    napi_get_value_string_utf8(env, args[1], infoString, infoStringLen + 1, &infoStringLen);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel,&drmKeySession);   
    DRM_MediaKeySystemInfo mediaKeySystemInfo;
    memset(&mediaKeySystemInfo,0,sizeof(DRM_MediaKeySystemInfo));
    DRM_MediaKeySystemInfo *mediaKeySystemInfo_ptr = nullptr;
    if(strcmp(infoString," ") != 0){
        mediaKeySystemInfo_ptr = &mediaKeySystemInfo;
    }       
    OH_AVDemuxer *demuxer_ptr = nullptr;
    if(strcmp(demuxerString," ") != 0){
//        OH_AVSource *source = OH_AVSource_CreateWithURI("http://192.168.200.62:8000/ChinaDRMLab-264-30-480P-SM4C/1_enc.m3u8");
        OH_AVSource *source = nullptr;
        demuxer_ptr = OH_AVDemuxer_CreateWithSource(source);
    }
    OH_AVDemuxer_GetMediaKeySystemInfo(demuxer_ptr, mediaKeySystemInfo_ptr);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK  && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }    
    napi_create_int32(env, ret, &res);
    return res;
}
static void OnDrmInfoChangedInApp(DRM_MediaKeySystemInfo *drmInfo)
{
    for (uint32_t i = 0; i < drmInfo->psshCount; i++)
    {   
        for (uint32_t k = 0; k < drmInfo->psshInfo[i].dataLen; k++) {
            unsigned char *pssh = static_cast<unsigned char*>(drmInfo->psshInfo[i].data);
			printf("OnDrmInfoChangedInApp print pssh %d", pssh[k]);
        }
    }
}
static napi_value Test_AVDemuxer_SetMediaKeySystemInfoCallback(napi_env env, napi_callback_info info) {
    napi_value res;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t demuxerStringLen = 0;
    char *demuxerString = nullptr;
    size_t infoStringLen = 0;
    char *infoString = nullptr;   
    Drm_ErrCode ret = DRM_ERR_INVALID_VAL;
    MediaKeySystem *drmKeySystem = nullptr;
    MediaKeySession *drmKeySession = nullptr;    
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &demuxerStringLen);
    demuxerString = new char[demuxerStringLen + 1];
    napi_get_value_string_utf8(env, args[0], demuxerString, demuxerStringLen + 1, &demuxerStringLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &infoStringLen);
    infoString = new char[infoStringLen + 1];
    napi_get_value_string_utf8(env, args[1], infoString, infoStringLen + 1, &infoStringLen);
    
    Drm_ErrCode ret1 = OH_MediaKeySystem_Create(judge_uuid(), &drmKeySystem);
    DRM_ContentProtectionLevel sessionLevel = CONTENT_PROTECTION_LEVEL_SW_CRYPTO;
    Drm_ErrCode ret2 = OH_MediaKeySystem_CreateMediaKeySession(drmKeySystem,&sessionLevel,&drmKeySession);   
    DRM_MediaKeySystemInfo mediaKeySystemInfo;
    memset(&mediaKeySystemInfo,0,sizeof(DRM_MediaKeySystemInfo));
    DRM_MediaKeySystemInfoCallback callback = nullptr;
    if(strcmp(infoString," ") != 0){
        callback = &OnDrmInfoChangedInApp;
    }       
    OH_AVDemuxer *demuxer_ptr = nullptr;
    if(strcmp(demuxerString," ") != 0){
//        OH_AVSource *source = OH_AVSource_CreateWithURI("http://192.168.200.62:8000/ChinaDRMLab-264-30-480P-SM4C/1_enc.m3u8");
        OH_AVSource *source = nullptr;
        demuxer_ptr = OH_AVDemuxer_CreateWithSource(source);
    }
    
    OH_AVDemuxer_SetMediaKeySystemInfoCallback(demuxer_ptr, callback);
    OH_AVErrCode ret1 = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(demuxer_ptr, callback);
    Drm_ErrCode ret4 = OH_MediaKeySession_Destroy(drmKeySession);
    Drm_ErrCode ret5 = OH_MediaKeySystem_Destroy(drmKeySystem);
    if (ret1 == DRM_ERR_OK && ret2 == DRM_ERR_OK  && ret4 == DRM_ERR_OK && ret5 == DRM_ERR_OK) { 
        ret = DRM_ERR_OK;
    } else {
        ret = DRM_ERR_INVALID_VAL;
    }    
    napi_create_int32(env, ret, &res);
    return res;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"Test_VideoDecoder_SetDecryptionConfig", nullptr, Test_VideoDecoder_SetDecryptionConfig, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_AVDemuxer_GetMediaKeySystemInfo", nullptr, Test_AVDemuxer_GetMediaKeySystemInfo, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"Test_AVDemuxer_SetMediaKeySystemInfoCallback", nullptr, Test_AVDemuxer_SetMediaKeySystemInfoCallback, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
