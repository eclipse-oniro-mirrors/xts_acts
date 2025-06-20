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

#ifndef JSVM_XTS_NAPI_FUNCTIONCALL_TEST_H
#define JSVM_XTS_NAPI_FUNCTIONCALL_TEST_H

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


JSVM_Value TestCallFunction01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction07(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction08(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCallFunction09(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestCreateFunction06(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetCbInfo01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetCbInfo02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetCbInfo03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetCbInfo04(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestGetCbInfo05(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsFunction01(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsFunction02(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsFunction03(JSVM_Env env, JSVM_CallbackInfo info);
JSVM_Value TestIsFunction04(JSVM_Env env, JSVM_CallbackInfo info);
#endif //JSVM_XTS_NAPI_FUNCTIONCALL_TEST_H
