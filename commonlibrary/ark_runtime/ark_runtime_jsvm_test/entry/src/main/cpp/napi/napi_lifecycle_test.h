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

#ifndef JSVM_XTS_NAPI_LIFECYCLE_TEST_H
#define JSVM_XTS_NAPI_LIFECYCLE_TEST_H

#include "jsvm.h"
#include "jsvm_common.h"
#include "native_common.h"
#include "test_entry.h"
#include "securec.h"
#include <cstdint>
#include <cstdio>
#include <malloc.h>
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

JSVM_Value TestOpenHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenHandleScopeCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenAndCloseHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenAndCloseHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenEscapableHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenEscapableHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenEscapableHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseEscapableHandleScopeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseEscapableHandleScopeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCloseEscapableHandleScopeCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestEscapeHandleCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestEscapeHandleCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestEscapeHandleCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestEscapeHandleCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestEscapeHandleCase05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenClosedEscapeCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestOpenClosedEscapeCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateReferenceCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateReferenceCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateReferenceCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteReferenceCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestDeleteReferenceCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceRefCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceRefCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceRefCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceUnrefCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceUnrefCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestReferenceUnrefCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetReferenceValueCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetReferenceValueCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHandleAndRefCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHandleAndRefCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestHandleAndRefCase03(JSVM_Env env, JSVM_CallbackInfo info);

#endif //JSVM_XTS_NAPI_LIFECYCLE_TEST_H
