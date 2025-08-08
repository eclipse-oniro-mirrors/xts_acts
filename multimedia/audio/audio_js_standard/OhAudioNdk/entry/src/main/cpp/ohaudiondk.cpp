/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <fcntl.h>
#include <linux/fuse.h>
#include <linux/kd.h>
#include <linux/quota.h>
#include <ohaudio/native_audiocapturer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <ohaudio/native_audiostream_base.h>
#include <ohaudio/native_audiorenderer.h>
#include <random>
#include <cstdio>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <utmp.h>
#include <web/arkweb_net_error_list.h>
#include <web/native_interface_arkweb.h>

#define FAIL (-1)
#define SUCCESS 1
#define SUCCESS1 2
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define CODE_SUCCESS 200       // 播放器创建成功
#define BUILD_FAIL 300         // 输入流和构造器初始化失败
#define CALLBACK_FAIL 400      // 回调方法设置失败
#define INFO_FAIL 500          // 工作场景初始化失败
#define CHANN_EL_FAIL 600       // 通道设置失败
#define ENCODING_FAIL 700      // 编码格式设置失败
#define FRAMESIZE_FAIL 800     // 帧长设置失败
#define LATENCYMODE_FAIL 900   // 延时模式设置失败
#define DATA_FAIL 1000         // 数据处理失败
#define SAMPLEFORMAT_FAIL 1100 // 采样格式设置失败
#define RATE_FAIL 1200         // 采样率设置失败
#define SPEED_FAIL 1300        // 播放速度设置失败
#define START_FAIL 1400        // 录音器启动失败
#define CREAT_FAIL 3000
#define CAPCREAT_FAIL 10
#define CAPCREASTREAMT_FAIL (-10)

#define RENDERERDESTORY_SUCCESS 2000 // 渲染器已经被销毁
#define STATE_ERROR 12 // 流状态无效
#define MAXPLAYTIME 10

#define SOURCETYPE0 0
#define SOURCETYPE1 1
#define SOURCETYPE2 2
#define SOURCETYPE7 7

#define KNUMBER0 0
#define KNUMBER1 1
#define KNUMBER2 2
#define KNUMBER3 3
#define KNUMBER4 4
#define KNUMBER5 5
#define KNUMBER6 6
#define KNUMBER7 7
#define KNUMBER8 8
#define KNUMBER9 9
#define KNUMBER10 10
#define KNUMBER11 11
#define KNUMBER12 12
#define KNUMBER13 13
#define KNUMBER1000 1000

#define KCHANNELCOUNT 2
#define KRATE 48000
#define KFRAMESIZE 240

FILE *g_file = nullptr;
std::string g_filePath = "/data/storage/el2/base/files/S16LE.pcm";
std::string g_filePath1 = "/resources/rawfile/Believer.wav";
std::string g_filePath2 = "/data/storage/el2/base/files/Believer60s.wav";

std::string prePath = "/data/storage/el2/base/files/";

std::string wavFileList[] = {"Believer.wav", "Believer60s.wav", "file_example_WAV_1MG.wav",
                             "safe_and_sound_32.wav", "StarWars10s-1C-8000-2SW.wav",
                             "StarWars10s-1C-16000-2SW.wav", "StarWars10s-1C-32000-1SW.wav",
                             "StarWars10s-1C-44100-2SW.wav", "StarWars10s-1C-64000-3SW.wav",
                             "StarWars10s-1C-96000-4SW.wav", "StarWars10s-2C-11025-1SW.wav",
                             "StarWars10s-2C-12000-2SW.wav", "StarWars10s-2C-16000-3SW.wav",
                             "StarWars10s-2C-22050-2SW.wav", "StarWars10s-2C-24000-3SW.wav",
                             "StarWars10s-2C-48000-4SW.wav", "test_44100_2.wav",
                             "vorbis_48000_32_1.wav"};
std::string pcmFileList[] = {"S16LE.pcm", "S16LE_1_8000.pcm",
                             "S16LE_1_16000.pcm", "S16LE_1_22050.pcm",
                             "S16LE_1_24000.pcm", "S32LE.pcm", "S32LE_2.pcm"};

static bool g_readEnd = false;
int32_t g_recorderTime = 10000;
static int g_playerTime;

static OH_AudioStreamBuilder *capturerbuilder;
static OH_AudioCapturer *audioCapturer;

static OH_AudioStreamBuilder *rendererbuilder;
static OH_AudioRenderer *audiorenderer;

#pragma mark - 公用方法
// 获取index下标的属性值
static int getParamAtIndex(int index, napi_env env, napi_callback_info info)
{
    size_t argc = 9;
    napi_value args[9] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    int value;
    napi_get_value_int32(env, args[index], &value);
    return value;
}

// 根据value值获取采样格式
static OH_AudioStream_SampleFormat getSampleFormatValue(int sampleFormatValue)
{
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
    switch (sampleFormatValue) {
        case KNUMBER0:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
            break;
        case KNUMBER1:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S16LE;
            break;
        case KNUMBER2:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S24LE;
            break;
        case KNUMBER3:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S32LE;
            break;
        default:
            break;
    }
    return oH_AudioStream_SampleFormat;
}

// 根据value值获取播放流场景类型
static OH_AudioStream_Usage getRendererInfoWithValue(int usageValue)
{
    OH_AudioStream_Usage oH_AudioStream_Usage = AUDIOSTREAM_USAGE_UNKNOWN;
    switch (usageValue) {
        case KNUMBER0:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_UNKNOWN;
            break;
        case KNUMBER1:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_MUSIC;
            break;
        case KNUMBER2:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
            break;
        case KNUMBER3:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_VOICE_ASSISTANT;
            break;
        case KNUMBER4:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_ALARM;
            break;
        case KNUMBER5:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_VOICE_MESSAGE;
            break;
        case KNUMBER6:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_RINGTONE;
            break;
        case KNUMBER7:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_NOTIFICATION;
            break;
        case KNUMBER8:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_ACCESSIBILITY;
            break;
        case KNUMBER10:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_MOVIE;
            break;
        case KNUMBER11:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_GAME;
            break;
        case KNUMBER12:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_AUDIOBOOK;
            break;
        case KNUMBER13:
            oH_AudioStream_Usage = AUDIOSTREAM_USAGE_NAVIGATION;
            break;
        default:
            break;
        }
        return oH_AudioStream_Usage;
}
// 创建一个输入或者输出类型的音频流构造器
static napi_value OHAudioStreamBuilderCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);

    double value;
    napi_get_value_double(env, args[0], &value);

    int backParam = FAIL;
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    if (value == 1) {
        type = AUDIOSTREAM_TYPE_CAPTURER;
    }
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_Create(&builder, type);
    if (value == 1) {
        capturerbuilder = builder;
    } else {
        rendererbuilder = builder;
    }
    
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

static OH_AudioStreamBuilder *GetAudioStreamBuilder(OH_AudioStream_Type type)
{
    if (type == AUDIOSTREAM_TYPE_RENDERER) {
        if (rendererbuilder) {
            return rendererbuilder;
        }
    } else {
        if (capturerbuilder) {
            return capturerbuilder;
        }
    }
    
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_Create(&builder, type);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        return builder;
    } else {
        return nullptr;
    }
}

static OH_AudioCapturer *GetOH_AudioCapturer()
{
    OH_AudioCapturer *oH_AudioCapturer;
    OH_AudioStream_Result oH_AudioStream_Result1 =
        OH_AudioStreamBuilder_GenerateCapturer(capturerbuilder, &oH_AudioCapturer);
    if (oH_AudioStream_Result1 == AUDIOSTREAM_SUCCESS) {
        return oH_AudioCapturer;
    } else if (oH_AudioStream_Result1 == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return nullptr;
    }
    return oH_AudioCapturer;
}

#pragma mark - 输入音频流回调方法
int32_t onReadData(OH_AudioCapturer *capturer, void *userData, void *buffer, int32_t length)
{
    printf("Get callback buffer, bufferLen:%d  \n", length);
    size_t count = 1;
    if (fwrite(buffer, length, count, g_file) != count) {
        printf("buffer fwrite err");
    }
    printf("userData: %p\n", &userData);
    return 0;
}

// Define callback function for handling stream events
int32_t onStreamEvent(OH_AudioCapturer *capturer, void *userData, OH_AudioStream_Event event)
{
    return 0;
}

// Define callback function for handling interrupt events
int32_t onInterruptEvent(OH_AudioCapturer *capturer, void *userData, OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    return 0;
}

// Define callback function for handling errors
int32_t onError(OH_AudioCapturer *capturer, void *userData, OH_AudioStream_Result error)
{
    return 0;
}
#pragma mark - 停止方法
void SleepWaitRecoder(bool *stop)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(g_recorderTime));
    *stop = true;
}
#pragma mark - 文件初始化
static napi_value OpenFileName(napi_env env, napi_callback_info info) 
{
    napi_value result = nullptr;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_string) {
        napi_throw_type_error(env, nullptr, "Argument must be a string.");
        return nullptr;
    }
    size_t bufsize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &bufsize);
    if (bufsize > 0) {
        char *buffer = new char[bufsize + 1]; // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[0], buffer, bufsize + 1, nullptr);
        // 使用接收到的字符串进行操作
        int backParam = FAIL;
        g_file = fopen(buffer, "wb"); // 以可读可写方式打开文件
        if (g_file == nullptr) {
            printf("OHAudioCapturerTest: Unable to open file \n");
            napi_create_int32(env, backParam, &result);
            return result;
        }
    }

    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

#pragma mark - 音频捕获器初始化
static napi_value CreatCapturerRecorderWithParam(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_file = fopen(g_filePath.c_str(), "wr"); // 以可读可写方式打开文件
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_CAPTURER); // 初始化输入流构造器
    if (builder == nullptr) {
        napi_create_int32(env, STATE_ERROR, &result);
        return result;
    }
    int32_t rateValue = getParamAtIndex(KNUMBER0, env, info);
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetSamplingRate(builder, rateValue); // 设置采样率
    int channelCount = getParamAtIndex(KNUMBER1, env, info);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount); // 设置通道数
    OH_AudioCapturer_Callbacks callbacks = OH_AudioCapturer_Callbacks();
    callbacks.OH_AudioCapturer_OnReadData = onReadData;
    callbacks.OH_AudioCapturer_OnStreamEvent = onStreamEvent;
    callbacks.OH_AudioCapturer_OnInterruptEvent = onInterruptEvent;
    callbacks.OH_AudioCapturer_OnError = onError;
    void *data;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, nullptr); // 设置回调

    int frameSizeValue = getParamAtIndex(KNUMBER2, env, info);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, frameSizeValue); // 设置每次回调的帧长
    
    OH_AudioStream_LatencyMode latencyMode =
        getParamAtIndex(KNUMBER3, env, info) == 0 ? AUDIOSTREAM_LATENCY_MODE_NORMAL : AUDIOSTREAM_LATENCY_MODE_FAST;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode); // 设置延时模式

    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = 
        getSampleFormatValue(getParamAtIndex(KNUMBER4, env, info));
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat); // 设置采样格式
    
    capturerbuilder = builder;
    audioCapturer = GetOH_AudioCapturer(); // 创建输入音频流实例
    if (audioCapturer == nullptr) {
        napi_create_int32(env, CAPCREASTREAMT_FAIL, &result);
        return result;
    }
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

static napi_value CreateAudioCapturerRecorder(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[PARAM_0], &index);
    std::string pcmPath = prePath.append(pcmFileList[index]);

    g_file = fopen(pcmPath.c_str(), "wb"); // 以可读可写方式打开文件
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_CAPTURER); // 初始化输入流构造器
    if (builder == nullptr) {
        napi_create_int32(env, KNUMBER12, &result);
        return result;
    }

    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetSamplingRate(builder, KRATE); // 设置采样率
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetChannelCount(builder, KCHANNELCOUNT); // 设置通道数
    OH_AudioCapturer_Callbacks callbacks = OH_AudioCapturer_Callbacks();
    callbacks.OH_AudioCapturer_OnReadData = onReadData;
    callbacks.OH_AudioCapturer_OnStreamEvent = onStreamEvent;
    callbacks.OH_AudioCapturer_OnInterruptEvent = onInterruptEvent;
    callbacks.OH_AudioCapturer_OnError = onError;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, nullptr); // 设置回调
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, KFRAMESIZE); // 设置每次回调的帧长

    capturerbuilder = builder;
    audioCapturer = GetOH_AudioCapturer(); // 创建输入音频流实例
    if (audioCapturer == nullptr) {
        napi_create_int32(env, CAPCREAT_FAIL, &result);
        return result;
    }
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

#pragma mark - 音频捕获器销毁方法

static napi_value CloseAudioCapture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (capturerbuilder) {
        OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_Destroy(capturerbuilder);
        napi_create_int32(env, oH_AudioStream_Result, &result);
    } else {
        napi_create_int32(env, CODE_SUCCESS, &result);
    }
    capturerbuilder = nullptr;
    return result;
}

static napi_value CloseCapturerPCMFile(napi_env env, napi_callback_info info) 
{
    napi_value result = nullptr;
    int ret = fclose(g_file);
    if (ret == 0) {
        printf("file close fail");
    }
    g_file = nullptr;
    return result;
}

// 输出音频流回调方法
int32_t onRendererWriteData(OH_AudioRenderer *renderer, void *userData, void *buffer, int32_t length) 
{
    if (g_file == nullptr) {
        return 0;
    }
    size_t readCount = fread(buffer, length, 1, g_file);
    if (!readCount) {
        if (ferror(g_file)) {
            printf("Error reading myfile");
            g_readEnd = true;
        } else if (feof(g_file)) {
            printf("EOF found");
            g_readEnd = true;
        }
    }
    if (g_playerTime > MAXPLAYTIME) {
        g_readEnd = true;
    }
    return length;
}

// Define callback function for handling stream events
int32_t onRendererStreamEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Event event)
{
    return 0;
}

// Define callback function for handling interrupt events
int32_t onRendererInterruptEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    return 0;
}

// Define callback function for handling errors
int32_t onRendererError(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Result error)
{
    return 0;
}

#pragma mark - 音频播放器初始化方法
void SetRendererNormalParam(OH_AudioStreamBuilder *builder)
{
    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetChannelCount(builder, KCHANNELCOUNT); // 设置通道数
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSamplingRate(builder, KRATE); // 设置采样率
}
// 输出流音频初始化
static napi_value CreatRendererAudioPlayer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_file = fopen(g_filePath2.c_str(), "wr");
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER); // 初始化输出构造器
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetRendererInfo(builder, usage); // 设置工作场景
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType); // 设置编码类型
    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode); // 设置延时模式
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
    oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat); // 设置采格式
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = onRendererWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = onRendererStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = onRendererInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = onRendererError;
    void *data;
    oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &data); // 设置回调
    SetRendererNormalParam(builder);
    rendererbuilder = builder;
    oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateRenderer(rendererbuilder, &audiorenderer);
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, BUILD_FAIL, &result);
        return result;
    }
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

static napi_value CreatAudioPlayerWithWavFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[PARAM_0], &index);
    std::string videoFilePath = prePath.append(wavFileList[index]);
    g_file = fopen(videoFilePath.c_str(), "wr");
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER); // 初始化输出构造器
    OH_AudioStream_Result oH_AudioStream_Result = // 设置工作场景
        OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC); 
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetChannelCount(builder, KCHANNELCOUNT); // 设置通道数
    oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW); // 设置编码类型
    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode); // 设置延时模式
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
    oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSamplingRate(builder, KRATE); // 设置采样率

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = onRendererWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = onRendererStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = onRendererInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = onRendererError;
    void *data;

    oH_AudioStream_Result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &data); // 设置回调
    rendererbuilder = builder;
    oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateRenderer(rendererbuilder, &audiorenderer);
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, BUILD_FAIL, &result);
        return result;
    }
    
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

static napi_value CreatAudioPlayerWithFileAndParam(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = KNUMBER9;
    napi_value args[KNUMBER9] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[PARAM_0], &index);
    std::string videoFilePath = prePath.append(wavFileList[index]);
    g_file = fopen(videoFilePath.c_str(), "wr");
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER); // 初始化输出构造器
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetRendererInfo(builder, usage); // 设置工作场景
    int channelCount = getParamAtIndex(2, env, info);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount); // 设置通道数
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW); // 设置编码类型
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, getParamAtIndex(KNUMBER4, env, info));
    OH_AudioStream_LatencyMode latencyMode =
        getParamAtIndex(KNUMBER6, env, info) == 0 ? AUDIOSTREAM_LATENCY_MODE_NORMAL : AUDIOSTREAM_LATENCY_MODE_FAST;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode); // 设置延时模式
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = 
        getSampleFormatValue(getParamAtIndex(KNUMBER7, env, info));
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat); // 设置采样格式
    int32_t rateValue = getParamAtIndex(KNUMBER8, env, info);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSamplingRate(builder, rateValue); // 设置采样率

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = onRendererWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = onRendererStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = onRendererInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = onRendererError;
    void *data;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &data); // 设置回调
    rendererbuilder = builder;
    oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateRenderer(rendererbuilder, &audiorenderer); // 流初始化
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, BUILD_FAIL, &result);
        return result;
    }
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

static napi_value TestRendererAudioStreamUsage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_file = fopen(g_filePath2.c_str(), "wr");
    if (g_file == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER); // 初始化输出构造器
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int usageValue;
    napi_get_value_int32(env, args[PARAM_0], &usageValue);

    OH_AudioStream_Usage usage = getRendererInfoWithValue(usageValue);
    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetRendererInfo(builder, usage); // 设置工作场景
    SetRendererNormalParam(builder);
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetEncodingType(builder, AUDIOSTREAM_ENCODING_TYPE_RAW); // 设置编码类型

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode); // 设置延时模式
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat); // 设置采格式

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = onRendererWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = onRendererStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = onRendererInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = onRendererError;
    void *data;

    oH_AudioStream_Result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &data); // 设置回调
    rendererbuilder = builder;
    oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateRenderer(rendererbuilder, &audiorenderer);
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, BUILD_FAIL, &result);
        return result;
    }

    float speed = 1.0f;
    oH_AudioStream_Result = OH_AudioRenderer_SetSpeed(audiorenderer, speed);
    napi_create_int32(env, CODE_SUCCESS, &result);
    return result;
}

#pragma mark - 音频播放器器销毁方法
static napi_value CloseAudioRender(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (rendererbuilder) {
        OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_Destroy(rendererbuilder);
        napi_create_int32(env, oH_AudioStream_Result, &result);
        rendererbuilder = nullptr;
    } else {
        napi_create_int32(env, RENDERERDESTORY_SUCCESS, &result);
    }
    int ret = fclose(g_file);
    if (ret == 0) {
        printf("file close fail");
    }
    g_file = nullptr;
    return result;
}

// 暂停输入音频流
static napi_value OHAudioCapturerPause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_Pause(audioCapturer);
    napi_create_int32(env, oH_AudioStream_Result, &result); 
    return result;
}

// 释放输入音频流
static napi_value OHAudioCapturerRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (audioCapturer != nullptr) {
        OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_Release(audioCapturer);
        napi_create_int32(env, oH_AudioStream_Result, &result);
        audioCapturer = nullptr;
    } else {
        napi_create_int32(env, 0, &result);
    }

    return result;
}

// 开始获取音频数据
static napi_value OHAudioCapturerStart(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_Start(audioCapturer);

    bool stop = false;
    std::thread stopthread(SleepWaitRecoder, &stop);
    stopthread.detach();
    
    if (audioCapturer == nullptr) {
        napi_create_int32(env, CREAT_FAIL, &result);
    } else {
        napi_create_int32(env, oH_AudioStream_Result, &result);
    }
    return result;
}

// 停止输入音频流
static napi_value OHAudioCapturerStop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_Stop(audioCapturer);
    napi_create_int32(env, oH_AudioStream_Result, &result); 
    return result;
}

// 丢弃已经写入的音频数据
static napi_value OHAudioRendererFlush(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_Flush(audiorenderer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 查询当前输出音频流通道数
static napi_value OHAudioRendererGetChannelCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t channelCount;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetChannelCount(audiorenderer, &channelCount);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, channelCount, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流状态
static napi_value OHAudioRendererGetCurrentState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_State state;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetCurrentState(audiorenderer, &state);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, state, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流编码类型
static napi_value OHAudioRendererGetEncodingType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_EncodingType encodingType;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetEncodingType(audiorenderer, &encodingType);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, encodingType, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 在回调中查询帧大小，它是一个固定的长度，每次回调都要填充流
static napi_value OHAudioRendererGetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int frameSizeValue;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioRenderer_GetFrameSizeInCallback(audiorenderer, &frameSizeValue);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, oH_AudioStream_Result, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询自创建流以来已写入的帧数
static napi_value OHAudioRendererGetFramesWritten(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t frames;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetFramesWritten(audiorenderer, &frames);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, oH_AudioStream_Result, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流时延模式
static napi_value OHAudioRendererGetLatencyMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_LatencyMode latencyMode;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetLatencyMode(audiorenderer, &latencyMode);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, latencyMode, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流工作场景类型
static napi_value OHAudioRendererGetRendererInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Usage usage;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetRendererInfo(audiorenderer, &usage);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, usage, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 丢弃获取的音频流数据
static napi_value OHAudioCapturerFlush(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_Flush(audioCapturer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 查询当前音频流工作场景类型
static napi_value OHAudioCapturerGetCapturerInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_SourceType sourceType;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetCapturerInfo(audioCapturer, &sourceType);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, sourceType, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前音频流通道数
static napi_value OHAudioCapturerGetChannelCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int channelCount;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetChannelCount(audioCapturer, &channelCount);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, channelCount, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前音频流状态
static napi_value OHAudioCapturerGetCurrentState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_State state;
    OH_AudioStream_Result oH_AudioStream_Result1 = 
        OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (oH_AudioStream_Result1 == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, state, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    napi_create_int32(env, state, &result);
    return result;
}

// 查询当前音频流编码类型
static napi_value OHAudioCapturerGetEncodingType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetEncodingType(audioCapturer, &encodingType);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, encodingType, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 在回调中查询帧大小，它是每次回调返回的缓冲区的固定长度。
static napi_value OHAudioCapturerGetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int frameSizeValue;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioCapturer_GetFrameSizeInCallback(audioCapturer, &frameSizeValue);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, frameSizeValue, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询自创建流以来已读取的帧数。
static napi_value OHAudioCapturerGetFramesRead(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int64_t framesRead;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetFramesRead(audioCapturer, &framesRead);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, framesRead, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前音频流时延模式。
static napi_value OHAudioCapturerGetLatencyMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_LatencyMode latencyMode;
    OH_AudioStream_Result oH_AudioStream_Result1 = OH_AudioCapturer_GetLatencyMode(audioCapturer, &latencyMode);
    if (oH_AudioStream_Result1 == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, latencyMode, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 在回调中查询帧大小
static napi_value OHAudioCapturerGetSampleFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_SampleFormat sampleFormat;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetSampleFormat(audioCapturer, &sampleFormat);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, sampleFormat, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输入音频流采样率
static napi_value OHAudioCapturerGetSamplingRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int rateValue;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetSamplingRate(audioCapturer, &rateValue);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, rateValue, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输入音频流ID。
static napi_value OHAudioCapturerGetStreamId(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t streamId;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioCapturer_GetStreamId(audioCapturer, &streamId);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, streamId, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 获取输入音频流时间戳
static napi_value OHAudioCapturerGetFramePosition(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    clockid_t clockId = CLOCK_MONOTONIC;
    int64_t framePosition;
    int64_t timestamp;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioCapturer_GetTimestamp(audioCapturer, clockId, &framePosition, &timestamp);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, framePosition, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 获取输入音频流位置信息。
static napi_value OHAudioCapturerGetTimestamp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    clockid_t clockId = CLOCK_MONOTONIC;
    int64_t framePosition;
    int64_t timestamp;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioCapturer_GetTimestamp(audioCapturer, clockId, &framePosition, &timestamp);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, timestamp, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 销毁一个音频流构造器
static napi_value OHAudioStreamBuilderDestroy(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    double value;
    napi_get_value_double(env, args[0], &value);
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    if (value == 1) {
        type = AUDIOSTREAM_TYPE_CAPTURER;
    }

    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(type);
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_Destroy(builder);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 创建输入音频流实例
static napi_value OHAudioStreamBuilderGenerateCapturer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_CAPTURER);
    if (builder == nullptr) {
        napi_create_int32(env, CODE_SUCCESS, &result);
        return result;
    }
    int32_t rateValue = 48000;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetSamplingRate(builder, rateValue); // 设置采样率
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, oH_AudioStream_Result, &result);
        return result;
    }
    int channelCount = 2;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount); // 设置通道数
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, oH_AudioStream_Result, &result);
        return result;
    }
    OH_AudioCapturer_Callbacks callbacks = OH_AudioCapturer_Callbacks();
    callbacks.OH_AudioCapturer_OnReadData = onReadData;
    callbacks.OH_AudioCapturer_OnStreamEvent = onStreamEvent;
    callbacks.OH_AudioCapturer_OnInterruptEvent = onInterruptEvent;
    callbacks.OH_AudioCapturer_OnError = onError;
    void *data;
    oH_AudioStream_Result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, data); // 设置回调
    if (oH_AudioStream_Result != AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, oH_AudioStream_Result, &result);
        return result;
    }
    OH_AudioCapturer *oH_AudioCapturer;
    oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateCapturer(builder, &oH_AudioCapturer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    capturerbuilder = builder;
    audioCapturer = audioCapturer;
    return result;
}

// 创建输出音频流实例
static napi_value OHAudioStreamBuilderGenerateRenderer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER);
    OH_AudioRenderer *oH_AudioRenderer;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_GenerateRenderer(builder, &oH_AudioRenderer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置输入音频流的回调
static napi_value OHAudioStreamBuilderSetCapturerCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = onReadData;
    callbacks.OH_AudioCapturer_OnStreamEvent = onStreamEvent;
    callbacks.OH_AudioCapturer_OnInterruptEvent = onInterruptEvent;
    callbacks.OH_AudioCapturer_OnError = onError;
    void *data;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetCapturerCallback(capturerbuilder, callbacks, &data);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置输入音频流的工作场景
static napi_value OHAudioStreamBuilderSetCapturerInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    napi_typeof(env, args[PARAM_0], &valuetype);
    int value;
    napi_get_value_int32(env, args[0], &value);
    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_INVALID;
    switch (value) {
        case SOURCETYPE0:
            sourceType = AUDIOSTREAM_SOURCE_TYPE_MIC;
            break;
        case SOURCETYPE1:
            sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION;
            break;
        case SOURCETYPE2:
            sourceType = AUDIOSTREAM_SOURCE_TYPE_PLAYBACK_CAPTURE;
            break;
        case SOURCETYPE7:
            sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION;
            break;
        default:
            break;
    }
    if (capturerbuilder == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetCapturerInfo(capturerbuilder, sourceType);
    napi_create_int32(env, oH_AudioStream_Result, &result); 
    return result;
}

// 设置音频流的通道数属性。
static napi_value OHAudioStreamBuilderSetChannelCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    int streamType; 
    int channelCount;
    napi_get_value_int32(env, args[PARAM_0], &streamType);
    napi_get_value_int32(env, args[PARAM_1], &channelCount);

    OH_AudioStream_Type audioStreamType = streamType == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    if (streamType == 1) {
        OH_AudioStream_Result oH_AudioStream_Result = 
            OH_AudioStreamBuilder_SetChannelCount(capturerbuilder, channelCount);
        napi_create_int32(env, oH_AudioStream_Result, &result);
    } else {
        OH_AudioStream_Result oH_AudioStream_Result = 
            OH_AudioStreamBuilder_SetChannelCount(rendererbuilder, channelCount);
        napi_create_int32(env, oH_AudioStream_Result, &result);
    }
    return result;
}

// 设置音频流的编码类型属性。
static napi_value OHAudioStreamBuilderSetEncodingType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int streamValue;
    int encodingValue;
    napi_get_value_int32(env, args[PARAM_0], &streamValue);
    napi_get_value_int32(env, args[PARAM_1], &encodingValue);

    OH_AudioStream_Type audioStreamType = streamValue == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(audioStreamType);
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置每次回调的帧长，帧长至少为音频硬件一次处理的数据大小，并且小于内部缓冲容量的一半。
static napi_value OHAudioStreamBuilderSetFrameSizeInCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int streamValue;
    int frameSizeValue;
    napi_get_value_int32(env, args[PARAM_0], &streamValue);
    napi_get_value_int32(env, args[PARAM_1], &frameSizeValue);
    OH_AudioStream_Type audioStreamType = streamValue == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(audioStreamType);

    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, frameSizeValue);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置音频流的时延模式
static napi_value OHAudioStreamBuilderSetLatencyMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int streamValue;
    int latencyModeValue;
    napi_get_value_int32(env, args[PARAM_0], &streamValue);
    napi_get_value_int32(env, args[PARAM_1], &latencyModeValue);
    OH_AudioStream_Type audioStreamType = streamValue == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(audioStreamType);
    OH_AudioStream_LatencyMode latencyMode =
        latencyModeValue == 1 ? AUDIOSTREAM_LATENCY_MODE_FAST : AUDIOSTREAM_LATENCY_MODE_NORMAL;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置输出音频流的回调。
static napi_value OHAudioStreamBuilderSetRendererCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = onRendererWriteData;
    callbacks.OH_AudioRenderer_OnStreamEvent = onRendererStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = onRendererInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = onRendererError;

    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER);
    void *data;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &data);
    napi_create_int32(env, oH_AudioStream_Result, &result);

    return result;
}

// 设置输出音频流的工作场景
static napi_value OHAudioStreamBuilderSetRendererInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype;
    napi_typeof(env, args[PARAM_0], &valuetype);
    int value;
    napi_get_value_int32(env, args[0], &value);
    OH_AudioStream_Usage oh_AudioStream_Usage = getRendererInfoWithValue(value);
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER);

    OH_AudioStream_Result oH_AudioStream_Result = 
        OH_AudioStreamBuilder_SetRendererInfo(builder, oh_AudioStream_Usage);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置音频流的采样格式属性。
static napi_value OHAudioStreamBuilderSetSampleFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int streamValue;
    int sampleFormatValue;
    napi_get_value_int32(env, args[PARAM_0], &streamValue);
    napi_get_value_int32(env, args[PARAM_1], &sampleFormatValue);
    OH_AudioStream_Type audioStreamType = streamValue == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(audioStreamType);
    OH_AudioStream_SampleFormat oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
    switch (sampleFormatValue) {
        case KNUMBER0:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_U8;
            break;
        case KNUMBER1:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S16LE;
            break;
        case KNUMBER2:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S24LE;
            break;
        case KNUMBER3:
            oH_AudioStream_SampleFormat = AUDIOSTREAM_SAMPLE_S32LE;
            break;
        default:
            break;
    }
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetSampleFormat(builder, oH_AudioStream_SampleFormat);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置音频流的采样率属性
static napi_value OHAudioStreamBuilderSetSamplingRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_2;
    napi_value args[PARAM_2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int streamValue;
    int rateValue;
    napi_get_value_int32(env, args[PARAM_0], &streamValue);
    napi_get_value_int32(env, args[PARAM_1], &rateValue);
    OH_AudioStream_Type audioStreamType = streamValue == 1 ? AUDIOSTREAM_TYPE_CAPTURER : AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(audioStreamType);

    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioStreamBuilder_SetSamplingRate(builder, rateValue);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 查询当前输出音频流采样格式
static napi_value OHAudioRendererGetSampleFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_SampleFormat sampleFormat;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetSampleFormat(audiorenderer, &sampleFormat);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, sampleFormat, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流采样率
static napi_value OHAudioRendererGetSamplingRate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t rate;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetSamplingRate(audiorenderer, &rate);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, rate, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 查询当前输出音频流ID
static napi_value OHAudioRendererGetStreamId(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t streamId;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetStreamId(audiorenderer, &streamId);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, streamId, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

// 获取输出音频流时间戳
static napi_value OHAudioRendererGetTimestamp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    clockid_t clockId = CLOCK_MONOTONIC;
    int64_t framePosition;
    int64_t timestamp;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioRenderer_GetTimestamp(audiorenderer, clockId, &framePosition, &timestamp);
    napi_create_int32(env, oH_AudioStream_Result, &result);

    return result;
}

// 暂停输出音频流
static napi_value OHAudioRendererPause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_Pause(audiorenderer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 释放输出音频流
static napi_value OHAudioRendererRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_Release(audiorenderer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 开始输出音频数据。
static napi_value OHAudioRendererStart(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_Start(audiorenderer);
    int frameSizeValue = 240;
    OH_AudioStreamBuilder_SetFrameSizeInCallback(rendererbuilder, frameSizeValue);
    g_playerTime = 0;
    while (!g_readEnd) {
        std::this_thread::sleep_for(std::chrono::milliseconds(KNUMBER1000));
        int64_t frames;
        OH_AudioRenderer_GetFramesWritten(audiorenderer, &frames);
        int64_t framePosition;
        int64_t timestamp;
        OH_AudioRenderer_GetTimestamp(audiorenderer, CLOCK_MONOTONIC, &framePosition, &timestamp);
        g_playerTime = g_playerTime + 1;
    }

    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 停止输出音频流
static napi_value OHAudioRendererStop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_Stop(audiorenderer);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 设置播放速度
static napi_value OHAudioRendererSetSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[PARAM_0], &value);
    float speed = static_cast<float>(value);
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_SetSpeed(audiorenderer, speed);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

// 获取播放倍速
static napi_value OHAudioRendererGetSpeed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    float speed;
    OH_AudioStream_Result oH_AudioStream_Result = OH_AudioRenderer_GetSpeed(audiorenderer, &speed);
    if (oH_AudioStream_Result == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, speed, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

void onOutputDeviceChange(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_DeviceChangeReason reason) 
{
}
// 设置输入流设备回调函数
static napi_value OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_AudioStreamBuilder *builder = GetAudioStreamBuilder(AUDIOSTREAM_TYPE_RENDERER);
    void *userData;
    OH_AudioRenderer_OutputDeviceChangeCallback callback = onOutputDeviceChange;
    OH_AudioStream_Result oH_AudioStream_Result =
        OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    napi_create_int32(env, oH_AudioStream_Result, &result);
    return result;
}

EXTERN_C_START

napi_property_descriptor desc1[] = {
    {"CreateAudioCapturerRecorder", nullptr, CreateAudioCapturerRecorder,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreatRendererAudioPlayer", nullptr, CreatRendererAudioPlayer,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderCreate", nullptr, OHAudioStreamBuilderCreate,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderDestroy", nullptr, OHAudioStreamBuilderDestroy,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderGenerateCapturer", nullptr, OHAudioStreamBuilderGenerateCapturer,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderGenerateRenderer", nullptr, OHAudioStreamBuilderGenerateRenderer,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetCapturerCallback", nullptr, OHAudioStreamBuilderSetCapturerCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetChannelCount", nullptr, OHAudioStreamBuilderSetChannelCount,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetEncodingType", nullptr, OHAudioStreamBuilderSetEncodingType,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetFrameSizeInCallback", nullptr, OHAudioStreamBuilderSetFrameSizeInCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetLatencyMode", nullptr, OHAudioStreamBuilderSetLatencyMode,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetRendererCallback", nullptr, OHAudioStreamBuilderSetRendererCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetRendererInfo", nullptr, OHAudioStreamBuilderSetRendererInfo,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetSampleFormat", nullptr, OHAudioStreamBuilderSetSampleFormat,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetSamplingRate", nullptr, OHAudioStreamBuilderSetSamplingRate,
     nullptr, nullptr, nullptr, napi_default, nullptr},

    {"OHAudioCapturerFlush", nullptr, OHAudioCapturerFlush,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetCapturerInfo", nullptr, OHAudioCapturerGetCapturerInfo,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetChannelCount", nullptr, OHAudioCapturerGetChannelCount,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetCurrentState", nullptr, OHAudioCapturerGetCurrentState,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetEncodingType", nullptr, OHAudioCapturerGetEncodingType,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetFrameSizeInCallback", nullptr, OHAudioCapturerGetFrameSizeInCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr}};
napi_property_descriptor desc2[] = {
    {"OHAudioCapturerGetFramesRead", nullptr, OHAudioCapturerGetFramesRead,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetLatencyMode", nullptr, OHAudioCapturerGetLatencyMode,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetSampleFormat", nullptr, OHAudioCapturerGetSampleFormat,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetSamplingRate", nullptr, OHAudioCapturerGetSamplingRate,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetStreamId", nullptr, OHAudioCapturerGetStreamId,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetTimestamp", nullptr, OHAudioCapturerGetTimestamp,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerGetFramePosition", nullptr, OHAudioCapturerGetFramePosition,
     nullptr, nullptr, nullptr, napi_default, nullptr},

    {"OHAudioRendererGetSampleFormat", nullptr, OHAudioRendererGetSampleFormat,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetSamplingRate", nullptr, OHAudioRendererGetSamplingRate,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerPause", nullptr, OHAudioCapturerPause,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerRelease", nullptr, OHAudioCapturerRelease,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerStart", nullptr, OHAudioCapturerStart,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioCapturerStop", nullptr, OHAudioCapturerStop,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererFlush", nullptr, OHAudioRendererFlush,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetChannelCount", nullptr, OHAudioRendererGetChannelCount,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetCurrentState", nullptr, OHAudioRendererGetCurrentState,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetEncodingType", nullptr, OHAudioRendererGetEncodingType,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetFrameSizeInCallback", nullptr, OHAudioRendererGetFrameSizeInCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetStreamId", nullptr, OHAudioRendererGetStreamId,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererPause", nullptr, OHAudioRendererPause,
     nullptr, nullptr, nullptr, napi_default, nullptr}};
napi_property_descriptor desc3[] = {
    {"OHAudioRendererRelease", nullptr, OHAudioRendererRelease,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererStart", nullptr, OHAudioRendererStart,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererStop", nullptr, OHAudioRendererStop,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetTimestamp", nullptr, OHAudioRendererGetTimestamp,
     nullptr, nullptr, nullptr, napi_default, nullptr},

    {"OHAudioRendererGetFramesWritten", nullptr, OHAudioRendererGetFramesWritten,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetLatencyMode", nullptr, OHAudioRendererGetLatencyMode,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetRendererInfo", nullptr, OHAudioRendererGetRendererInfo,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererSetSpeed", nullptr, OHAudioRendererSetSpeed,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioRendererGetSpeed", nullptr, OHAudioRendererGetSpeed,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback", nullptr,
     OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CloseAudioCapture", nullptr, CloseAudioCapture,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CloseAudioRender", nullptr, CloseAudioRender,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHAudioStreamBuilderSetCapturerInfo", nullptr, OHAudioStreamBuilderSetCapturerInfo,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OpenFileName", nullptr, OpenFileName,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreatAudioPlayerWithWavFile", nullptr, CreatAudioPlayerWithWavFile,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreatAudioPlayerWithFileAndParam", nullptr, CreatAudioPlayerWithFileAndParam,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CloseCapturerPCMFile", nullptr, CloseCapturerPCMFile,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"CreatCapturerRecorderWithParam", nullptr, CreatCapturerRecorderWithParam,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestRendererAudioStreamUsage", nullptr, TestRendererAudioStreamUsage,
     nullptr, nullptr, nullptr, napi_default, nullptr}};

static napi_value Init(napi_env env, napi_value exports) 
{
    size_t mergedLength = sizeof(desc1) / sizeof(desc1[0]) + 
        sizeof(desc2) / sizeof(desc2[0]) + sizeof(desc3) / sizeof(desc3[0]);
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    for (size_t i = 0; i < sizeof(desc2) / sizeof(desc2[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + i] = desc2[i];
    }
    for (size_t i = 0; i < sizeof(desc3) / sizeof(desc3[0]); ++i) {
        mergedArray[sizeof(desc1) / sizeof(desc1[0]) + sizeof(desc2) / sizeof(desc2[0]) + i] = desc3[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ohaudiondk",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
