/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <chrono>
#include <string>
#include "web/native_interface_arkweb.h"

#define ARGS_INDEX_ZERO 0
#define ARGS_INDEX_ONE 1
#define ARGS_INDEX_TWO 2
#define ARGS_INDEX_THREE 3
#define ARGS_INDEX_FOUR 4
#define ARGS_INDEX_FIVE 5
#define ARGS_INDEX_SIX 6

static napi_value loadData(napi_env env, napi_callback_info info)
{
    size_t argc = 6;
    napi_value args[ARGS_INDEX_SIX] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_value result;

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], nullptr, 0, &webNameSize);
    char *webNameValue = new (std::nothrow) char[webNameSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], webNameValue, webNameSize + 1, &webNameSize);

    // 获取第二个参数 data
    size_t dataSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], nullptr, 0, &dataSize);
    char *dataValue = new (std::nothrow) char[dataSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], dataValue, dataSize + 1, &dataSize);

	// 获取第三个参数 mimeType
    size_t mimeTypeSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_TWO], nullptr, 0, &mimeTypeSize);
    char *mimeTypeValue = new (std::nothrow) char[mimeTypeSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_TWO], mimeTypeValue, mimeTypeSize + 1, &mimeTypeSize);

	// 获取第四个参数 encoding
    size_t encodingSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_THREE], nullptr, 0, &encodingSize);
    char *encodingValue = new (std::nothrow) char[encodingSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_THREE], encodingValue, encodingSize + 1, &encodingSize);

	// 获取第五个参数 baseUrl
    size_t baseUrlSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_FOUR], nullptr, 0, &baseUrlSize);
    char *baseUrlValue = new (std::nothrow) char[baseUrlSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_FOUR], baseUrlValue, baseUrlSize + 1, &baseUrlSize);

	// 获取第六个参数 historyUrl
    size_t historyUrlSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_FIVE], nullptr, 0, &historyUrlSize);
    char *historyUrlValue = new (std::nothrow) char[historyUrlSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_FIVE], historyUrlValue, historyUrlSize + 1, &historyUrlSize);

    // 调用原生接口
    ArkWeb_ErrorCode result1 = OH_NativeArkWeb_LoadData(webNameValue, dataValue, mimeTypeValue, encodingValue,
    baseUrlValue, historyUrlValue);
    int errorCodeAsInt = static_cast<int>(result1);
    napi_create_double(env, errorCodeAsInt, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
    {"loadData", nullptr, loadData, nullptr, nullptr, nullptr,
        napi_default, nullptr}
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}