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
#ifndef HICOLLIETEST_H
#define HICOLLIETEST_H
#include "napi/native_api.h"
#undef LOG_TAG
#define LOG_TAG "testTag"
napi_value OH_HiCollie_Report_sucess(napi_env env, napi_callback_info info);
napi_value OH_HiCollie_Report_Main(napi_env env, napi_callback_info info);
napi_value OH_HiCollie_Report_Remote(napi_env env, napi_callback_info info);
napi_value OH_HiCollie_ReportInputBlock_Main(napi_env env, napi_callback_info info);
napi_value OH_HiCollie_ReportInputBlock_Remote(napi_env env, napi_callback_info info);
#endif // HICOLLIETEST_H
