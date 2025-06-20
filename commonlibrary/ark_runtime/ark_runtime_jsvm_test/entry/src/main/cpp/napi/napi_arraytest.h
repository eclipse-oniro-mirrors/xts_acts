/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

#ifndef ARK_RUNTIME_JSVM_TEST_NAPI_ARRAYTEST_H
#define ARK_RUNTIME_JSVM_TEST_NAPI_ARRAYTEST_H
#include "jsvm.h"
#include "jsvm_common.h"
#include "jsvm_types.h"
#include "native_common.h"
#include "test_entry.h"
#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <thread>
#include <uv.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

JSVM_Value TestCreateArrayWithLength_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateArrayWithLength_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateArrayWithLength_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateArrayWithLength_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetArrayLength_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetArrayLength_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetArrayLength_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetArrayLength_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateTypedarray_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetTypedarrayInfo_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetTypedarrayInfo_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDataview_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetDataview_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetDataview_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestSetElement_07(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetElement_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHasElement_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteElement_06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypedarrayProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypedarrayProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayDataviewProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayDataviewProcessSteps_02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeArrayAndDataviewProcessSteps_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestTypeArraySetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArraySetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayGetMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayDeleteMultipleTimes_01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestArrayDeleteMultipleTimes_02(JSVM_Env env, JSVM_CallbackInfo info);
#endif //ARK_RUNTIME_JSVM_TEST_NAPI_ARRAYTEST_H