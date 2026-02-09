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

#ifndef GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
#define GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"
#include "rawfile/raw_file.h"
#include "rawfile/raw_dir.h"
#include "hilog/log.h"
#include <cstdint>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <vector>
#include <resourcemanager/ohresmgr.h>
#include <string>
#include <sstream>

namespace GlobalNapiTest {
const int PARAMETER = 401;
const int NOT_FOUND_ID = 9001001;
const int NOT_FOUND_BY_ID = 9001002;
const int NOT_FOUND_NAME = 9001003;
const int NOT_FOUND_BY_NAME = 9001004;
const int TOO_MUCH = 9001006;
const int NO_OVERLAY_PATH = 9001010;
const int RES_ID_FORMAT_ERROR = 9001007;
const int count = 20;
const int count2 = 10;

napi_value GetResourceManager(napi_env env, napi_callback_info info);
napi_value GetMediaBase640100(napi_env env, napi_callback_info info);
napi_value GetMediaBase640200(napi_env env, napi_callback_info info);
napi_value GetMediaBase640300(napi_env env, napi_callback_info info);
napi_value GetMediaBase640400(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0100(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0200(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0300(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0400(napi_env env, napi_callback_info info);
napi_value GetMediaBase64ByName0100(napi_env env, napi_callback_info info);
napi_value GetMediaBase64ByName0200(napi_env env, napi_callback_info info);
napi_value GetMediaBase64ByName0300(napi_env env, napi_callback_info info);
napi_value GetMediaBase64DataByName0100(napi_env env, napi_callback_info info);
napi_value GetMediaBase64DataByName0200(napi_env env, napi_callback_info info);
napi_value GetMediaBase64DataByName0300(napi_env env, napi_callback_info info);
napi_value GetMedia0100(napi_env env, napi_callback_info info);
napi_value GetMedia0200(napi_env env, napi_callback_info info);
napi_value GetMedia0300(napi_env env, napi_callback_info info);
napi_value GetMedia0400(napi_env env, napi_callback_info info);
napi_value GetMediaData0100(napi_env env, napi_callback_info info);
napi_value GetMediaData0200(napi_env env, napi_callback_info info);
napi_value GetMediaData0300(napi_env env, napi_callback_info info);
napi_value GetMediaData0400(napi_env env, napi_callback_info info);
napi_value GetMediaByName0100(napi_env env, napi_callback_info info);
napi_value GetMediaByName0200(napi_env env, napi_callback_info info);
napi_value GetMediaByName0300(napi_env env, napi_callback_info info);
napi_value GetMediaDataByName0100(napi_env env, napi_callback_info info);
napi_value GetMediaDataByName0200(napi_env env, napi_callback_info info);
napi_value GetMediaDataByName0300(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptor0100(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptor0200(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptor0300(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptor0400(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorData0100(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorData0200(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorData0300(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorData0400(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorByName0100(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorByName0200(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorByName0300(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorDataByName0100(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorDataByName0200(napi_env env, napi_callback_info info);
napi_value GetDrawableDescriptorDataByName0300(napi_env env, napi_callback_info info);
napi_value GetSymbol0100(napi_env env, napi_callback_info info);
napi_value GetSymbol0200(napi_env env, napi_callback_info info);
napi_value GetSymbol0300(napi_env env, napi_callback_info info);
napi_value GetSymbol0400(napi_env env, napi_callback_info info);
napi_value GetSymbol0500(napi_env env, napi_callback_info info);
napi_value GetSymbolByName0100(napi_env env, napi_callback_info info);
napi_value GetSymbolByName0200(napi_env env, napi_callback_info info);
napi_value GetSymbolByName0300(napi_env env, napi_callback_info info);
napi_value GetSymbolByName0400(napi_env env, napi_callback_info info);
napi_value GetLocales0100(napi_env env, napi_callback_info info);
napi_value GetLocales0200(napi_env env, napi_callback_info info);
napi_value GetLocalesData0100(napi_env env, napi_callback_info info);
napi_value GetLocalesData0200(napi_env env, napi_callback_info info);
napi_value GetConfiguration0100(napi_env env, napi_callback_info info);
napi_value GetConfiguration0200(napi_env env, napi_callback_info info);
napi_value GetResourceConfiguration0100(napi_env env, napi_callback_info info);
napi_value ReleaseConfiguration0100(napi_env env, napi_callback_info info);
napi_value ReleaseConfiguration0200(napi_env env, napi_callback_info info);
napi_value GetString0100(napi_env env, napi_callback_info info);
napi_value GetString0200(napi_env env, napi_callback_info info);
napi_value GetString0300(napi_env env, napi_callback_info info);
napi_value GetString0400(napi_env env, napi_callback_info info);
napi_value GetString0500(napi_env env, napi_callback_info info);
napi_value GetString0600(napi_env env, napi_callback_info info);
napi_value GetStringByName0100(napi_env env, napi_callback_info info);
napi_value GetStringByName0200(napi_env env, napi_callback_info info);
napi_value GetStringByName0300(napi_env env, napi_callback_info info);
napi_value GetStringByName0400(napi_env env, napi_callback_info info);
napi_value GetStringByName0500(napi_env env, napi_callback_info info);
napi_value GetStringArray0100(napi_env env, napi_callback_info info);
napi_value GetStringArray0200(napi_env env, napi_callback_info info);
napi_value GetStringArray0300(napi_env env, napi_callback_info info);
napi_value GetStringArray0400(napi_env env, napi_callback_info info);
napi_value GetStringArray0500(napi_env env, napi_callback_info info);
napi_value GetStringArrayByName0100(napi_env env, napi_callback_info info);
napi_value GetStringArrayByName0200(napi_env env, napi_callback_info info);
napi_value GetStringArrayByName0300(napi_env env, napi_callback_info info);
napi_value GetStringArrayByName0400(napi_env env, napi_callback_info info);
napi_value ReleaseStringArray0100(napi_env env, napi_callback_info info);
napi_value ReleaseStringArray0200(napi_env env, napi_callback_info info);
napi_value GetPluralString0100(napi_env env, napi_callback_info info);
napi_value GetPluralString0200(napi_env env, napi_callback_info info);
napi_value GetPluralString0300(napi_env env, napi_callback_info info);
napi_value GetPluralString0400(napi_env env, napi_callback_info info);
napi_value GetPluralString0500(napi_env env, napi_callback_info info);
napi_value GetPluralStringByName0100(napi_env env, napi_callback_info info);
napi_value GetPluralStringByName0200(napi_env env, napi_callback_info info);
napi_value GetPluralStringByName0300(napi_env env, napi_callback_info info);
napi_value GetPluralStringByName0400(napi_env env, napi_callback_info info);
napi_value GetIntPluralString0100(napi_env env, napi_callback_info info);
napi_value GetIntPluralString0200(napi_env env, napi_callback_info info);
napi_value GetIntPluralString0300(napi_env env, napi_callback_info info);
napi_value GetIntPluralString0400(napi_env env, napi_callback_info info);
napi_value GetIntPluralString0500(napi_env env, napi_callback_info info);
napi_value GetResourceManager2(napi_env env, napi_callback_info info);
napi_value GetDoublePluralString0100(napi_env env, napi_callback_info info);
napi_value GetDoublePluralString0200(napi_env env, napi_callback_info info);
napi_value GetDoublePluralString0300(napi_env env, napi_callback_info info);
napi_value GetDoublePluralString0400(napi_env env, napi_callback_info info);
napi_value GetDoublePluralString0500(napi_env env, napi_callback_info info);
napi_value GetIntPluralStringByName0100(napi_env env, napi_callback_info info);
napi_value GetIntPluralStringByName0200(napi_env env, napi_callback_info info);
napi_value GetIntPluralStringByName0300(napi_env env, napi_callback_info info);
napi_value GetIntPluralStringByName0400(napi_env env, napi_callback_info info);
napi_value GetDoublePluralStringByName0100(napi_env env, napi_callback_info info);
napi_value GetDoublePluralStringByName0200(napi_env env, napi_callback_info info);
napi_value GetDoublePluralStringByName0300(napi_env env, napi_callback_info info);
napi_value GetDoublePluralStringByName0400(napi_env env, napi_callback_info info);
napi_value GetColor0100(napi_env env, napi_callback_info info);
napi_value GetColor0200(napi_env env, napi_callback_info info);
napi_value GetColor0300(napi_env env, napi_callback_info info);
napi_value GetColor0400(napi_env env, napi_callback_info info);
napi_value GetColor0500(napi_env env, napi_callback_info info);
napi_value GetColorByName0100(napi_env env, napi_callback_info info);
napi_value GetColorByName0200(napi_env env, napi_callback_info info);
napi_value GetColorByName0300(napi_env env, napi_callback_info info);
napi_value GetColorByName0400(napi_env env, napi_callback_info info);
napi_value GetInt0100(napi_env env, napi_callback_info info);
napi_value GetInt0200(napi_env env, napi_callback_info info);
napi_value GetInt0300(napi_env env, napi_callback_info info);
napi_value GetInt0400(napi_env env, napi_callback_info info);
napi_value GetInt0500(napi_env env, napi_callback_info info);
napi_value GetIntByName0100(napi_env env, napi_callback_info info);
napi_value GetIntByName0200(napi_env env, napi_callback_info info);
napi_value GetIntByName0300(napi_env env, napi_callback_info info);
napi_value GetIntByName0400(napi_env env, napi_callback_info info);
napi_value GetFloat0100(napi_env env, napi_callback_info info);
napi_value GetFloat0200(napi_env env, napi_callback_info info);
napi_value GetFloat0300(napi_env env, napi_callback_info info);
napi_value GetFloat0400(napi_env env, napi_callback_info info);
napi_value GetFloat0500(napi_env env, napi_callback_info info);
napi_value GetFloatByName0100(napi_env env, napi_callback_info info);
napi_value GetFloatByName0200(napi_env env, napi_callback_info info);
napi_value GetFloatByName0300(napi_env env, napi_callback_info info);
napi_value GetFloatByName0400(napi_env env, napi_callback_info info);
napi_value GetBool0100(napi_env env, napi_callback_info info);
napi_value GetBool0200(napi_env env, napi_callback_info info);
napi_value GetBool0300(napi_env env, napi_callback_info info);
napi_value GetBool0400(napi_env env, napi_callback_info info);
napi_value GetBool0500(napi_env env, napi_callback_info info);
napi_value GetBoolByName0100(napi_env env, napi_callback_info info);
napi_value GetBoolByName0200(napi_env env, napi_callback_info info);
napi_value GetBoolByName0300(napi_env env, napi_callback_info info);
napi_value GetBoolByName0400(napi_env env, napi_callback_info info);
napi_value AddResource0100(napi_env env, napi_callback_info info);
napi_value AddResource0200(napi_env env, napi_callback_info info);
napi_value AddResource0300(napi_env env, napi_callback_info info);
napi_value RemoveResource0200(napi_env env, napi_callback_info info);
napi_value RemoveResource0300(napi_env env, napi_callback_info info);
napi_value GetResourceManager3(napi_env env, napi_callback_info info);
napi_value GetSuccess0100(napi_env env, napi_callback_info info);
napi_value GetInvalidInputParameter0100(napi_env env, napi_callback_info info);
napi_value GetIdNotFound0100(napi_env env, napi_callback_info info);
napi_value GetNotFoundById0100(napi_env env, napi_callback_info info);
napi_value GetNameNotFound0100(napi_env env, napi_callback_info info);
napi_value GetRefTooMuch0100(napi_env env, napi_callback_info info);
napi_value GetResPathInvalid0100(napi_env env, napi_callback_info info);
napi_value GetDirectionVertical0100(napi_env env, napi_callback_info info);
napi_value GetDirectionHorizontal0100(napi_env env, napi_callback_info info);
napi_value GetColorModeLight0100(napi_env env, napi_callback_info info);
napi_value GetColorModeDark0100(napi_env env, napi_callback_info info);
napi_value GetDeviceType0100(napi_env env, napi_callback_info info);
napi_value GetScreenDensity0100(napi_env env, napi_callback_info info);
napi_value GetConfigurations0100(napi_env env, napi_callback_info info);
napi_value GetConfigurations0200(napi_env env, napi_callback_info info);
napi_value GetConfigurations0300(napi_env env, napi_callback_info info);
napi_value GetConfigurations0400(napi_env env, napi_callback_info info);
napi_value GetConfigurations0500(napi_env env, napi_callback_info info);
napi_value GetConfigurations0600(napi_env env, napi_callback_info info);
napi_value GetConfigurations0700(napi_env env, napi_callback_info info);
napi_value RemoveResource0100(napi_env env, napi_callback_info info);
}

#endif //GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
