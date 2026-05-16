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
#ifndef AUDIOMIDITEST_AUDIOTEST_H
#define AUDIOMIDITEST_AUDIOTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include "syscap_ndk.h"
#include "ohmidi/native_midi.h"
#include "ohmidi/native_midi_base.h"

napi_value OHMIDIClientCreateInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientCreateTooManyClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientDestroyInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetDeviceCountInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetDeviceCountInvalidCount(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetDeviceInfosInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetDeviceInfosInvalidInfos(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetDeviceInfosInvalidDeviceCount(napi_env env, napi_callback_info info);
napi_value OHMIDIClientOpenDeviceInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientOpenDeviceInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIClientOpenBLEDeviceInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientCloseDeviceInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientCloseDeviceInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortCountInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortCountInvalidDeviceId(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortCountInvalidCount(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortInfosInvalidClient(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortInfosInvalidDeviceId(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortInfosInvalidInfos(napi_env env, napi_callback_info info);
napi_value OHMIDIClientGetPortInfosInvalidPortCount(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceOpenInputPortInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceOpenOutputPortInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceCloseInputPortInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceCloseOutputPortInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceSendInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceSendSysExInvalidDevice(napi_env env, napi_callback_info info);
napi_value OHMIDIDeviceFlushOutputPortInvalidDevice(napi_env env, napi_callback_info info);

#endif // AUDIOMIDITEST_AUDIOTEST_H
