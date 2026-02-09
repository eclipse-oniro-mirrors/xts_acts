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
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_cencinfo.h>
#include <hilog/log.h>

const char* MP4_FILE = "/data/storage/el2/base/haps/entry_test/files/01_video_audio.mp4";
const int BLOCK_24 = 24;
const int BLOCK_16 = 16;
const int BLOCK_8 = 8;
const int BLOCK_4 = 4;
const int COUNT_2 = 2;
const int MUNUSONE = -1;
const int SMAPLE_RATE = 4410;
const int SEEK_TIME = 100;
const int BUFFER_SIZE = 15;
const int BUFFER_PTS = 12;
const int BUFFER_AV = 11;

static void WriteBox(std::ofstream& out, uint32_t size, const std::string& type, const char* data = nullptr)
{
    out.put((size >> BLOCK_24) & 0xFF);
    out.put((size >> BLOCK_16) & 0xFF);
    out.put((size >> BLOCK_8) & 0xFF);
    out.put(size & 0xFF);
    out.write(type.c_str(), BLOCK_4);
    if (data && size > BLOCK_8) {
        out.write(data, size - BLOCK_8);
    }
}

napi_value WriteMp4File(napi_env env, napi_callback_info info)
{
    std::ofstream out(MP4_FILE, std::ios::binary);
    if (!out.is_open()) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "AVCode", "WriteMp4File error.");
        return nullptr;
    }
    const char ftypData[] = "isom\0\0\0\0";
    WriteBox(out, BLOCK_16, "ftyp", ftypData);
    const char mvhdData[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01};
    uint32_t mvhdSize = BLOCK_8 + sizeof(mvhdData);
    WriteBox(out, mvhdSize, "mvhd", mvhdData);

    const char tkhdData[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00};
    uint32_t tkhdSize = BLOCK_8 + sizeof(tkhdData);
    WriteBox(out, tkhdSize, "tkhd", tkhdData);
    const char mdiaData[] = "minimal";
    uint32_t mdiaSize = BLOCK_8 + sizeof(mdiaData) - 1;
    WriteBox(out, mdiaSize, "mdia", mdiaData);
    uint32_t trakSize = BLOCK_8 + tkhdSize + mdiaSize;
    WriteBox(out, trakSize, "trak");
    uint32_t moovSize = BLOCK_8 + mvhdSize + trakSize;
    WriteBox(out, moovSize, "moov");
    WriteBox(out, BLOCK_8, "mdat");
    out.close();
    return nullptr;
}

napi_value OH_AVCLevelTest1(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_1;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest2(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_1b;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest3(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_11;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest4(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_12;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest5(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_13;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest6(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_2;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest7(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_21;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest8(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_22;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest9(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_3;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest10(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_31;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest11(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_32;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest12(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_4;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest13(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_41;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest14(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_42;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest15(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_5;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest16(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_51;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest17(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_52;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest18(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_6;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest19(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_61;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest20(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_62;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest1(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest2(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest3(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_21;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest4(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest5(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_31;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest6(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest7(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_41;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest8(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest9(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_51;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest10(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_52;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest11(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest12(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_61;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest13(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_62;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest1(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest2(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest3(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_21;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest4(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest5(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_31;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest6(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest7(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_41;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest8(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest9(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_51;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest10(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_52;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest11(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest12(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_61;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest13(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_62;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest14(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_63;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest15(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_155;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level1(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_0;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level2(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_0B;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level3(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level4(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 1, &retValue);
    } else {
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}

napi_value OH_MPEG4Level5(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level6(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_3B;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 1, &retValue);
    } else {
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}

napi_value OH_MPEG4Level7(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level8(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_4A;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level9(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level10(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetCallbackTest(napi_env env, napi_callback_info info)
{
    struct OH_AVCodecAsyncCallback callback;
    OH_AVErrCode setResult = OH_VideoDecoder_SetCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RegisterCallbackTest(napi_env env, napi_callback_info info)
{
    struct OH_AVCodecCallback callback;
    OH_AVErrCode setResult = OH_VideoDecoder_RegisterCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetSurfaceTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetSurface(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_StartTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Start(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_StopTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Stop(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FlushTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Flush(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_ResetTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Reset(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetParameterTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetParameter(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_PushInputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVCodecBufferAttr attr;
    OH_AVErrCode setResult = OH_VideoDecoder_PushInputData(nullptr, index, attr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputData(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FreeOutputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_FreeOutputData(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_PushInputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_PushInputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputBufferAtTimeTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    int64_t renderTimestampNs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputBufferAtTime(nullptr, index, renderTimestampNs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FreeOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_FreeOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_QueryInputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_QueryInputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_QueryOutputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_QueryOutputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetDecryptionConfigTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetDecryptionConfig(nullptr, nullptr, true);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_SetCallbackTest(napi_env env, napi_callback_info info)
{
    OH_AVCodecAsyncCallback callback;
    OH_AVErrCode setResult = OH_VideoEncoder_SetCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_RegisterCallbackTest(napi_env env, napi_callback_info info)
{
    OH_AVCodecCallback callback;
    OH_AVErrCode setResult = OH_VideoEncoder_RegisterCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_RegisterParameterCallbackTest(napi_env env, napi_callback_info info)
{
    OH_VideoEncoder_OnNeedInputParameter onInputParameter;
    OH_AVErrCode setResult = OH_VideoEncoder_RegisterParameterCallback(nullptr, onInputParameter, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PrepareTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_Prepare(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_SetParameterTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_SetParameter(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVCodecBufferAttr attr;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputData(nullptr, index, attr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputParameterTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputParameter(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_FreeOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_FreeOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_QueryInputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_QueryInputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_QueryOutputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_QueryOutputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_IsValidTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_IsValid(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVDemuxer_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SelectTrackByIDTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_SelectTrackByID(nullptr, trackIndex);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_UnselectTrackByIDTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_UnselectTrackByID(nullptr, trackIndex);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_ReadSampleTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_ReadSample(nullptr, trackIndex, nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_ReadSampleBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_ReadSampleBuffer(nullptr, trackIndex, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SeekToTimeTest(napi_env env, napi_callback_info info)
{
    int64_t millisecond = 1;
    OH_AVSeekMode mode = SEEK_MODE_NEXT_SYNC;
    OH_AVErrCode setResult = OH_AVDemuxer_SeekToTime(nullptr, millisecond, mode);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SetMediaKeySystemInfoCallbackTest(napi_env env, napi_callback_info info)
{
    DRM_MediaKeySystemInfoCallback callback;
    OH_AVErrCode setResult = OH_AVDemuxer_SetMediaKeySystemInfoCallback(nullptr, callback);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallbackTest(napi_env env, napi_callback_info info)
{
    Demuxer_MediaKeySystemInfoCallback callback;
    OH_AVErrCode setResult = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(nullptr, callback);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_GetMediaKeySystemInfoTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVDemuxer_GetMediaKeySystemInfo(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_WriteSampleBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVMuxer_WriteSampleBuffer(nullptr, trackIndex, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVSource_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVSource_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetAlgorithmTest(napi_env env, napi_callback_info info)
{
    DrmCencAlgorithm algo = DRM_ALG_CENC_UNENCRYPTED;
    OH_AVErrCode setResult = OH_AVCencInfo_SetAlgorithm(nullptr, algo);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetKeyIdAndIvTest(napi_env env, napi_callback_info info)
{
    uint32_t keyIdLen = 1;
    uint32_t ivLen = 1;
    OH_AVErrCode setResult = OH_AVCencInfo_SetKeyIdAndIv(nullptr, nullptr, keyIdLen, nullptr, ivLen);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetSubsampleInfoTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_SetSubsampleInfo(nullptr, 1, 1, 1, 1, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetModeTest(napi_env env, napi_callback_info info)
{
    DrmCencInfoMode mode = DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET;
    OH_AVErrCode setResult = OH_AVCencInfo_SetMode(nullptr, mode);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetAVBufferTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_SetAVBuffer(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_ReadSampleBufferTestNotPermit(napi_env env, napi_callback_info info)
{
    int fd1 = open(MP4_FILE, O_RDONLY);
    int64_t sizeTest = 0;
    struct stat fileStatus;
    if (stat(MP4_FILE, &fileStatus) == 0) {
        sizeTest = static_cast<int64_t>(fileStatus.st_size);
    }
    uint32_t trackIndex = 0;
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd1, 0, sizeTest);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "AVCode", "demuxer is nullptr");
    }
    OH_AVBuffer *buffer = OH_AVBuffer_Create(sizeTest);
    OH_AVErrCode setResult = OH_AVDemuxer_ReadSampleBuffer(demuxer, trackIndex, buffer);

    close(fd1);
    OH_AVDemuxer_Destroy(demuxer);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SeekToTimeTestNotPermit(napi_env env, napi_callback_info info)
{
    int fd1 = open(MP4_FILE, O_RDONLY);
    int64_t sizeTest = 0;
    struct stat fileStatus;
    if (stat(MP4_FILE, &fileStatus) == 0) {
        sizeTest = static_cast<int64_t>(fileStatus.st_size);
    }
    OH_AVSource *source = OH_AVSource_CreateWithFD(fd1, 0, sizeTest);
    OH_AVDemuxer *demuxer = OH_AVDemuxer_CreateWithSource(source);
    if (demuxer == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xFF00, "AVCode", "demuxer is nullptr");
    }

    OH_AVFormat *format = OH_AVSource_GetSourceFormat(source);
    int32_t outCount = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_TRACK_COUNT, &outCount);
    OH_AVErrCode setResult = OH_AVDemuxer_SeekToTime(demuxer, SEEK_TIME, SEEK_MODE_NEXT_SYNC);

    close(fd1);
    OH_AVDemuxer_Destroy(demuxer);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_SetRotationNotPermit(napi_env env, napi_callback_info info)
{
    int audioTrackId = -1;
    napi_value retValue;
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_SAMPLE_RATE, SMAPLE_RATE);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, COUNT_2);
    OH_AVFormat_SetIntValue(trackFormat, OH_MD_KEY_ENABLE_MOOV_FRONT, 1);
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    OH_AVErrCode result = OH_AVMuxer_Start(muxer);
    result = OH_AVMuxer_SetRotation(muxer, 0);
    OH_AVMuxer_Stop(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_SetFormatNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "This is abnormal case");
    OH_AVErrCode result = OH_AVMuxer_SetFormat(muxer, fileFormat);
    int audioTrackId = -1;
    OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    result = OH_AVMuxer_Start(muxer);
    OH_AVErrCode retFormat = OH_AVMuxer_SetFormat(muxer, fileFormat);
    if (retFormat == AV_ERR_OPERATE_NOT_PERMIT) {
        result = retFormat;
    }
    OH_AVMuxer_Stop(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);

    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_AddTrackNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "This is abnormal case");
    OH_AVMuxer_SetFormat(muxer, fileFormat);
    OH_AVErrCode result = OH_AVMuxer_Start(muxer);
    int audioTrackId = -1;
    OH_AVErrCode retTrack = OH_AVMuxer_AddTrack(muxer, &audioTrackId, trackFormat);
    if (retTrack == AV_ERR_OPERATE_NOT_PERMIT) {
        result = retTrack;
    }

    retTrack = OH_AVMuxer_AddTrack(muxer, &audioTrackId, nullptr);
    if (retTrack == AV_ERR_UNSUPPORT) {
        result = retTrack;
    }

    OH_AVMuxer_Stop(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_StartNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVErrCode result = OH_AVMuxer_Start(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_WriteSampleNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "This is abnormal case");
    OH_AVMuxer_SetFormat(muxer, fileFormat);
    OH_AVErrCode result = OH_AVMuxer_Start(muxer);
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = BUFFER_PTS;
    attrInfo.size = BUFFER_SIZE;
    attrInfo.offset = 0;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVMemory *sample = OH_AVMemory_Create(BUFFER_AV);
    int trackId = -1;
    OH_AVErrCode retWrite = OH_AVMuxer_WriteSample(muxer, trackId, sample, attrInfo);
    if (retWrite == AV_ERR_OPERATE_NOT_PERMIT) {
        result = retWrite;
    }
    OH_AVMuxer_Stop(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);
    OH_AVMemory_Destroy(sample);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_WriteSampleBufferNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVFormat *trackFormat = OH_AVFormat_Create();
    OH_AVFormat *fileFormat = OH_AVFormat_Create();
    OH_AVFormat_SetStringValue(fileFormat, OH_MD_KEY_CREATION_TIME, "This is abnormal case");
    OH_AVMuxer_SetFormat(muxer, fileFormat);
    OH_AVErrCode result = OH_AVMuxer_Start(muxer);
    OH_AVCodecBufferAttr attrInfo;
    attrInfo.pts = BUFFER_PTS;
    attrInfo.size = BUFFER_SIZE;
    attrInfo.offset = 0;
    attrInfo.flags |= AVCODEC_BUFFER_FLAGS_SYNC_FRAME;
    OH_AVBuffer *sample = OH_AVBuffer_Create(BUFFER_AV);
    int trackId = -1;
    OH_AVErrCode retWriteBuff = OH_AVMuxer_WriteSampleBuffer(muxer, trackId, sample);
    if (retWriteBuff == AV_ERR_OPERATE_NOT_PERMIT) {
        result = retWriteBuff;
    }
    OH_AVMuxer_Stop(muxer);

    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    OH_AVFormat_Destroy(trackFormat);
    OH_AVFormat_Destroy(fileFormat);
    OH_AVBuffer_Destroy(sample);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_StopNotPermit(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(MP4_FILE, O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    OH_AVMuxer *muxer = OH_AVMuxer_Create(fileDescribe, AV_OUTPUT_FORMAT_MPEG_4);
    napi_value retValue;
    if (muxer == nullptr) {
        napi_create_int32(env, 0, &retValue);
        return retValue;
    }
    OH_AVErrCode result = OH_AVMuxer_Stop(muxer);
    close(fileDescribe);
    OH_AVMuxer_Destroy(muxer);
    napi_create_int32(env, result == AV_ERR_OPERATE_NOT_PERMIT ? 1 : 0, &retValue);
    return retValue;
}
