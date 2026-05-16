/**
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <log.h>
#include <semaphore.h>
#include <string>

#include "gtest/gtest.h"
#include "securec.h"
#include "bundle_info.h"
#include "bundle_manager.h"
#include "want.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static bool g_installState = false;
static int g_errorCode = -1;
static sem_t g_sem;
static string g_testPath;

extern "C" {
void __attribute__((weak)) HOS_SystemInit(void) { }
}

/* callback */
static void TestBundleStateCallback(const uint8_t resultCode, const void *resultMessage)
{
    HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleStateCallback resultCode: %d", resultCode);
    HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleStateCallback resultMessage: %s", (char *) resultMessage);
    g_installState = (resultCode == 0);
    g_errorCode = resultCode;
    sem_post(&g_sem);
}

/* *
 * get current dir
 * @return  string current file path of the test suits
 */
static string GetCurDir()
{
    string filePath = "";
    char *buffer;
    if ((buffer = getcwd(NULL, 0)) == NULL) {
        perror("get file path error");
    } else {
        printf("Current Dir: %s\r\n", buffer);
        filePath = buffer;
        free(buffer);
    }
    return filePath + "/";
}

class BundleMgrTest : public testing::Test {
protected:
    static void SetUpTestCase(void)
    {
        printf("----------test case with BundleMgrTest start-------------\n");
        HOS_SystemInit();
        sem_init(&g_sem, 0, 0);
        InstallParam installParam = { .installLocation = 1, .keepData = false };
        g_testPath = GetCurDir();
        string hapPath = g_testPath + "testjsdemo.hap";
        Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
        sem_wait(&g_sem);
        printf("callback installresult is %d \n", g_errorCode);
        EXPECT_EQ(g_errorCode, 0);
    }
    static void TearDownTestCase(void)
    {
        sem_init(&g_sem, 0, 0);
        InstallParam installParam = { .installLocation = 1, .keepData = false };
        Uninstall("com.openharmony.testjsdemo", &installParam, TestBundleStateCallback);
        sem_wait(&g_sem);
        printf("callback uninstallresult is %d \n", g_errorCode);
        EXPECT_EQ(g_errorCode, 0);
        printf("----------test case with BundleMgrTest end-------------\n");
    }
};


/**
 * @tc.name   testClearAbilityInfoIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0044
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testClearAbilityInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearAbilityInfoIllegal------\n");
    // abilityInfo is nullptr
    AbilityInfo abilityInfo;
    int32_t result = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    EXPECT_EQ(result, 0);
    abilityInfo.bundleName = (char*)"com.openharmony.testjsdemo";
    printf("abilityInfo.bundleName is %s \n", abilityInfo.bundleName);
    ClearAbilityInfo(nullptr);
    EXPECT_STREQ(abilityInfo.bundleName, "com.openharmony.testjsdemo");
    printf("------end testClearAbilityInfoIllegal------\n");
}

/**
 * @tc.name   testClearBundleInfoIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0045
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testClearBundleInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testClearBundleInfoIllegal------\n");
    BundleInfo bundleInfo;
    int32_t result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    EXPECT_EQ(result, 0);
    bundleInfo.bundleName = (char*)"com.openharmony.testjsdemo";
    printf("abilityInfo.bundleName is %s \n", bundleInfo.bundleName);
    ClearBundleInfo(nullptr);
    printf("abilityInfo.bundleName afterclear is %s \n", bundleInfo.bundleName);
    EXPECT_STREQ(bundleInfo.bundleName, "com.openharmony.testjsdemo");
    printf("------end testClearBundleInfoIllegal------\n");
}

/**
 * @tc.name   testClearModuleInfoIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0046
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testClearModuleInfoIllegal, Function | MediumTest | Level1)
{
    printf("------start testClearModuleInfoIllegal------\n");
    ModuleInfo moduleInfo;
    int32_t result = memset_s(&moduleInfo, sizeof(moduleInfo), 0, sizeof(moduleInfo));
    EXPECT_EQ(result, 0);
    moduleInfo.description = (char*)"test app";
    moduleInfo.moduleType = (char*)"entry";
    ClearModuleInfo(nullptr);
    EXPECT_STREQ(moduleInfo.description, "test app");
    EXPECT_STREQ(moduleInfo.moduleType, "entry");
    printf("------end testClearModuleInfoIllegal------\n");
}

/**
 * @tc.name   testSetElementAbilityName
 * @tc.number SUB_APPEXECFWK_AMS_API_0009
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(BundleMgrTest, testSetElementAbilityName, Function | MediumTest | Level0)
{
    printf("------start testSetElementAbilityName------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementAbilityName(&element, "SecondAbility");
    SetWantElement(&want, element);
    printf("element is %s \n", want.element->abilityName);
    char aName[] = "SecondAbility";
    printf("aName is %s \n", aName);
    EXPECT_STREQ(want.element->abilityName, aName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityName------\n");
}

/**
 * @tc.name   testSetElementAbilityNameIllegal
 * @tc.number SUB_APPEXECFWK_AMS_API_0010
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testSetElementAbilityNameIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementAbilityNameIllegal------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementAbilityName(&element, nullptr);
    SetWantElement(&want, element);
    printf("AbilityName1 is %s \n", want.element->abilityName);
    EXPECT_STREQ(want.element->abilityName, nullptr);
    char aName[] = "";
    SetElementAbilityName(&element, aName);
    SetWantElement(&want, element);
    printf("AbilityName2 is %s \n", want.element->abilityName);
    EXPECT_STREQ(want.element->abilityName, "");
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementAbilityNameIllegal------\n");
}

/**
 * @tc.name   testSetElementBundleName
 * @tc.number SUB_APPEXECFWK_AMS_API_0007
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(BundleMgrTest, testSetElementBundleName, Function | MediumTest | Level0)
{
    printf("------start testSetElementBundleName------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementBundleName(&element, "com.openharmony.testjsdemo");
    SetWantElement(&want, element);
    printf("element is %s \n", want.element->bundleName);
    char bName[] = "com.openharmony.testjsdemo";
    EXPECT_STREQ(want.element->bundleName, bName);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleName------\n");
}

/**
 * @tc.name   testSetElementBundleNameIllegal
 * @tc.number SUB_APPEXECFWK_AMS_API_0008
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testSetElementBundleNameIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementBundleNameIllegal------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementBundleName(&element, "");
    SetWantElement(&want, element);
    printf("BundleName1 is %s \n", want.element->bundleName);
    char bName[] = "";
    EXPECT_STREQ(want.element->bundleName, bName);
    SetElementBundleName(&element, nullptr);
    SetWantElement(&want, element);
    printf("BundleName2 is %s \n", want.element->bundleName);
    EXPECT_STREQ(want.element->bundleName, nullptr);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementBundleNameIllegal------\n");
}

/**
 * @tc.name   testSetElementDeviceID
 * @tc.number SUB_APPEXECFWK_AMS_API_0005
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(BundleMgrTest, testSetElementDeviceID, Function | MediumTest | Level0)
{
    printf("------start testSetElementDeviceID------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementDeviceID(&element, "0001000");
    SetWantElement(&want, element);
    char dID[] = "0001000";
    EXPECT_STREQ(want.element->deviceId, dID);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceID------\n");
}

/**
 * @tc.name   testSetElementDeviceIDIllegal
 * @tc.number SUB_APPEXECFWK_AMS_API_0006
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testSetElementDeviceIDIllegal, Function | MediumTest | Level2)
{
    printf("------start testSetElementDeviceIDIllegal------\n");
    Want want = { nullptr };
    ElementName element = { nullptr };
    SetElementDeviceID(&element, "");
    SetWantElement(&want, element);
    char dID[] = "";
    EXPECT_STREQ(want.element->deviceId, dID);
    SetElementDeviceID(&element, nullptr);
    SetWantElement(&want, element);
    EXPECT_STREQ(want.element->deviceId, nullptr);
    ClearElement(&element);
    ClearWant(&want);
    printf("------end testSetElementDeviceIDIllegal------\n");
}

/**
 * @tc.name   testInstallWithNullptr
 * @tc.number SUB_APPEXECFWK_BMS_API_0007
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testInstallWithNullptr, Function | MediumTest | Level2)
{
    printf("------start testInstallWithNullptr------\n");
    string hapPath = g_testPath + "testnative.hap";
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool isInstallSuccess = Install(hapPath.c_str(), &installParam, nullptr);
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d \n", isInstallSuccess);
    printf("------end testInstallWithNullptr------\n");
}

/**
 * @tc.name   testInstallWithNullPath
 * @tc.number SUB_APPEXECFWK_BMS_API_0004
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testInstallWithNullPath, Function | MediumTest | Level2)
{
    printf("------start testInstallWithNullPath------\n");
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool isInstallSuccess = Install(nullptr, &installParam, TestBundleStateCallback);
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d \n", isInstallSuccess);
    printf("------end testInstallWithNullPath------\n");
}

/**
 * @tc.name   testInstallWithErrorPath
 * @tc.number SUB_APPEXECFWK_BMS_API_0002
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testInstallWithErrorPath, Function | MediumTest | Level2)
{
    printf("------start testBundleMgrInstallWithErrorPath------\n");
    string hapPath = "appexecfwk/nothishap.hap";
    bool isInstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    if (g_errorCode == 0) {
        isInstallSuccess = true;
    }else if (g_errorCode > 0) {
        isInstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrInstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d", installResult);
    printf("------end testBundleMgrInstallWithErrorPath------\n");
}

/**
 * @tc.name   testBundleMgrInstallright
 * @tc.number SUB_APPEXECFWK_BMS_API_0001
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(BundleMgrTest, testBundleMgrInstallright, Function | MediumTest | Level0)
{
    printf("------start testBundleMgrInstallright------\n");
    string hapPath = g_testPath + "testnative.hap";
    bool isInstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    if (g_errorCode == 0) {
        isInstallSuccess = true;
    }else if (g_errorCode > 0) {
        isInstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrInstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_TRUE(isInstallSuccess);
    printf("install result is %d \n", installResult);
    printf("------end testBundleMgrInstallright------\n");
}
/**
 * @tc.name   testBundleMgrInstallEmpty
 * @tc.number SUB_APPEXECFWK_BMS_API_0003
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testBundleMgrInstallEmpty, Function | MediumTest | Level2)
{
    printf("------start testBundleMgrInstallEmpty------\n");
    string hapPath = "";
    bool isInstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    if (g_errorCode == 0) {
        isInstallSuccess = true;
    }else if (g_errorCode > 0) {
        isInstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrInstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d", installResult);
    printf("------end testBundleMgrInstallEmpty------\n");
}

/**
 * @tc.name   testBundleMgrInstallBin
 * @tc.number SUB_APPEXECFWK_BMS_API_0009
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testBundleMgrInstallBin, Function | MediumTest | Level1)
{
    printf("------start testBundleMgrInstallBin------\n");
    string hapPath = g_testPath + "testdemo.bin";
    bool isInstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    if (g_errorCode == 0) {
        isInstallSuccess = true;
    }else if (g_errorCode > 0) {
        isInstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrInstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d", installResult);
    printf("------end testBundleMgrInstallBin------\n");
}

/**
 * @tc.name   testBundleMgrInstallBadfile
 * @tc.number SUB_APPEXECFWK_BMS_API_0008
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testBundleMgrInstallBadfile, Function | MediumTest | Level2)
{
    printf("------start testBundleMgrInstallBadfile------\n");
    string hapPath = g_testPath + "errpinjie.hap";
    bool isInstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    if (g_errorCode == 0) {
        isInstallSuccess = true;
    }else if (g_errorCode > 0) {
        isInstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrInstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isInstallSuccess);
    printf("install result is %d", installResult);
    printf("------start testBundleMgrInstallBadfile------\n");
}

/**
 * @tc.name   testUninstallNullCallback
 * @tc.number SUB_APPEXECFWK_BMS_API_0014
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testUninstallNullCallback, Function | MediumTest | Level2)
{
    printf("------start testUninstallNullCallback------\n");
    const char *bundleName = (char*)"com.openharmony.testdemo";
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool isUninstallSuccess = Uninstall(bundleName, &installParam, nullptr);
    EXPECT_FALSE(isUninstallSuccess);
    printf("uninstall result is %d", isUninstallSuccess);
    printf("------end testUninstallNullCallback------\n");
}

/**
 * @tc.name   testUninstallnullBundleName
 * @tc.number SUB_APPEXECFWK_BMS_API_0013
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testUninstallnullBundleName, Function | MediumTest | Level2)
{
    printf("------start testUninstallnullBundleName------\n");
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool isUninstallSuccess = Uninstall(nullptr, &installParam, TestBundleStateCallback);
    EXPECT_FALSE(isUninstallSuccess);
    printf("uninstall result is %d", isUninstallSuccess);
    printf("------end testUninstallnullBundleName------\n");
}

/**
 * @tc.name   testUninstallright
 * @tc.number SUB_APPEXECFWK_BMS_API_0010
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(BundleMgrTest, testUninstallright, Function | MediumTest | Level0)
{
    printf("------start testUninstallright------\n");
    string hapPath = g_testPath + "testnative.hap";
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool installResult = Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    EXPECT_TRUE(installResult);
    const char *bundleName = (char*)"com.openharmony.testnative";
    bool isUninstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    bool uninstallState = Uninstall(bundleName, &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    printf("uninstall result is %d", uninstallState);
    if (g_installState) {
        isUninstallSuccess = true;
    }else if (g_errorCode > 0) {
        isUninstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrUninstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_TRUE(uninstallState);
    printf("uninstall result is %d", isUninstallSuccess);
    printf("------end testUninstallright------\n");
}

/**
 * @tc.name   testUninstallErrorName
 * @tc.number SUB_APPEXECFWK_BMS_API_0011
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testUninstallErrorName, Function | MediumTest | Level2)
{
    printf("------start testUninstallErrorName------\n");
    const char *bundleName = (char*)"com.openharmony.nothisBundleName";
    bool isUninstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool uninstallState = Uninstall(bundleName, &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    printf("uninstall result is %d", uninstallState);
    if (g_installState) {
        isUninstallSuccess = true;
    }else if (g_errorCode > 0) {
        isUninstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrUninstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isUninstallSuccess);
    printf("uninstall result is %d", isUninstallSuccess);
    printf("------end testUninstallErrorName------\n");
}

/**
 * @tc.name   testUninstallEmptyName
 * @tc.number SUB_APPEXECFWK_BMS_API_0012
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testUninstallEmptyName, Function | MediumTest | Level2)
{
    printf("------start testUninstallEmptyName------\n");
    const char *bundleName = (char*)"";
    bool isUninstallSuccess = false;
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = { .installLocation = 1, .keepData = false };
    bool uninstallState = Uninstall(bundleName, &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    printf("uninstall resute is %d", uninstallState);
    if (g_installState) {
        isUninstallSuccess = true;
    }else if (g_errorCode > 0) {
        isUninstallSuccess = false;
        HILOG_DEBUG(HILOG_MODULE_APP, "TestBundleMgrUninstall failed,g_errorCode is: %d", g_errorCode);
    }
    EXPECT_FALSE(isUninstallSuccess);
    printf("uninstall result is %d", isUninstallSuccess);
    printf("------end testUninstallEmptyName------\n");
}


/**
 * @tc.name   testQueryAbilityInfoRight
 * @tc.number SUB_APPEXECFWK_BMS_API_0040
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testQueryAbilityInfoRight, Function | MediumTest | Level1)
{
    printf("------start testQueryAbilityInfoRight------\n");
    Want want;
    int32_t resultWant = memset_s(&want, sizeof(Want), 0, sizeof(Want));
    EXPECT_EQ(resultWant, 0);
    ElementName element;
    int32_t resultElementName = memset_s(&element, sizeof(ElementName), 0, sizeof(ElementName));
    EXPECT_EQ(resultElementName, 0);
    SetElementAbilityName(&element, "MainAbility");
    SetElementBundleName(&element, "com.openharmony.testjsdemo");
    SetWantElement(&want, element);
    SetWantData(&want, "test", 4);
    AbilityInfo abilityInfo;
    int32_t result = memset_s(&abilityInfo, sizeof(abilityInfo), 0, sizeof(abilityInfo));
    EXPECT_EQ(result, 0);
    printf("element.elementname is %s \n",  want.element->bundleName);
    printf("AbilityName2 is %s \n", want.element->abilityName);
    g_errorCode = QueryAbilityInfo(&want, &abilityInfo);
    printf("abilityInfo.bundleName is %s \n", abilityInfo.bundleName);
    printf("abilityInfo.label is %s \n", abilityInfo.label);
    printf("abilityInfo.iconPath is %s \n", abilityInfo.iconPath);
    printf("ret is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 0);
    printf("------end testQueryAbilityInfoRight------\n");
}
/**
 * @tc.name   testQueryAbilityInfoIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0041
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testQueryAbilityInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testQueryAbilityInfoIllegal------\n");
    AbilityInfo abilityInfo;
    int32_t result = memset_s(&abilityInfo, sizeof(AbilityInfo), 0, sizeof(AbilityInfo));
    EXPECT_EQ(result, 0);
    // want is nullptr
    g_errorCode = QueryAbilityInfo(nullptr, &abilityInfo);
    printf("ret is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    // abilityInfo is nullptr
    Want want;
    int32_t resultWant = memset_s(&want, sizeof(Want), 0, sizeof(Want));
    EXPECT_EQ(resultWant, 0);
    ElementName element;
    int32_t resultElementName = memset_s(&element, sizeof(ElementName), 0, sizeof(ElementName));
    EXPECT_EQ(resultElementName, 0);
    SetElementAbilityName(&element, "MainAbility");
    SetElementBundleName(&element, "com.openharmony.testjsdemo");
    SetWantElement(&want, element);
    SetWantData(&want, "test", 4);
    g_errorCode = QueryAbilityInfo(&want, nullptr);
    printf("ret is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    // content of want is ""
    Want want1 = { nullptr };
    ElementName element1 = { nullptr };
    SetElementBundleName(&element1, "");
    SetElementAbilityName(&element1, "");
    SetWantElement(&want1, element1);
    AbilityInfo abilityInfo1;
    g_errorCode = QueryAbilityInfo(&want1, &abilityInfo1);
    printf("abilityInfo is null \n");
    printf("ret is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 2);
    printf("------end testQueryAbilityInfoIllegal------\n");
}

/**
 * @tc.name   testGetBundleInfoRight
 * @tc.number SUB_APPEXECFWK_BMS_API_0029
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testGetBundleInfoRight, Function | MediumTest | Level1)
{
    printf("------start testGetBundleInfoRight------\n");
    BundleInfo bundleInfo;
    int32_t result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    EXPECT_EQ(result, 0);
    const char *bundleName = (char*)"com.openharmony.testjsdemo";
    int32_t flags = 0;
    printf("bundleName is %s \n", bundleName);
    g_errorCode = GetBundleInfo(bundleName, flags, &bundleInfo);
    printf("getBundleInfo result is %d \n", g_errorCode);
    EXPECT_STREQ(bundleInfo.bundleName, bundleName);
    EXPECT_EQ(bundleInfo.numOfAbility, 0);
    EXPECT_EQ(g_errorCode, 0);
    flags = 1;
    printf("bundleName is %s \n", bundleName);
    g_errorCode = GetBundleInfo(bundleName, flags, &bundleInfo);
    printf("getBundleInfo result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 0);
    EXPECT_STREQ(bundleInfo.bundleName, bundleName);
    EXPECT_EQ(bundleInfo.numOfAbility, 3);
    ClearBundleInfo(&bundleInfo);
    printf("------end testGetBundleInfoRight------\n");
}

/**
 * @tc.name   testGetBundleInfoIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0030
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleInfoIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfoIllegal------\n");
    BundleInfo bundleInfo;
    int32_t result = memset_s(&bundleInfo, sizeof(bundleInfo), 0, sizeof(bundleInfo));
    EXPECT_EQ(result, 0);
    const char *bundleName = (char*)"com.openharmony.nothishap";
    int32_t flags = 0;
    // error bundleName
    g_errorCode = GetBundleInfo(bundleName, flags, &bundleInfo);
    printf("bundleInfo1.bundleName is %s \n", bundleInfo.bundleName);
    printf("bundleInfo1.versionCode is %d \n", bundleInfo.versionCode);
    printf("bundleInfo1.codePath is %s \n", bundleInfo.codePath);
    EXPECT_EQ(g_errorCode, 2);
    // bundleName = nullptr
    g_errorCode = GetBundleInfo(nullptr, flags, &bundleInfo);
    printf("abilityInfo2 is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    printf("bundleInfo2.bundleName is %s \n", bundleInfo.bundleName);
    printf("bundleInfo2.versionCode is %d \n", bundleInfo.versionCode);
    printf("bundleInfo2.codePath is %s \n", bundleInfo.codePath);
    // bunldeName = ""
    g_errorCode = GetBundleInfo("", flags, &bundleInfo);
    printf("bundleInfo3.bundleName is %s \n", bundleInfo.bundleName);
    printf("bundleInfo3.versionCode is %d \n", bundleInfo.versionCode);
    printf("bundleInfo3.codePath is %s \n", bundleInfo.codePath);
    EXPECT_EQ(g_errorCode, 2);
    // flags not exit
    g_errorCode = GetBundleInfo("com.openharmony.testjsdemo", 2, &bundleInfo);
    printf("bundleInfo3.bundleName is %s \n", bundleInfo.bundleName);
    printf("bundleInfo3.versionCode is %d \n", bundleInfo.versionCode);
    printf("bundleInfo3.codePath is %s \n", bundleInfo.codePath);
    EXPECT_EQ(g_errorCode, 1);
    printf("------end testGetBundleInfoIllegal------\n");
}

/**
 * @tc.name   testGetBundleInfosRight
 * @tc.number SUB_APPEXECFWK_BMS_API_0042
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testGetBundleInfosRight, Function | MediumTest | Level1)
{
    printf("------start testGetBundleInfosRight------\n");
    BundleInfo *bundleInfos = nullptr;
    int32_t flags = 0;
    int32_t length = 0;
    g_errorCode = GetBundleInfos(flags, &bundleInfos, &length);
    printf("getBundleInfo result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 0);
    if (g_errorCode == 0){
        printf("bundleInfos.codePath is %s \n", bundleInfos[0].codePath);
        printf("bundleInfos.bundleName is %s \n", bundleInfos[0].bundleName);
        printf("bundleInfos.versionCode is %d \n", bundleInfos[0].versionCode);
    }
    flags = 1;
    g_errorCode = GetBundleInfos(flags, &bundleInfos, &length);
    printf("getBundleInfo result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 0);
        if (g_errorCode == 0){
        printf("bundleInfos.codePath is %s \n", bundleInfos[0].codePath);
        printf("bundleInfos.bundleName is %s \n", bundleInfos[0].bundleName);
        printf("bundleInfos.versionCode is %d \n", bundleInfos[0].versionCode);
    }
    free(bundleInfos);
    printf("------end testGetBundleInfosRight------\n");
}

/**
 * @tc.name   testGetBundleInfosIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0043
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleInfosIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfosIllegal------\n");
    BundleInfo *bundleInfos = {nullptr};
    int32_t *length = nullptr;
    int32_t flags = 0;
    g_errorCode = GetBundleInfos(flags, nullptr, length);
    EXPECT_EQ(g_errorCode, 4);
    g_errorCode = GetBundleInfos(flags, &bundleInfos, nullptr);
    printf("g_errorCode is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    g_errorCode = GetBundleInfos(2, &bundleInfos, length);
    printf("g_errorCode is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    printf("------end testGetBundleInfosIllegal------\n");
}

/**
 * @tc.name   testGetBundleInfosByMetaDataIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0039
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleInfosByMetaDataIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleInfosByMetaDataIllegal------\n");
    BundleInfo *bundleInfos = {nullptr};
    int32_t length = 0;
    const char *metaDataKey = "appId";
    g_errorCode = GetBundleInfosByMetaData(nullptr, &bundleInfos, &length);
    EXPECT_EQ(g_errorCode, 4);
    g_errorCode = GetBundleInfosByMetaData(metaDataKey, &bundleInfos, nullptr);
    printf("g_errorCode is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    g_errorCode = GetBundleInfosByMetaData(metaDataKey, nullptr, &length);
    printf("g_errorCode is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    const char *metaDataKey1 = "noThisKey";
    printf("metaDataKey is %s \n", metaDataKey1);
    g_errorCode = GetBundleInfosByMetaData(metaDataKey1, &bundleInfos, &length);
    printf("GetBundleInfosByMetaData result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 2);
    const char *metaDataKey2 = "";
    g_errorCode = GetBundleInfosByMetaData(metaDataKey2, &bundleInfos, &length);
    printf("GetBundleInfosByMetaData result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 2);
    printf("------end testGetBundleInfosByMetaDataIllegal------\n");
}

/**
 * @tc.name   testGetBundleInfosByMetaDataRight
 * @tc.number SUB_APPEXECFWK_BMS_API_0038
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testGetBundleInfosByMetaDataRight, Function | MediumTest | Level1)
{
    printf("------start testGetBundleInfosByMetaDataRight------\n");
    BundleInfo *bundleInfos = nullptr;
    const char *metaDataKey = "appId";
    int32_t length = 0;
    printf("metaDataKey is %s \n", metaDataKey);
    g_errorCode = GetBundleInfosByMetaData(metaDataKey, &bundleInfos, &length);
    printf("GetBundleInfosByMetaData result is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 0);
    if (g_errorCode == 0){
        printf("bundleInfos.bundleName is %s \n", bundleInfos[0].bundleName);
    }
    printf("------end testGetBundleInfosByMetaDataRight------\n");
}

/**
 * @tc.name   testQueryKeepAliveBundleInfosIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0037
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testQueryKeepAliveBundleInfosIllegal, Function | MediumTest | Level2)
{
    printf("------start testQueryKeepAliveBundleInfosIllegal------\n");
    BundleInfo *bundleInfos = {nullptr};
    int32_t length = 0;
    g_errorCode = QueryKeepAliveBundleInfos(nullptr, &length);
    printf("g_errorCode1 is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    g_errorCode = QueryKeepAliveBundleInfos(&bundleInfos, nullptr);
    printf("g_errorCode2 is %d \n", g_errorCode);
    EXPECT_EQ(g_errorCode, 4);
    printf("------end testQueryKeepAliveBundleInfosIllegal------\n");
}

/**
 * @tc.name   testGetBundleNameForUidWithNullptr
 * @tc.number SUB_APPEXECFWK_BMS_API_0034
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleNameForUidWithNullptr, Function | MediumTest | Level2)
{
    printf("------start testGetBundleNameForUidWithNullptr------\n");
    int32_t resultCode = GetBundleNameForUid(0, nullptr);
    EXPECT_EQ(resultCode, 4);
    printf("GetBundleNameForUid result is %d \n", resultCode);
    printf("------end testGetBundleNameForUidWithNullptr------\n");
}

/**
 * @tc.name   testGetBundleNameForUidWithIllegal
 * @tc.number SUB_APPEXECFWK_BMS_API_0035
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleNameForUidWithIllegal, Function | MediumTest | Level2)
{
    printf("------start testGetBundleNameForUidWithIllegal------\n");
    char *bundleName = nullptr;
    int32_t resultCode = GetBundleNameForUid(0, &bundleName);
    EXPECT_EQ(resultCode, 114);
    printf("GetBundleNameForUid result is %d \n", resultCode);
    if (bundleName != nullptr) {
        free(bundleName);
    }
    printf("------end testGetBundleNameForUidWithIllegal------\n");
}

/**
 * @tc.name   testGetBundleSizeWithLegal_0001
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0001
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithLegal_0001, Function | MediumTest | Level1)
{
    printf("------start testGetBundleSizeWithLegal_0001------\n");
    char *bundleName = (char*)"com.openharmony.testjsdemo";
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_GT(resultCode, 0);
    printf("------end testGetBundleSizeWithLegal_0001------\n");
}

/**
 * @tc.name   testGetBundleSizeWithLegal_0002
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0002
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithLegal_0002, Function | MediumTest | Level1)
{
    printf("------start testGetBundleSizeWithLegal_0002------\n");
    char *bundleName = (char*)"com.openharmony.testjsdemoBundleNameleng" \
"thequalto127testjsdemoBundleNamelengthequalto127testjsdemoBundleNamelengthequalto127tes";
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = {.installLocation = 1, .keepData = false };
    string hapPath = g_testPath + "testGetBundleNameWithLegal127.hap";
    Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_EQ(strlen(bundleName), 127);
    EXPECT_GT(resultCode, 0);
    // uninstall
    sem_init(&g_sem, 0, 0);
    Uninstall(bundleName, &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    printf("------end testGetBundleSizeWithLegal_0002------\n");
}

/**
 * @tc.name   testGetBundleSizeWithIllegal_0001
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0003
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithIllegal_0001, Function | MediumTest | Level2)
{
    printf("------start testGetBundleSizeWithIllegal_0001------\n");
    char *bundleName = (char*)"com.openharmony.testjsdemoBundleNameLength128test" \
"jsdemoBundleNameLength128testjsdemoBundleNameLength128testjsdemoBundleNameLengt";
    EXPECT_EQ(strlen(bundleName), 128);
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_EQ(resultCode, 0);
    printf("------end testGetBundleSizeWithIllegal_0001------\n");
}

/**
 * @tc.name   testGetBundleSizeWithIllegal_0002
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0004
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithIllegal_0002, Function | MediumTest | Level2)
{
    printf("------start testGetBundleSizeWithIllegal_0002------\n");
    char *bundleName = nullptr;
    // bundleName nullptr
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_EQ(resultCode, 0);
    printf("------end testGetBundleSizeWithIllegal_0002------\n");
}

/**
 * @tc.name   testGetBundleSizeWithIllegal_0003
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0005
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithIllegal_0003, Function | MediumTest | Level2)
{
    printf("------start testGetBundleSizeWithIllegal_0003------\n");
    char *bundleName = (char*)"com.openharmony.nothishap";
    // error bundleName
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_EQ(resultCode, 0);
    printf("------end testGetBundleSizeWithIllegal_0003------\n");
}

/**
 * @tc.name   testGetBundleSizeWithIllegal_0004
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0006
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testGetBundleSizeWithIllegal_0004, Function | MediumTest | Level2)
{
    printf("------start testGetBundleSizeWithIllegal_0004------\n");
    char *bundleName = (char*)" ";
    // bundleName " "
    uint32_t resultCode = GetBundleSize(bundleName);
    EXPECT_EQ(resultCode, 0);
    printf("------end testGetBundleSizeWithIllegal_0004------\n");
}

/**
 * @tc.name   testStressConfig_0001
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0007
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testStressConfig_0001, Function | MediumTest | Level2)
{
    printf("------start testStressConfig_0001------\n");
    char *bundleName = (char*)"com.openharmony.testjsdemo";
    for (int i = 1; i <= 100; i++) {
        uint32_t resultCode = GetBundleSize(bundleName);
        EXPECT_GT(resultCode, 0);
    }
    printf("------end testStressConfig_0001------\n");
}

/**
 * @tc.name   testStressConfig_0002
 * @tc.number SUB_APPEXECFWK_BMS_SIZE_0008
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(BundleMgrTest, testStressConfig_0002, Function | MediumTest | Level2)
{
    printf("------start testStressConfig_0002------\n");
    char *bundleName = (char*)"com.openharmony.testjsdemo";
    char *bundleName2 = (char*)"com.openharmony.testjsdemoBtestjsdemoB";
    sem_init(&g_sem, 0, 0);
    InstallParam installParam = {.installLocation = 1, .keepData = false };
    string hapPath = g_testPath + "frequentlyStress.hap";
    Install(hapPath.c_str(), &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    for (int i = 1; i <= 100; i++) {
        uint32_t resultCode = GetBundleSize(bundleName);
        EXPECT_GT(resultCode, 0);
        resultCode = GetBundleSize(bundleName2);
        EXPECT_GT(resultCode, 0);
    }
    // uninstall
    sem_init(&g_sem, 0, 0);
    Uninstall(bundleName2, &installParam, TestBundleStateCallback);
    sem_wait(&g_sem);
    printf("------end testStressConfig_0002------\n");
}
