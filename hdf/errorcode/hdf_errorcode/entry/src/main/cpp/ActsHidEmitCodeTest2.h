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

#ifndef HDF_ERRORCODE_ACTSHIDEMITCODETEST2_H
#define HDF_ERRORCODE_ACTSHIDEMITCODETEST2_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addHidEmitErrorCodeTest2(std::vector<napi_property_descriptor>& descData);
napi_value HidCreateDeviceKeyCodeKEYNUMPAD8(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPAD9(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeNUMPADDIVIDE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADADD(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADDOT(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADSYSRQ(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYNUMPADDELETE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYMUTE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYVOLUMEDOWN(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYVOLUMEUP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeKEYBRIGHTNESSUP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN0(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN1(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN2(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN3(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN4(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN5(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN6(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN7(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN8(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBIN9(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINLEFT(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINMIDDLE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINLEFT(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINSIDE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINEXTRA(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINFORWARD(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINBACKWARD(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINTASK(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINTOOLBRUSH(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINTOOLPENCIL(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeBINTOOLAIRBRUSH(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSHIDEMITCODETEST2_H