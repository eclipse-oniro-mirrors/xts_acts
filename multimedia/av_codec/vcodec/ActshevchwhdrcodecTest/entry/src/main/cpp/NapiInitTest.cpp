/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/FuncTest.h"
#include "napi/native_api.h"

using namespace OHOS::Media;

template <typename Func> napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_throw_error(env, nullptr, e.what());
    } catch (...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}

EXTERN_C_START

struct AsyncWorkData {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    int (*testFunc)();
    int result;
    std::string errorMsg;
};

static void ExecuteWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    try {
        workData->result = workData->testFunc();
    } catch (const std::exception& e) {
        workData->errorMsg = e.what();
        workData->result = -1;
    } catch (...) {
        workData->errorMsg = "Unknown error occurred";
        workData->result = -1;
    }
}

static void CompleteWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    
    if (status != napi_ok) {
        napi_reject_deferred(env, workData->deferred, nullptr);
        goto cleanup;
    }

    if (!workData->errorMsg.empty()) {
        napi_value error;
        napi_create_string_utf8(env, workData->errorMsg.c_str(), NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, workData->deferred, error);
    } else {
        napi_value result;
        napi_create_int32(env, workData->result, &result);
        napi_resolve_deferred(env, workData->deferred, result);
    }

cleanup:
    napi_delete_async_work(env, workData->work);
    delete workData;
}

static napi_value CreateAsyncWrapper(napi_env env, napi_callback_info info, int (*testFunc)())
{
    return NapiTry(env, [env, info, testFunc]() {
        napi_value promise;
        napi_deferred deferred;
        napi_create_promise(env, &deferred, &promise);

        AsyncWorkData* workData = new AsyncWorkData();
        workData->env = env;
        workData->deferred = deferred;
        workData->testFunc = testFunc;
        workData->result = 0;

        napi_value workName;
        napi_create_string_utf8(env, "AudioEncoderTest", NAPI_AUTO_LENGTH, &workName);
        napi_create_async_work(env, nullptr, workName, ExecuteWork, CompleteWork, workData, &workData->work);

        napi_queue_async_work(env, workData->work);

        return promise;
    });
}

static napi_value FuncTest1(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, DEMUXER_DEC_ENC_MUXER_FUNC_009);
}

static napi_value FuncTest2(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, DEMUXER_DEC_ENC_MUXER_FUNC_010);
}

static napi_value FuncTest3(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, DEMUXER_DEC_ENC_MUXER_FUNC_011);
}

static napi_value FuncTest4(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, DEMUXER_DEC_ENC_MUXER_FUNC_012);
}

static napi_value FuncTest5(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, DEMUXER_DEC_ENC_MUXER_FUNC_013);
}

static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "DEMUXER_DEC_ENC_MUXER_FUNC_009", nullptr, FuncTest1,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DEMUXER_DEC_ENC_MUXER_FUNC_010", nullptr, FuncTest2,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DEMUXER_DEC_ENC_MUXER_FUNC_011", nullptr, FuncTest3,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DEMUXER_DEC_ENC_MUXER_FUNC_012", nullptr, FuncTest4,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "DEMUXER_DEC_ENC_MUXER_FUNC_013", nullptr, FuncTest5,
            nullptr, nullptr, nullptr, napi_default, nullptr },
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
