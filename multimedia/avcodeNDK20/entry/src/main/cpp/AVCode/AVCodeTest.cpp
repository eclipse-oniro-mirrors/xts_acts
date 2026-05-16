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
#include "common/Common.h"
#include <cstdint>
#include <multimedia/player_framework/avcodec_audio_channel_layout.h>
#include <ohaudio/native_audiostreambuilder.h>

napi_value EnumOHAudioChannelSet1(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet2(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet3(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet4(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_LOW_FREQUENCY);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet5(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_BACK_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet6(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_BACK_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet7(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_FRONT_LEFT_OF_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet8(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_FRONT_RIGHT_OF_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet9(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_BACK_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet10(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_SIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet11(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_SIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet12(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet13(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet14(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet15(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet16(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_BACK_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet17(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_BACK_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet18(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_BACK_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet19(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_STEREO_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet20(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_STEREO_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet21(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_WIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet22(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_WIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet23(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_SURROUND_DIRECT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet24(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_SURROUND_DIRECT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet25(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_LOW_FREQUENCY_2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet26(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_SIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet27(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_TOP_SIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet28(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_BOTTOM_FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet29(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(CH_SET_BOTTOM_FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelSet30(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BOTTOM_FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet1(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_ORD_1);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet2(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_ORD_2);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet3(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_ORD_3);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet4(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_COM_ACN);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet5(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_COM_FUMA);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet6(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_NOR_N3D);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet7(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_NOR_SN3D);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAmbAttributeSet8(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(AMB_MODE);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout1(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_MONO;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout2(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_STEREO_DOWNMIX;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout3(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_2POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout4(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_3POINT0;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout5(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_SURROUND;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout6(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_3POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout7(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_4POINT0;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout8(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_QUAD_SIDE;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout9(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_QUAD;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout10(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_2POINT0POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout11(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER1_ACN_N3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout12(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER1_ACN_SN3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout13(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER1_FUMA;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout14(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_4POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout15(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT0;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout16(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT0_BACK;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout17(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_2POINT1POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout18(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_3POINT0POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout19(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout20(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT1_BACK;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout21(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_6POINT0;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout22(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_3POINT1POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout23(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_6POINT0_FRONT;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout24(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_HEXAGONAL;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout25(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_6POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout26(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_6POINT1_BACK;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout27(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_6POINT1_FRONT;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout28(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT0;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout29(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT0_FRONT;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout30(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT1;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout31(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_OCTAGONAL;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout32(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT1POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout33(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT1_WIDE;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout34(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT1_WIDE_BACK;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout35(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER2_ACN_N3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout36(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER2_ACN_SN3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout37(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER2_FUMA;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout38(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_5POINT1POINT4;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout39(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT1POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout40(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_7POINT1POINT4;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout41(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_10POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout42(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_9POINT1POINT4;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout43(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_9POINT1POINT6;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout44(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_HEXADECAGONAL;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout45(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER3_ACN_N3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout46(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER3_ACN_SN3D;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout47(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_AMB_ORDER3_FUMA;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumOHAudioChannelLayout48(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = CH_LAYOUT_22POINT2;
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet1(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet2(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet3(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet4(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(LOW_FREQUENCY);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet5(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BACK_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet6(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BACK_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet7(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(FRONT_LEFT_OF_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet8(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(FRONT_RIGHT_OF_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet9(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(BACK_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet10(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(SIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet11(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(SIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet12(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet13(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_FRONT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet14(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_FRONT_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet15(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_FRONT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet16(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_BACK_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet17(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_BACK_CENTER);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet18(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(TOP_BACK_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet19(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(STEREO_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet20(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(STEREO_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet21(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(WIDE_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet22(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(WIDE_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet23(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(SURROUND_DIRECT_LEFT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumAudioChannelSet24(napi_env env, napi_callback_info info)
{
    OH_AudioChannelLayout channelLayout = static_cast<OH_AudioChannelLayout>(SURROUND_DIRECT_RIGHT);
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    int32_t setResult = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    OH_AudioStreamBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AUDIOSTREAM_SUCCESS) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
