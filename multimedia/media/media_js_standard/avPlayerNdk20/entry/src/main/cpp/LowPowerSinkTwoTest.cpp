/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing fpermissions and
 * limitations under the License.
 */

#include "GLES3/gl32.h"

#include "multimedia/player_framework/lowpower_audio_sink.h"
#include "multimedia/player_framework/lowpower_audio_sink_base.h"
#include "multimedia/player_framework/lowpower_video_sink_base.h"
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <arpa/nameser.h>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <iostream>
#include <js_native_api.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avrecorder.h>
#include <multimedia/player_framework/lowpower_avsink_base.h>
#include <multimedia/player_framework/lowpower_video_sink.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avsource.h>
#include <native_buffer/native_buffer.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <typeinfo>
#include <unistd.h>
#include <vector>

 auto g_defWidth = 1920;
 auto g_defHeight = 1080;
 auto g_longValue = 4000000;

static napi_value OH_LowPowerAudioSink_Start0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_LowPowerAudioSink_Prepare(AudioSink);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Start(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerAudioSink_Destroy(AudioSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Resume0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_LowPowerAudioSink_Prepare(AudioSink);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Resume(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerAudioSink_Destroy(AudioSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Flush0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_LowPowerAudioSink_Prepare(AudioSink);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Flush(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerAudioSink_Destroy(AudioSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Stop0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_LowPowerAudioSink_Prepare(AudioSink);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Stop(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerAudioSink_Destroy(AudioSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerAudioSink_Destroy0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_LowPowerAudioSink_Prepare(AudioSink);
    OH_AVErrCode errcode = OH_LowPowerAudioSink_Destroy(AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetParameter0101(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetParameter(VideoSink, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnNeedInputParameter(OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData){};
static napi_value OH_LowPowerVideoSink_SetVideoSurface0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode acv = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    OH_AVErrCode q = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    OH_AVErrCode aa = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    OH_AVErrCode a = OH_VideoEncoder_Configure(encoder, Format);
    OH_AVErrCode ret = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetVideoSurface0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode acv = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    OH_AVErrCode aa = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    OH_AVErrCode a = OH_VideoEncoder_Configure(encoder, Format);
    OH_AVErrCode ret = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Prepare0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Prepare(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Prepare0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Prepare(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartDecoder0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartDecoder0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_RenderFirstFrame0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_RenderFirstFrame(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_RenderFirstFrame0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_RenderFirstFrame(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartRenderer0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_StartRenderer0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Pause0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Pause(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Pause0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Pause(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Resume0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Resume(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Resume0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Resume(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Flush0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Flush(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Flush0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    test = OH_LowPowerVideoSink_Resume(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Flush(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Stop0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Stop(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Stop0102(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Stop(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Reset0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Reset(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_Destroy0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    test = OH_LowPowerVideoSink_Pause(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_Destroy(VideoSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetSyncAudioSink0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSink_SetPlaybackSpeed0101(napi_env env, napi_callback_info info)
{
    void *userData;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    OH_AVCodec *encoder = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_LowPowerVideoSink *VideoSink = OH_LowPowerVideoSink_CreateByMime(mime);
    OH_AVFormat *Format = OH_AVFormat_Create();
    OH_AVErrCode test = OH_LowPowerVideoSink_GetParameter(nullptr, nullptr);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_WIDTH, g_defWidth);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_HEIGHT, g_defHeight);
    OH_AVFormat_SetIntValue(Format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    OH_AVFormat_SetLongValue(Format, OH_MD_KEY_BITRATE, g_longValue);
    test = OH_LowPowerVideoSink_Configure(VideoSink, Format);
    test = OH_VideoEncoder_RegisterParameterCallback(encoder, OnNeedInputParameter, userData);
    OHNativeWindow *nativeWindow = nullptr;
    test = OH_VideoEncoder_Configure(encoder, Format);
    test = OH_VideoEncoder_GetSurface(encoder, &nativeWindow);
    test = OH_LowPowerVideoSink_SetVideoSurface(VideoSink, nativeWindow);
    const char *mimeAudio = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_LowPowerAudioSink *AudioSink = OH_LowPowerAudioSink_CreateByMime(mimeAudio);
    test = OH_LowPowerVideoSink_SetSyncAudioSink(VideoSink, AudioSink);
    test = OH_LowPowerVideoSink_Prepare(VideoSink);
    test = OH_LowPowerVideoSink_StartDecoder(VideoSink);
    test = OH_LowPowerVideoSink_StartRenderer(VideoSink);
    OH_AVErrCode errcode = OH_LowPowerVideoSink_SetPlaybackSpeed(VideoSink, 1);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    OH_LowPowerVideoSink_Destroy(VideoSink);
    OH_VideoEncoder_Destroy(encoder);
    OH_AVFormat_Destroy(Format);
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_LowPowerVideoSinkCallback_Destroy0101(napi_env env, napi_callback_info info)
{
    OH_LowPowerVideoSinkCallback *Callback = OH_LowPowerVideoSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_Destroy(Callback);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnDataNeeded(OH_LowPowerVideoSink *sink, OH_AVSamplesBuffer *buffer, void *userData){};
static napi_value OH_LowPowerVideoSinkCallback_SetDataNeededListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSinkCallback *Callback = OH_LowPowerVideoSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetDataNeededListener(Callback, OnDataNeeded, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnStreamChanged(OH_LowPowerVideoSink *sink, OH_AVFormat *format, void *userData){};
static napi_value OH_LowPowerVideoSinkCallback_SetStreamChangedListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSinkCallback *Callback = OH_LowPowerVideoSinkCallback_Create();
    OH_AVErrCode errcode = OH_LowPowerVideoSinkCallback_SetStreamChangedListener(Callback, OnStreamChanged, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnFirstFrameDecoded(OH_LowPowerVideoSink *sink, void *userData){};
static napi_value OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0101(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_LowPowerVideoSinkCallback *Callback = OH_LowPowerVideoSinkCallback_Create();
    OH_AVErrCode errcode =
        OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener(Callback, OnFirstFrameDecoded, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}


napi_property_descriptor desc[] = {
    {"OH_LowPowerAudioSink_Start0101", nullptr, OH_LowPowerAudioSink_Start0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Resume0101", nullptr, OH_LowPowerAudioSink_Resume0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerAudioSink_Flush0101", nullptr, OH_LowPowerAudioSink_Flush0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Stop0101", nullptr, OH_LowPowerAudioSink_Stop0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerAudioSink_Destroy0101", nullptr, OH_LowPowerAudioSink_Destroy0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetParameter0101", nullptr, OH_LowPowerVideoSink_SetParameter0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetVideoSurface0101", nullptr, OH_LowPowerVideoSink_SetVideoSurface0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetVideoSurface0102", nullptr, OH_LowPowerVideoSink_SetVideoSurface0102, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_Prepare0101", nullptr, OH_LowPowerVideoSink_Prepare0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_Prepare0102", nullptr, OH_LowPowerVideoSink_Prepare0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartDecoder0101", nullptr, OH_LowPowerVideoSink_StartDecoder0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartDecoder0102", nullptr, OH_LowPowerVideoSink_StartDecoder0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_RenderFirstFrame0101", nullptr, OH_LowPowerVideoSink_RenderFirstFrame0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_RenderFirstFrame0102", nullptr, OH_LowPowerVideoSink_RenderFirstFrame0102, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartRenderer0101", nullptr, OH_LowPowerVideoSink_StartRenderer0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_StartRenderer0102", nullptr, OH_LowPowerVideoSink_StartRenderer0102, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_Pause0101", nullptr, OH_LowPowerVideoSink_Pause0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Pause0102", nullptr, OH_LowPowerVideoSink_Pause0102, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Resume0101", nullptr, OH_LowPowerVideoSink_Resume0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_Resume0102", nullptr, OH_LowPowerVideoSink_Resume0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_Flush0101", nullptr, OH_LowPowerVideoSink_Flush0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Flush0102", nullptr, OH_LowPowerVideoSink_Flush0102, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Stop0101", nullptr, OH_LowPowerVideoSink_Stop0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Stop0102", nullptr, OH_LowPowerVideoSink_Stop0102, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Reset0101", nullptr, OH_LowPowerVideoSink_Reset0101, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OH_LowPowerVideoSink_Destroy0101", nullptr, OH_LowPowerVideoSink_Destroy0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetSyncAudioSink0101", nullptr, OH_LowPowerVideoSink_SetSyncAudioSink0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSink_SetPlaybackSpeed0101", nullptr, OH_LowPowerVideoSink_SetPlaybackSpeed0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_LowPowerVideoSinkCallback_Destroy0101", nullptr, OH_LowPowerVideoSinkCallback_Destroy0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_SetDataNeededListener0101", nullptr, OH_LowPowerVideoSinkCallback_SetDataNeededListener0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_SetStreamChangedListener0101", nullptr, OH_LowPowerVideoSinkCallback_SetStreamChangedListener0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_SetFirstFrameDecodedListener0101", nullptr, OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0101,
     nullptr, nullptr, nullptr, napi_default, nullptr},

};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "lowpoweraudiosinktwondk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
