/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "ActsPMSTest.h"

using namespace std;
using namespace testing::ext;

static PmsInnerApi *g_interface;
static PermissionTrans g_unNormalPers[] = {
    {
        PERMISSION_TOOLONG,
        "abnormal permission",
        INUSE,
    },
    {
        PERMISSION_EMPTY,
        "abnormal permission",
        INUSE,
    },
    {
        PERMISSION_UNSUPPORTED,
        "abnormal permission",
        INUSE,
    },
};
static PermissionTrans g_systemPers[] = {
    {
        "ohos.permission.CAMERA",
        "for CAMERA use",
        INUSE,
    },
    {
        "ohos.permission.RECORD_AUDIO",
        "for RECORD_AUDIO use",
        ALWAYS,
    },
    {
        "ohos.permission.READ_MEDIA_AUDIO",
        "for READ_MEDIA_AUDIO use",
        INUSE,
    },
    {
        "ohos.permission.READ_MEDIA_IMAGES",
        "for READ_MEDIA_IMAGES use",
        ALWAYS,
    },
    {
        "ohos.permission.READ_MEDIA_VIDEO",
        "for READ_MEDIA_VIDEO use",
        INUSE,
    },
    {
        "ohos.permission.WRITE_MEDIA_AUDIO",
        "for WRITE_MEDIA_AUDIO use",
        ALWAYS,
    },
    {
        "ohos.permission.WRITE_MEDIA_IMAGES",
        "for WRITE_MEDIA_IMAGES use",
        INUSE,
    },
    {
        "ohos.permission.WRITE_MEDIA_VIDEO",
        "for WRITE_MEDIA_VIDEO use",
        ALWAYS,
    },
    {
        "ohos.permission.MODIFY_AUDIO_SETTINGS",
        "for MODIFY_AUDIO_SETTINGS use",
        INUSE,
    },
};
static PermissionTrans g_unDefPer = {
    PERMISSION_UNDEFINED,
    "for undefined use",
    INUSE,
};

int IsUserGrant(const char* pname)
{
    if (strcmp(pname, "ohos.permission.MODIFY_AUDIO_SETTINGS") == 0) {
        return false;
    }
    return true;
}

int CheckPermData(const PermissionTrans* pt, const PermissionSaved* ps,
    const PermissionSaved* pre, int len, int plen)
{
    if (len == 0) {
        printf("len == 0\n");
        return true;
    }
    if (ps == NULL) {
        printf("ps == NULL\n");
        return false;
    }
    bool ret = true;
    for (int i = 0; i < len; i++) {
        if (strcmp(pt[i].name, ps[i].name) != 0) {
            ret = false;
        }
        int grant = NOT_GRANTED;
        if (IsUserGrant(pt[i].name)) {
            if (pre != NULL) {
                for (int j = 0; j < plen; j++) {
                    if (strcmp(ps[i].name, pre[j].name) == 0 && pre[j].granted == GRANTED) {
                        grant = GRANTED;
                        break;
                    }
                }
            }
        } else {
            grant = GRANTED;
        }
        if (ps[i].granted != grant) {
            ret = false;
        }
        if (ret == false) {
            printf("ps[i].name = %s, ps[i].granted = %d, except = %d\n", pt[i].name, ps[i].granted, grant);
            break;
        }
    }
    return ret;
}

void ClrPers(PermissionSaved* &permissions)
{
    if (permissions != NULL) {
        free(permissions);
        permissions = NULL;
    }
}

class ActsPMSSaveTest : public testing::Test {
public:
    static void InitInterface()
    {
        if (g_interface != NULL) {
            return;
        }

        SetUpTestCase();
    }
protected:
    static void SetUpTestCase(void)
    {
        CreateAppDir();
        IUnknown *iUnknown = SAMGR_GetInstance()->GetFeatureApi(PERMISSION_SERVICE, PERM_INNER);
        iUnknown->QueryInterface(iUnknown, DEFAULT_VERSION, (void **) &g_interface);
        setuid(0);
    }
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown()
    {
        DeletePermissions(TEST_APP_ID);
        DeletePermissions(TEST_APP_ID2);
        DeletePermissions(SUBTEST_APP_ID);
        UnLoadPermissions(TEST_TASKID);
        UnLoadPermissions(SUBTEST_TASKID);
    }
};

void CheckAppPermission(const char *identifier, int expRet, int expNum, const PermissionTrans* installPers,
    const PermissionSaved* lastPers, int lastLen)
{
    if (g_interface == NULL) {
        ActsPMSSaveTest::InitInterface();
    }
    PermissionSaved* permissions = NULL;
    int permNum = 0;
    int ret = g_interface->QueryPermission(identifier, &permissions, &permNum);
    EXPECT_EQ(ret, expRet) << "query ret = " << ret << ", expect ret = " << expRet << std::endl;
    EXPECT_EQ(permNum, expNum) << "permNum = " << permNum << ", expect permNum = " << expNum << std::endl;
    ret = CheckPermData(installPers, permissions, lastPers, permNum, lastLen);
    EXPECT_EQ(ret, true);
    ClrPers(permissions);
}

void SubTestWithoutCheck(const char *identifier, int taskID)
{
    if (g_interface == NULL) {
        ActsPMSSaveTest::InitInterface();
    }

    SaveOrUpdatePermissions(identifier, g_systemPers, 0, FIRST_INSTALL);
    SaveOrUpdatePermissions(identifier, g_systemPers, SYS_PERM_NUM, UPDATE);
    int i;
    for (i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->GrantPermission(identifier, g_systemPers[i].name);
    }
    for (i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->RevokePermission(identifier, g_systemPers[i].name);
    }
    g_interface->GrantPermission(identifier, g_systemPers[0].name);
    LoadPermissions(identifier, taskID);
    g_interface->GrantRuntimePermission(taskID, g_systemPers[1].name);
    CheckPermission(TEST_TASKID, g_systemPers[0].name);
    UnLoadPermissions(taskID);
    CheckPermission(TEST_TASKID, g_systemPers[0].name);
    DeletePermissions(identifier);
}

void CreateAppDir(void)
{
    mkdir("/storage", DIR_MODE);
    mkdir("/storage/app", DIR_MODE);
    int ret = mkdir(ETC_PREFIX, DIR_MODE);
    if (ret) {
        printf("create dir %s error\n", ETC_PREFIX);
    }
    ret = mkdir(PERMISSION_PREFIX, DIR_MODE);
    if (ret) {
        printf("create dir %s error\n", PERMISSION_PREFIX);
    }
}

/**
 * @tc.name   testSecPMPMS_0010
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0010
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0010, Function | MediumTest | Level1)
{
    PermissionTrans pt[] = {g_systemPers[0]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 0, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, pt);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0020
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0020
 * @tc.desc   [C- SECURITY -0300]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0020, Function | MediumTest | Level0)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0030
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0030
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0030, Function | MediumTest | Level2)
{
    PermissionTrans pt[1];
    int ret = PERM_ERRORCODE_INVALID_PARAMS;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        pt[0] = g_systemPers[i];
        ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 1, FIRST_INSTALL);
        EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
        CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 1, pt);
        DeletePermissions(TEST_APP_ID);
    }
}

/**
 * @tc.name   testSecPMPMS_0040
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0040
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0040, Function | MediumTest | Level3)
{
    PermissionTrans pt[] = {g_unDefPer};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 1, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 1, pt);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0050
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0050
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0050, Function | MediumTest | Level3)
{
    PermissionTrans pt[1];
    int ret = PERM_ERRORCODE_INVALID_PARAMS;
    for (int i = 0; i < ABNORMAL_PERM_NUM; i++) {
        pt[0] = g_unNormalPers[i];
        ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 1, FIRST_INSTALL);
        EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << ", index = " << i << endl;
        CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 1, pt);
        DeletePermissions(TEST_APP_ID);
    }
}

/**
 * @tc.name   testSecPMPMS_0060
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0060
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0060, Function | MediumTest | Level2)
{
    PermissionTrans pt[MAX_PERM_NUM];
    PermissionTrans exp[MAX_PERM_NUM];
    int i;
    for (i = 0; i < SYS_PERM_NUM; i++) {
        pt[i] = g_systemPers[i];
        exp[i] = g_systemPers[i];
    }
    exp[SYS_PERM_NUM] = g_unDefPer;
    for (i = SYS_PERM_NUM; i < MAX_PERM_NUM; i++) {
        pt[i] = g_unDefPer;
    }
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, MAX_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM + 1, exp);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0070
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0070
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL4
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0070, Function | MediumTest | Level4)
{
    PermissionTrans pt[MAX_PERM_NUM + 1];
    int i;
    for (i = 0; i < MAX_PERM_NUM + 1; i++) {
        pt[i] = g_systemPers[0];
    }
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, MAX_PERM_NUM + 1, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_TOO_MUCH_PERM) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, pt);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0080
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0080
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0080, Function | MediumTest | Level2)
{
    PermissionTrans pt[MAX_PERM_NUM];
    int i;
    for (i = 0; i < SYS_PERM_NUM; i++) {
        pt[i] = g_systemPers[i];
    }
    for (i = SYS_PERM_NUM; i < MAX_PERM_NUM; i++) {
        pt[i] = g_systemPers[0];
    }
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, MAX_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* permissions = NULL;
    int permNum = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &permissions, &permNum);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(permNum, SYS_PERM_NUM) << "permNum = " << permNum << endl;
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0090
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0090
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL4
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0090, Function | MediumTest | Level4)
{
    PermissionTrans pt[MAX_PERM_NUM];
    int i;
    for (i = 0; i < MAX_PERM_NUM; i++) {
        pt[i] = g_systemPers[0];
    }
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, MAX_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 1, pt);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0100
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0100
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0100, Function | MediumTest | Level1)
{
    PermissionTrans pt[] = {g_systemPers[0]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 0, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID2, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, pt);
    CheckAppPermission(TEST_APP_ID2, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    DeletePermissions(TEST_APP_ID);
    DeletePermissions(TEST_APP_ID2);
}

/**
 * @tc.name   testSecPMPMS_0110
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0110
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0110, Function | MediumTest | Level2)
{
    PermissionTrans pt[] = {g_systemPers[0]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 0, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0120
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0120
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0120, Function | MediumTest | Level2)
{
    PermissionTrans pt[] = {g_systemPers[0]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 0, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, pt);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0130
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0130
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0130, Function | MediumTest | Level1)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        ret = g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, SYS_PERM_NUM) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0140
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0140
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0140, Function | MediumTest | Level1)
{
    PermissionTrans pt1[] = {g_systemPers[0], g_systemPers[1], g_systemPers[2],
                g_systemPers[3], g_systemPers[5], g_systemPers[6], g_systemPers[7]};
    PermissionTrans pt2[] = {g_systemPers[1], g_systemPers[2], g_systemPers[3], g_systemPers[4],
                g_systemPers[5], g_systemPers[6], g_systemPers[7], g_systemPers[8]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt1, 7, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        ret = g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, 7) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, pt2, 8, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 8, pt2, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0150
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0150
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0150, Function | MediumTest | Level3)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, SYS_PERM_NUM) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM - 1, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM - 1, g_systemPers, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0160
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0160
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0160, Function | MediumTest | Level2)
{
    PermissionTrans pt[] = {g_systemPers[0], g_systemPers[1], g_systemPers[2], g_systemPers[3],
                            g_systemPers[5], g_systemPers[6], g_systemPers[7]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        ret = g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, SYS_PERM_NUM) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 7, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 7, pt, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0170
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0170
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0170, Function | MediumTest | Level2)
{
    PermissionTrans pt[] = {g_systemPers[0], g_systemPers[1], g_systemPers[2], g_systemPers[3],
                            g_systemPers[5], g_systemPers[6], g_systemPers[7]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        if (i % 2 == 0) {
            continue;
        }
        ret = g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, SYS_PERM_NUM) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 7, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, 7, pt, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0180
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0180
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0180, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM - 1, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, SYS_PERM_NUM - 1) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0190
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0190
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0190, Function | MediumTest | Level1)
{
    PermissionTrans pt[] = {g_systemPers[8]};
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, pt, 1, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* oldpers = NULL;
    int oldp = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &oldpers, &oldp);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(oldp, 1) << "permNum = " << oldp;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers, oldpers, oldp);
    ClrPers(oldpers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0220
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0220
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0220, Function | MediumTest | Level3)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0240
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0240
 * @tc.desc   [C- SECURITY -0600]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0240, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    ret = DeletePermissions(TEST_APP_ID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "delete ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0320
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0320
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0320, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    ret = LoadPermissions(TEST_APP_ID, TEST_TASKID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "load ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, 0, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, g_systemPers);
    ret = UnLoadPermissions(TEST_TASKID);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0330
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0330
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0330, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = LoadPermissions(TEST_APP_ID, TEST_TASKID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "load ret = " << ret << endl;
    ret = UnLoadPermissions(TEST_TASKID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "unload ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, 0, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0340
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0340
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL4
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0340, Function | MediumTest | Level4)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    for (int i = 0; i < SYS_PERM_NUM; i++) {
        g_interface->GrantPermission(TEST_APP_ID, g_systemPers[i].name);
    }
    ret = LoadPermissions(TEST_APP_ID, TEST_TASKID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "load ret = " << ret << endl;
    ret = CheckPermission(TEST_TASKID, g_systemPers[0].name);
    EXPECT_EQ(ret, GRANTED) << "checkperm ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, 0, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, g_systemPers);
    UnLoadPermissions(TEST_TASKID);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0350
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0350
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL4
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0350, Function | MediumTest | Level4)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = LoadPermissions(TEST_APP_ID, TEST_TASKID);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "load ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_SUCCESS, SYS_PERM_NUM, g_systemPers);
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, 0, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_FILE_NOT_EXIST, 0, g_systemPers);
    UnLoadPermissions(TEST_TASKID);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0360
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0360
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0360, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = g_interface->GrantPermission(TEST_APP_ID, g_systemPers[0].name);
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* permissions = NULL;
    int permNum = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &permissions, &permNum);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(permNum, SYS_PERM_NUM) << "permNum = " << permNum << endl;
    EXPECT_EQ(permissions[0].granted, GRANTED);
    ClrPers(permissions);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0370
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0370
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0370, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    g_interface->GrantPermission(TEST_APP_ID, g_systemPers[0].name);
    g_interface->RevokePermission(TEST_APP_ID, g_systemPers[0].name);
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    PermissionSaved* permissions = NULL;
    int permNum = 0;
    ret = g_interface->QueryPermission(TEST_APP_ID, &permissions, &permNum);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "query ret = " << ret << endl;
    EXPECT_EQ(permNum, SYS_PERM_NUM) << "permNum = " << permNum << endl;
    EXPECT_EQ(permissions[0].granted, NOT_GRANTED);
    ClrPers(permissions);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0380
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0380
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0380, Function | MediumTest | Level3)
{
    int pid = fork();
    int status = 0;
    if (pid != 0) {
        int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
        EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
        DeletePermissions(TEST_APP_ID);
        waitpid(pid, &status, 0);
    } else {
        SubTestWithoutCheck(SUBTEST_APP_ID, SUBTEST_TASKID);
        exit(0);
    }
}

/**
 * @tc.name   testSecPMPMS_0390
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0390
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0390, Function | MediumTest | Level3)
{
    int ret = SaveOrUpdatePermissions(NULL, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_INVALID_PARAMS) << "save ret = " << ret << endl;
}

/**
 * @tc.name   testSecPMPMS_0410
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0410
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL4
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0410, Function | MediumTest | Level4)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    int fd = access(TEST_APP_PATH, F_OK);
    if (fd == 0) {
        unlink(TEST_APP_PATH);
    }
    fd = open(TEST_APP_PATH, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
    if (fd >= 0) {
        write(fd, PERMISSION_UNSUPPORTED, strlen(PERMISSION_UNSUPPORTED));
        close(fd);
    }
    ret = SaveOrUpdatePermissions(TEST_APP_ID, g_systemPers, SYS_PERM_NUM, UPDATE);
    EXPECT_EQ(ret, PERM_ERRORCODE_JSONPARSE_FAIL) << "save ret = " << ret << endl;
    CheckAppPermission(TEST_APP_ID, PERM_ERRORCODE_JSONPARSE_FAIL, 0, g_systemPers);
    DeletePermissions(TEST_APP_ID);
}

/**
 * @tc.name   testSecPMPMS_0490
 * @tc.number SUB_SEC_AppSEC_PermissionMgmt_PMS_0490
 * @tc.desc   [C- SECURITY -0700]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(ActsPMSSaveTest, testSecPMPMS_0490, Function | MediumTest | Level2)
{
    int ret = SaveOrUpdatePermissions(TEST_APP_SHORT, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    ret = SaveOrUpdatePermissions(TEST_APP_LONG, g_systemPers, SYS_PERM_NUM, FIRST_INSTALL);
    EXPECT_EQ(ret, PERM_ERRORCODE_SUCCESS) << "save ret = " << ret << endl;
    DeletePermissions(TEST_APP_SHORT);
    DeletePermissions(TEST_APP_LONG);
}