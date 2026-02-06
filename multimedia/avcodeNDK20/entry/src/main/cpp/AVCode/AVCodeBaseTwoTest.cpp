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
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_cencinfo.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <hilog/log.h>

napi_value OH_AVErrCodeTest1(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_10;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_SERVICE_DIED ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest2(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_20;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_UNSUPPORTED_FORMAT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest3(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_30;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_EXTEND_START ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest4(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_40;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_DRM_BASE ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest5(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_45;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_DRM_DECRYPT_FAILED ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest6(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_50;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_VIDEO_BASE ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest7(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_60;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_CANNOT_FIND_HOST ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest8(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_70;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_CONNECTION_TIMEOUT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest9(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_10;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_NETWORK_ABNORMAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest10(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_20;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_NETWORK_UNAVAILABLE ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest11(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_30;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_NO_PERMISSION ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest12(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_40;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_NETWORK_ACCESS_DENIED ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest13(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_45;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_RESOURCE_NOT_FOUND ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest14(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_50;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_SSL_CLIENT_CERT_NEEDED ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest15(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_60;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_SSL_CONNECT_FAIL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest16(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_70;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_SSL_SERVER_CERT_UNTRUSTED ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest17(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_60;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_IO_UNSUPPORTED_REQUEST ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVErrCodeTest18(napi_env env, napi_callback_info info)
{
    int32_t leve = H263_LEVEL_70;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_TRY_AGAIN_LATER ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVFormat_SetIntValueTest(napi_env env, napi_callback_info info)
{
    bool setResult = OH_AVFormat_SetIntValue(nullptr, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_SURFACE_FORMAT);
    napi_value retValue;
    napi_create_int32(env, setResult == false ? 1 : 0, &retValue);
    return retValue;
}