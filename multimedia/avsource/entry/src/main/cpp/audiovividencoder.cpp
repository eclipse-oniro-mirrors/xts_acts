/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <condition_variable>
#include <js_native_api_types.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_audio_vivid.h>
#include <multimedia/native_audio_channel_layout.h>
#include <pthread.h>
#include <thread>
#include <queue>
#include <fstream>
#include <iostream>

#define FAIL (-1)
#define SUCCESS (0)
#define NO_SOUNDBED_LAYOUT (-1)
#define SAMPLERATE_32000 (32000)
#define SAMPLERATE_44100 (44100)
#define SAMPLERATE_48000 (48000)
#define SAMPLERATE_INVALID (0)
#define BITRATE_ZERO (0)
#define BITRATE_32KBPS (32000)
#define BITRATE_44KBPS (44000)
#define BITRATE_96KBPS (96000)
#define BITRATE_152KBPS (152000)
#define BITRATE_192KBPS (192000)
#define BITRATE_256KBPS (256000)
#define BITRATE_320KBPS (320000)
#define BITRATE_400KBPS (400000)
#define BITRATE_832KBPS (832000)
#define BITRATE_900KBPS (900000)
#define OBJECT_ZERO (0)
#define OBJECT_NUM_2 (2)
#define OBJECT_NUM_10 (10)
#define OBJECT_NUM_11 (11)
#define OBJECT_INVALID (-1)
#define CARTESIAN_ZERO (0.0f)
#define CARTESIAN_MIN (-1.0f)
#define CARTESIAN_MIN_INVALID (-1.1f)
#define CARTESIAN_MAX (1.0f)
#define CARTESIAN_MAX_INVALID (1.1f)
#define AZIMUTH_MIN (-180.0f)
#define AZIMUTH_MIN_INVALID (-180.1f)
#define AZIMUTH_MAX (180.0f)
#define AZIMUTH_MAX_INVALID (180.1f)
#define ELEVATION_MIN (-90.0f)
#define ELEVATION_MIN_INVALID (-90.1f)
#define ELEVATION_MAX (90.0f)
#define ELEVATION_MAX_INVALID (90.1f)
#define DISTANCE_MIN (0.0f)
#define DISTANCE_MIN_INVALID (-0.1f)
#define DISTANCE_MAX (1.0f)
#define DISTANCE_MAX_INVALID (1.1f)

using namespace std;

static OH_AVFormat *g_format = nullptr;
static int32_t g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO;
static int32_t g_sampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
static int32_t g_sampleRate = SAMPLERATE_32000;
static int64_t g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO;
static int64_t g_soundbedBitrate = BITRATE_44KBPS;
static int32_t g_objNum = OBJECT_ZERO;
static int64_t g_objBitrate = BITRATE_ZERO;
static OH_AudioObjectPosition g_pos = {
    .isCartesian = true,
    .pos.cartesian.x = CARTESIAN_ZERO,
    .pos.cartesian.y = CARTESIAN_ZERO,
    .pos.cartesian.z = CARTESIAN_ZERO,
};

static bool IsSupportAudioVivid()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
    if (capability != nullptr) {
        return true;
    }
    return false;
}

static void SetAudioVividFormat()
{
    if (g_format) {
        OH_AVFormat_SetIntValue(g_format, OH_MD_KEY_AUDIO_VIVID_SIGNAL_FORMAT, g_mode);
        OH_AVFormat_SetIntValue(g_format, OH_MD_KEY_AUD_SAMPLE_RATE, g_sampleRate);
        OH_AVFormat_SetIntValue(g_format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, g_sampleFormat);
        if (g_mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO || g_mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO) {
            OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_BITRATE, g_soundbedBitrate);
        } else if (g_mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_MC) {
            OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_BITRATE, g_soundbedBitrate);
            OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_CHANNEL_LAYOUT, g_soundbedChannelLayout);
        } else {
            if (g_soundbedChannelLayout != NO_SOUNDBED_LAYOUT) {
                OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_AUDIO_SOUNDBED_LAYOUT, g_soundbedChannelLayout);
            }
            OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_AUDIO_SOUNDBED_BITRATE, g_soundbedBitrate);
            OH_AVFormat_SetIntValue(g_format, OH_MD_KEY_AUDIO_OBJECT_NUMBER, g_objNum);
            OH_AVFormat_SetLongValue(g_format, OH_MD_KEY_AUDIO_OBJECT_BITRATE, g_objBitrate);
        }
    }
}

static void Init(int32_t mode, bool isCartesian)
{
    if (mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO) {
        g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO;
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
        g_sampleRate = SAMPLERATE_32000;
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO;
        g_soundbedBitrate = BITRATE_44KBPS;
        g_objNum = OBJECT_ZERO;
        g_objBitrate = BITRATE_ZERO;
    } else if (mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO) {
        g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO;
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
        g_sampleRate = SAMPLERATE_32000;
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
        g_soundbedBitrate = BITRATE_44KBPS;
        g_objNum = OBJECT_ZERO;
        g_objBitrate = BITRATE_ZERO;
    } else if (mode == OH_AUDIO_VIVID_SIGNAL_FORMAT_MC) {
        g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_MC;
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
        g_sampleRate = SAMPLERATE_32000;
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_5POINT1;
        g_soundbedBitrate = BITRATE_96KBPS;
        g_objNum = OBJECT_ZERO;
        g_objBitrate = BITRATE_ZERO;
    } else {
        g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX;
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S16LE;
        g_sampleRate = SAMPLERATE_32000;
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_5POINT1;
        g_soundbedBitrate = BITRATE_96KBPS;
        g_objNum = OBJECT_NUM_2;
        g_objBitrate = BITRATE_32KBPS;
    }

    if (isCartesian) {
        g_pos = {
            .isCartesian = true,
            .pos.cartesian.x = CARTESIAN_ZERO,
            .pos.cartesian.y = CARTESIAN_ZERO,
            .pos.cartesian.z = CARTESIAN_ZERO,
        };
    } else {
        g_pos = {
            .isCartesian = false,
            .pos.polar.azimuth = CARTESIAN_ZERO,
            .pos.polar.elevation = CARTESIAN_ZERO,
            .pos.polar.distance = CARTESIAN_ZERO,
        };
    }
}

static napi_value MonoModeSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 32K
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 44.1K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_44100;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 48K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_48000;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_INVALID;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MonoModeSampleFormatCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // s16le
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // s24le
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S24LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S32LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MonoModeBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 0kbps
        g_soundbedBitrate = BITRATE_ZERO;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 192kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_192KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 256kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_256KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value StereoModeSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        g_mode = OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO;
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 32K
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 44.1K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_44100;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 48K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_48000;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_INVALID;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value StereoModeSampleFormatCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // s16le
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // s24le
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S24LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S32LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value StereoModeBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 0kbps
        g_soundbedBitrate = BITRATE_ZERO;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 320kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_320KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 400kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_400KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MCModeSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MC, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 32K
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 44.1K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_44100;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 48K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_48000;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_INVALID;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MCModeSampleFormatCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MC, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // s16le
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // s24le
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S24LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S32LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MCModeChannelLayoutCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MC, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 5.1
        SetAudioVividFormat();
        if (OH_AudioCodec_Configure(codec, g_format) != AV_ERR_OK) {
            errNum++;
        }
        // 5.1.2
        OH_AudioCodec_Reset(codec);
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_5POINT1POINT2;
        SetAudioVividFormat();
        if (OH_AudioCodec_Configure(codec, g_format) != AV_ERR_OK) {
            errNum++;
        }
        // 5.1.4
        OH_AudioCodec_Reset(codec);
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_5POINT1POINT4;
        SetAudioVividFormat();
        if (OH_AudioCodec_Configure(codec, g_format) != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_UNKNOWN;
        SetAudioVividFormat();
        if (OH_AudioCodec_Configure(codec, g_format) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MCModeBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MC, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 96kbps
        g_soundbedBitrate = BITRATE_96KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 832kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_832KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 900kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_900KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 32K
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 48K
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_48000;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleRate = SAMPLERATE_INVALID;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeSampleFormatCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // s16le
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // s24le
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S24LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_sampleFormat = OH_BitsPerSample::SAMPLE_S32LE;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeChannelLayoutCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // not set
        g_soundbedChannelLayout = NO_SOUNDBED_LAYOUT;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 7.1
        OH_AudioCodec_Reset(codec);
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_7POINT1;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_UNKNOWN;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 152kbps
        g_soundbedBitrate = BITRATE_152KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 832kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_832KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // 900kbps
        OH_AudioCodec_Reset(codec);
        g_soundbedBitrate = BITRATE_900KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeObjNumCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        g_objNum = OBJECT_NUM_10;
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // 5.1 + 10obj
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // invalid
        OH_AudioCodec_Reset(codec);
        g_objNum = OBJECT_INVALID;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        // 5.1 + 11obj
        OH_AudioCodec_Reset(codec);
        g_objNum = OBJECT_NUM_11;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value MixModeObjBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    if (IsSupportAudioVivid()) {
        g_format = OH_AVFormat_Create();
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        // obj 32kbps
        g_objBitrate = BITRATE_32KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // obj 96kbps
        OH_AudioCodec_Reset(codec);
        g_objBitrate = BITRATE_96KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        // obj 192kbps
        OH_AudioCodec_Reset(codec);
        g_objBitrate = BITRATE_192KBPS;
        SetAudioVividFormat();
        ret = OH_AudioCodec_Configure(codec, g_format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
        OH_AVFormat_Destroy(g_format);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_VIVID, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateMonoMode(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MONO, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_OK && builder != nullptr) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateStereoMode(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_STEREO, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_OK && builder != nullptr) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateMCMode(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MC, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_OK && builder != nullptr) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateMixMode(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        // 7.1.2
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
        // 7.1.4
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_7POINT1POINT4;
        SetAudioVividFormat();
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
        // mono
        g_soundbedChannelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO;
        SetAudioVividFormat();
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_OK || builder != nullptr) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateObjNumCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    g_objNum = OBJECT_NUM_10;
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        // 5.1 + 10obj
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
        // 5.1 + 11obj
        g_objNum = OBJECT_NUM_11;
        SetAudioVividFormat();
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_OK || builder != nullptr) {
            errNum++;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
        if (errNum == 0) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosIndexCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        ret = OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        ret = OH_AudioVividMetaBuilder_UpdateObjectPos(builder, -1, g_pos);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosXCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.cartesian.x = CARTESIAN_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.x = CARTESIAN_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.x = CARTESIAN_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.cartesian.x = CARTESIAN_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosYCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.cartesian.y = CARTESIAN_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.y = CARTESIAN_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.y = CARTESIAN_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.cartesian.y = CARTESIAN_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosZCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.cartesian.z = CARTESIAN_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.z = CARTESIAN_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.cartesian.z = CARTESIAN_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.cartesian.z = CARTESIAN_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosAzimuthCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, false);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.polar.azimuth = AZIMUTH_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.azimuth = AZIMUTH_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.azimuth = AZIMUTH_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.polar.azimuth = AZIMUTH_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosElevationCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, false);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.polar.elevation = ELEVATION_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.elevation = ELEVATION_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.elevation = ELEVATION_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.polar.elevation = ELEVATION_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosDistanceCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, false);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        g_pos.pos.polar.distance = DISTANCE_MIN;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.distance = DISTANCE_MAX;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_OK) {
            errNum++;
        }
        g_pos.pos.polar.distance = DISTANCE_MIN_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        g_pos.pos.polar.distance = DISTANCE_MAX_INVALID;
        if (OH_AudioVividMetaBuilder_UpdateObjectPos(builder, 0, g_pos) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectGainIndexCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        ret = OH_AudioVividMetaBuilder_UpdateObjectGain(builder, 0, 2.0f);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        ret = OH_AudioVividMetaBuilder_UpdateObjectGain(builder, -1, 2.0f);
        if (ret != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectGainGainCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t errNum = 0;
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret != AV_ERR_OK || builder == nullptr) {
            errNum++;
        }
        // gain [0.0, 6.0]
        if (OH_AudioVividMetaBuilder_UpdateObjectGain(builder, 0, 0.0f) != AV_ERR_OK) {
            errNum++;
        }
        if (OH_AudioVividMetaBuilder_UpdateObjectGain(builder, 0, 6.0f) != AV_ERR_OK) {
            errNum++;
        }
        if (OH_AudioVividMetaBuilder_UpdateObjectGain(builder, 0, -0.1f) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (OH_AudioVividMetaBuilder_UpdateObjectGain(builder, 0, 6.1f) != AV_ERR_INVALID_VAL) {
            errNum++;
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Create(nullptr, g_format);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CreateFormatNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Create(&builder, nullptr);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectPosBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_UpdateObjectPos(nullptr, 0, g_pos);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value UpdateObjectGainBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_UpdateObjectGain(nullptr, 0, 2.0f);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value GetMetaLenBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t len;
        ret = OH_AudioVividMetaBuilder_GetMetaLen(nullptr, true, &len);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value GetMetaLenLenNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();

    if (IsSupportAudioVivid()) {
        OH_AudioVividMetaBuilder_Create(&builder, g_format);
        ret = OH_AudioVividMetaBuilder_GetMetaLen(builder, true, nullptr);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value GetMetaBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t len;
        OH_AudioVividMetaBuilder_Create(&builder, g_format);
        ret = OH_AudioVividMetaBuilder_GetMetaLen(builder, true, &len);
        if (ret == AV_ERR_OK && len > 0) {
            std::vector<uint8_t> metaData;
            metaData.resize(len);
            ret = OH_AudioVividMetaBuilder_GetMeta(nullptr, true, metaData.data(), len);
            if (ret == AV_ERR_INVALID_VAL) {
                backParam = SUCCESS;
            }
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value GetMetaBufferNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        int32_t len;
        OH_AudioVividMetaBuilder_Create(&builder, g_format);
        ret = OH_AudioVividMetaBuilder_GetMetaLen(builder, true, &len);
        if (ret == AV_ERR_OK && len > 0) {
            ret = OH_AudioVividMetaBuilder_GetMeta(builder, true, nullptr, len);
            if (ret == AV_ERR_INVALID_VAL) {
                backParam = SUCCESS;
            }
        }
        OH_AudioVividMetaBuilder_Destroy(builder);
        builder = nullptr;
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DestroyBuilderNullCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    g_format = OH_AVFormat_Create();
    OH_AudioVividMetaBuilder *builder = nullptr;
    OH_AVErrCode ret;
    Init(OH_AUDIO_VIVID_SIGNAL_FORMAT_MIX, true);
    SetAudioVividFormat();
    if (IsSupportAudioVivid()) {
        ret = OH_AudioVividMetaBuilder_Destroy(nullptr);
        if (ret == AV_ERR_INVALID_VAL) {
            backParam = SUCCESS;
        }
    } else {
        ret = OH_AudioVividMetaBuilder_Create(&builder, g_format);
        if (ret == AV_ERR_UNSUPPORT && builder == nullptr) {
            backParam = SUCCESS;
        }
    }
    OH_AVFormat_Destroy(g_format);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"MonoModeSampleRateCheck", nullptr, MonoModeSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MonoModeSampleFormatCheck", nullptr, MonoModeSampleFormatCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MonoModeBitrateCheck", nullptr, MonoModeBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"StereoModeSampleRateCheck", nullptr, StereoModeSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"StereoModeSampleFormatCheck", nullptr, StereoModeSampleFormatCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"StereoModeBitrateCheck", nullptr, StereoModeBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MCModeSampleRateCheck", nullptr, MCModeSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MCModeSampleFormatCheck", nullptr, MCModeSampleFormatCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MCModeChannelLayoutCheck", nullptr, MCModeChannelLayoutCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MCModeBitrateCheck", nullptr, MCModeBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeSampleRateCheck", nullptr, MixModeSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeSampleFormatCheck", nullptr, MixModeSampleFormatCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeChannelLayoutCheck", nullptr, MixModeChannelLayoutCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeBitrateCheck", nullptr, MixModeBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeObjNumCheck", nullptr, MixModeObjNumCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"MixModeObjBitrateCheck", nullptr, MixModeObjBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateMonoMode", nullptr, CreateMonoMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateStereoMode", nullptr, CreateStereoMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateMCMode", nullptr, CreateMCMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateMixMode", nullptr, CreateMixMode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateObjNumCheck", nullptr, CreateObjNumCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosIndexCheck", nullptr, UpdateObjectPosIndexCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosXCheck", nullptr, UpdateObjectPosXCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosYCheck", nullptr, UpdateObjectPosYCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosZCheck", nullptr, UpdateObjectPosZCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosAzimuthCheck", nullptr, UpdateObjectPosAzimuthCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosElevationCheck", nullptr, UpdateObjectPosElevationCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosDistanceCheck", nullptr, UpdateObjectPosDistanceCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectGainIndexCheck", nullptr, UpdateObjectGainIndexCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectGainGainCheck", nullptr, UpdateObjectGainGainCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateBuilderNullCheck", nullptr, CreateBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"CreateFormatNullCheck", nullptr, CreateFormatNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectPosBuilderNullCheck", nullptr, UpdateObjectPosBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"UpdateObjectGainBuilderNullCheck", nullptr, UpdateObjectGainBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetMetaLenBuilderNullCheck", nullptr, GetMetaLenBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetMetaLenLenNullCheck", nullptr, GetMetaLenLenNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetMetaBuilderNullCheck", nullptr, GetMetaBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GetMetaBufferNullCheck", nullptr, GetMetaBufferNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"DestroyBuilderNullCheck", nullptr, DestroyBuilderNullCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "libaudiovividencoder",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}