/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#ifndef HIAPPEVENT_HIAPPEVENTTEST_H
#define HIAPPEVENT_HIAPPEVENTTEST_H
#include "napi/native_api.h"
#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#undef LOG_TAG
#define LOG_TAG "testTag"
#include "napi/native_api.h"

const float FLOAT_123_22 = 123.22f;
const float FLOAT_234_5 = 234.5f;
const float FLOAT_131312_46464 = 131312.46464f;
const double DOUBLE_123_22 = 123.22;
const double DOUBLE_30949_374 = 30949.374;
const double DOUBLE_131312_46464 = 131312.46464;
napi_value SetReportRouteValue(napi_env env, napi_callback_info info);
napi_value SetReportPolicy(napi_env env, napi_callback_info info);
napi_value SetCustomConfig(napi_env env, napi_callback_info info);
napi_value SetConfigId(napi_env env, napi_callback_info info);
napi_value SetConfigName(napi_env env, napi_callback_info info);
napi_value SetReportUserId(napi_env env, napi_callback_info info);
napi_value SetReportUserProperty0(napi_env env, napi_callback_info info);
napi_value SetReportUserProperty1(napi_env env, napi_callback_info info);
napi_value SetReportUserProperty2(napi_env env, napi_callback_info info);
napi_value SetReportUserProperty3(napi_env env, napi_callback_info info);
napi_value SetReportUserPropertyCode(napi_env env, napi_callback_info info);
napi_value SetReportUserPropertyCodeValue(napi_env env, napi_callback_info info);
napi_value SetWatcherOnReceive(napi_env env, napi_callback_info info);
napi_value RemoveProcessor(napi_env env, napi_callback_info info);
napi_value SetConfigItem(napi_env env, napi_callback_info info);
napi_value SetConfigItem1(napi_env env, napi_callback_info info);
napi_value SetEventConfig(napi_env env, napi_callback_info info);
napi_value HiAppEventSetConfigItem(napi_env env, napi_callback_info info);
napi_value SetEventConfigSuccess(napi_env env, napi_callback_info info);
napi_value HiAppEventCreateProcessor(napi_env env, napi_callback_info info);


#endif // HIAPPEVENT_HIAPPEVENTTEST_H
