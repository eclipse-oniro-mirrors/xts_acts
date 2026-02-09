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

#ifndef ACTSHUKSAPI20NDKTEST_OHHUKSTEST_H
#define ACTSHUKSAPI20NDKTEST_OHHUKSTEST_H

#include "huks/native_huks_type.h"
#include <napi/native_api.h>
#include "common/Common.h"
#include <huks/native_huks_api.h>
#include "huks/native_huks_param.h"

namespace OHHuksStructTest {
napi_value GetOHHuksResult0100(napi_env env, napi_callback_info info);
napi_value GetOHHuksResult0200(napi_env env, napi_callback_info info);
napi_value GetOHHuksParamSet0100(napi_env env, napi_callback_info info);
napi_value GetOHHuksParamSet0200(napi_env env, napi_callback_info info);
napi_value GetOHHuksParam0100(napi_env env, napi_callback_info info);
napi_value GetOHHuksParam0200(napi_env env, napi_callback_info info);
napi_value GetOHHuksParam0300(napi_env env, napi_callback_info info);
napi_value GetOHHuksParam0400(napi_env env, napi_callback_info info);
napi_value GetOHHuksParam0500(napi_env env, napi_callback_info info);
}

#endif //ACTSHUKSAPI20NDKTEST_OHHUKSTEST_H
