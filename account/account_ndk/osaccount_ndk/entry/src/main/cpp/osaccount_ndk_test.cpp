/*
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
#include <string>

#include "errors.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "os_account.h"
#include "os_account_common.h"
#include "os_account_manager.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include <vector>

namespace {
    static const uint32_t MAX_NAME_LENGTH = 1024;
}

static napi_value OsAccountGetAccountNameA(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value OsAccountGetAccountNameB(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(str, 0);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value OsAccountGetAccountNameC(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(nullptr, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"osAccountGetAccountNameA",
         nullptr, OsAccountGetAccountNameA, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"osAccountGetAccountNameB",
         nullptr, OsAccountGetAccountNameB, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"osAccountGetAccountNameC",
         nullptr, OsAccountGetAccountNameC, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libosaccountndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
