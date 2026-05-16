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
#ifndef MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGERECEIVERMDK_TEST_H_X
#define MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGERECEIVERMDK_TEST_H_X
#include "node_api.h"
napi_value PackToData(napi_env env, napi_callback_info info);
napi_value Create(napi_env env, napi_callback_info info);
napi_value PackToFile(napi_env env, napi_callback_info info);
napi_value Release(napi_env env, napi_callback_info info);
napi_value JsCreateImageReceiver(napi_env env, napi_callback_info info);
napi_value JsCreateImageReceiverOptions(napi_env env, napi_callback_info info);

#endif // MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEKITSUCCESTEST_H
