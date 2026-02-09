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
#include "multimedia/player_framework/native_cencinfo.h"
#include "multimedia/player_framework/native_averrors.h"
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avbuffer.h"

#include <cstring>
#include <cstdio>
#include <stdlib.h>

#define KEY_DATA_LEN 16
#define BUFF_DATA_SIZE 2000
static napi_value Test_CencInfo_Destroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    size_t argc_twoLen = 0;
    char *argc_two = nullptr;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &argc_twoLen);
    argc_two = new char[argc_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], argc_two, argc_twoLen + 1, &argc_twoLen);   

    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVCencInfo *handle_ptr = nullptr;
    if (0 != strcmp(argc_one, " ")) {
        handle_ptr = handle;
    }
    OH_AVErrCode ret1 = OH_AVCencInfo_Destroy(handle_ptr);
    napi_create_int32(env, ret1, &result);
    return result;
}
static napi_value Test_AVCencInfo_SetAlgorithm(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    int32_t argc_two ;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_int32(env,args[1],&argc_two);  

    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVCencInfo *handle_ptr = nullptr;
    if (0 != strcmp(argc_one, " ")) {
        handle_ptr = handle;
    }
    OH_AVErrCode ret1 = OH_AVCencInfo_SetAlgorithm(handle_ptr,(DrmCencAlgorithm)argc_two);
    OH_AVErrCode ret2 = OH_AVCencInfo_Destroy(handle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK ) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_AVCencInfo_SetKeyIdAndIv(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 5;
    napi_value args[5] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    size_t argc_twoLen = 0;
    char *argc_two = nullptr;
    uint32_t keyIdLen = 0;
    size_t argc_fourLen = 0;
    char *argc_four = nullptr;     
    uint32_t argc_five = 0;  
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &argc_twoLen);
    argc_two = new char[argc_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], argc_two, argc_twoLen + 1, &argc_twoLen);

    napi_get_value_uint32(env,args[2],&keyIdLen);  
    napi_get_value_string_utf8(env, args[3], nullptr, 0, &argc_fourLen);
    argc_four = new char[argc_fourLen + 1];
    napi_get_value_string_utf8(env, args[3], argc_four, argc_fourLen + 1, &argc_fourLen);
    napi_get_value_uint32(env,args[4],&argc_five); 
    
    uint8_t keyIdData[KEY_DATA_LEN] = {0x01, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42};
    uint8_t ivData[KEY_DATA_LEN] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x10};
    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVCencInfo *handle_ptr = nullptr;
    if (0 != strcmp(argc_one, " ")) {
        handle_ptr = handle;
    }
    uint8_t *keyId_ptr = nullptr;
    if (0 != strcmp(argc_two, " ")) {
        keyId_ptr = keyIdData;
    }
    uint8_t *iv_ptr = nullptr;
    if (0 != strcmp(argc_four, " ")) {
        iv_ptr = ivData;
    }
    uint32_t ivLen = argc_five;
  
    OH_AVErrCode ret1 = OH_AVCencInfo_SetKeyIdAndIv(handle_ptr, keyId_ptr, keyIdLen, iv_ptr, ivLen);
    OH_AVErrCode ret2 = OH_AVCencInfo_Destroy(handle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK ) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_AVCencInfo_SetSubsampleInfo(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 6;
    napi_value args[6] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    uint32_t argc_two = 0;
    uint32_t argc_three = 0;
    uint32_t argc_four = 0;
    uint32_t argc_five = 0;
    size_t argc_sixLen = 0;
    char *argc_six = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_uint32(env,args[1],&argc_two);  
    napi_get_value_uint32(env,args[2],&argc_three); 
    napi_get_value_uint32(env,args[3],&argc_four); 
    napi_get_value_uint32(env,args[4],&argc_five); 
    napi_get_value_string_utf8(env, args[5], nullptr, 0, &argc_sixLen);
    argc_six = new char[argc_sixLen + 1];
    napi_get_value_string_utf8(env, args[5], argc_six, argc_sixLen + 1, &argc_sixLen);   
    DrmSubsample subsamples[10] = {{0x10,0x16},{0x20,0x22},{0x30,0x35},{0x40,0x47},{0x50,0x50},{0x60,0x6f},{0x70,0x71},{0x80,0x82},{0x90,0x22},{0xa0,0x22}};
    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVCencInfo *handle_ptr = nullptr;
    if (0 != strcmp(argc_one, " ")) {
        handle_ptr = handle;
    }
    uint32_t encryptedBlockCount = argc_two;
    uint32_t skippedBlockCount = argc_three;
    uint32_t firstEncryptedOffset = argc_four;
    uint32_t subsampleCount = argc_five;
    DrmSubsample *subsamples_ptr = nullptr;
    if (0 != strcmp(argc_six, " ")) {
        subsamples_ptr = subsamples;
    }    
    OH_AVErrCode ret1 = OH_AVCencInfo_SetSubsampleInfo(handle_ptr, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset, subsampleCount, subsamples_ptr);
    OH_AVErrCode ret2 = OH_AVCencInfo_Destroy(handle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK ) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_AVCencInfo_SetMode(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    uint32_t argc_two = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_uint32(env,args[1],&argc_two);  

    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVCencInfo *handle_ptr = nullptr;
    if (0 != strcmp(argc_one, " ")) {
        handle_ptr = handle;
    }
    DrmCencInfoMode mode = (DrmCencInfoMode)argc_two;
  
    OH_AVErrCode ret1 = OH_AVCencInfo_SetMode(handle_ptr, mode);
    OH_AVErrCode ret2 = OH_AVCencInfo_Destroy(handle);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK ) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Test_AVCencInfo_SetAVBuffer(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AVErrCode ret = AV_ERR_INVALID_VAL;
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    size_t argc_oneLen = 0;
    char *argc_one = nullptr;
    size_t argc_twoLen = 0;
    char *argc_two = nullptr;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &argc_oneLen);
    argc_one = new char[argc_oneLen + 1];
    napi_get_value_string_utf8(env, args[0], argc_one, argc_oneLen + 1, &argc_oneLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &argc_twoLen);
    argc_two = new char[argc_twoLen + 1];
    napi_get_value_string_utf8(env, args[1], argc_two, argc_twoLen + 1, &argc_twoLen); 
    uint8_t keyIdData[KEY_DATA_LEN] = {0x01, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42};
    uint8_t ivData[KEY_DATA_LEN] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x10};
    DrmSubsample subsamples[10] = {{0x10,0x16},{0x20,0x22},{0x30,0x35},{0x40,0x47},{0x50,0x50},{0x60,0x6f},{0x70,0x71},{0x80,0x82},{0x90,0x22},{0xa0,0x22}};
    uint32_t encryptedBlockCount = 0xff;
    uint32_t skippedBlockCount = 0x10;
    uint32_t firstEncryptedOffset = 0x20;
    uint32_t subsampleCount = 2;
    OH_AVCencInfo *handle = OH_AVCencInfo_Create();
    OH_AVErrCode ret1 = OH_AVCencInfo_SetAlgorithm(handle, DRM_ALG_CENC_SM4_CBC);
    OH_AVErrCode ret2 = OH_AVCencInfo_SetKeyIdAndIv(handle, keyIdData, KEY_DATA_LEN, ivData, KEY_DATA_LEN);
    OH_AVErrCode ret3 = OH_AVCencInfo_SetSubsampleInfo(handle, encryptedBlockCount, skippedBlockCount, firstEncryptedOffset, subsampleCount, subsamples);
    OH_AVErrCode ret4 = OH_AVCencInfo_SetMode(handle, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET);
    OH_AVErrCode ret5 = AV_ERR_INVALID_VAL;
    OH_AVBuffer *inBuf = OH_AVBuffer_Create(BUFF_DATA_SIZE);
    if(inBuf != nullptr){
        OH_AVCencInfo *handle_ptr = nullptr;
        if (0 != strcmp(argc_one, " ")) {
            handle_ptr = handle;
        }
        if (0 != strcmp(argc_one, " ")) {
            ret5 = OH_AVCencInfo_SetAVBuffer(handle_ptr, inBuf);
        } else{
            ret5 = OH_AVCencInfo_SetAVBuffer(handle_ptr, nullptr);
        }         
    }
    OH_AVErrCode ret6 = OH_AVCencInfo_Destroy(handle);
    OH_AVErrCode ret7 = OH_AVBuffer_Destroy(inBuf);
    if (ret1 == AV_ERR_OK && ret2 == AV_ERR_OK && ret3 == AV_ERR_OK 
    && ret4 == AV_ERR_OK && ret5 == AV_ERR_OK && ret6 == AV_ERR_OK && ret7 == AV_ERR_OK) { 
        ret = AV_ERR_OK;
    } else {
        ret = AV_ERR_INVALID_VAL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "Test_CencInfo_Destroy", nullptr, Test_CencInfo_Destroy, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVCencInfo_SetAlgorithm", nullptr, Test_AVCencInfo_SetAlgorithm, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVCencInfo_SetKeyIdAndIv", nullptr, Test_AVCencInfo_SetKeyIdAndIv, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVCencInfo_SetSubsampleInfo", nullptr, Test_AVCencInfo_SetSubsampleInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVCencInfo_SetMode", nullptr, Test_AVCencInfo_SetMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "Test_AVCencInfo_SetAVBuffer", nullptr, Test_AVCencInfo_SetAVBuffer, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

