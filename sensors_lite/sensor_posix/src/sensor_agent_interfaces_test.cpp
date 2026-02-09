/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "gtest/gtest.h"
#include "hilog/log.h"
#include "sensor_agent.h"
#include "sensor_agent_type.h"

#undef LOG_TAG
#define LOG_TAG "SENSOR_LITE"
#undef SENSOR_ERROR_INVALID_PARAM
#define SENSOR_ERROR_INVALID_PARAM (-3)

using namespace std;
using namespace testing::ext;

#define NULLPTR ((void *)0)

namespace OHOS {
class SensorAgentInterfacesTest : public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
};

void SensorDataCallbackImpl(SensorEvent *event)
{
    HILOG_DEBUG(HILOG_MODULE_APP, "SensorDataCallbackImpl called");
    if (event == NULLPTR) {
        return;
    }
    float *sensorData = (float *)event->data;
    for (int32_t i = 0; i < (int32_t)(event->dataLen / sizeof(uint8_t *)); i++) {
        HILOG_DEBUG(HILOG_MODULE_APP, "SensorDataCallbackImpl data: %f", *(sensorData + i));
    }
}

/**
 * @tc.name   GetAllSensorsInterfaceTest001
 * @tc.number SUB_DSS_SensorsSystem_lite_GetAllSensors_0010
 * @tc.desc   Test the interface for obtaining the sensor list
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(SensorAgentInterfacesTest, GetAllSensorsInterfaceTest001, Function | MediumTest | Level0)
{
    HILOG_INFO(HILOG_MODULE_APP, "GetAllSensorsInterfaceTest001 called");
    SensorInfo *sensorInfo = (SensorInfo *)NULLPTR;
    int32_t count = 0;
    int32_t ret = GetAllSensors(&sensorInfo, &count);
    HILOG_INFO(HILOG_MODULE_APP, "GetAllSensorsInterfaceTest001 sensor lists count: %d", count);
    for (int i = 0; i < count; i++) {
        HILOG_INFO(HILOG_MODULE_APP, "%s %s %s %s %d %d %f %f %f!",
            (sensorInfo + i)->sensorName, (sensorInfo + i)->vendorName,
            (sensorInfo + i)->firmwareVersion, (sensorInfo + i)->hardwareVersion,
            (sensorInfo + i)->sensorTypeId, (sensorInfo + i)->sensorId,
            (sensorInfo + i)->maxRange, (sensorInfo + i)->precision,
            (sensorInfo + i)->power);
    }
    EXPECT_EQ(ret, 0) << "GetAllSensors ret = " << ret << endl;
};

/**
 * @tc.name   GetAllSensorsInterfaceTest002
 * @tc.number SUB_DSS_SensorsSystem_lite_GetAllSensors_0020
 * @tc.desc   Test the interface for obtaining the sensor list
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SensorAgentInterfacesTest, GetAllSensorsInterfaceTest002, Function | MediumTest | Level1)
{
    HILOG_INFO(HILOG_MODULE_APP, "GetAllSensorsInterfaceTest002 called");
    SensorInfo **sensorInfo = (SensorInfo **)NULLPTR;
    int32_t ret = GetAllSensors(sensorInfo, (int32_t *)NULLPTR);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "GetAllSensors ret = " << ret << endl;
};

/**
 * @tc.name   GetAllSensorsInterfaceTest003
 * @tc.number SUB_DSS_SensorsSystem_lite_GetAllSensors_0030
 * @tc.desc   Test the interface for obtaining the sensor list
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(SensorAgentInterfacesTest, GetAllSensorsInterfaceTest003, Function | MediumTest | Level2)
{
    HILOG_INFO(HILOG_MODULE_APP, "GetAllSensorsInterfaceTest003 called");
    int32_t count = 0;
    SensorInfo **sensorInfo = (SensorInfo **)NULLPTR;
    int32_t ret = GetAllSensors(sensorInfo, &count);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "GetAllSensors ret = " << ret << endl;
};

/**
 * @tc.name   ActivateSensorInterfaceTest001
 * @tc.number SUB_DSS_SensorsSystem_lite_Enable_0010
 * @tc.desc   Test the enable sensor interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SensorAgentInterfacesTest, ActivateSensorInterfaceTest001, Function | MediumTest | Level1)
{
    HILOG_INFO(HILOG_MODULE_APP, "ActivateSensorInterfaceTest001 called");
    SensorUser sensorUser;
    int32_t ret = ActivateSensor(-1, &sensorUser);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "ActivateSensor ret = " << ret << endl;
};

/**
 * @tc.name   ActivateSensorInterfaceTest002
 * @tc.number SUB_DSS_SensorsSystem_lite_Enable_0020
 * @tc.desc   Test the enable sensor interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(SensorAgentInterfacesTest, ActivateSensorInterfaceTest002, Function | MediumTest | Level2)
{
    HILOG_INFO(HILOG_MODULE_APP, "ActivateSensorInterfaceTest002 called");
    SensorUser *sensorUser = (SensorUser *)NULLPTR;
    int32_t ret = ActivateSensor(0, sensorUser);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "ActivateSensor ret = " << ret << endl;
};

/**
 * @tc.name   ActivateSensorInterfaceTest003
 * @tc.number SUB_DSS_SensorsSystem_lite_Enable_0030
 * @tc.desc   Test the enable sensor interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(SensorAgentInterfacesTest, ActivateSensorInterfaceTest003, Function | MediumTest | Level2)
{
    HILOG_INFO(HILOG_MODULE_APP, "ActivateSensorInterfaceTest003 called");
    SensorUser sensorUser;
    sensorUser.callback = SensorDataCallbackImpl;
    SensorInfo *sensorInfo = (SensorInfo *)NULLPTR;
    int32_t count = 0;
    int32_t ret = GetAllSensors(&sensorInfo, &count);
    EXPECT_EQ(ret, 0) << "GetAllSensors ret = " << ret << endl;
    sleep(1);

    ret = ActivateSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "ActivateSensor ret = " << ret << endl;
    sleep(3);

    ret = DeactivateSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "DeactivateSensor ret = " << ret << endl;
    sleep(1);
};

/**
 * @tc.name   SetBatchInterfaceTest002
 * @tc.number SUB_DSS_SensorsSystem_lite_SetBatch_0010
 * @tc.desc   Set sensor param.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SensorAgentInterfacesTest, SetBatchInterfaceTest002, Function | MediumTest | Level1)
{
    HILOG_INFO(HILOG_MODULE_APP, "SetBatchInterfaceTest002 called");
    SensorUser sensorUser;
    int32_t ret = SetBatch(0, &sensorUser, -1, 3000);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "SetBatch ret = " << ret << endl;
};

/**
 * @tc.name   SetBatchInterfaceTest003
 * @tc.number SUB_DSS_SensorsSystem_lite_SetBatch_0020
 * @tc.desc   Set sensor param.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(SensorAgentInterfacesTest, SetBatchInterfaceTest003, Function | MediumTest | Level2)
{
    HILOG_INFO(HILOG_MODULE_APP, "SetBatchInterfaceTest003 called");
    SensorUser sensorUser;
    int32_t ret = SetBatch(0, &sensorUser, 200, 3000);
    EXPECT_EQ(ret, 0) << "SetBatch ret = " << ret << endl;
};

/**
 * @tc.name   SubscribeSensorInterfaceTest001
 * @tc.number SUB_DSS_SensorsSystem_lite_Register_0010
 * @tc.desc   SubscribeSensor sensor.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SensorAgentInterfacesTest, SubscribeSensorInterfaceTest001, Function | MediumTest | Level1)
{
    HILOG_INFO(HILOG_MODULE_APP, "SubscribeSensorInterfaceTest001 called");
    SensorInfo *sensorInfo = (SensorInfo *)NULLPTR;
    int32_t count = 0;
    int32_t ret = GetAllSensors(&sensorInfo, &count);
    EXPECT_EQ(ret, 0) << "GetAllSensors ret = " << ret << endl;
    sleep(1);

    SensorUser sensorUser;
    sensorUser.callback = SensorDataCallbackImpl;
    ret = SubscribeSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "SubscribeSensor ret = " << ret << endl;

    ret = UnsubscribeSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "UnsubscribeSensor ret = " << ret << endl;
};

/**
 * @tc.name   UnSubscribeSensorInterfaceTest001
 * @tc.number SUB_DSS_SensorsSystem_lite_Register_0020
 * @tc.desc   UnSubscribeSensor sensor.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(SensorAgentInterfacesTest, UnSubscribeSensorInterfaceTest001, Function | MediumTest | Level1)
{
    HILOG_INFO(HILOG_MODULE_APP, "UnSubscribeSensorInterfaceTest001 called");
    SensorUser *sensorUser = (SensorUser *)NULLPTR;
    int32_t ret = UnsubscribeSensor(0, sensorUser);
    EXPECT_EQ(ret, SENSOR_ERROR_INVALID_PARAM) << "UnsubscribeSensor ret = " << ret << endl;
};

/**
 * @tc.name   DataReportInterfaceTest001
 * @tc.number SUB_DSS_SensorsSystem_lite_Register_0030
 * @tc.desc   Sensor data report.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(SensorAgentInterfacesTest, DataReportInterfaceTest001, Function | MediumTest | Level3)
{
    HILOG_INFO(HILOG_MODULE_APP, "DataReportInterfaceTest001 called");
    SensorUser sensorUser;
    sensorUser.callback = SensorDataCallbackImpl;

    SensorInfo *sensorInfo = (SensorInfo *)NULLPTR;
    int32_t count = 0;

    int32_t ret = GetAllSensors(&sensorInfo, &count);
    EXPECT_EQ(ret, 0) << "GetAllSensorsTest001 ret = " << ret << endl;
    sleep(1);

    ret = SubscribeSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "SubscribeSensor ret = " << ret << endl;
    sleep(1);

    ret = ActivateSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "ActivateSensor ret = " << ret << endl;
    sleep(1);

    ret = DeactivateSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "DeactivateSensor ret = " << ret << endl;
    sleep(1);

    ret = UnsubscribeSensor(0, &sensorUser);
    EXPECT_EQ(ret, 0) << "UnsubscribeSensor ret = " << ret << endl;
};
}