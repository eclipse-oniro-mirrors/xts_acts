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

#ifndef UDMFTESTAPI20_UDMFTEST_H
#define UDMFTESTAPI20_UDMFTEST_H

#include "napi/native_api.h"
#include <database/udmf/udmf.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

extern int g_invalidParamCode;
extern int g_err;

void AddUdmfTest(std::vector<napi_property_descriptor> &descData);

void DataProgressCallback(OH_Udmf_ProgressInfo* progressInfo, OH_UdmfData* data);

napi_value TestDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value TestAddFileUriInvalidParam(napi_env env, napi_callback_info info);
napi_value TestAddFileUriSuccess(napi_env env, napi_callback_info info);
napi_value TestAddPixelMapInvalidParam(napi_env env, napi_callback_info info);
napi_value TestAddPixelMapSuccess(napi_env env, napi_callback_info info);
napi_value TestGetGeneralEntryInvalidParam(napi_env env, napi_callback_info info);
napi_value testGetPlainTextError(napi_env env, napi_callback_info info);
napi_value TestGetHyperlinkError(napi_env env, napi_callback_info info);
napi_value TestGetHtmlError(napi_env env, napi_callback_info info);
napi_value TestGetAppItemInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetAppItemError(napi_env env, napi_callback_info info);
napi_value TestSetProviderInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetVisibilitySuccess(napi_env env, napi_callback_info info);
napi_value TestSetVisibilityInvalidParam(napi_env env, napi_callback_info info);
napi_value TestSetVisibilitySuccess(napi_env env, napi_callback_info info);
napi_value TestGetUnifiedDataError(napi_env env, napi_callback_info info);
napi_value TestGetUnifiedDataByOptionsError(napi_env env, napi_callback_info info);
napi_value TestSetUnifiedDataError(napi_env env, napi_callback_info info);
napi_value TestUpdateUnifiedDataError(napi_env env, napi_callback_info info);
napi_value TestDeleteUnifiedDataError(napi_env env, napi_callback_info info);
napi_value TestUdmfOptionsGetVisibilityProcess(napi_env env, napi_callback_info info);
napi_value TestUdmfOptionsGetVisibilityAll(napi_env env, napi_callback_info info);
napi_value TestUdmfProgressInfoGetStatus(napi_env env, napi_callback_info info);
napi_value TestUDMFSkip(napi_env env, napi_callback_info info);
#endif //UDMFTESTAPI20_UDMFTEST_H