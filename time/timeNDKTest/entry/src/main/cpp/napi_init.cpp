/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "BasicServicesKit/time_service.h"
#include <BasicServicesKit/ohprint.h>
#include "napi/native_api.h"
#include "native_common.h"
#include "hilog/log.h"
#include <codecvt>
#include <locale>
#include <cstdlib>
#include <variant>

namespace { static const uint32_t MAX_NAME_LENGTH = 1024; }

static napi_value GetTimezone_0100(napi_env env, napi_callback_info info)
{
    int  len = 35;
    char *bufTmp = nullptr;
    TimeService_ErrCode returnValue = OH_TimeService_GetTimeZone(bufTmp, len);
    //正常
    if (returnValue == TimeService_ErrCode::TIMESERVICE_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, bufTmp, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    //异常
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value GetTimezone_0200(napi_env env, napi_callback_info info)
{
    int  len = 5;
    char *bufTmp = static_cast<char *>(malloc(len + 1));
    TimeService_ErrCode returnValue = OH_TimeService_GetTimeZone(bufTmp, len);
    //正常
    if (returnValue == TimeService_ErrCode::TIMESERVICE_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, bufTmp, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    //异常
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value GetTimezone_0300(napi_env env, napi_callback_info info)
{
    int  len = 35;
    char *bufTmp = static_cast<char *>(malloc(len + 1));
    TimeService_ErrCode returnValue = OH_TimeService_GetTimeZone(bufTmp, len);
    //正常
    if (returnValue == TimeService_ErrCode::TIMESERVICE_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, bufTmp, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    //异常
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value GetTimezone_0400(napi_env env, napi_callback_info info)
{
    int  len = 14;
    char *bufTmp = static_cast<char *>(malloc(len + 1));
    TimeService_ErrCode returnValue = OH_TimeService_GetTimeZone(bufTmp, len);
    //正常
    if (returnValue == TimeService_ErrCode::TIMESERVICE_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, bufTmp, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    //异常
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getTimezone_0100", nullptr, GetTimezone_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getTimezone_0200", nullptr, GetTimezone_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getTimezone_0300", nullptr, GetTimezone_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getTimezone_0400", nullptr, GetTimezone_0400, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
