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

#ifndef JSVM_XTS_NAPI_BIGINT_TEST_H
#define JSVM_XTS_NAPI_BIGINT_TEST_H

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

JSVM_Value TestCreateBigintInt64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintInt64Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintInt64Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintInt64Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintUint64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintUint64Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintUint64Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintWordsCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintWordsCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintWordsCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintWordsCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateBigintWordsCase05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintInt64Case06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintUint64Case06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintWordsCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintWordsCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintWordsCase03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintWordsCase04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetValueBigintWordsCase05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateAndGetBigIntProgramCase01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateAndGetBigIntProgramCase02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateAndGetBigIntProgramCase03(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_BIGINT_TEST_H
