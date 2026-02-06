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

#ifndef TYPOGRAPHY_TEST_H
#define TYPOGRAPHY_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addTypographyTest(std::vector<napi_property_descriptor> &descData);
napi_value OH_Drawing_FontFeature0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeature0101(napi_env env, napi_callback_info info);
napi_value OH_Drawing_LineMetrics0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontDescriptor0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontConfigInfo0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGenericInfo0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontAliasInfo0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontAdjustInfo0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFallbackGroup0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFallbackInfo0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontConfigInfoErrorCode0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectStyle0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PlaceholderVerticalAlignment0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_WordBreakType0100(napi_env env, napi_callback_info info);
napi_value OH_Drawing_TextStyleType0100(napi_env env, napi_callback_info info);
#endif
