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

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <globalnapitest/GlobalNapiTest.h>
#include <vector>

EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetResourceManager", nullptr, GlobalNapiTest::GetResourceManager, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640100", nullptr, GlobalNapiTest::GetMediaBase640100, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640200", nullptr, GlobalNapiTest::GetMediaBase640200, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640300", nullptr, GlobalNapiTest::GetMediaBase640300, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640400", nullptr, GlobalNapiTest::GetMediaBase640400, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0100", nullptr, GlobalNapiTest::GetMediaBase64Data0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0200", nullptr, GlobalNapiTest::GetMediaBase64Data0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0300", nullptr, GlobalNapiTest::GetMediaBase64Data0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0400", nullptr, GlobalNapiTest::GetMediaBase64Data0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64ByName0100", nullptr, GlobalNapiTest::GetMediaBase64ByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64ByName0200", nullptr, GlobalNapiTest::GetMediaBase64ByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64ByName0300", nullptr, GlobalNapiTest::GetMediaBase64ByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64DataByName0100", nullptr, GlobalNapiTest::GetMediaBase64DataByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64DataByName0200", nullptr, GlobalNapiTest::GetMediaBase64DataByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64DataByName0300", nullptr, GlobalNapiTest::GetMediaBase64DataByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMedia0100", nullptr, GlobalNapiTest::GetMedia0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMedia0200", nullptr, GlobalNapiTest::GetMedia0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMedia0300", nullptr, GlobalNapiTest::GetMedia0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMedia0400", nullptr, GlobalNapiTest::GetMedia0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaData0100", nullptr, GlobalNapiTest::GetMediaData0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaData0200", nullptr, GlobalNapiTest::GetMediaData0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaData0300", nullptr, GlobalNapiTest::GetMediaData0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaData0400", nullptr, GlobalNapiTest::GetMediaData0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetMediaByName0100", nullptr, GlobalNapiTest::GetMediaByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaByName0200", nullptr, GlobalNapiTest::GetMediaByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaByName0300", nullptr, GlobalNapiTest::GetMediaByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaDataByName0100", nullptr, GlobalNapiTest::GetMediaDataByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaDataByName0200", nullptr, GlobalNapiTest::GetMediaDataByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaDataByName0300", nullptr, GlobalNapiTest::GetMediaDataByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptor0100", nullptr, GlobalNapiTest::GetDrawableDescriptor0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptor0200", nullptr, GlobalNapiTest::GetDrawableDescriptor0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptor0300", nullptr, GlobalNapiTest::GetDrawableDescriptor0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptor0400", nullptr, GlobalNapiTest::GetDrawableDescriptor0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorData0100", nullptr, GlobalNapiTest::GetDrawableDescriptorData0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorData0200", nullptr, GlobalNapiTest::GetDrawableDescriptorData0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorData0300", nullptr, GlobalNapiTest::GetDrawableDescriptorData0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorData0400", nullptr, GlobalNapiTest::GetDrawableDescriptorData0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorByName0100", nullptr, GlobalNapiTest::GetDrawableDescriptorByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorByName0200", nullptr, GlobalNapiTest::GetDrawableDescriptorByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorByName0300", nullptr, GlobalNapiTest::GetDrawableDescriptorByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorDataByName0100", nullptr, GlobalNapiTest::GetDrawableDescriptorDataByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorDataByName0200", nullptr, GlobalNapiTest::GetDrawableDescriptorDataByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDrawableDescriptorDataByName0300", nullptr, GlobalNapiTest::GetDrawableDescriptorDataByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush3(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetSymbol0100", nullptr, GlobalNapiTest::GetSymbol0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbol0200", nullptr, GlobalNapiTest::GetSymbol0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbol0300", nullptr, GlobalNapiTest::GetSymbol0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbol0400", nullptr, GlobalNapiTest::GetSymbol0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbol0500", nullptr, GlobalNapiTest::GetSymbol0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbolByName0100", nullptr, GlobalNapiTest::GetSymbolByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbolByName0200", nullptr, GlobalNapiTest::GetSymbolByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbolByName0300", nullptr, GlobalNapiTest::GetSymbolByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSymbolByName0400", nullptr, GlobalNapiTest::GetSymbolByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetLocales0100", nullptr, GlobalNapiTest::GetLocales0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetLocales0200", nullptr, GlobalNapiTest::GetLocales0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetLocalesData0100", nullptr, GlobalNapiTest::GetLocalesData0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetLocalesData0200", nullptr, GlobalNapiTest::GetLocalesData0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfiguration0100", nullptr, GlobalNapiTest::GetConfiguration0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfiguration0200", nullptr, GlobalNapiTest::GetConfiguration0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetResourceConfiguration0100", nullptr, GlobalNapiTest::GetResourceConfiguration0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"ReleaseConfiguration0100", nullptr, GlobalNapiTest::ReleaseConfiguration0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"ReleaseConfiguration0200", nullptr, GlobalNapiTest::ReleaseConfiguration0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetString0100", nullptr, GlobalNapiTest::GetString0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetString0200", nullptr, GlobalNapiTest::GetString0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetString0300", nullptr, GlobalNapiTest::GetString0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetString0400", nullptr, GlobalNapiTest::GetString0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetString0500", nullptr, GlobalNapiTest::GetString0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush4(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetStringByName0100", nullptr, GlobalNapiTest::GetStringByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringByName0200", nullptr, GlobalNapiTest::GetStringByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringByName0300", nullptr, GlobalNapiTest::GetStringByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringByName0400", nullptr, GlobalNapiTest::GetStringByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArray0100", nullptr, GlobalNapiTest::GetStringArray0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArray0200", nullptr, GlobalNapiTest::GetStringArray0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArray0300", nullptr, GlobalNapiTest::GetStringArray0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArray0400", nullptr, GlobalNapiTest::GetStringArray0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArray0500", nullptr, GlobalNapiTest::GetStringArray0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArrayByName0100", nullptr, GlobalNapiTest::GetStringArrayByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArrayByName0200", nullptr, GlobalNapiTest::GetStringArrayByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArrayByName0300", nullptr, GlobalNapiTest::GetStringArrayByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetStringArrayByName0400", nullptr, GlobalNapiTest::GetStringArrayByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"ReleaseStringArray0100", nullptr, GlobalNapiTest::ReleaseStringArray0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"ReleaseStringArray0200", nullptr, GlobalNapiTest::ReleaseStringArray0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralString0100", nullptr, GlobalNapiTest::GetPluralString0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralString0200", nullptr, GlobalNapiTest::GetPluralString0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralString0300", nullptr, GlobalNapiTest::GetPluralString0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralString0400", nullptr, GlobalNapiTest::GetPluralString0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralString0500", nullptr, GlobalNapiTest::GetPluralString0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush5(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetPluralStringByName0100", nullptr, GlobalNapiTest::GetPluralStringByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralStringByName0200", nullptr, GlobalNapiTest::GetPluralStringByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralStringByName0300", nullptr, GlobalNapiTest::GetPluralStringByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetPluralStringByName0400", nullptr, GlobalNapiTest::GetPluralStringByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetResourceManager2", nullptr, GlobalNapiTest::GetResourceManager2,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralString0100", nullptr, GlobalNapiTest::GetIntPluralString0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralString0200", nullptr, GlobalNapiTest::GetIntPluralString0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralString0300", nullptr, GlobalNapiTest::GetIntPluralString0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralString0400", nullptr, GlobalNapiTest::GetIntPluralString0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralString0500", nullptr, GlobalNapiTest::GetIntPluralString0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralString0100", nullptr, GlobalNapiTest::GetDoublePluralString0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralString0200", nullptr, GlobalNapiTest::GetDoublePluralString0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralString0300", nullptr, GlobalNapiTest::GetDoublePluralString0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralString0400", nullptr, GlobalNapiTest::GetDoublePluralString0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralString0500", nullptr, GlobalNapiTest::GetDoublePluralString0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralStringByName0100", nullptr, GlobalNapiTest::GetIntPluralStringByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralStringByName0200", nullptr, GlobalNapiTest::GetIntPluralStringByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralStringByName0300", nullptr, GlobalNapiTest::GetIntPluralStringByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntPluralStringByName0400", nullptr, GlobalNapiTest::GetIntPluralStringByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralStringByName0100", nullptr, GlobalNapiTest::GetDoublePluralStringByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralStringByName0200", nullptr, GlobalNapiTest::GetDoublePluralStringByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralStringByName0300", nullptr, GlobalNapiTest::GetDoublePluralStringByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDoublePluralStringByName0400", nullptr, GlobalNapiTest::GetDoublePluralStringByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush6(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetColor0100", nullptr, GlobalNapiTest::GetColor0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColor0200", nullptr, GlobalNapiTest::GetColor0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColor0300", nullptr, GlobalNapiTest::GetColor0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColor0400", nullptr, GlobalNapiTest::GetColor0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColor0500", nullptr, GlobalNapiTest::GetColor0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorByName0100", nullptr, GlobalNapiTest::GetColorByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorByName0200", nullptr, GlobalNapiTest::GetColorByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorByName0300", nullptr, GlobalNapiTest::GetColorByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorByName0400", nullptr, GlobalNapiTest::GetColorByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInt0100", nullptr, GlobalNapiTest::GetInt0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInt0200", nullptr, GlobalNapiTest::GetInt0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInt0300", nullptr, GlobalNapiTest::GetInt0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInt0400", nullptr, GlobalNapiTest::GetInt0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInt0500", nullptr, GlobalNapiTest::GetInt0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntByName0100", nullptr, GlobalNapiTest::GetIntByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntByName0200", nullptr, GlobalNapiTest::GetIntByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntByName0300", nullptr, GlobalNapiTest::GetIntByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIntByName0400", nullptr, GlobalNapiTest::GetIntByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush7(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetFloat0100", nullptr, GlobalNapiTest::GetFloat0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloat0200", nullptr, GlobalNapiTest::GetFloat0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloat0300", nullptr, GlobalNapiTest::GetFloat0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloat0400", nullptr, GlobalNapiTest::GetFloat0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloat0500", nullptr, GlobalNapiTest::GetFloat0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloatByName0100", nullptr, GlobalNapiTest::GetFloatByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloatByName0200", nullptr, GlobalNapiTest::GetFloatByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloatByName0300", nullptr, GlobalNapiTest::GetFloatByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetFloatByName0400", nullptr, GlobalNapiTest::GetFloatByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBool0100", nullptr, GlobalNapiTest::GetBool0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBool0200", nullptr, GlobalNapiTest::GetBool0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBool0300", nullptr, GlobalNapiTest::GetBool0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBool0400", nullptr, GlobalNapiTest::GetBool0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBool0500", nullptr, GlobalNapiTest::GetBool0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBoolByName0100", nullptr, GlobalNapiTest::GetBoolByName0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBoolByName0200", nullptr, GlobalNapiTest::GetBoolByName0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBoolByName0300", nullptr, GlobalNapiTest::GetBoolByName0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetBoolByName0400", nullptr, GlobalNapiTest::GetBoolByName0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"AddResource0100", nullptr, GlobalNapiTest::AddResource0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"AddResource0200", nullptr, GlobalNapiTest::AddResource0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"AddResource0300", nullptr, GlobalNapiTest::AddResource0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"RemoveResource0200", nullptr, GlobalNapiTest::RemoveResource0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"RemoveResource0300", nullptr, GlobalNapiTest::RemoveResource0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void InitPush8(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetResourceManager3", nullptr, GlobalNapiTest::GetResourceManager3,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetSuccess0100", nullptr, GlobalNapiTest::GetSuccess0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetInvalidInputParameter0100", nullptr, GlobalNapiTest::GetInvalidInputParameter0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetIdNotFound0100", nullptr, GlobalNapiTest::GetIdNotFound0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetNotFoundById0100", nullptr, GlobalNapiTest::GetNotFoundById0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetNameNotFound0100", nullptr, GlobalNapiTest::GetNameNotFound0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetRefTooMuch0100", nullptr, GlobalNapiTest::GetRefTooMuch0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetResPathInvalid0100", nullptr, GlobalNapiTest::GetResPathInvalid0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDirectionVertical0100", nullptr, GlobalNapiTest::GetDirectionVertical0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDirectionHorizontal0100", nullptr, GlobalNapiTest::GetDirectionHorizontal0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorModeLight0100", nullptr, GlobalNapiTest::GetColorModeLight0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetColorModeDark0100", nullptr, GlobalNapiTest::GetColorModeDark0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetDeviceType0100", nullptr, GlobalNapiTest::GetDeviceType0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetScreenDensity0100", nullptr, GlobalNapiTest::GetScreenDensity0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0100", nullptr, GlobalNapiTest::GetConfigurations0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0200", nullptr, GlobalNapiTest::GetConfigurations0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0300", nullptr, GlobalNapiTest::GetConfigurations0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0400", nullptr, GlobalNapiTest::GetConfigurations0400,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0500", nullptr, GlobalNapiTest::GetConfigurations0500,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0600", nullptr, GlobalNapiTest::GetConfigurations0600,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetConfigurations0700", nullptr, GlobalNapiTest::GetConfigurations0700,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"RemoveResource0100", nullptr, GlobalNapiTest::RemoveResource0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    InitPush3(desc);
    InitPush4(desc);
    InitPush5(desc);
    InitPush6(desc);
    InitPush7(desc);
    InitPush8(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}