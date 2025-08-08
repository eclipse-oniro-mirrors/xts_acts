/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "napi/native_api.h"
#include "hilog/log.h"
#include <BasicServicesKit/oh_commonevent.h>
#include "parameters.cpp"
#include "publishinfo.cpp"
#include "publish.cpp"
#include "orderedcommonevent.cpp"

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"createParameters", nullptr, CreateParameters, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyParameters", nullptr, DestroyParameters, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setIntToParameters", nullptr, SetIntToParameters, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setIntArrayToParameters", nullptr, SetIntArrayToParameters, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setLongToParameters", nullptr, SetLongToParameters, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setLongArrayToParameters", nullptr, SetLongArrayToParameters, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setBoolToParameters", nullptr, SetBoolToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},
        {"setBoolArrayToParameters", nullptr, SetBoolArrayToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},
        {"setDoubleToParameters", nullptr, SetDoubleToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},
        {"setDoubleArrayToParameters", nullptr, SetDoubleArrayToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},
        {"setCharToParameters", nullptr, SetCharToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},
        {"setCharArrayToParameters", nullptr, SetCharArrayToParameters, nullptr, nullptr, nullptr, napi_default,
        nullptr},

        {"createPublishInfo", nullptr, CreatePublishInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyPublishInfo", nullptr, DestroyPublishInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPublishInfoBundleName", nullptr, SetPublishInfoBundleName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setPublishInfoPermissions", nullptr, SetPublishInfoPermissions, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setPublishInfoCode", nullptr, SetPublishInfoCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSetPublishInfoCode", nullptr, GetSetPublishInfoCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPublishInfoData", nullptr, SetPublishInfoData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSetPublishInfoData", nullptr, GetSetPublishInfoData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setPublishInfoParameters", nullptr, SetPublishInfoParameters, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getSetPublishInfoParameters", nullptr, GetSetPublishInfoParameters, nullptr, nullptr, nullptr, napi_default,
         nullptr},

        {"isOrderedCommonEvent", nullptr, IsOrderedCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getIsOrderedCommonEvent", nullptr, GetIsOrderedCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finishCommonEvent", nullptr, FinishCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFinishCommonEvent", nullptr, GetFinishCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbortCommonEvent", nullptr, GetAbortCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGetAbortCommonEvent", nullptr, GetGetAbortCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"abortCommonEvent", nullptr, AbortCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbortCommonEvent2", nullptr, GetAbortCommonEvent2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearAbortCommonEvent", nullptr, ClearAbortCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getClearAbortCommonEvent", nullptr, GetClearAbortCommonEvent, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"subscriberCommonEvent", nullptr, SubscriberCommonEvent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGetCodeFromSubscriber", nullptr, GetGetCodeFromSubscriber, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getSetCodeToSubscriber", nullptr, GetSetCodeToSubscriber, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGetDataFromSubscriber", nullptr, GetGetDataFromSubscriber, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"getSetDataToSubscriber", nullptr, GetSetDataToSubscriber, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"publish", nullptr, Publish, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"publishWithInfo", nullptr, PublishWithInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSetPublishInfoBundleName", nullptr, GetSetPublishInfoBundleName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "subscribe",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
