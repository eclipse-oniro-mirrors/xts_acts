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

#ifndef HDF_ERRORCODE_ACTSHIDEMITCODETEST3_H
#define HDF_ERRORCODE_ACTSHIDEMITCODETEST3_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addHidEmitErrorCodeTest3(std::vector<napi_property_descriptor>& descData);
napi_value HidCreateDeviceKeyCodeTOOLFINGER(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLMOUSE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLLENS(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLQUINTTAP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeSTYLUS3(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeSTYLUS2(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLDOUBLETAP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLTRIPLETAP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeTOOLQUADTAP(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceKeyCodeWHEEL(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSZ(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSRX(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSRY(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSRZ(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSTHROTTLE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSRUDDER(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSWHEEL(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSGAS(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSBRAKE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT0X(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT0Y(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT1X(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT1Y(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT2X(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT2Y(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT3X(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSHAT3Y(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSDISTANCE(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSTILTX(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSTILTY(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSTOOLWIDTH(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSVOLUME(napi_env env, napi_callback_info info);
napi_value HidCreateDeviceABSMISC(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSHIDEMITCODETEST3_H