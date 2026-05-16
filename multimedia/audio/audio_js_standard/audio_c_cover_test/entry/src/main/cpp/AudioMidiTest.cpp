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
#include "AudioMidiTest.h"
#include <iostream>
#include <cstdlib>
#include <cstdint>
#include <cstring>

#define SUCCESS 0
#define FAIL (-1)
#define CLIENT_LIMIT 32

using namespace std;

static void OnMIDIDeviceChange(void *userData, OH_MIDIDeviceChangeAction action, OH_MIDIDeviceInformation deviceInfo)
{
    (void)userData;
    (void)action;
    (void)deviceInfo;
}

static void OnMIDIError(void *userData, OH_MIDIStatusCode code)
{
    (void)userData;
    (void)code;
}

static void OnMIDIReceived(void *userData, const OH_MIDIEvent *events, size_t eventCount)
{
    (void)userData;
    (void)events;
    (void)eventCount;
}

static void OnMIDIDeviceOpened(void *userData,
                               bool opened,
                               OH_MIDIDevice *device,
                               OH_MIDIDeviceInformation info)
{
    (void)userData;
    (void)opened;
    (void)device;
    (void)info;
}

napi_value OHMIDIClientCreateInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret = OH_MIDIClient_Create(nullptr, callbacks, userData);
        if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientCreateTooManyClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        vector<OH_MIDIClient *> clientVec;
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        for (int32_t i = 0; i < CLIENT_LIMIT; i++) {
            ret = OH_MIDIClient_Create(&client, callbacks, userData);
            if (ret == OH_MIDI_STATUS_OK) {
                clientVec.push_back(client);
            }
        }

        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_TOO_MANY_CLIENTS) {
            returnValue = SUCCESS;
        }

        for (auto it: clientVec) {
            ret = OH_MIDIClient_Destroy(it);
            if (ret != OH_MIDI_STATUS_OK) {
                returnValue = FAIL;
            }
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientDestroyInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDIStatusCode ret = OH_MIDIClient_Destroy(nullptr);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetDeviceCountInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        size_t count = 0;
        OH_MIDIStatusCode ret = OH_MIDIClient_GetDeviceCount(nullptr, &count);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT && count == 0) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetDeviceCountInvalidCount(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            ret = OH_MIDIClient_GetDeviceCount(client, nullptr);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetDeviceInfosInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDIDeviceInformation* infos = (OH_MIDIDeviceInformation*)malloc(sizeof(OH_MIDIDeviceInformation));
        size_t capacity = 0;
        size_t actualDeviceCount = 0;
        OH_MIDIStatusCode ret = OH_MIDIClient_GetDeviceInfos(nullptr, infos, capacity, &actualDeviceCount);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
        free(infos);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetDeviceInfosInvalidInfos(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            size_t capacity = 0;
            size_t actualDeviceCount = 0;
            OH_MIDIStatusCode ret = OH_MIDIClient_GetDeviceInfos(client, nullptr, capacity, &actualDeviceCount);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetDeviceInfosInvalidDeviceCount(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            OH_MIDIDeviceInformation* infos = (OH_MIDIDeviceInformation*)malloc(sizeof(OH_MIDIDeviceInformation));
            size_t capacity = 0;
            OH_MIDIStatusCode ret = OH_MIDIClient_GetDeviceInfos(client, infos, capacity, nullptr);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
            free(infos);
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientOpenDeviceInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            OH_MIDIDevice* device = nullptr;

            ret = OH_MIDIClient_OpenDevice(nullptr, deviceId, &device);
            if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientOpenDeviceInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            ret = OH_MIDIClient_OpenDevice(client, deviceId, nullptr);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientOpenBLEDeviceInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        string deviceAddr = "AA:BB:CC:DD:EE:FF";
        void* userData = nullptr;
        OH_MIDIStatusCode ret = OH_MIDIClient_OpenBLEDevice(nullptr, deviceAddr.c_str(), OnMIDIDeviceOpened, userData);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientCloseDeviceInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDIDevice* device = nullptr;
        OH_MIDIStatusCode ret = OH_MIDIClient_CloseDevice(nullptr, device);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientCloseDeviceInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            OH_MIDIStatusCode ret = OH_MIDIClient_CloseDevice(client, nullptr);
            if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortCountInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        int64_t deviceId = 0;
        size_t count = 0;
        OH_MIDIStatusCode ret = OH_MIDIClient_GetPortCount(nullptr, deviceId, &count);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortCountInvalidDeviceId(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            size_t count = 0;
            ret = OH_MIDIClient_GetPortCount(client, deviceId, &count);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortCountInvalidCount(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            ret = OH_MIDIClient_GetPortCount(client, deviceId, nullptr);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortInfosInvalidClient(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        int64_t deviceId = 0;
        OH_MIDIPortInformation* infos = (OH_MIDIPortInformation*)malloc(sizeof(OH_MIDIPortInformation));
        size_t capacity = 0;
        size_t actualPortCount = 0;

        OH_MIDIStatusCode ret = OH_MIDIClient_GetPortInfos(nullptr, deviceId, infos, capacity, &actualPortCount);
        if (ret == OH_MIDI_STATUS_INVALID_CLIENT) {
            returnValue = SUCCESS;
        }
        free(infos);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortInfosInvalidDeviceId(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            OH_MIDIPortInformation* infos = (OH_MIDIPortInformation*)malloc(sizeof(OH_MIDIPortInformation));
            size_t capacity = 0;
            size_t actualPortCount = 0;

            ret = OH_MIDIClient_GetPortInfos(client, deviceId, infos, capacity, &actualPortCount);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
            free(infos);
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortInfosInvalidInfos(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            size_t capacity = 0;
            size_t actualPortCount = 0;

            ret = OH_MIDIClient_GetPortInfos(client, deviceId, nullptr, capacity, &actualPortCount);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIClientGetPortInfosInvalidPortCount(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDICallbacks callbacks = {.onDeviceChange = OnMIDIDeviceChange,
                                      .onError = OnMIDIError};
        void* userData = nullptr;
        OH_MIDIStatusCode ret;
        OH_MIDIClient* client = nullptr;
        ret = OH_MIDIClient_Create(&client, callbacks, userData);
        if (ret == OH_MIDI_STATUS_OK && client != nullptr) {
            int64_t deviceId = 0;
            OH_MIDIPortInformation* infos = (OH_MIDIPortInformation*)malloc(sizeof(OH_MIDIPortInformation));
            size_t capacity = 0;

            ret = OH_MIDIClient_GetPortInfos(client, deviceId, infos, capacity, nullptr);
            if (ret == OH_MIDI_STATUS_GENERIC_INVALID_ARGUMENT) {
                returnValue = SUCCESS;
            }
            free(infos);
        }
        OH_MIDIClient_Destroy(client);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceOpenInputPortInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDIPortDescriptor descriptor = {.portIndex = 0,
                                            .protocol = OH_MIDI_PROTOCOL_1_0};
        void *userData = nullptr;

        OH_MIDIStatusCode ret = OH_MIDIDevice_OpenInputPort(nullptr, descriptor, OnMIDIReceived, userData);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceOpenOutputPortInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        OH_MIDIPortDescriptor descriptor = {.portIndex = 0,
                                            .protocol = OH_MIDI_PROTOCOL_2_0};

        OH_MIDIStatusCode ret = OH_MIDIDevice_OpenOutputPort(nullptr, descriptor);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceCloseInputPortInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        uint32_t portIndex = 0;
        OH_MIDIStatusCode ret = OH_MIDIDevice_CloseInputPort(nullptr, portIndex);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceCloseOutputPortInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        uint32_t portIndex = 0;
        OH_MIDIStatusCode ret = OH_MIDIDevice_CloseOutputPort(nullptr, portIndex);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceSendInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        uint32_t portIndex = 0;
        OH_MIDIEvent events;
        uint32_t eventCount = 0;
        uint32_t eventsWritten = 0;
        OH_MIDIStatusCode ret = OH_MIDIDevice_Send(nullptr, portIndex, &events, eventCount, &eventsWritten);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceSendSysExInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        uint32_t portIndex = 0;
        uint8_t* data = (uint8_t*)malloc(100);
        uint32_t byteSize = 100;

        OH_MIDIStatusCode ret = OH_MIDIDevice_SendSysEx(nullptr, portIndex, data, byteSize);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
        free(data);
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHMIDIDeviceFlushOutputPortInvalidDevice(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    if (canIUse("SystemCapability.Multimedia.Audio.MIDI")) {
        uint32_t portIndex = 0;

        OH_MIDIStatusCode ret = OH_MIDIDevice_FlushOutputPort(nullptr, portIndex);
        if (ret == OH_MIDI_STATUS_INVALID_DEVICE_HANDLE) {
            returnValue = SUCCESS;
        }
    } else {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHMIDIClientCreateInvalidClient", nullptr, OHMIDIClientCreateInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientCreateTooManyClient", nullptr, OHMIDIClientCreateTooManyClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientDestroyInvalidClient", nullptr, OHMIDIClientDestroyInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetDeviceCountInvalidClient", nullptr, OHMIDIClientGetDeviceCountInvalidClient, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetDeviceCountInvalidCount", nullptr, OHMIDIClientGetDeviceCountInvalidCount, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetDeviceInfosInvalidClient", nullptr, OHMIDIClientGetDeviceInfosInvalidClient, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetDeviceInfosInvalidInfos", nullptr, OHMIDIClientGetDeviceInfosInvalidInfos, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetDeviceInfosInvalidDeviceCount", nullptr, OHMIDIClientGetDeviceInfosInvalidDeviceCount,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientOpenDeviceInvalidClient", nullptr, OHMIDIClientOpenDeviceInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientOpenDeviceInvalidDevice", nullptr, OHMIDIClientOpenDeviceInvalidDevice, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientOpenBLEDeviceInvalidClient", nullptr, OHMIDIClientOpenBLEDeviceInvalidClient, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientCloseDeviceInvalidClient", nullptr, OHMIDIClientCloseDeviceInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientCloseDeviceInvalidDevice", nullptr, OHMIDIClientCloseDeviceInvalidDevice, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortCountInvalidClient", nullptr, OHMIDIClientGetPortCountInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortCountInvalidDeviceId", nullptr, OHMIDIClientGetPortCountInvalidDeviceId, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortCountInvalidCount", nullptr, OHMIDIClientGetPortCountInvalidCount, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortInfosInvalidClient", nullptr, OHMIDIClientGetPortInfosInvalidClient, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortInfosInvalidDeviceId", nullptr, OHMIDIClientGetPortInfosInvalidDeviceId, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortInfosInvalidInfos", nullptr, OHMIDIClientGetPortInfosInvalidInfos, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIClientGetPortInfosInvalidPortCount", nullptr, OHMIDIClientGetPortInfosInvalidPortCount, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIDeviceOpenInputPortInvalidDevice", nullptr, OHMIDIDeviceOpenInputPortInvalidDevice, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIDeviceOpenOutputPortInvalidDevice", nullptr, OHMIDIDeviceOpenOutputPortInvalidDevice, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIDeviceCloseInputPortInvalidDevice", nullptr, OHMIDIDeviceCloseInputPortInvalidDevice, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIDeviceCloseOutputPortInvalidDevice", nullptr, OHMIDIDeviceCloseOutputPortInvalidDevice, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OHMIDIDeviceSendInvalidDevice", nullptr, OHMIDIDeviceSendInvalidDevice, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIDeviceSendSysExInvalidDevice", nullptr, OHMIDIDeviceSendSysExInvalidDevice, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHMIDIDeviceFlushOutputPortInvalidDevice", nullptr, OHMIDIDeviceFlushOutputPortInvalidDevice, nullptr,
         nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "midi",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}