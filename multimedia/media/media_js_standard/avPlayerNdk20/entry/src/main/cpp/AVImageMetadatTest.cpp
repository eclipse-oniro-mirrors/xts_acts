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
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/player_framework/avimage_generator.h>
#include <multimedia/player_framework/avmetadata_extractor.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avrecorder.h>
#include <multimedia/player_framework/lowpower_video_sink.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <typeinfo>
#include <unistd.h>
#include <vector>

#define AVCODEC_SAMPLE_ERR_OK = 0,
#define AVCODEC_SAMPLE_ERR_ERROR = -1,
auto g_two = 2;
constexpr int CREATE_TYPE = 0x4;

static napi_value OH_AVImageGenerator_SetFDSource0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode errcode = OH_AVImageGenerator_SetFDSource(nullptr, fd, offset, size);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_FetchFrameByTime0100(napi_env env, napi_callback_info info)
{
    int64_t timeUs = 10;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode errcode =
        OH_AVImageGenerator_FetchFrameByTime(nullptr, timeUs, OH_AVIMAGE_GENERATOR_QUERY_NEXT_SYNC, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_FetchFrameByTime0101(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int64_t timeUs = 0;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode aaa = OH_AVImageGenerator_SetFDSource(AVImageGenerator, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode =
        OH_AVImageGenerator_FetchFrameByTime(AVImageGenerator, timeUs, OH_AVIMAGE_GENERATOR_QUERY_CLOSEST, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_UNSUPPORTED_FORMAT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVImageGenerator_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_QueryOptions0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int64_t timeUs = 0;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode aaa = OH_AVImageGenerator_SetFDSource(AVImageGenerator, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode =
        OH_AVImageGenerator_FetchFrameByTime(AVImageGenerator, timeUs, OH_AVIMAGE_GENERATOR_QUERY_NEXT_SYNC, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_QueryOptions0101(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int64_t timeUs = 0;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode aaa = OH_AVImageGenerator_SetFDSource(AVImageGenerator, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode = OH_AVImageGenerator_FetchFrameByTime(AVImageGenerator, timeUs,
                                                                OH_AVIMAGE_GENERATOR_QUERY_PREVIOUS_SYNC, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_QueryOptions0102(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int64_t timeUs = 0;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode aaa = OH_AVImageGenerator_SetFDSource(AVImageGenerator, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode = OH_AVImageGenerator_FetchFrameByTime(AVImageGenerator, timeUs,
                                                                OH_AVIMAGE_GENERATOR_QUERY_CLOSEST_SYNC, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVImageGenerator_QueryOptions0103(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int64_t timeUs = 0;
    OH_AVImageGenerator *AVImageGenerator = OH_AVImageGenerator_Create();
    OH_AVErrCode aaa = OH_AVImageGenerator_SetFDSource(AVImageGenerator, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode =
        OH_AVImageGenerator_FetchFrameByTime(AVImageGenerator, timeUs, OH_AVIMAGE_GENERATOR_QUERY_CLOSEST, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVMetadataExtractor_SetFDSource0100(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    OH_AVErrCode errcode = OH_AVMetadataExtractor_SetFDSource(nullptr, fd, offset, size);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVMetadataExtractor_FetchMetadata0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVMetadataExtractor_FetchMetadata(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVMetadataExtractor_FetchMetadata0101(napi_env env, napi_callback_info info)
{
    int32_t sampleRate = 16000;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_AVMetadataExtractor *Extractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode errcode = OH_AVMetadataExtractor_FetchMetadata(Extractor, Format);
    int32_t res = 1;
    if (errcode == AV_ERR_OPERATE_NOT_PERMIT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVMetadataExtractor_FetchAlbumCover0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVMetadataExtractor_FetchAlbumCover(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}
static napi_value OH_AVMetadataExtractor_FetchAlbumCover0101(napi_env env, napi_callback_info info)
{
    int32_t fd = -1;
    int64_t offset = 0;
    int64_t size = -1;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    status = napi_get_value_int32(env, args[0], &fd);
    status = napi_get_value_int64(env, args[1], &offset);
    status = napi_get_value_int64(env, args[g_two], &size);
    int32_t sampleRate = 16000;
    int32_t channelCount = 2;
    const char *mime = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    OH_AVFormat *Format = OH_AVFormat_CreateAudioFormat(mime, sampleRate, channelCount);
    OH_AVMetadataExtractor *Extractor = OH_AVMetadataExtractor_Create();
    OH_AVErrCode aaa = OH_AVMetadataExtractor_SetFDSource(Extractor, fd, offset, size);
    uint32_t width = 600;
    uint32_t height = 400;
    size_t bufferSize = width * height * 4; // RGBA_8888格式，每像素4字节
    uint8_t *pixels = new uint8_t[bufferSize];
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, width);
    OH_PixelmapInitializationOptions_SetHeight(createOps, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, PIXEL_FORMAT_RGBA_8888);
    Image_ErrorCode bbb = OH_PixelmapNative_CreatePixelmap(pixels, bufferSize, createOps, &pixelMap);
    OH_AVErrCode errcode = OH_AVMetadataExtractor_FetchAlbumCover(Extractor, &pixelMap);
    int32_t res = 1;
    if (errcode == AV_ERR_UNSUPPORTED_FORMAT) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVMetadataExtractor_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVMetadataExtractor_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

void OnError(OH_VideoProcessing *handle, VideoProcessing_ErrorCode errorCode, void *userData) {}

void OnState(OH_VideoProcessing *instance, VideoProcessing_State state, void *userData) {}

void OnNewOutputBuffer(OH_VideoProcessing *instance, uint32_t index, void *userData) {}

static napi_value OH_VideoProcessing_RegisterCallback0100(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow *window = nullptr;
    OHNativeWindow *window2 = nullptr;
    VideoProcessing_ErrorCode qwe = OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}
static napi_value OH_VideoProcessing_GetSurface0100(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow *window = nullptr;
    OHNativeWindow *window2 = nullptr;
    OH_VideoProcessing_GetSurface(instance, &window);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_GetSurface(instance, &window);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoProcessing_SetParameter0100(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_SetParameter(nullptr, parameterSetted);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoProcessing_SetParameter0101(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_SetParameter(instance, nullptr);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoProcessing_GetParameter0100(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_GetParameter(nullptr, parameterSetted);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_INVALID_INSTANCE) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoProcessing_GetParameter0101(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_GetParameter(instance, nullptr);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_VideoProcessing_RenderOutputBuffer0100(napi_env env, napi_callback_info info)
{
    OHNativeWindowBuffer *ohNativeWindowBuffer;
    OH_VideoProcessing_InitializeEnvironment();
    OH_VideoProcessing *instance = nullptr;
    OH_VideoProcessing *instance2 = nullptr;
    OH_VideoProcessing_Create(&instance, CREATE_TYPE);
    OH_VideoProcessing_Create(&instance2, CREATE_TYPE);
    VideoProcessing_Callback *callback = nullptr;
    OH_VideoProcessingCallback_Create(&callback);
    OH_VideoProcessingCallback_BindOnError(callback, OnError);
    OH_VideoProcessingCallback_BindOnState(callback, OnState);
    auto a = OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback, OnNewOutputBuffer);
    auto userData = VIDEO_PROCESSING_STATE_STOPPED;
    VideoProcessing_ErrorCode retq = OH_VideoProcessing_RegisterCallback(instance, callback, &userData);
    OH_AVFormat *parameterSetted = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameterSetted, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL,
                            VIDEO_DETAIL_ENHANCER_QUALITY_LEVEL_HIGH);
    OH_VideoProcessing_SetParameter(instance, parameterSetted);
    OHNativeWindow *window = nullptr;
    OHNativeWindow *window2 = nullptr;
    VideoProcessing_ErrorCode qwe = OH_VideoProcessing_GetSurface(instance, &window);
    OH_VideoProcessing_GetSurface(instance2, &window2);
    OH_VideoProcessing_SetSurface(instance, window2);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_Start(instance);
    VideoProcessing_ErrorCode errcode = OH_VideoProcessing_RenderOutputBuffer(instance, NULL);
    int32_t res = 1;
    if (errcode == VIDEO_PROCESSING_ERROR_INVALID_PARAMETER) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

napi_property_descriptor desc[] = {
    {"OH_AVImageGenerator_SetFDSource0100", nullptr, OH_AVImageGenerator_SetFDSource0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVImageGenerator_FetchFrameByTime0100", nullptr, OH_AVImageGenerator_FetchFrameByTime0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVImageGenerator_FetchFrameByTime0101", nullptr, OH_AVImageGenerator_FetchFrameByTime0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVImageGenerator_Release0100", nullptr, OH_AVImageGenerator_Release0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVImageGenerator_QueryOptions0100", nullptr, OH_AVImageGenerator_QueryOptions0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVImageGenerator_QueryOptions0101", nullptr, OH_AVImageGenerator_QueryOptions0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVImageGenerator_QueryOptions0102", nullptr, OH_AVImageGenerator_QueryOptions0102, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVImageGenerator_QueryOptions0103", nullptr, OH_AVImageGenerator_QueryOptions0103, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVMetadataExtractor_SetFDSource0100", nullptr, OH_AVMetadataExtractor_SetFDSource0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVMetadataExtractor_FetchMetadata0100", nullptr, OH_AVMetadataExtractor_FetchMetadata0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVMetadataExtractor_FetchMetadata0101", nullptr, OH_AVMetadataExtractor_FetchMetadata0101, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_AVMetadataExtractor_FetchAlbumCover0100", nullptr, OH_AVMetadataExtractor_FetchAlbumCover0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVMetadataExtractor_FetchAlbumCover0101", nullptr, OH_AVMetadataExtractor_FetchAlbumCover0101, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OH_AVMetadataExtractor_Release0100", nullptr, OH_AVMetadataExtractor_Release0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_RegisterCallback0100", nullptr, OH_VideoProcessing_RegisterCallback0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OH_VideoProcessing_GetSurface0100", nullptr, OH_VideoProcessing_GetSurface0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_SetParameter0100", nullptr, OH_VideoProcessing_SetParameter0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_SetParameter0101", nullptr, OH_VideoProcessing_SetParameter0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_GetParameter0100", nullptr, OH_VideoProcessing_GetParameter0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_GetParameter0101", nullptr, OH_VideoProcessing_GetParameter0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_VideoProcessing_RenderOutputBuffer0100", nullptr, OH_VideoProcessing_RenderOutputBuffer0100, nullptr, nullptr,
     nullptr, napi_default, nullptr},
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
    .nm_modname = "avimagemetadatndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
