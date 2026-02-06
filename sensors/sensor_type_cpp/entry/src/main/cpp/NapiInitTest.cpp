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
#include <cstdio>
#include <cstdint>
#include <sensors/oh_sensor.h>
#include <sensors/vibrator.h>
#include <hilog/log.h>
#include "napi/native_api.h"

static napi_value OH_Sensor_GetInfosTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 0;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Result ret = OH_Sensor_GetInfos(sensors, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_ACCELEROMETER;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_GYROSCOPE;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest3(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_MAGNETIC_FIELD;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest4(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_BAROMETER;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest5(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_HALL;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest6(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_PROXIMITY;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest7(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_ORIENTATION;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest8(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_GRAVITY;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest9(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_LINEAR_ACCELERATION;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest10(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_PEDOMETER_DETECTION;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest11(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_PEDOMETER;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_TypeTest12(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t count = 1;
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    Sensor_Type sensorType = SENSOR_TYPE_HEART_RATE;
    int32_t ret = OH_SensorInfo_GetType(sensors[0], &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetNameTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetName(nullptr, nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetVendorNameTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetVendorName(nullptr, nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetTypeTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetType(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetResolutionTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetResolution(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetMinSamplingIntervalTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetMinSamplingInterval(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorInfo_GetMaxSamplingIntervalTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorInfo_GetMaxSamplingInterval(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorEvent_GetTypeTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorEvent_GetType(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorEvent_GetTimestampTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorEvent_GetTimestamp(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorEvent_GetAccuracyTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorEvent_GetAccuracy(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorEvent_GetDataTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_SensorEvent_GetData(nullptr, nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriptionIdTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_Sensor_DestroySubscriptionId(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriptionIdTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_Sensor_DestroySubscriptionId(id);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorSubscriptionId_GetTypeTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    Sensor_Type sensorType = SENSOR_TYPE_HEART_RATE;
    int32_t ret = OH_SensorSubscriptionId_GetType(id, &sensorType);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriptionAttributeTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionAttribute *attribute = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_Sensor_DestroySubscriptionAttribute(attribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriptionAttributeTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_Sensor_DestroySubscriptionAttribute(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorSubscriptionAttribute_GetSamplingIntervalTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionAttribute *attribute = OH_Sensor_CreateSubscriptionAttribute();
    int64_t samplingInterval = 0;
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(attribute, &samplingInterval);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriberTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Subscriber *user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_Sensor_DestroySubscriber(user);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_DestroySubscriberTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_Sensor_DestroySubscriber(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_SensorSubscriber_GetCallbackTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Subscriber *user = OH_Sensor_CreateSubscriber();
    Sensor_EventCallback callback;
    OH_SensorSubscriber_SetCallback(user, callback);
    int32_t ret = OH_SensorSubscriber_GetCallback(user, &callback);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_UNKNOWN;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_ALARM;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest3(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_RING;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest4(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_NOTIFICATION;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest5(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_COMMUNICATION;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest6(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_TOUCH;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest7(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_MEDIA;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest8(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_PHYSICAL_FEEDBACK;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest9(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_SIMULATED_REALITY;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Vibrator_AttributeTest10(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t duration = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_MAX;
    int32_t ret = OH_Vibrator_PlayVibration(duration, vibrateAttribute);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_AccuracyTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_LOW;
    int32_t ret = OH_SensorEvent_GetAccuracy(nullptr, &accuracy);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_AccuracyTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_MEDIUM;
    int32_t ret = OH_SensorEvent_GetAccuracy(nullptr, &accuracy);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Sensor_AccuracyTest3(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_HIGH;
    int32_t ret = OH_SensorEvent_GetAccuracy(nullptr, &accuracy);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_SubscribeTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    Sensor_SubscriptionAttribute *attribute = OH_Sensor_CreateSubscriptionAttribute();
    Sensor_Subscriber *user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_Sensor_Subscribe(id, attribute, user);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Sensor_UnsubscribeTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    Sensor_Subscriber *user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_Sensor_Unsubscribe(id, user);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Vibrator_PlayVibrationCustomTest1(napi_env env, napi_callback_info info)
{
    napi_value result;
    Vibrator_FileDescription fileDescription;
    fileDescription.fd = -1;
    Vibrator_Attribute vibrateAttribute;
    int32_t ret = OH_Vibrator_PlayVibrationCustom(fileDescription, vibrateAttribute);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testSensor_typeNdkTest480", "ret ====>  %{public}d", ret);
    if (ret == UNSUPPORTED) {
        ret = PARAMETER_ERROR;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Vibrator_PlayVibrationCustomTest2(napi_env env, napi_callback_info info)
{
    napi_value result;
    Vibrator_FileDescription fileDescription;
    fileDescription.fd = 1;
    fileDescription.length = 1;
    fileDescription.offset = 1;
    Vibrator_Attribute vibrateAttribute;
    vibrateAttribute.usage = VIBRATOR_USAGE_ALARM;
    int32_t ret = OH_Vibrator_PlayVibrationCustom(fileDescription, vibrateAttribute);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testSensor_typeNdkTest490", "ret ====>  %{public}d", ret);
    if (ret == UNSUPPORTED) {
        ret = DEVICE_OPERATION_FAILED;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PERMISSION_DENIEDTest(napi_env env, napi_callback_info info)
{
    napi_value result;
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_HIGH;
    int32_t ret = OH_SensorEvent_GetAccuracy(nullptr, &accuracy);
    napi_create_int32(env, ret == PERMISSION_DENIED ? 1: 0, &result);
    return result;
}

napi_property_descriptor desc[] = {
    {"ohSensorGetInfosTest", nullptr, OH_Sensor_GetInfosTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest1", nullptr, Sensor_TypeTest1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest2", nullptr, Sensor_TypeTest2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest3", nullptr, Sensor_TypeTest3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest4", nullptr, Sensor_TypeTest4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest5", nullptr, Sensor_TypeTest5, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest6", nullptr, Sensor_TypeTest6, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest7", nullptr, Sensor_TypeTest7, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest8", nullptr, Sensor_TypeTest8, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest9", nullptr, Sensor_TypeTest9, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest10", nullptr, Sensor_TypeTest10, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest11", nullptr, Sensor_TypeTest11, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_TypeTest12", nullptr, Sensor_TypeTest12, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetNameTest", nullptr, OH_SensorInfo_GetNameTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetVendorNameTest", nullptr, OH_SensorInfo_GetVendorNameTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetTypeTest", nullptr, OH_SensorInfo_GetTypeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetResolutionTest", nullptr, OH_SensorInfo_GetResolutionTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetMinSamplingIntervalTest", nullptr, OH_SensorInfo_GetMinSamplingIntervalTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorInfo_GetMaxSamplingIntervalTest", nullptr, OH_SensorInfo_GetMaxSamplingIntervalTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorEvent_GetTypeTest", nullptr, OH_SensorEvent_GetTypeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorEvent_GetTimestampTest", nullptr, OH_SensorEvent_GetTimestampTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorEvent_GetAccuracyTest", nullptr, OH_SensorEvent_GetAccuracyTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorEvent_GetDataTest", nullptr, OH_SensorEvent_GetDataTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriptionIdTest1", nullptr, OH_Sensor_DestroySubscriptionIdTest1,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriptionIdTest2", nullptr, OH_Sensor_DestroySubscriptionIdTest2,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorSubscriptionId_GetTypeTest", nullptr, OH_SensorSubscriptionId_GetTypeTest,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriptionAttributeTest1", nullptr, OH_Sensor_DestroySubscriptionAttributeTest1,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriptionAttributeTest2", nullptr, OH_Sensor_DestroySubscriptionAttributeTest2,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorSubscriptionAttribute_GetSamplingIntervalTest", nullptr,
        OH_SensorSubscriptionAttribute_GetSamplingIntervalTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriberTest1", nullptr, OH_Sensor_DestroySubscriberTest1,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_DestroySubscriberTest2", nullptr, OH_Sensor_DestroySubscriberTest2,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensorSubscriber_GetCallbackTest", nullptr, OH_SensorSubscriber_GetCallbackTest,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest1", nullptr, Vibrator_AttributeTest1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest2", nullptr, Vibrator_AttributeTest2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest3", nullptr, Vibrator_AttributeTest3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest4", nullptr, Vibrator_AttributeTest4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest5", nullptr, Vibrator_AttributeTest5, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest6", nullptr, Vibrator_AttributeTest6, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest7", nullptr, Vibrator_AttributeTest7, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest8", nullptr, Vibrator_AttributeTest8, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest9", nullptr, Vibrator_AttributeTest9, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_AttributeTest10", nullptr, Vibrator_AttributeTest10, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_AccuracyTest1", nullptr, Sensor_AccuracyTest1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_AccuracyTest2", nullptr, Sensor_AccuracyTest2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_AccuracyTest3", nullptr, Sensor_AccuracyTest3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_SubscribeTest", nullptr, OH_Sensor_SubscribeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"sensor_UnsubscribeTest", nullptr, OH_Sensor_UnsubscribeTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_PlayVibrationCustomTest1", nullptr, OH_Vibrator_PlayVibrationCustomTest1,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"vibrator_PlayVibrationCustomTest2", nullptr, OH_Vibrator_PlayVibrationCustomTest2,
        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"permission_deniedTest", nullptr, PERMISSION_DENIEDTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "sensorNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }