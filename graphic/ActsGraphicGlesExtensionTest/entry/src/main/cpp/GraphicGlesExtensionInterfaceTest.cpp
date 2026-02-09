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
#include <cassert>
#include "include/GraphicGlesExtensionTest.h"
#include "napi/native_api.h"

#define CASE_NUM_0 0
#define CASE_NUM_1 1
#define CASE_NUM_2 2
#define CASE_NUM_3 3
#define CASE_NUM_4 4
#define ARGS_INDEX_ZERO 0
#define ARGS_SIZE 1

static napi_value createResultValue(napi_env env, bool success)
{
    napi_value result;
    napi_create_int32(env, success ? 0 : -1, &result);
    return result;
}

static napi_value ohGlesExtensionTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, false);
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, false);
    }
    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, false);
    }
    int result;
    switch (caseNum) {
        case CASE_NUM_0:
            result = OHOS::Rosen::OH_GLES_Extension001Test();
            break;
        case CASE_NUM_1:
            result = OHOS::Rosen::OH_GLES_Extension002Test();
            break;
        case CASE_NUM_2:
            result = OHOS::Rosen::OH_GLES_Extension003Test();
            break;
        case CASE_NUM_3:
            result = OHOS::Rosen::OH_GLES_Extension004Test();
            break;
        case CASE_NUM_4:
            result = OHOS::Rosen::OH_GLES_Extension005Test();
            break;
        default:
            napi_throw_type_error(env, nullptr, "The range of case must be 0 to 4");
            return createResultValue(env, false);
    }
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ohGlesExtensionTest", nullptr, ohGlesExtensionTest, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "graphic_gles_extension_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
