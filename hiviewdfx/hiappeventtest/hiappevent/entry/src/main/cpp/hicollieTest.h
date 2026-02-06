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
#ifndef HIAPPEVENT_HICOLLIETEST_H
#define HIAPPEVENT_HICOLLIETEST_H
#include "napi/native_api.h"
#undef LOG_TAG
#define LOG_TAG "testTag"
napi_value TestHiCollieStuckWithTimeoutNdk2(napi_env env, napi_callback_info info);
napi_value TestHiCollieStuckWithTimeoutNdk(napi_env env, napi_callback_info info);
napi_value SetTimer1(napi_env env, napi_callback_info info);
napi_value SetTimer2(napi_env env, napi_callback_info info);
napi_value SetTimer3(napi_env env, napi_callback_info info);
napi_value SetTimer4(napi_env env, napi_callback_info info);
napi_value TestHiCollieStuckWithTimeoutNdk1(napi_env env, napi_callback_info info);
napi_value TestHiCollieJankC(napi_env env, napi_callback_info info);


#endif // HIAPPEVENT_HICOLLIETEST_H
