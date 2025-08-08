/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
#include <numeric>
#include <iostream>
#include <gtest/gtest.h>
#include <vector>
#include <map>
#include <sstream>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <ctime>
#include "hiappevent.h"
#include "hiappevent_config.h"
#include "hilog/log.h"
#include "file_utils.h"
#include <securec.h>
#include "hiappevent_base.h"

#define BUFF_SIZE 100
using namespace std;
using namespace testing;
using namespace testing::ext;
using namespace OHOS::HiviewDFX;

namespace{
    const char* TEST_DOMAIN_NAME = "test_domain";
    const char* TEST_EVENT_NAME = "test_event";
    string g_reDiRectTimeout = "5";
    string logPath = "/data/test/hiappevent/";
    string delelogPath = "/data/test/hiappevent/*";
}

class HiAppEventCPPTest : public testing::Test{
public:
    void TearDown();
private:
};
void HiAppEventCPPTest::TearDown()
{
    std::cout << "TearDown" << std::endl;
    std::vector<std::string> cmdret;
    string cmd = "rm -f " + delelogPath;
    ExecCmdWithRet(cmd, cmdret);
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is false.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0100
* @author f00601390
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0100, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0100 start" << endl;
    bool result = false;
    bool boolean = false;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"bool_key\":false"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0100 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0100 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0200
* @author f00601390
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0200, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0200 start" << endl;
    bool result = false;
    bool boolean = true;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"bool_key\":true"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0200 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0200 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of the Boolean List Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0300
* @author f00601390
* @tc.desc The keyvalue is reported as a boolean list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0300, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0300 start" << endl;
    bool result = false;
    bool booleans[] = {true, true};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolArrayParam(list, "bool_arr_key", booleans, sizeof(booleans) / sizeof(booleans[0]));
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"bool_arr_key\":[true,true]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0300 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0300 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of the Boolean List Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0400
* @author f00601390
* @tc.desc The keyvalue is reported as a boolean list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0400, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0400 start" << endl;
    bool result = false;
    char str[] = "hello";
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::BEHAVIOR;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":4", "\"str_key\":\"hello\""};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0400 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0400 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of the Boolean List Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0500
* @author f00601390
* @tc.desc The keyvalue is reported as a boolean list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0500, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0500 start" << endl;
    bool result = false;
    char str1[] = "hello";
    char str2[] = "world";
    char* strs[] = {str1, str2};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    EventType eventType = EventType::BEHAVIOR;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":4", "\"str_arr_key\":[\"hello\",\"world\"]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0500 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0500 end" << endl;
}

/**
* @tc.name Testing the Native Write Interface of the HiAppEvent, Reporting the Keyvalue of the Double Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0800
* @author f00601390
* @tc.desc The keyvalue type is double.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0800, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0800 start" << endl;
    bool result = false;
    double num = 30949.374;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddDoubleParam(list, "double_key", num);
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"double_key\":30949.374"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0800 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0800 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of a Double List.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_0900
* @author f00601390
* @tc.desc The keyvalue is reported as a double list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_0900, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0900 start" << endl;
    bool result = false;
    double nums[] = {123.22, 30949.374, 131312.46464};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddDoubleArrayParam(list, "double_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::STATISTIC;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":2", "\"double_arr_key\":[123.22,30949.374,131312.46464]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_0900 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_0900 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the KeyValue of the Floating Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1000
* @author f00601390
* @tc.desc The keyvalue type is float.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1000, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1000 start" << endl;
    bool result = false;
    float num = 234.5f;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddFloatParam(list, "float_key", num);
    EventType eventType = EventType::STATISTIC;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":2", "\"float_key\":234.5"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1000 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1000 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of a Floating List.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1100
* @author f00601390
* @tc.desc The keyvalue is reported as a float list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1100, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1100 start" << endl;
    bool result = false;
    float nums[] = {123.22f, 234.5f, 131312.46464f};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddFloatArrayParam(list, "float_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::STATISTIC;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":2", "\"float_arr_key\":[123.22", "234.5", "131312.46"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1100 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1100 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reported When the Keyvalue Is of the Int Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1200
* @author f00601390
* @tc.desc The keyvalue is of the int type.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1200, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1200 start" << endl;
    bool result = false;
    int num = 1;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt8Param(list, "int8_key", num);
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int8_key\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1200 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1200 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting of the int List Type of Keyvalue.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1300
* @author f00601390
* @tc.desc The keyvalue is reported as an int list.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1300, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1300 start" << endl;
    bool result = false;
    int8_t nums[] = {1, 10, 100};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt8ArrayParam(list, "int8_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int8_arr_key\":[1,10,100]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1300 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1300 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1400
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1400, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1400 start" << endl;
    bool result = false;
    int16_t num = 1;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt16Param(list, "int16_key", num);
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int16_key\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1400 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1400 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1500
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1500, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1500 start" << endl;
    bool result = false;
    int16_t nums[] = {1, 1000, 5000};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt16ArrayParam(list, "int16_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int16_arr_key\":[1,1000,5000]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1500 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1500 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1600
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1600, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1600 start" << endl;
    bool result = false;
     int32_t num = 1;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt32Param(list, "int32_key", num);
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int32_key\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1600 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1600 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1700
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1700, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1700 start" << endl;
    bool result = false;
    int32_t nums[] = {1, 100000, 500000};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt32ArrayParam(list, "int32_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int32_arr_key\":[1,100000,500000]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1700 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1700 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1800
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1800, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1800 start" << endl;
    bool result = false;
    int64_t num = 1;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt64Param(list, "int64_key", num);
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int64_key\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1800 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1800 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test Reported When the Keyvalue Is of the Long Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_1900
* @author f00601390
* @tc.desc The keyvalue type is long.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_1900, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1900 start" << endl;
    bool result = false;
    int64_t nums[] = {1, 10000000, 50000000};
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt64ArrayParam(list, "int64_arr_key", nums, sizeof(nums) / sizeof(nums[0]));
    EventType eventType = EventType::SECURITY;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":3", "\"int64_arr_key\":[1,10000000,50000000]"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_1900 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_1900 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of the string List Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2100
* @author f00601390
* @tc.desc The keyvalue is reported as a string list, 100 list parameters .
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2100, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2100 start" << endl;
    bool result = false;
    char* strs[100];
    int num = 32;
    for(int i=0;i<100;i++){
	strs[i] = new char[32];
        sprintf_s(strs[i], num,"hello_world_%d",i);
	std::cout << sizeof(strs[i]) << std::endl;
	std::cout << strs[i] << std::endl;
    }
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    EventType eventType = EventType::BEHAVIOR;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":4"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_2100 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2100 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Keyvalue of the string Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2200
* @author f00601390
* @tc.desc The keyvalue is reported as a string, 8 * 1024 lenth.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2200, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2200 start" << endl;
    bool result = false;
    string strs = "";
    for(int i=0;i<1024;i++){
        strs.append("abcdefgh");
    }
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", strs.c_str());
    EventType eventType = EventType::BEHAVIOR;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":4"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_2200 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2200 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the event name is null.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2300
* @author f00601390
* @tc.desc Reported event name is null.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2300, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2300 start" << endl;
    char str[] = "hello";
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, NULL, eventType, list);
    sleep(1); //等待1s
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == -1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2300 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the event name is empty.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2400
* @author f00601390
* @tc.desc Reported event name is empty.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2400, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2400 start" << endl;
    char str[] = "hello";
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, "", eventType, list);
    sleep(1); //等待1s
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == -1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2400 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the event name starts with number.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2500
* @author f00601390
* @tc.desc Reported event name starts with number.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2500, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2500 start" << endl;
    char str[] = "hello";
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, "9527_test_event", eventType, list);
    sleep(1); //等待1s
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == -1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2500 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, 33 parameters are reported.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2700
* @author f00601390
* @tc.desc key and values 33 parameters are reported.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2700, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2700 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    int maxLen = 32;
    string keys[maxLen + 1];
    string values[maxLen + 1];
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++){
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(), values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"key31\":\"value31\"", "\"key15\":\"value15\""};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_2700 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == 5);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2700 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, key and value is empty.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2800
* @author f00601390
* @tc.desc key and value is empty.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2800, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2800 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "", "");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_2800 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    ASSERT_TRUE(ret == 1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2800 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, key is not string type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_2900
* @author f00601390
* @tc.desc key is not string type.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_2900, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2900 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "", "hello");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_2900 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    ASSERT_TRUE(ret == 1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_2900 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, key start with number.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3000
* @author f00601390
* @tc.desc key start with number.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3000, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3000 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "9527_hello", "world");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_3000 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    ASSERT_TRUE(ret == 1);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3000 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, Reporting the Key value of the string Type.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3100
* @author f00601390
* @tc.desc The keyvalue is reported as a string, 8 * 1024 + 1 length.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3100, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3100 start" << endl;
    bool result = false;
    string strs = "";
    for(int i=0;i<1024;i++){
        strs.append("abcdefgh");
    }
    strs.append("a");
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", strs.c_str());
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_3100 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    ASSERT_TRUE(ret == 4);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3100 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, key and value is NULL.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3200
* @author f00601390
* @tc.desc key and value is NULL.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3200, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3200 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, NULL, NULL);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_3200 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == 0);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3200 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, List Type Reporting,101 List Parameters.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3300
* @author f00601390
* @tc.desc 101 List Parameters.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3300, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3300 start" << endl;
    bool result = false;
    char* strs[101];
    int num = 32;
    for(int i=0;i<101;i++){
	strs[i] = new char[32];
        sprintf_s(strs[i], num,"hello_world_%d",i);
	std::cout << sizeof(strs[i]) << std::endl;
	std::cout << strs[i] << std::endl;
    }
    string getlogFile;
    string path;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    EventType eventType = EventType::BEHAVIOR;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":4", "\"str_arr_key\":[\"hello_world_0\",\"hello_world_1\",\"hello_world_2\"", "hello_world_99"};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_3300 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == 6);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3300 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, 32 parameters are reported.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3400
* @author f00601390
* @tc.desc key and values 32 parameters are reported.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3400, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3400 start" << endl;
    bool result = false;
    string getlogFile;
    string path;
    int maxLen = 32;
    string keys[maxLen+1];
    string values[maxLen+1];
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++){
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(), values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    string fileinfo = "";
    fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"key31\":\"value31\"","\"key15\":\"value15\"","\"key0\":\"value0\""};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    } else {
        std::cout << "DFX_DFT_HiviewKit_HiAppEvent_Native_3400 file error" << std::endl;
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(ret == 5);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3400 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, 32 parameters are reported.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3500
* @author f00601390
* @tc.desc key and values 32 parameters are reported.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3500, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3500 start" << endl;
    string getlogFile;
    string path;
    OH_HiAppEvent_Configure("max_storage", "10M");
    int maxLen = 32;
    string keys[maxLen+1];
    string values[maxLen+1];
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    std::vector<std::string> cmdret;
    time_t nowtime;
    struct tm* p;
    time(&nowtime);
    p = localtime(&nowtime);
    char s[25];
    sprintf_s(s, sizeof(s),"app_event_%d%02d%02d.log", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday);
    std::cout << s << std::endl;
    string fname = s;
    string cmd = "dd if=/dev/zero of=/data/test/hiappevent/" + fname + " bs=11M count=1";
    ExecCmdWithRet(cmd, cmdret);
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++){
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(), values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    bool result = false;
    string fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"key31\":\"value31\"","\"key15\":\"value15\"","\"key0\":\"value0\""};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3500 end" << endl;
}

/**
* @tc.name HiAppEvent Native Write Interface Test, 32 parameters are reported.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3500
* @author f00601390
* @tc.desc key and values 32 parameters are reported.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3600, Function|MediumTest|Level4){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3600 start" << endl;
    string getlogFile;
    string path;
    OH_HiAppEvent_Configure("max_storage", "1M");
    int maxLen = 32;
    string keys[maxLen+1];
    string values[maxLen+1];
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    std::vector<std::string> cmdret;
    time_t nowtime;
    struct tm* p;
    time(&nowtime);
    p = localtime(&nowtime);
    char s[25];
    sprintf_s(s, sizeof(s),"app_event_%d%02d%02d.log", 1900 + p->tm_year, 1 + p->tm_mon, p->tm_mday);
    string fname = s;
    string cmd = "dd if=/dev/zero of=/data/test/hiappevent/" + fname + " bs=1.5M count=1";
    ExecCmdWithRet(cmd, cmdret);
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++){
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(), values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    getlogFile = accumulate(file.begin(), file.end(), getlogFile);
    path = logPath + getlogFile;
    bool result = false;
    string fileinfo = ReadFile(path);
    std::vector<std::string> para = {"test_event", "\"type_\":1", "\"key31\":\"value31\"","\"key15\":\"value15\"","\"key0\":\"value0\""};
    if (fileinfo != "") {
        result = CheckInfo(para, fileinfo);
    }
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(result);
    OH_HiAppEvent_Configure("max_storage", "10M");
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3600 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3700
* @author f00601390
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3700, Function|MediumTest|Level3){
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3700 start" << endl;
    OH_HiAppEvent_Configure("disable", "true");
    bool boolean = true;
    OHOS::HiviewDFX::HiAppEventConfig::GetInstance().SetStorageDir("/data/test/hiappevent/");
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    sleep(1); //等待1s
    std::vector<std::string> file;
    file = getfileinpath(logPath);
    OH_HiAppEvent_DestroyParamList(list);
    ASSERT_TRUE(file.size() == 0);
    ASSERT_TRUE(ret == -99);
    OH_HiAppEvent_Configure("disable", "false");
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3700 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3800
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3800, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3800 start" << endl;
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(nullptr, "testName", "testValue"), ErrorCode::ERROR_EVENT_CONFIG_IS_NULL);

    int maxStrLen = 1024;
    std::string longStr(maxStrLen, 'a');
    std::string longInvalidStr(maxStrLen + 1, 'a');
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "", "testValue"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, longStr.c_str(), "testValue"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, nullptr, "testValue"), ErrorCode::ERROR_INVALID_PARAM_VALUE);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, longInvalidStr.c_str(), "testValue"),
              ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "testName", ""), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "testName", longStr.c_str()),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "testName", nullptr), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "testName", longInvalidStr.c_str()),
              ErrorCode::ERROR_INVALID_PARAM_VALUE);

    OH_HiAppEvent_DestroyConfig(configDemo);

    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3800 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_3900
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_3900, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3900 start" << endl;
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "0"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig(nullptr, configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("testName", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);
    int maxStrLen = 1024;
    std::string longInvalidStr(maxStrLen + 1, 'a');
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig(longInvalidStr.c_str(), configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    OH_HiAppEvent_DestroyConfig(configDemo);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_3900 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4000
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_4000, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4000 start" << endl;
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", nullptr), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "-1"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "abc"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", ""), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", nullptr), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "100"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "0"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "2"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    OH_HiAppEvent_DestroyConfig(configDemo);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4000 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4100
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_4100, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4100  start" << endl;
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "1"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "ignore_startup_time", "10"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "100"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "report_times_per_app", "3"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_count", "21"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    OH_HiAppEvent_DestroyConfig(configDemo);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4100  end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native Write Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4200
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/
HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_4200, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4200 start" << endl;
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "1"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_count", "21"), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "ignore_startup_time", "10"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "report_times_per_app", "3"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "50"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);  // sample_interval range is [50, 1000]

    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "-1"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "49"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "aa"),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    std::string maxValue = "92233720368547758079223372036854775807";
    ASSERT_EQ(OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", maxValue.c_str()),
              ErrorCode::HIAPPEVENT_VERIFY_SUCCESSFUL);
    ASSERT_EQ(OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo), ErrorCode::ERROR_INVALID_PARAM_VALUE);

    OH_HiAppEvent_DestroyConfig(configDemo);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4200 end" << endl;
}

/**
* @tc.name Test of the HiAppEvent Native SetReportRoute Interface in which the keyvalue
*          is of the boolean type and the bool value is true.
* @tc.number DFX_DFT_HiviewKit_HiAppEvent_Native_4300
* @author z30053398
* @tc.desc The keyvalue is of the boolean type and the bool value is false.
*/

HWTEST_F(HiAppEventCPPTest, DFX_DFT_HiviewKit_HiAppEvent_Native_4300, Function | MediumTest | Level3) {
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4300 start" << endl;
    const char * validname = "test_processor";
    HiAppEvent_Processor * processor0= OH_HiAppEvent_CreateProcessor (validname);
    ASSERT_EQ(OH_HiAppEvent_SetReportRoute(processor0, "com.example.app", "https://hiappevents.com/test"), -200);
    ASSERT_EQ(OH_HiAppEvent_SetReportPolicy(processor0, 10, 5, true, false), -200);
    ASSERT_EQ(OH_HiAppEvent_SetReportEvent(processor0, "OS", "ADDRESS_SANITIZER", true), -200);
    ASSERT_EQ(OH_HiAppEvent_SetCustomConfig(processor0, "test", "test"), -200);
    ASSERT_EQ(OH_HiAppEvent_SetConfigId(processor0, 123), -200);
    const char* userList[] = {"testprocessor", "processor2", "processor3"};
    ASSERT_EQ(OH_HiAppEvent_SetReportUserId(processor0, userList, 1), -200);
    ASSERT_EQ(OH_HiAppEvent_SetReportUserProperty(processor0, userList, 1), -200);
    ASSERT_EQ(OH_HiAppEvent_AddProcessor(processor0), -200);
    ASSERT_EQ(OH_HiAppEvent_RemoveProcessor(123), -200);
    GTEST_LOG_(INFO) << "DFX_DFT_HiviewKit_HiAppEvent_Native_4300 end" << endl;
}