/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <js_native_api.h>
#include <cstring>
#include <iostream>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <unistd.h>
#include <cstdio>
#include <thread>
#include <native_buffer/native_buffer.h>
#include "hilog/log.h"
#include <fcntl.h>
#include <map>
#include "multimedia/player_framework/native_avscreen_capture.h"
#include "multimedia/player_framework/native_avscreen_capture_base.h"
#include "multimedia/player_framework/native_avscreen_capture_errors.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avformat.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include <fstream>
#include <memory>
#include <unistd.h>
#include <atomic>

using namespace std;
static int32_t g_recordTimeHalf = 500000;
static int32_t g_recordTimeOne = 1000000;
static uint64_t g_displaySelectedId = -1;

OH_AVCodec *g_videoEnc;
constexpr uint32_t DEFAULT_WIDTH = 720;
constexpr uint32_t DEFAULT_HEIGHT = 1280;
constexpr OH_AVPixelFormat DEFAULT_PIXELFORMAT = AV_PIXEL_FORMAT_NV12;
static int32_t g_aFlag = 0;
static int32_t g_vFlag = 0;
const int32_t TEST_PASS = 0;
const int32_t TEST_FAILED = 1;
static atomic<double> frameNum;
static OH_AVScreenCapture *screenCaptureNormal;
static struct OH_AVScreenCapture_ContentFilter *g_contentFilter;
static OH_AVScreenCapture *screenCaptureRecord;
static OH_AVScreenCapture *screenCaptureSurface;

void SetConfig(OH_AVScreenCaptureConfig &config)
{
    int32_t width = 720;
    int32_t height = 1280;
    OH_AudioCaptureInfo micCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_MIC};
    OH_AudioCaptureInfo innerCapInfo = {.audioSampleRate = 48000, .audioChannels = 2, .audioSource = OH_ALL_PLAYBACK};
    OH_AudioEncInfo audioEncInfo = {.audioBitrate = 48000, .audioCodecformat = OH_AudioCodecFormat::OH_AAC_LC};
    OH_AudioInfo audioInfo = {.micCapInfo = micCapInfo, .innerCapInfo = innerCapInfo, .audioEncInfo = audioEncInfo};

    OH_VideoCaptureInfo videoCapInfo = {
        .videoFrameWidth = width, .videoFrameHeight = height, .videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA};
    OH_VideoEncInfo videoEncInfo = {
        .videoCodec = OH_VideoCodecFormat::OH_H264, .videoBitrate = 2000000, .videoFrameRate = 30};
    OH_VideoInfo videoInfo = {.videoCapInfo = videoCapInfo, .videoEncInfo = videoEncInfo};

    config = {
        .captureMode = OH_CAPTURE_HOME_SCREEN,
        .dataType = OH_ORIGINAL_STREAM,
        .audioInfo = audioInfo,
        .videoInfo = videoInfo,
    };
}

void OnError(OH_AVScreenCapture *capture, int32_t errorCode, void *userData)
{
    (void)capture;
    (void)errorCode;
    (void)userData;
}

void OnStateChange(struct OH_AVScreenCapture *capture, OH_AVScreenCaptureStateCode stateCode, void *userData)
{
    (void)capture;
    (void)stateCode;
    (void)userData;
}

void OnDisplaySelected(struct OH_AVScreenCapture *capture, uint64_t displayId, void *userData)
{
    (void)capture;
    (void)displayId;
    g_displaySelectedId = displayId;
    (void)userData;
}

void OnBufferAvailable(OH_AVScreenCapture *capture, OH_AVBuffer *buffer, OH_AVScreenCaptureBufferType bufferType,
                       int64_t timestamp, void *userData)
{
    if (bufferType == OH_AVScreenCaptureBufferType::OH_SCREEN_CAPTURE_BUFFERTYPE_VIDEO) {
        frameNum.store(frameNum.load() + 1);
    }
    (void)capture;
    (void)buffer;
    (void)bufferType;
    (void)timestamp;
    (void)userData;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
static napi_value NormalAVScreenCaptureTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
	
    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    bool isRotation = true;
    OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter, OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
static napi_value normalAVScreenCaptureTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeHalf);
    int32_t maxFrameRate = 20;
    double exceedPercentage = 1.2;
    int32_t width = 768;
    int32_t height = 1280;
    OH_AVScreenCapture_ResizeCanvas(screenCaptureNormal, width, height); // 768 width 1280 height
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_SetMaxVideoFrameRate(screenCaptureNormal, maxFrameRate);
    frameNum.store(0);
    usleep(g_recordTimeOne);
    int32_t totalFrameNum = frameNum.load();
    double averageFrameNum = static_cast<double>(totalFrameNum / (g_recordTimeOne / g_recordTimeOne));
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_AVScreenCapture_ReleaseContentFilter(g_contentFilter);
    OH_AVSCREEN_CAPTURE_ErrCode result3 = OH_AVScreenCapture_Release(screenCaptureNormal);
    int32_t result = TEST_FAILED;
    if (result3 == AV_SCREEN_CAPTURE_ERR_OK && ((result1 == AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT) ||
        (result1 == AV_SCREEN_CAPTURE_ERR_OK && averageFrameNum < (maxFrameRate * exceedPercentage)))) {
        result = TEST_PASS;
    } else {
        result = TEST_FAILED;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value NormalAVScreenRecordTest(napi_env env, napi_callback_info info)
{
    screenCaptureRecord = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    OH_RecorderInfo recorderInfo;
    const std::string screenCaptureRoot = "/data/storage/el2/base/files/";
    int32_t outputFd = open((screenCaptureRoot + "screen01.mp4").c_str(), O_RDWR | O_CREAT, 0777);
    std::string fileUrl = "fd://" + std::to_string(outputFd);
    recorderInfo.url = const_cast<char *>(fileUrl.c_str());
    recorderInfo.fileFormat = OH_ContainerFormatType::CFT_MPEG_4;
    SetConfig(config_);
    config_.dataType = OH_CAPTURE_FILE;
    config_.recorderInfo = recorderInfo;

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureRecord, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureRecord, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureRecord, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureRecord, OnBufferAvailable, nullptr);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureRecord, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenRecording(screenCaptureRecord);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
static napi_value normalAVScreenRecordTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenRecording(screenCaptureRecord);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureRecord);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0100
static napi_value normalAVScreenCaptureDisplayCallbackSuccess(napi_env env, napi_callback_info info)
{
    g_displaySelectedId = -1;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
	
    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    bool isRotation = true;
    OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    OH_AVScreenCapture_SetDisplayCallback(screenCaptureNormal, OnDisplaySelected, nullptr);
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter, OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    int32_t result = TEST_FAILED;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = TEST_PASS;
    }
    if (result == TEST_PASS) {
        result = g_displaySelectedId >= 0 ? TEST_PASS : TEST_FAILED;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0200
static napi_value normalAVScreenCaptureSetDisplayCallbackFail(napi_env env, napi_callback_info info)
{
    g_displaySelectedId = -1;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
	
    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    bool isRotation = true;
    OH_AVScreenCapture_SetCanvasRotation(screenCaptureNormal, isRotation);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    vector<int> windowidsExclude = { -111 };
    g_contentFilter = OH_AVScreenCapture_CreateContentFilter();
    OH_AVScreenCapture_ContentFilter_AddAudioContent(g_contentFilter, OH_SCREEN_CAPTURE_NOTIFICATION_AUDIO);
    OH_AVScreenCapture_ContentFilter_AddWindowContent(g_contentFilter,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVScreenCapture_ExcludeContent(screenCaptureNormal, g_contentFilter);
    OH_AVScreenCapture_SkipPrivacyMode(screenCaptureNormal,
        &windowidsExclude[0], static_cast<int32_t>(windowidsExclude.size()));
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = OH_AVScreenCapture_SetDisplayCallback(screenCaptureNormal, OnDisplaySelected, nullptr);
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    int32_t result3 = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_STATE) {
        result3 = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, result3, &res);
    return res;
}

void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
}

void OnStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
}

void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)userData;
    (void)index;
    (void)buffer;
}

void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    OH_AVCodecBufferAttr info;
    int32_t ret = OH_AVBuffer_GetBufferAttr(buffer, &info);
    ret = OH_VideoEncoder_FreeOutputBuffer(codec, index);
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
static napi_value NormalAVScreenCaptureSurfaceTest(napi_env env, napi_callback_info info)
{
    screenCaptureSurface = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);

    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureSurface, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureSurface, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureSurface, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureSurface, OnBufferAvailable, nullptr);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureSurface, config_);


    // 获取需要输入的Surface，以进行编码
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    const char *name = OH_AVCapability_GetName(capability);
    g_videoEnc = OH_VideoEncoder_CreateByName(name);
    // 配置异步回调，调用 OH_VideoEncoder_SetCallback 接口
    int32_t ret =
        OH_VideoEncoder_RegisterCallback(g_videoEnc,
                                         {OnError, OnStreamChanged,
                                          OnNeedInputBuffer, OnNewOutputBuffer},
                                         nullptr);
    // 配置视频帧速率
    double frameRate = 30.0;
    // 配置视频YUV值范围标志
    bool rangeFlag = false;
    // 配置视频原色
    int32_t primary = static_cast<int32_t>(OH_ColorPrimary::COLOR_PRIMARY_BT709);
    // 配置传输特性
    int32_t transfer = static_cast<int32_t>(OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709);
    // 配置最大矩阵系数
    int32_t matrix = static_cast<int32_t>(OH_MatrixCoefficient::MATRIX_COEFFICIENT_IDENTITY);
    // 配置编码Profile
    int32_t profile = static_cast<int32_t>(OH_AVCProfile::AVC_PROFILE_BASELINE);
    // 配置编码比特率模式
    int32_t rateMode = static_cast<int32_t>(OH_VideoEncodeBitrateMode::CBR);
    // 配置关键帧的间隔，单位为毫秒
    int32_t iFrameInterval = 23000;
    // 配置所需的编码质量。只有在恒定质量模式下配置的编码器才支持此配置
    int32_t quality = 0;
    // 配置比特率
    int64_t bitRate = 3000000;
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, rangeFlag);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, primary);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, transfer);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, matrix);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, iFrameInterval);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, rateMode);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
    int result2 = OH_VideoEncoder_Configure(g_videoEnc, format);
    OH_AVFormat_Destroy(format);

    // 从视频编码器获取输入Surface
    OHNativeWindow *nativeWindow;
    int result3 = OH_VideoEncoder_GetSurface(g_videoEnc, &nativeWindow);
    if (result3 != AV_ERR_OK) {
        OH_LOG_INFO(LOG_APP, "==DEMO== ScreenCapture Started OH_VideoEncoder_GetSurface ret=%{public}d", result3);
    }
    int result4 = OH_VideoEncoder_Prepare(g_videoEnc);
    std::string_view outputFilePath = "/data/storage/el2/base/files/DemoSurface.h264";
    std::unique_ptr<std::ofstream> outputFile = std::make_unique<std::ofstream>();
    outputFile->open(outputFilePath.data(), std::ios::out | std::ios::binary | std::ios::ate);

    // 启动编码器
    int32_t retEnc = OH_VideoEncoder_Start(g_videoEnc);
    // 指定surface开始录屏
    OH_AVSCREEN_CAPTURE_ErrCode result5 =
        OH_AVScreenCapture_StartScreenCaptureWithSurface(screenCaptureSurface, nativeWindow);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result5 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
static napi_value normalAVScreenCaptureSurfaceTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureSurface);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureSurface);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

class ScreenCaptureNdkCallBack {
public:
    virtual ~ScreenCaptureNdkCallBack() = default;
    virtual void OnError(int32_t errorCode) = 0;
    virtual void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) = 0;
    virtual void OnVideoBufferAvailable(bool isReady) = 0;
};

class ScreenCaptureNdkTestCallback : public ScreenCaptureNdkCallBack {
public:
    ScreenCaptureNdkTestCallback(OH_AVScreenCapture *ScreenCapture, FILE *audioFile, FILE *iFile, FILE *videoFile)
        : screenCapture_(ScreenCapture), aFile(audioFile), innerFile(iFile), vFile(videoFile) {}
    ~ScreenCaptureNdkTestCallback() override;
    void OnError(int32_t errorCode) override;
    void OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) override;
    void OnVideoBufferAvailable(bool isReady) override;

private:
    OH_AVScreenCapture *screenCapture_;
    FILE *aFile = nullptr;
    FILE *innerFile = nullptr;
    FILE *vFile = nullptr;
};

ScreenCaptureNdkTestCallback::~ScreenCaptureNdkTestCallback() 
{
    screenCapture_ = nullptr;
    aFile = nullptr;
    innerFile = nullptr;
    vFile = nullptr;
}

void ScreenCaptureNdkTestCallback::OnError(int32_t errorCode) 
{
    (void) errorCode;
}

void ScreenCaptureNdkTestCallback::OnAudioBufferAvailable(bool isReady, OH_AudioCaptureSourceType type) 
{
    if (isReady == true) {
        OH_AudioBuffer *audioBuffer = (OH_AudioBuffer *)malloc(sizeof(OH_AudioBuffer));
        if (audioBuffer == nullptr) {
            OH_LOG_INFO(LOG_APP, "audio buffer is nullptr");
            return;
        }
        if (OH_AVScreenCapture_AcquireAudioBuffer(screenCapture_, &audioBuffer, type) == AV_SCREEN_CAPTURE_ERR_OK) {
            if ((aFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_MIC)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, aFile);
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            } else if ((innerFile != nullptr) && (audioBuffer->buf != nullptr) && (type == OH_ALL_PLAYBACK)) {
                int32_t ret = fwrite(audioBuffer->buf, 1, audioBuffer->size, innerFile);
                free(audioBuffer->buf);
                audioBuffer->buf = nullptr;
            }
            free(audioBuffer);
            audioBuffer = nullptr;
        }
        if (g_aFlag == 1) {
            OH_AVScreenCapture_ReleaseAudioBuffer(screenCapture_, type);
        }
    } else {
        OH_LOG_INFO(LOG_APP, "AcquireAudioBuffer failed");
    }
}

void ScreenCaptureNdkTestCallback::OnVideoBufferAvailable(bool isReady) 
{
    if (isReady == true) {
        int32_t fence = 0;
        int64_t timestamp = 0;
        int32_t size = 4;
        OH_Rect damage;
        OH_NativeBuffer_Config config;
        OH_NativeBuffer *nativeBuffer =
            OH_AVScreenCapture_AcquireVideoBuffer(screenCapture_, &fence, &timestamp, &damage);
        if (nativeBuffer != nullptr) {
            OH_NativeBuffer_GetConfig(nativeBuffer, &config);
            int32_t length = config.height * config.width * size;

            OH_NativeBuffer_Unreference(nativeBuffer);
            if (g_vFlag == 1) {
                OH_AVScreenCapture_ReleaseVideoBuffer(screenCapture_);
            }
        } else {
            OH_LOG_INFO(LOG_APP, "AcquireVideoBuffer failed");
        }
    }
}

std::shared_ptr<ScreenCaptureNdkTestCallback> screenCaptureCb = nullptr;
static char g_filename[100] = {0};
std::mutex mutex_;
std::map<OH_AVScreenCapture *, std::shared_ptr<ScreenCaptureNdkCallBack>> mockCbMap_;

FILE *OpenAFile(FILE *audioFile, string filename) 
{
    snprintf(g_filename, sizeof(g_filename), "data/storage/el2/base/files/%s.pcm", filename.c_str());
    audioFile = fopen(g_filename, "w+");
    return audioFile;
}

void CloseFile(FILE *audioFile, FILE *videoFile) 
{
    if (audioFile != nullptr) {
        fclose(audioFile);
        audioFile = nullptr;
    }
    if (videoFile != nullptr) {
        fclose(videoFile);
        videoFile = nullptr;
    }
}

void DelCallback(OH_AVScreenCapture *screenCapture) 
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return;
    }
    auto it = mockCbMap_.find(screenCapture);
    if (it != mockCbMap_.end()) {
        mockCbMap_.erase(it);
    }
}

std::shared_ptr<ScreenCaptureNdkCallBack> GetCallback(OH_AVScreenCapture *screenCapture) 
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (mockCbMap_.empty()) {
        return nullptr;
    }
    if (mockCbMap_.find(screenCapture) != mockCbMap_.end()) {
        return mockCbMap_.at(screenCapture);
    }
    return nullptr;
}

void OnError(OH_AVScreenCapture *screenCapture, int32_t errorCode) 
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnError(errorCode);
    }
}

void OnAudioBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady, OH_AudioCaptureSourceType type) 
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnAudioBufferAvailable(isReady, type);
    }
}

void OnVideoBufferAvailable(OH_AVScreenCapture *screenCapture, bool isReady) 
{
    std::shared_ptr<ScreenCaptureNdkCallBack> mockCb = GetCallback(screenCapture);
    if (mockCb != nullptr) {
        mockCb->OnVideoBufferAvailable(isReady);
    }
}

void SetScreenCaptureCallback(OH_AVScreenCapture *screenCapture, std::shared_ptr<ScreenCaptureNdkTestCallback> &cb) 
{
    if (cb != nullptr) {
        std::lock_guard<std::mutex> lock(mutex_);
        mockCbMap_[screenCapture] = cb;
        struct OH_AVScreenCaptureCallback callback;
        callback.onError = OnError;
        callback.onAudioBufferAvailable = OnAudioBufferAvailable;
        callback.onVideoBufferAvailable = OnVideoBufferAvailable;
        OH_AVScreenCapture_SetCallback(screenCapture, callback);
    }
}

// SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400
static napi_value OriginAVScreenCaptureTest(napi_env env, napi_callback_info info) 
{
    FILE *audioFile = nullptr;
    OH_AVScreenCapture *screenCapture = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
    config_.videoInfo.videoCapInfo.videoSource = OH_VIDEO_SOURCE_SURFACE_RGBA;
    audioFile = OpenAFile(audioFile, "SUB_MULTIMEDIA_SCREEN_CAPTURE_0004");
    screenCaptureCb = std::make_shared<ScreenCaptureNdkTestCallback>(screenCapture, audioFile, nullptr, nullptr);

    bool isMicrophone = true;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCapture, isMicrophone);

    SetScreenCaptureCallback(screenCapture, screenCaptureCb);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCapture, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCapture);
    OH_AVScreenCapture_StopScreenCapture(screenCapture);
    DelCallback(screenCapture);
    OH_AVScreenCapture_Release(screenCapture);
    CloseFile(audioFile, nullptr);
    screenCaptureCb = nullptr;
    napi_value res;
    OH_AVSCREEN_CAPTURE_ErrCode result;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        OH_LOG_INFO(LOG_APP, "init/start/stop failed, init: %d, start: %d", result1, result2);
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorTest(napi_env env, napi_callback_info info)
{
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVScreenCaptureConfig config_;
    SetConfig(config_);
	
    bool isMicrophone = false;
    OH_AVScreenCapture_SetMicrophoneEnabled(screenCaptureNormal, isMicrophone);
    OH_AVScreenCapture_SetErrorCallback(screenCaptureNormal, OnError, nullptr);
    OH_AVScreenCapture_SetStateCallback(screenCaptureNormal, OnStateChange, nullptr);
    OH_AVScreenCapture_SetDataCallback(screenCaptureNormal, OnBufferAvailable, nullptr);
    
    OH_AVScreenCapture_ShowCursor(screenCaptureNormal, false);
    
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_Init(screenCaptureNormal, config_);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_StartScreenCapture(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value normalAVScreenCaptureShowCursorBeforeTestStop(napi_env env, napi_callback_info info)
{
    usleep(g_recordTimeOne);
    OH_AVScreenCapture_ShowCursor(screenCaptureNormal, true);
    usleep(g_recordTimeOne);
    OH_AVScreenCapture_ShowCursor(screenCaptureNormal, false);
    
    OH_AVSCREEN_CAPTURE_ErrCode result1 = OH_AVScreenCapture_StopScreenCapture(screenCaptureNormal);
    OH_AVSCREEN_CAPTURE_ErrCode result2 = OH_AVScreenCapture_Release(screenCaptureNormal);

    OH_AVSCREEN_CAPTURE_ErrCode result = AV_SCREEN_CAPTURE_ERR_OK;
    if (result1 == AV_SCREEN_CAPTURE_ERR_OK && result2 == AV_SCREEN_CAPTURE_ERR_OK) {
        result = AV_SCREEN_CAPTURE_ERR_OK;
    } else {
        result = AV_SCREEN_CAPTURE_ERR_OPERATE_NOT_PERMIT;
    }
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value normalAVScreenCaptureShowCursorWithParaNullFalse(napi_env env, napi_callback_info info)
{
    bool isMicrophone = false;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_ShowCursor(nullptr, false);
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}


static napi_value normalAVScreenCaptureShowCursorWithParaNullTrue(napi_env env, napi_callback_info info)
{
    bool isMicrophone = false;
    screenCaptureNormal = OH_AVScreenCapture_Create();
    OH_AVSCREEN_CAPTURE_ErrCode result = OH_AVScreenCapture_ShowCursor(nullptr, true);
    int resCapture = TEST_FAILED;
    if (result == AV_SCREEN_CAPTURE_ERR_INVALID_VAL) {
        resCapture = TEST_PASS;
    }
    napi_value res;
    napi_create_int32(env, resCapture, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"normalAVScreenCaptureTest", nullptr, NormalAVScreenCaptureTest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenRecordTest", nullptr, NormalAVScreenRecordTest, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"normalAVScreenCaptureSurfaceTest", nullptr, NormalAVScreenCaptureSurfaceTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"originAVScreenCaptureTest", nullptr, OriginAVScreenCaptureTest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureTestStop", nullptr, normalAVScreenCaptureTestStop, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenRecordTestStop", nullptr, normalAVScreenRecordTestStop, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"normalAVScreenCaptureSurfaceTestStop", nullptr, normalAVScreenCaptureSurfaceTestStop, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorTest", nullptr, normalAVScreenCaptureShowCursorTest, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorTestStop", nullptr, normalAVScreenCaptureShowCursorTestStop, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorWithParaNullTrue", nullptr, normalAVScreenCaptureShowCursorWithParaNullTrue,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorWithParaNullFalse", nullptr, normalAVScreenCaptureShowCursorWithParaNullFalse,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureShowCursorBeforeTestStop", nullptr, normalAVScreenCaptureShowCursorBeforeTestStop,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureSetDisplayCallbackFail", nullptr, normalAVScreenCaptureSetDisplayCallbackFail,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"normalAVScreenCaptureDisplayCallbackSuccess", nullptr, normalAVScreenCaptureDisplayCallbackSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativeAVScreenCapturendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
