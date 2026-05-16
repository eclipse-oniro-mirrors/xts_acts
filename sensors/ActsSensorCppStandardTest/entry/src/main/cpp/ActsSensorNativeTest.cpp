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

#include "ActsSensorNativeTest.h"
#include <cinttypes>
#include <memory>
#include <mutex>
#include <sensors/oh_sensor.h>
#include <thread>

#undef LOG_TAG
#define LOG_TAG "ActsSensorNativeTest"

namespace {
constexpr Sensor_Type SENSOR_ID{ SENSOR_TYPE_AMBIENT_LIGHT };
constexpr Sensor_Type SECOND_SENSOR_ID{ SENSOR_TYPE_ROTATION_VECTOR };
constexpr Sensor_Type THIRD_SENSOR_ID{ SENSOR_TYPE_GAME_ROTATION_VECTOR };
constexpr uint32_t SENSOR_NAME_LENGTH_MAX = 64;
constexpr int64_t SENSOR_SAMPLE_PERIOD = 200000000;
constexpr int32_t SLEEP_TIME_MS = 1000;
constexpr int64_t INVALID_VALUE = -1;
constexpr float INVALID_RESOLUTION = -1.0F;
std::atomic_bool g_existAmbientLight{ false };
std::atomic_bool g_existGameRotationVector{ false };

void InitSensorFlags()
{
    static std::once_flag once;
    std::call_once(once, []() {
        uint32_t count = 0;
        int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
        if (ret != SENSOR_SUCCESS) {
            return;
        }
        Sensor_Info** sensors = OH_Sensor_CreateInfos(count);
        if (sensors == nullptr) {
            return;
        }
        ret = OH_Sensor_GetInfos(sensors, &count);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return;
        }
        for (uint32_t i = 0; i < count; ++i) {
            Sensor_Type sensorType;
            ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
            if (ret != SENSOR_SUCCESS) {
                continue;
            }
            if (sensorType == SENSOR_TYPE_AMBIENT_LIGHT) {
                g_existAmbientLight = true;
            }
            if (sensorType == THIRD_SENSOR_ID) {
                g_existGameRotationVector = true;
            }
        }
        OH_Sensor_DestroyInfos(sensors, count);
    });
}

void SensorDataCallbackImpl(Sensor_Event* event)
{
    if (event == nullptr) {
        return;
    }
    int64_t timestamp = INVALID_VALUE;
    OH_SensorEvent_GetTimestamp(event, &timestamp);
    Sensor_Type sensorType;
    OH_SensorEvent_GetType(event, &sensorType);
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_UNRELIABLE;
    OH_SensorEvent_GetAccuracy(event, &accuracy);
    float* data = nullptr;
    uint32_t length = 0;
    OH_SensorEvent_GetData(event, &data, &length);
}
} // namespace

namespace Acts {
namespace Sensor {

static int GetSensorInfosList(Sensor_Info*** outSensors, uint32_t* outCount);

static int ValidateSensorInfoFields(Sensor_Info** sensors, uint32_t count)
{
    for (uint32_t i = 0; i < count; ++i) {
        char sensorName[SENSOR_NAME_LENGTH_MAX] = {};
        uint32_t length = SENSOR_NAME_LENGTH_MAX;
        int32_t ret = OH_SensorInfo_GetName(sensors[i], sensorName, &length);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        char vendorName[SENSOR_NAME_LENGTH_MAX] = {};
        length = SENSOR_NAME_LENGTH_MAX;
        ret = OH_SensorInfo_GetVendorName(sensors[i], vendorName, &length);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        Sensor_Type sensorType;
        ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        float resolution = INVALID_RESOLUTION;
        ret = OH_SensorInfo_GetResolution(sensors[i], &resolution);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        int64_t minSamplePeriod = INVALID_VALUE;
        ret = OH_SensorInfo_GetMinSamplingInterval(sensors[i], &minSamplePeriod);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        int64_t maxSamplePeriod = INVALID_VALUE;
        ret = OH_SensorInfo_GetMaxSamplingInterval(sensors[i], &maxSamplePeriod);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
    }
    return 0;
}

int OHSensorGetInfos001()
{
    Sensor_Info** sensors = nullptr;
    uint32_t count = 0;
    int32_t ret = GetSensorInfosList(&sensors, &count);
    if (ret != 0) {
        return ret;
    }
    ret = ValidateSensorInfoFields(sensors, count);
    if (ret != 0) {
        return ret;
    }
    ret = OH_Sensor_DestroyInfos(sensors, count);
    if (ret != SENSOR_SUCCESS) {
        return ret;
    }
    return 0;
}

int OHSensorGetInfos002()
{
    Sensor_Info* sensors = nullptr;
    int32_t ret = OH_Sensor_GetInfos(&sensors, nullptr);
    if (ret == SENSOR_SUCCESS) {
        return -1;
    }
    return 0;
}

int OHSensorSubscribe001()
{
    InitSensorFlags();
    if (!g_existAmbientLight) {
        return 0;
    }
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, g_user);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
    ret = OH_Sensor_Unsubscribe(id, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    return (ret == SENSOR_SUCCESS) ? 0 : ret;
}

int OHSensorSubscribe002()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe003()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe004()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

static int SubscribeUnsubscribeSecondSensorImpl(Sensor_Info** sensors, uint32_t count)
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, g_user);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
    ret = OH_Sensor_Unsubscribe(id, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    OH_Sensor_DestroyInfos(sensors, count);
    return (ret == SENSOR_SUCCESS) ? 0 : ret;
}

static int DoSubscribeUnsubscribeSecondSensor(Sensor_Info** sensors, uint32_t count, bool* found)
{
    *found = false;
    for (uint32_t i = 0; i < count; ++i) {
        Sensor_Type sensorType;
        int32_t ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        if (sensorType != SECOND_SENSOR_ID) {
            continue;
        }
        *found = true;
        return SubscribeUnsubscribeSecondSensorImpl(sensors, count);
    }
    return 0;
}

int OHSensorSubscribe005()
{
    InitSensorFlags();
    if (!g_existGameRotationVector) {
        return 0;
    }
    Sensor_Info** sensors = nullptr;
    uint32_t count = 0;
    int32_t ret = GetSensorInfosList(&sensors, &count);
    if (ret != 0) {
        return ret;
    }
    bool found = false;
    ret = DoSubscribeUnsubscribeSecondSensor(sensors, count, &found);
    if (!found) {
        OH_Sensor_DestroyInfos(sensors, count);
    }
    return ret;
}

int OHSensorSubscribe006()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe007()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe008()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

static int GetSensorInfosList(Sensor_Info*** outSensors, uint32_t* outCount)
{
    uint32_t count = 0;
    int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
    if (ret != SENSOR_SUCCESS) {
        return ret;
    }
    Sensor_Info** sensors = OH_Sensor_CreateInfos(count);
    if (sensors == nullptr) {
        return -1;
    }
    ret = OH_Sensor_GetInfos(sensors, &count);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    *outSensors = sensors;
    *outCount = count;
    return 0;
}

static int SubscribeUnsubscribeThirdSensorImpl(Sensor_Info** sensors, uint32_t count)
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, g_user);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        OH_Sensor_DestroyInfos(sensors, count);
        return ret;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
    ret = OH_Sensor_Unsubscribe(id, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    OH_Sensor_DestroyInfos(sensors, count);
    return (ret == SENSOR_SUCCESS) ? 0 : ret;
}

static int DoSubscribeUnsubscribeThirdSensor(Sensor_Info** sensors, uint32_t count, bool* found)
{
    *found = false;
    for (uint32_t i = 0; i < count; ++i) {
        Sensor_Type sensorType;
        int32_t ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        if (ret != SENSOR_SUCCESS) {
            OH_Sensor_DestroyInfos(sensors, count);
            return ret;
        }
        if (sensorType != THIRD_SENSOR_ID) {
            continue;
        }
        *found = true;
        return SubscribeUnsubscribeThirdSensorImpl(sensors, count);
    }
    return 0;
}

int OHSensorSubscribe009()
{
    InitSensorFlags();
    if (!g_existGameRotationVector) {
        return 0;
    }
    Sensor_Info** sensors = nullptr;
    uint32_t count = 0;
    int32_t ret = GetSensorInfosList(&sensors, &count);
    if (ret != 0) {
        return ret;
    }
    bool found = false;
    ret = DoSubscribeUnsubscribeThirdSensor(sensors, count, &found);
    if (!found) {
        OH_Sensor_DestroyInfos(sensors, count);
    }
    return ret;
}

int OHSensorSubscribe010()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe011()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe012()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe013()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    Sensor_Subscriber* g_user2 = OH_Sensor_CreateSubscriber();
    ret = OH_SensorSubscriber_SetCallback(g_user2, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user2);
        return ret;
    }
    id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user2);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user2);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user2);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscribe014()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    Sensor_Subscriber* g_user2 = OH_Sensor_CreateSubscriber();
    ret = OH_SensorSubscriber_SetCallback(g_user2, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user2);
        return ret;
    }
    id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        OH_Sensor_DestroySubscriber(g_user2);
        return ret;
    }
    ret = OH_Sensor_Subscribe(id, nullptr, g_user2);
    OH_Sensor_DestroySubscriptionId(id);
    OH_Sensor_DestroySubscriber(g_user2);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe001()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe002()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(id, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe003()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe004()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(id, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe005()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriber(g_user);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorUnsubscribe006()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    if (ret != SENSOR_SUCCESS) {
        OH_Sensor_DestroySubscriptionId(id);
        return ret;
    }
    ret = OH_Sensor_Unsubscribe(id, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionIdSetType001()
{
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, SENSOR_ID);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionIdSetType002()
{
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, SECOND_SENSOR_ID);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionIdSetType003()
{
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, THIRD_SENSOR_ID);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionIdGetType001()
{
    Sensor_Type type;
    int32_t ret = OH_SensorSubscriptionId_GetType(nullptr, &type);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionIdGetType002()
{
    Sensor_SubscriptionId* id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_GetType(id, nullptr);
    OH_Sensor_DestroySubscriptionId(id);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionAttributeSetSamplingInterval001()
{
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(nullptr, SENSOR_SAMPLE_PERIOD);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionAttributeSetSamplingInterval002()
{
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, INVALID_VALUE);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionAttributeGetSamplingInterval001()
{
    int64_t samplingInterval = 0;
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(nullptr, &samplingInterval);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriptionAttributeGetSamplingInterval002()
{
    Sensor_SubscriptionAttribute* attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(attr, nullptr);
    OH_Sensor_DestroySubscriptionAttribute(attr);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriberSetCallback001()
{
    int32_t ret = OH_SensorSubscriber_SetCallback(nullptr, SensorDataCallbackImpl);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriberSetCallback002()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, nullptr);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriberGetCallback001()
{
    Sensor_EventCallback callback;
    int32_t ret = OH_SensorSubscriber_GetCallback(nullptr, &callback);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

int OHSensorSubscriberGetCallback002()
{
    Sensor_Subscriber* g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_GetCallback(g_user, nullptr);
    OH_Sensor_DestroySubscriber(g_user);
    if (ret != SENSOR_PARAMETER_ERROR) {
        return ret;
    }
    return 0;
}

} // namespace Sensor
} // namespace Acts
