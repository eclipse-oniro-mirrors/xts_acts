/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "AVCode/AVCode_Test.h"
#include "AVCode/AVDecodeTest.h"
#include "AVCode/AVEncodeTest.h"
#include "common/Common.h"
#include <cstdint>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_cencinfo.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avbuffer.h>

static const int32_t WIDTH = 320;
static const int32_t HEIGHT = 240;
static const int32_t NUMBER20 = 240;
static const int32_t DEFAULT_WIDTH = 128;
static const int32_t DEFAULT_HEIGHT = 96;
static const int32_t DEFAULT_FRAME_RATE = 30;

napi_value VideoEncoder_FreeOutputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_AVErrCode ret = OH_VideoEncoder_FreeOutputBuffer(videoEnc, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_RegisterParameterCallback_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_OnNeedInputParameter onInputParameter = nullptr;
    onInputParameter = [](OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData) {};
    OH_AVErrCode ret = OH_VideoEncoder_RegisterParameterCallback(videoEnc, onInputParameter, nullptr);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_SetParameter_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_AVErrCode ret = OH_VideoEncoder_SetParameter(videoEnc, format.get());
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_NotifyEndOfStream_Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    OH_AVErrCode ret = OH_VideoEncoder_NotifyEndOfStream(videoEnc);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_PushInputData_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_AVErrCode ret = OH_VideoEncoder_PushInputData(videoEnc, 1, attr);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_PushInputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_AVErrCode ret = OH_VideoEncoder_PushInputBuffer(videoEnc, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_PushInputParameter_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_VideoEncoder_OnNeedInputParameter onInputParameter = nullptr;
    onInputParameter = [](OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData) {};
    OH_VideoEncoder_RegisterParameterCallback(videoEnc, onInputParameter, nullptr);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OHNativeWindow *window;
    OH_VideoEncoder_GetSurface(videoEnc, &window);
    OH_VideoEncoder_Prepare(videoEnc);
    OH_AVErrCode ret = OH_VideoEncoder_PushInputParameter(videoEnc, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1 : 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryInputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoEncoder_QueryInputBuffer(videoEnc, &index, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryInputBuffer_Test2(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_VideoEncoder_Start(videoEnc);
    uint32_t index = UINT32_MAX;
    OH_AVErrCode ret;
    for (int i = 1; i < NUMBER20; i++) {
        ret = OH_VideoEncoder_QueryInputBuffer(videoEnc, &index, 0);
        if (ret == AV_ERR_TRY_AGAIN_LATER) {
            break;
        }
    }
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_TRY_AGAIN_LATER ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryInputBuffer_Test3(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 0);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_VideoEncoder_Start(videoEnc);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoEncoder_QueryInputBuffer(videoEnc, &index, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_OPERATE_NOT_PERMIT ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryOutputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoEncoder_QueryOutputBuffer(videoEnc, &index, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryOutputBuffer_Test2(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_VideoEncoder_Start(videoEnc);
    uint32_t index = UINT32_MAX;
    OH_AVErrCode ret;
    for (int i = 1; i < NUMBER20; i++) {
        ret = OH_VideoEncoder_QueryOutputBuffer(videoEnc, &index, 0);
        if (ret == AV_ERR_TRY_AGAIN_LATER) {
            break;
        }
    }
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_TRY_AGAIN_LATER ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryOutputBuffer_Test3(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 0);
    OH_AVCodecAsyncCallback callback;
    OH_VideoDecoder_SetCallback(videoEnc, callback, nullptr);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OH_VideoEncoder_Prepare(videoEnc);
    OH_VideoEncoder_Start(videoEnc);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoEncoder_QueryOutputBuffer(videoEnc, &index, 1);
    OH_VideoEncoder_Destroy(videoEnc);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_OPERATE_NOT_PERMIT ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_SetSurface_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVCapability *capability1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *name1 = OH_AVCapability_GetName(capability1);
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByName(name1);
    OH_VideoEncoder_Configure(videoEnc, format.get());
    OHNativeWindow *window = nullptr;
    OH_VideoEncoder_GetSurface(videoEnc, &window);
    OH_AVErrCode ret = OH_VideoDecoder_SetSurface(videoDec, window);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    OH_VideoDecoder_Destroy(videoDec);
    OH_VideoEncoder_Destroy(videoEnc);
    return retValue;
}

napi_value VideoDecoder_SetParameter_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVErrCode ret = OH_VideoDecoder_SetParameter(videoDec, format.get());
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_PushInputData_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_AVErrCode ret = OH_VideoDecoder_PushInputData(videoDec, 1, attr);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_RenderOutputData_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVErrCode ret = OH_VideoDecoder_RenderOutputData(videoDec, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_FreeOutputData_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVErrCode ret = OH_VideoDecoder_FreeOutputData(videoDec, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE, &retValue);
    return retValue;
}

napi_value VideoDecoder_PushInputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVErrCode ret = OH_VideoDecoder_PushInputBuffer(videoDec, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE, &retValue);
    return retValue;
}

napi_value VideoDecoder_RenderOutputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVErrCode ret = OH_VideoDecoder_RenderOutputBuffer(videoDec, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE, &retValue);
    return retValue;
}

napi_value VideoDecoder_RenderOutputBufferAtTime_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVErrCode ret = OH_VideoDecoder_RenderOutputBufferAtTime(videoDec, 1, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE, &retValue);
    return retValue;
}

napi_value VideoDecoder_FreeOutputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_AVErrCode ret = OH_VideoDecoder_FreeOutputBuffer(videoDec, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryInputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoDecoder_QueryInputBuffer(videoDec, &index, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryInputBuffer_Test2(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_VideoDecoder_Start(videoDec);
    uint32_t index = UINT32_MAX;
    OH_AVErrCode ret;
    for (int i = 1; i < NUMBER20; i++) {
        ret = OH_VideoDecoder_QueryInputBuffer(videoDec, &index, 0);
        if (ret == AV_ERR_TRY_AGAIN_LATER) {
            break;
        }
    }
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_TRY_AGAIN_LATER, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryInputBuffer_Test3(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 0);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_VideoDecoder_Start(videoDec);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoDecoder_QueryInputBuffer(videoDec, &index, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_OPERATE_NOT_PERMIT ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryOutputBuffer_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoDecoder_QueryInputBuffer(videoDec, &index, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_INVALID_STATE ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryOutputBuffer_Test2(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_VideoDecoder_Start(videoDec);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoDecoder_QueryOutputBuffer(videoDec, &index, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_TRY_AGAIN_LATER ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_QueryOutputBuffer_Test3(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 0);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Prepare(videoDec);
    OH_VideoDecoder_Start(videoDec);
    uint32_t index = 1;
    OH_AVErrCode ret = OH_VideoDecoder_QueryOutputBuffer(videoDec, &index, 1);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, ret == AV_ERR_OPERATE_NOT_PERMIT ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_Configure_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, 1);
    OH_AVErrCode ret = OH_VideoDecoder_Configure(videoDec, format.get());
    OH_VideoDecoder_Destroy(videoDec);
    napi_value ret2;
    napi_create_int32(env, (ret == AV_ERR_VIDEO_UNSUPPORTED_COLOR_SPACE_CONVERSION || ret == AV_ERR_OK) ? 1: 0, &ret2);
    return ret2;
}

napi_value VideoDecoder_Prepare_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_AVErrCode ret = OH_VideoDecoder_Prepare(videoDec);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, (ret == AV_ERR_OPERATE_NOT_PERMIT || ret == AV_ERR_OK) ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoDecoder_Start_Test(napi_env env, napi_callback_info info)
{
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(name);
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, WIDTH);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, HEIGHT);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, 1);
    OH_VideoDecoder_Configure(videoDec, format.get());
    OH_AVErrCode ret = OH_VideoDecoder_Start(videoDec);
    OH_VideoDecoder_Destroy(videoDec);
    napi_value retValue;
    napi_create_int32(env, (ret == AV_ERR_OPERATE_NOT_PERMIT || ret == AV_ERR_INVALID_STATE) ? 1: 0, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryOutputBuffer(napi_env env, napi_callback_info info)
{
    auto vEncSample = std::make_unique<OHOS::Media::AVEncodeTest>();
    vEncSample->enbleSyncMode = 1;
    vEncSample->syncOutputWaitTime = INT64_MIN;
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *enName = OH_AVCapability_GetName(cap);
    int32_t ret = vEncSample->CreateVideoEncoder(enName);
    ret = vEncSample->ConfigureVideoEncoder();
    ret = vEncSample->StartVideoEncoder();
    vEncSample->WaitForEOS();
    ret = vEncSample->errCount;
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

napi_value VideoEncoder_QueryInputBuffer(napi_env env, napi_callback_info info)
{
    auto vEncSample = std::make_unique<OHOS::Media::AVEncodeTest>();
    vEncSample->enbleSyncMode = 0;
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *enName = OH_AVCapability_GetName(cap);
    int32_t ret = vEncSample->CreateVideoEncoder(enName);
    ret = vEncSample->ConfigureVideoEncoder();
    ret = vEncSample->StartVideoEncoder();
    vEncSample->WaitForEOS();
    ret = vEncSample->errCount;
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

napi_value VideoDecoder_AVDecodeSync(napi_env env, napi_callback_info info)
{
    int32_t ret = -1;
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
    const char* capName = OH_AVCapability_GetName(cap);
    if (cap != nullptr) {
        auto vDecSample = std::make_shared<OHOS::Media::AVDecodeTest>();
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defualtPixelFormat = DEFAULT_FRAME_RATE;
        vDecSample->enbleSyncMode = 1;
        vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
        vDecSample->CreateVideoDecoder(capName);
        vDecSample->ConfigureVideoDecoder();
        vDecSample->StartSyncVideoDecoder();
        vDecSample->WaitForEOS();
        ret = vDecSample->errCount;
    }
    napi_value retValue;
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

