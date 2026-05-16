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

#ifndef JSVM_XTS_NAPI_BASICDATATYPES_TEST_H
#define JSVM_XTS_NAPI_BASICDATATYPES_TEST_H

#include "jsvm.h"
#include "jsvm_common.h"
#include "jsvm_types.h"
#include "native_common.h"
#include "test_entry.h"
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

JSVM_Value TestCreateInt32Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt32Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt32Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt32Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateUint32Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateUint32Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateUint32Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateUint32Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt64Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt64Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateInt64Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDoubleCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDoubleCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDoubleCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateDoubleCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueUint32Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueInt32Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueInt64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueDoubleCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestBasicDataTypesCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestBasicDataTypesCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestBasicDataTypesCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestBasicDataTypesCase04(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_BASICDATATYPES_TEST_H
