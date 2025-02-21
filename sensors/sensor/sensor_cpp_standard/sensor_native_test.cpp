/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
using namespace Security::AccessToken;
using Security::AccessToken::AccessTokenID;

namespace {
constexpr Sensor_Type SENSOR_ID { SENSOR_TYPE_ACCELEROMETER };
constexpr uint32_t SENSOR_NAME_LENGTH_MAX = 64;
constexpr int64_t SENSOR_SAMPLE_PERIOD = 200000000;
constexpr int32_t SLEEP_TIME_MS = 1000;
constexpr int64_t INVALID_VALUE = -1;
constexpr float INVALID_RESOLUTION = -1.0F;
constexpr int32_t num = 0;
constexpr int32_t num1 = 1;
constexpr int32_t num2 = 2;
PermissionDef g_infoManagerTestPermDef = {
    .permissionName = "ohos.permission.ACCELEROMETER",
    .bundleName = "accesstoken_test",
    .grantMode = 1,
    .availableLevel = APL_NORMAL,
    .label = "label",
    .labelId = 1,
    .description = "test sensor agent",
    .descriptionId = 1
};

PermissionStateFull g_infoManagerTestState = {
    .permissionName = "ohos.permission.ACCELEROMETER",
    .isGeneral = true,
    .resDeviceID = {"local"},
    .grantStatus = {PermissionState::PERMISSION_GRANTED},
    .grantFlags = {1}
};

HapPolicyParams g_infoManagerTestPolicyPrams = {
    .apl = APL_NORMAL,
    .domain = "test.domain",
    .permList = {g_infoManagerTestPermDef},
    .permStateList = {g_infoManagerTestState}
};

HapInfoParams g_infoManagerTestInfoParms = {
    .userID = 1,
    .bundleName = "sensoragent_test",
    .instIndex = 0,
    .appIDDesc = "sensorAgentTest"
};

Sensor_Subscriber *g_user = nullptr;
}  // namespace

class SensorAgentTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
private:
    static AccessTokenID tokenID_;
};

AccessTokenID SensorAgentTest::tokenID_ = 0;

void SensorAgentTest::SetUpTestCase()
{
    AccessTokenIDEx tokenIdEx = {0};
    tokenIdEx = AccessTokenKit::AllocHapToken(g_infoManagerTestInfoParms, g_infoManagerTestPolicyPrams);
    tokenID_ = tokenIdEx.tokenIdExStruct.tokenID;
    ASSERT_NE(0, tokenID_);
    ASSERT_EQ(0, SetSelfTokenID(tokenID_));
}

void SensorAgentTest::TearDownTestCase()
{
    int32_t ret = AccessTokenKit::DeleteToken(tokenID_);
    if (tokenID_ != 0) {
        ASSERT_EQ(RET_SUCCESS, ret);
    }
}

void SensorAgentTest::SetUp()
{}

void SensorAgentTest::TearDown()
{}

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
    SEN_HILOGI("sensorType:%{public}d, dataLen:%{public}d, accuracy:%{public}d"
        "x:%{public}f, y:%{public}f, z:%{public}f", sensorType, length, accuracy,
        data[num], data[num1], data[num2]);
}

HWTEST_F(SensorAgentTest, OH_Sensor_GetInfos_001, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_Sensor_GetInfos_002, TestSize.Level1)
{
    SEN_HILOGI("OH_Sensor_GetInfos_003 in");
    Sensor_Info *sensors { nullptr };
    int32_t ret = OH_Sensor_GetInfos(&sensors, nullptr);
    ASSERT_NE(ret, SENSOR_SUCCESS);
}

HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_001, TestSize.Level1)
{
    SEN_HILOGI("OH_Sensor_Subscribe_001 in");
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

HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_002, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_003, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_Sensor_Subscribe_004, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_001, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_Sensor_Unsubscribe_002, TestSize.Level1)
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

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_SetType_001, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionId_SetType_001 in");
    int32_t ret = OH_SensorSubscriptionId_SetType(nullptr, SENSOR_ID);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_GetType_001, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionId_GetType_001 in");
    Sensor_Type type;
    int32_t ret = OH_SensorSubscriptionId_GetType(nullptr, &type);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionId_GetType_002, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionId_GetType_002 in");
    Sensor_SubscriptionId *id = OH_Sensor_CreateSubscriptionId();
    int32_t ret = OH_SensorSubscriptionId_GetType(id, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (id != nullptr) {
        OH_Sensor_DestroySubscriptionId(id);
    }
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_SetSamplingInterval_001,
    TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_SetSamplingInterval_001 in");
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(nullptr,
        SENSOR_SAMPLE_PERIOD);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_SetSamplingInterval_002,
    TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_SetSamplingInterval_002 in");
    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_SetSamplingInterval(attr, INVALID_VALUE);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_GetSamplingInterval_001,
    TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_GetSamplingInterval_001 in");
    int64_t samplingInterval = 0;
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(nullptr,
        &samplingInterval);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriptionAttribute_GetSamplingInterval_002,
    TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriptionAttribute_GetSamplingInterval_002 in");
    Sensor_SubscriptionAttribute *attr = OH_Sensor_CreateSubscriptionAttribute();
    int32_t ret = OH_SensorSubscriptionAttribute_GetSamplingInterval(attr, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
    if (attr != nullptr) {
        OH_Sensor_DestroySubscriptionAttribute(attr);
    }
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriber_SetCallback_001, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriber_SetCallback_001 in");
    int32_t ret = OH_SensorSubscriber_SetCallback(nullptr, SensorDataCallbackImpl);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriber_SetCallback_002, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriber_SetCallback_002 in");
    g_user = OH_Sensor_CreateSubscriber();
    int32_t ret = OH_SensorSubscriber_SetCallback(g_user, nullptr);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriber_GetCallback_001, TestSize.Level1)
{
    SEN_HILOGI("OH_SensorSubscriber_GetCallback_001 in");
    Sensor_EventCallback callback;
    int32_t ret = OH_SensorSubscriber_GetCallback(nullptr, &callback);
    ASSERT_EQ(ret, SENSOR_PARAMETER_ERROR);
}

HWTEST_F(SensorAgentTest, OH_SensorSubscriber_GetCallback_002, TestSize.Level1)
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
