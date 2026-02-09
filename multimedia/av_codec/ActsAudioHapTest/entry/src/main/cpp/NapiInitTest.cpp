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
#include "napi/native_api.h"
#include "include/AudioEncoderCApiNdkTest.h"
#include "include/CommonToolTest.h"
#include <string>

using namespace OHOS;

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

static napi_value EncoderConfigureLCAACWrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, EncoderConfigureLCAAC);
}

static napi_value EncoderConfigureHEAACWrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, EncoderConfigureHEAAC);
}

static napi_value EncoderConfigureHEAACv2Wrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, EncoderConfigureHEAACv2);
}

static napi_value EncoderConfigureByCapWrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, EncoderConfigureByCap);
}

static napi_value SampleRateWrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, SampleRate);
}

static napi_value ChannelCountV1Wrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, ChannelCountV1);
}

static napi_value ChannelCountV2Wrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, ChannelCountV2);
}

static napi_value ChannelLayoutV1Wrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, ChannelLayoutV1);
}

static napi_value ChannelLayoutV2Wrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, ChannelLayoutV2);
}

static napi_value AacProfileWrapper(napi_env env, napi_callback_info info)
{
    return CreateAsyncWrapper(env, info, AacProfile);
}

static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "EncoderConfigureLCAAC", nullptr, EncoderConfigureLCAACWrapper,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "EncoderConfigureHEAAC", nullptr, EncoderConfigureHEAACWrapper,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "EncoderConfigureHEAACv2", nullptr, EncoderConfigureHEAACv2Wrapper,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "EncoderConfigureByCap", nullptr, EncoderConfigureByCapWrapper,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "SampleRate", nullptr, SampleRateWrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ChannelCountV1", nullptr, ChannelCountV1Wrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ChannelCountV2", nullptr, ChannelCountV2Wrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ChannelLayoutV1", nullptr, ChannelLayoutV1Wrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ChannelLayoutV2", nullptr, ChannelLayoutV2Wrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AacProfile", nullptr, AacProfileWrapper, nullptr, nullptr, nullptr, napi_default, nullptr },
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
