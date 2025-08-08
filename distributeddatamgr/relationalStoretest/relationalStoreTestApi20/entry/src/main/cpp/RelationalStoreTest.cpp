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

#include "napi/native_api.h"
#include <database/data/data_asset.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

static napi_value GetURISuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    char uri[10] = "";
    size_t length = 10;
    int ret = OH_Data_Asset_GetUri(readData5, uri, &length);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetPathSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    char path[10] = "";
    size_t length = 10;
    int ret = OH_Data_Asset_GetPath(readData5, path, &length);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetCreateTimeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    int64_t createTime = 0;
    int ret = OH_Data_Asset_GetCreateTime(readData5, &createTime);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetModifyTimeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    int64_t modifyTime = 0;
    int ret = OH_Data_Asset_GetModifyTime(readData5, &modifyTime);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetSizeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    size_t size = 0;
    int ret = OH_Data_Asset_GetSize(readData5, &size);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetStatusSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();

    Data_AssetStatus status = Data_AssetStatus::ASSET_NORMAL;
    int ret = OH_Data_Asset_GetStatus(readData5, &status);

    napi_create_int32(env, ret, &result);
    OH_Data_Asset_DestroyOne(readData5);
    return result;
}

static napi_value GetDestroyOneSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    
    int ret = OH_Data_Asset_DestroyOne(asset);

    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value TestDestroyMultipleInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    uint32_t count = 2;
    Data_Asset **asset = OH_Data_Asset_CreateMultiple(count);
    
    uint32_t cnt = 4294967295;
    int ret = OH_Data_Asset_DestroyMultiple(asset, cnt);

    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getURISuccess", nullptr, GetURISuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPathSuccess", nullptr, GetPathSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCreateTimeSuccess", nullptr, GetCreateTimeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getModifyTimeSuccess", nullptr, GetModifyTimeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSizeSuccess", nullptr, GetSizeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getStatusSuccess", nullptr, GetStatusSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getDestroyOneSuccess", nullptr, GetDestroyOneSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testDestroyMultipleInvalidParam", nullptr, TestDestroyMultipleInvalidParam, nullptr, nullptr, nullptr,
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
    .nm_modname = "relationndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
