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

#ifndef GRAPHICS2DTESTAPI20_COLORSPACENAMETEST_H
#define GRAPHICS2DTESTAPI20_COLORSPACENAMETEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void addColorSpaceNameTest(std::vector<napi_property_descriptor>& descData);
napi_value OHCreateColorSpaceFromNameDCIP3(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYP3(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT709(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT601EBU(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT601SMPTEC(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT2020HLG(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT2020PQ(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameP3HLG(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameP3PQ(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameADOBERGBLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYP3LIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameSRGBLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT709LIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT601EBULIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT601SMPTECLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT2020HLGLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameBT2020PQLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameP3HLGLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameP3PQLIMIT(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameLINEARP3(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameLINEARSRGB(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameLINEARBT709(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameLINEARBT2020(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYSRGB(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYP3SRGB(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYP3HLG(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameDISPLAYP3PQ(napi_env env, napi_callback_info info);
napi_value OHCreateColorSpaceFromNameCUSTOM(napi_env env, napi_callback_info info);
#endif //GRAPHICS2DTESTAPI20_COLORSPACENAMETEST_H
