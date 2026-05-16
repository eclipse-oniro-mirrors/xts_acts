/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

#include <cinttypes>
#include <memory>
#include <gtest/gtest.h>
#include <thread>

#include "accesstoken_kit.h"
#include "nativetoken_kit.h"
#include "token_setproc.h"

#include "oh_sensor.h"
#include "sensor_errors.h"

#undef LOG_TAG
#define LOG_TAG "SensorAgentTest"

namespace OHOS {
namespace Sensors {
using namespace testing::ext;
using namespace OHOS::HiviewDFX;

namespace {
constexpr Sensor_Type SENSOR_ID { SENSOR_TYPE_AMBIENT_LIGHT };
constexpr Sensor_Type SECOND_SENSOR_ID { SENSOR_TYPE_ROTATION_VECTOR };
constexpr Sensor_Type THIRD_SENSOR_ID { SENSOR_TYPE_GAME_ROTATION_VECTOR };
constexpr uint32_t SENSOR_NAME_LENGTH_MAX = 64;
constexpr int64_t SENSOR_SAMPLE_PERIOD = 200000000;
constexpr int32_t SLEEP_TIME_MS = 1000;
constexpr int64_t INVALID_VALUE = -1;
constexpr float INVALID_RESOLUTION = -1.0F;
Sensor_Subscriber *g_user = nullptr;
Sensor_Subscriber *g_user2 = nullptr;
std::atomic_bool g_existAmbientLight = false;
}  // namespace

class SensorAgentTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
};

void SensorAgentTest::SetUpTestCase()
{
    SEN_HILOGI("SensorAgentTest SetUpTestCase in");
    uint32_t count = 0;
    int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    ASSERT_NE(sensors, nullptr);
    ret = OH_Sensor_GetInfos(sensors, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    for (uint32_t i = 0; i < count; ++i) {
        Sensor_Type sensorType;
        ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        if (sensorType == SENSOR_TYPE_AMBIENT_LIGHT) {
            g_existAmbientLight = true;
            SEN_HILOGI("SensorAgentTest SetUpTestCase ,Exist AmbientLight sensor");
            break;
        }
    }
    if (!g_existAmbientLight) {
        SEN_HILOGI("SensorAgentTest SetUpTestCase ,Not exist AmbientLight sensor");
    }
    ret = OH_Sensor_DestroyInfos(sensors, count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    SEN_HILOGI("SensorAgentTest SetUpTestCase end");
}

void SensorAgentTest::TearDownTestCase() {}

void SensorAgentTest::SetUp() {}

void SensorAgentTest::TearDown() {}

void SensorDataCallbackImpl(Sensor_Event *event)
{
    if (event == nullptr) {
        SEN_HILOGE("event is null");
        return;
    }
    int64_t timestamp = INVALID_VALUE;
    int32_t ret = OH_SensorEvent_GetTimestamp(event, &timestamp);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Type sensorType;
    ret = OH_SensorEvent_GetType(event, &sensorType);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Accuracy accuracy = SENSOR_ACCURACY_UNRELIABLE;
    ret = OH_SensorEvent_GetAccuracy(event, &accuracy);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    float *data = nullptr;
    uint32_t length = 0;
    ret = OH_SensorEvent_GetData(event, &data, &length);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    SEN_HILOGI("sensorType:%{public}d, dataLen:%{public}d, accuracy:%{public}d", sensorType, length, accuracy);
    for (uint32_t i = 0; i < length; ++i) {
        SEN_HILOGI("data[%{public}d]:%{public}f", i, data[i]);
    }
}

/**
 * @tc.name   OH_Sensor_GetInfos_001
 * @tc.number OH_Sensor_GetInfos_001
 * @tc.desc   OH_Sensor_GetInfos_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_GetInfos_001, Level3)
{
    SEN_HILOGI("OH_Sensor_GetInfos_001 in");
    uint32_t count = 0;
    int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    ASSERT_NE(sensors, nullptr);
    ret = OH_Sensor_GetInfos(sensors, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    for (uint32_t i = 0; i < count; ++i) {
        char sensorName[SENSOR_NAME_LENGTH_MAX] = {};
        uint32_t length = SENSOR_NAME_LENGTH_MAX;
        ret = OH_SensorInfo_GetName(sensors[i], sensorName, &length);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        char vendorName[SENSOR_NAME_LENGTH_MAX] = {};
        length = SENSOR_NAME_LENGTH_MAX;
        ret = OH_SensorInfo_GetVendorName(sensors[i], vendorName, &length);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        Sensor_Type sensorType;
        ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        float resolution = INVALID_RESOLUTION;
        ret = OH_SensorInfo_GetResolution(sensors[i], &resolution);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        int64_t minSamplePeriod = INVALID_VALUE;
        ret = OH_SensorInfo_GetMinSamplingInterval(sensors[i], &minSamplePeriod);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        int64_t maxSamplePeriod = INVALID_VALUE;
        ret = OH_SensorInfo_GetMaxSamplingInterval(sensors[i], &maxSamplePeriod);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        SEN_HILOGI("sensorType:%{public}d, sensorName:%{public}s, vendorName:%{public}s,"
            "resolution:%{public}f, minSamplePeriod:%{public}" PRId64 "maxSamplePeriod:%{public}" PRId64,
            static_cast<int32_t>(sensorType), sensorName, vendorName,
            resolution, minSamplePeriod, maxSamplePeriod);
    }
    ret = OH_Sensor_DestroyInfos(sensors, count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
}

/**
 * @tc.name   OH_Sensor_GetInfos_002
 * @tc.number OH_Sensor_GetInfos_002
 * @tc.desc   OH_Sensor_GetInfos_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_GetInfos_002, Level3)
{
    SEN_HILOGI("OH_Sensor_GetInfos_003 in");
    Sensor_Info *sensors { nullptr };
    int32_t ret = OH_Sensor_GetInfos(&sensors, nullptr);
    ASSERT_NE(ret, SENSOR_SUCCESS);
}

/**
 * @tc.name   OH_Sensor_Subscribe_001
 * @tc.number OH_Sensor_Subscribe_001
 * @tc.desc   OH_Sensor_Subscribe_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_001, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_001 in");
    if (g_existAmbientLight) {
        g_user = OH_Sensor_CreateSubscriber();
        int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
        ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
        ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        ret = OH_Sensor_Subscribe(id, attr, g_user);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
        ret = OH_Sensor_Unsubscribe(id, g_user);
        ASSERT_EQ(ret, SENSOR_SUCCESS);
        if (id != nullptr) {
            OH_Sensor_DestroySubscriptionId(id);
        }
        if (attr != nullptr) {
            OH_Sensor_DestroySubscriptionAttribute(attr);
        }
        if (g_user != nullptr) {
            OH_Sensor_DestroySubscriber(g_user);
            g_user = nullptr;
        }
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_002
 * @tc.number OH_Sensor_Subscribe_002
 * @tc.desc   OH_Sensor_Subscribe_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_002, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_002 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_003
 * @tc.number OH_Sensor_Subscribe_003
 * @tc.desc   OH_Sensor_Subscribe_003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_003, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_003 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_004
 * @tc.number OH_Sensor_Subscribe_004
 * @tc.desc   OH_Sensor_Subscribe_004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_004, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_004 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_005
 * @tc.number OH_Sensor_Subscribe_005
 * @tc.desc   OH_Sensor_Subscribe_005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_005, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_005 in");
    uint32_t count = 0;
    int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    for (uint32_t i = 0; i < count; ++i) {
        Sensor_Type sensorType;
        ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        if (sensorType == THIRD_SENSOR_ID) {
            g_user = OH_Sensor_CreateSubscriber();
            ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
            ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
            ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            ret = OH_Sensor_Subscribe(id, attr, g_user);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
            ret = OH_Sensor_Unsubscribe(id, g_user);
            ASSERT_EQ(ret, SENSOR_SUCCESS);
            if (id != nullptr) {
                OH_Sensor_DestroySubscriptionId(id);
            }
            if (attr != nullptr) {
                OH_Sensor_DestroySubscriptionAttribute(attr);
            }
            if (g_user != nullptr) {
                OH_Sensor_DestroySubscriber(g_user);
                g_user = nullptr;
            }
        }
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_006
 * @tc.number OH_Sensor_Subscribe_006
 * @tc.desc   OH_Sensor_Subscribe_006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_006, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_006 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_007
 * @tc.number OH_Sensor_Subscribe_007
 * @tc.desc   OH_Sensor_Subscribe_007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_007, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_007 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_008
 * @tc.number OH_Sensor_Subscribe_008
 * @tc.desc   OH_Sensor_Subscribe_008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_008, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_008 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_009
 * @tc.number OH_Sensor_Subscribe_009
 * @tc.desc   OH_Sensor_Subscribe_009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_009, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_009 in");
    uint32_t count = 0;
    int32_t ret = OH_Sensor_GetInfos(nullptr, &count);
    ASSERT_EQ(ret, SENSOR_SUCCESS);
    Sensor_Info **sensors = OH_Sensor_CreateInfos(count);
    for (uint32_t i = 0; i < count; ++i) {
        Sensor_Type sensorType;
        ret = OH_SensorInfo_GetType(sensors[i], &sensorType);
        ASSERT_EQ(ret, SENSOR_SUCCESS);

        if (sensorType == THIRD_SENSOR_ID) {
            g_user = OH_Sensor_CreateSubscriber();
            ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
            ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
            ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            ret = OH_Sensor_Subscribe(id, attr, g_user);
            ASSERT_EQ(ret, SENSOR_SUCCESS);

            std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME_MS));
            ret = OH_Sensor_Unsubscribe(id, g_user);
            ASSERT_EQ(ret, SENSOR_SUCCESS);
            if (id != nullptr) {
                OH_Sensor_DestroySubscriptionId(id);
            }
            if (attr != nullptr) {
                OH_Sensor_DestroySubscriptionAttribute(attr);
            }
            if (g_user != nullptr) {
                OH_Sensor_DestroySubscriber(g_user);
                g_user = nullptr;
            }
        }
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_010
 * @tc.number OH_Sensor_Subscribe_010
 * @tc.desc   OH_Sensor_Subscribe_010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_010, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_010 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, attr, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_011
 * @tc.number OH_Sensor_Subscribe_011
 * @tc.desc   OH_Sensor_Subscribe_011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_011, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_011 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(nullptr, attr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_012
 * @tc.number OH_Sensor_Subscribe_012
 * @tc.desc   OH_Sensor_Subscribe_012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_012, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_012 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_013
 * @tc.number OH_Sensor_Subscribe_013
 * @tc.desc   OH_Sensor_Subscribe_013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_013, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_013 enter");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }

    g_user2 = OH_Sensor_CreateSubscriber();
    ret = OH_SensorSubscriber_SetCallback(g_user2, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user2);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user2 != nullptr) {
        OH_Sensor_DestroySubscriber(g_user2);
        g_user2 = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Subscribe_014
 * @tc.number OH_Sensor_Subscribe_014
 * @tc.desc   OH_Sensor_Subscribe_014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_014, Level3)
{
    SEN_HILOGI("OH_Sensor_Subscribe_014 enter");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }

    g_user2 = OH_Sensor_CreateSubscriber();
    ret = OH_SensorSubscriber_SetCallback(g_user2, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    id = OH_Sensor_CreateSubscriptionId();
    ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Subscribe(id, nullptr, g_user2);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
    if (g_user2 != nullptr) {
        OH_Sensor_DestroySubscriber(g_user2);
        g_user2 = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_001
 * @tc.number OH_Sensor_Unsubscribe_001
 * @tc.desc   OH_Sensor_Unsubscribe_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_001, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_001 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_002
 * @tc.number OH_Sensor_Unsubscribe_002
 * @tc.desc   OH_Sensor_Unsubscribe_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_002, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_002 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(id, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_003
 * @tc.number OH_Sensor_Unsubscribe_003
 * @tc.desc   OH_Sensor_Unsubscribe_003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_003, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_003 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_004
 * @tc.number OH_Sensor_Unsubscribe_004
 * @tc.desc   OH_Sensor_Unsubscribe_004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_004, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_004 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(id, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_005
 * @tc.number OH_Sensor_Unsubscribe_005
 * @tc.desc   OH_Sensor_Unsubscribe_005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_005, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_005 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(nullptr, g_user);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
        g_user = nullptr;
    }
}

/**
 * @tc.name   OH_Sensor_Unsubscribe_006
 * @tc.number OH_Sensor_Unsubscribe_006
 * @tc.desc   OH_Sensor_Unsubscribe_006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_006, Level3)
{
    SEN_HILOGI("OH_Sensor_Unsubscribe_006 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_SetType(id, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_SUCCESS);

    ret = OH_Sensor_Unsubscribe(id, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
}

/**
 * @tc.name   OH_SensorSubscriptionId_SetType_001
 * @tc.number OH_SensorSubscriptionId_SetType_001
 * @tc.desc   OH_SensorSubscriptionId_SetType_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_SetType_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionId_SetType_001 in");
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionId_SetType_002
 * @tc.number OH_SensorSubscriptionId_SetType_002
 * @tc.desc   OH_SensorSubscriptionId_SetType_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_SetType_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionId_SetType_002 in");
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, SECOND_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionId_SetType_003
 * @tc.number OH_SensorSubscriptionId_SetType_003
 * @tc.desc   OH_SensorSubscriptionId_SetType_003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_SetType_003, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionId_SetType_003 in");
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, THIRD_SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionId_GetType_001
 * @tc.number OH_SensorSubscriptionId_GetType_001
 * @tc.desc   OH_SensorSubscriptionId_GetType_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_GetType_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionId_GetType_001 in");
    Sensor_Type type;
    int32_t ret = OH_SensorSubscriptionId_GetType(nullptr, &type);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionId_GetType_002
 * @tc.number OH_SensorSubscriptionId_GetType_002
 * @tc.desc   OH_SensorSubscriptionId_GetType_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_GetType_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionId_GetType_002 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_GetType(id, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
}

/**
 * @tc.name   OH_SensorSubscriptionAttribute_SetSamplingInterval_001
 * @tc.number OH_SensorSubscriptionAttribute_SetSamplingInterval_001
 * @tc.desc   OH_SensorSubscriptionAttribute_SetSamplingInterval_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_SetSamplingInterval_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_SetSamplingInterval_001 in");
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(nullptr,
        SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionAttribute_SetSamplingInterval_002
 * @tc.number OH_SensorSubscriptionAttribute_SetSamplingInterval_002
 * @tc.desc   OH_SensorSubscriptionAttribute_SetSamplingInterval_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_SetSamplingInterval_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_SetSamplingInterval_002 in");
    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, INVALID_VALUE);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

/**
 * @tc.name   OH_SensorSubscriptionAttribute_GetSamplingInterval_001
 * @tc.number OH_SensorSubscriptionAttribute_GetSamplingInterval_001
 * @tc.desc   OH_SensorSubscriptionAttribute_GetSamplingInterval_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_GetSamplingInterval_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_GetSamplingInterval_001 in");
    int64_t samplingInterval = 0;
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(nullptr,
        &samplingInterval);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriptionAttribute_GetSamplingInterval_002
 * @tc.number OH_SensorSubscriptionAttribute_GetSamplingInterval_002
 * @tc.desc   OH_SensorSubscriptionAttribute_GetSamplingInterval_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_GetSamplingInterval_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_GetSamplingInterval_002 in");
    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(attr, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

/**
 * @tc.name   OH_SensorSubscriber_SetCallback_001
 * @tc.number OH_SensorSubscriber_SetCallback_001
 * @tc.desc   OH_SensorSubscriber_SetCallback_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriber_SetCallback_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriber_SetCallback_001 in");
    int32_t ret = OH_SensorSubscriber_SetCallback(nullptr, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriber_SetCallback_002
 * @tc.number OH_SensorSubscriber_SetCallback_002
 * @tc.desc   OH_SensorSubscriber_SetCallback_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriber_SetCallback_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriber_SetCallback_002 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriber_GetCallback_001
 * @tc.number OH_SensorSubscriber_GetCallback_001
 * @tc.desc   OH_SensorSubscriber_GetCallback_001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriber_GetCallback_001, Level3)
{
    SEN_HILOGI("OH_SensorSubscriber_GetCallback_001 in");
    Sensor_EventCallback callback;
    int32_t ret = OH_SensorSubscriber_GetCallback(nullptr, &callback);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

/**
 * @tc.name   OH_SensorSubscriber_GetCallback_002
 * @tc.number OH_SensorSubscriber_GetCallback_002
 * @tc.desc   OH_SensorSubscriber_GetCallback_002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentTest, OH_SensorSubscriber_GetCallback_002, Level3)
{
    SEN_HILOGI("OH_SensorSubscriber_GetCallback_002 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_GetCallback(g_user, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (g_user != nullptr) {
        OH_Sensor_DestroySubscriber(g_user);
    }
}
}  // namespace Sensors
}  // namespace OHOS
