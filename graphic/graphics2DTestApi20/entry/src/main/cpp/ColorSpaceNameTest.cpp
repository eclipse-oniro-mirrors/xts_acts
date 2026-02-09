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
#include "ColorSpaceNameTest.h"
#include "native_color_space_manager/native_color_space_manager.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
void addColorSpaceNameTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHCreateColorSpaceFromNameDCIP3", nullptr, OHCreateColorSpaceFromNameDCIP3,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYP3", nullptr, OHCreateColorSpaceFromNameDISPLAYP3,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT709", nullptr, OHCreateColorSpaceFromNameBT709,
             nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT601EBU", nullptr, OHCreateColorSpaceFromNameBT601EBU,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT601SMPTEC", nullptr, OHCreateColorSpaceFromNameBT601SMPTEC,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT2020HLG", nullptr, OHCreateColorSpaceFromNameBT2020HLG,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT2020PQ", nullptr, OHCreateColorSpaceFromNameBT2020PQ,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameP3HLG", nullptr, OHCreateColorSpaceFromNameP3HLG,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameP3PQ", nullptr, OHCreateColorSpaceFromNameP3PQ,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameADOBERGBLIMIT", nullptr, OHCreateColorSpaceFromNameADOBERGBLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYP3LIMIT", nullptr, OHCreateColorSpaceFromNameDISPLAYP3LIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameSRGBLIMIT", nullptr, OHCreateColorSpaceFromNameSRGBLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT709LIMIT", nullptr, OHCreateColorSpaceFromNameBT709LIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT601EBULIMIT", nullptr, OHCreateColorSpaceFromNameBT601EBULIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT601SMPTECLIMIT", nullptr,
                        OHCreateColorSpaceFromNameBT601SMPTECLIMIT, nullptr, nullptr, nullptr, napi_default, nullptr});
}
void addColorSpaceNameTest(std::vector<napi_property_descriptor>& descData)
{
    addColorSpaceNameTest1(descData);
    descData.push_back({"OHCreateColorSpaceFromNameBT2020HLGLIMIT", nullptr, OHCreateColorSpaceFromNameBT2020HLGLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameBT2020PQLIMIT", nullptr, OHCreateColorSpaceFromNameBT2020PQLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameP3HLGLIMIT", nullptr, OHCreateColorSpaceFromNameP3HLGLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameP3PQLIMIT", nullptr, OHCreateColorSpaceFromNameP3PQLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameLINEARP3", nullptr, OHCreateColorSpaceFromNameLINEARP3,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameLINEARSRGB", nullptr, OHCreateColorSpaceFromNameLINEARSRGB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameLINEARBT709", nullptr, OHCreateColorSpaceFromNameLINEARBT709,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameLINEARBT2020", nullptr, OHCreateColorSpaceFromNameLINEARBT2020,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYSRGB", nullptr, OHCreateColorSpaceFromNameDISPLAYSRGB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYP3SRGB", nullptr, OHCreateColorSpaceFromNameDISPLAYP3SRGB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYP3HLG", nullptr, OHCreateColorSpaceFromNameDISPLAYP3HLG,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameDISPLAYP3PQ", nullptr, OHCreateColorSpaceFromNameDISPLAYP3PQ,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHCreateColorSpaceFromNameCUSTOM", nullptr, OHCreateColorSpaceFromNameCUSTOM,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}
napi_value OHCreateColorSpaceFromNameDCIP3(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DCI_P3;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameDISPLAYP3(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_P3;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT709(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT709;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT601EBU(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT601_EBU;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT601SMPTEC(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT601_SMPTE_C;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT2020HLG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT2020_HLG;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT2020PQ(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT2020_PQ;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameP3HLG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::P3_HLG;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameP3PQ(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::P3_PQ;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameADOBERGBLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::ADOBE_RGB_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}
napi_value OHCreateColorSpaceFromNameDISPLAYP3LIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_P3_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameSRGBLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::SRGB_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}


napi_value OHCreateColorSpaceFromNameBT709LIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT709_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT601EBULIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT601_EBU_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT601SMPTECLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT601_SMPTE_C_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT2020HLGLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT2020_HLG_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameBT2020PQLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::BT2020_PQ_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameP3HLGLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::P3_HLG_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameP3PQLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::P3_PQ_LIMIT;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameLINEARP3(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::LINEAR_P3;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameLINEARSRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::LINEAR_SRGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameLINEARBT709(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::LINEAR_BT709;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameLINEARBT2020(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::LINEAR_BT2020;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameDISPLAYSRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_SRGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameDISPLAYP3SRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_P3_SRGB;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameDISPLAYP3HLG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_P3_HLG;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameDISPLAYP3PQ(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::DISPLAY_P3_PQ;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value OHCreateColorSpaceFromNameCUSTOM(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeColorSpaceManager *nativeColorSpace = nullptr;
    ColorSpaceName colorSpaceName = ColorSpaceName::CUSTOM;
    nativeColorSpace = OH_NativeColorSpaceManager_CreateFromName(colorSpaceName);
    colorSpaceName = static_cast<ColorSpaceName>(OH_NativeColorSpaceManager_GetColorSpaceName(nativeColorSpace));
    OH_NativeColorSpaceManager_Destroy(nativeColorSpace);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}
