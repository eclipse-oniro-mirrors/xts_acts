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

import { describe, expect, it, Level } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  APP_IDS_1,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  AUTOSTARTAPP1,
  AUTOSTARTAPP2,
  TEST_BUNDLENAME,
  DEFAULT_APP_INDEX
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';
import sysDeviceInfo from '@ohos.deviceInfo';
import common from '@ohos.enterprise.common';
import { connection, statistics } from '@kit.NetworkKit';

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test addDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test addDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test getDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test getDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_001
     * @tc.desc   test addAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_001
     * @tc.desc   test removeAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_001
     * @tc.desc   test getAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAutoStartApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAutoStartApps_disallowModify_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DISALLOWMODIFY_001
     * @tc.desc   test addAutoStartAppsWithDisallowModify method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartApps_disallowModify_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartApps_userId_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_001
     * @tc.desc   test removeAutoStartAppsWithUserId method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartApps_userId_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAutoStartApps_userId_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_001
     * @tc.desc   test getAutoStartAppsWithUserId method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartApps_userId_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyAutoStartAppsDisallowed_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODIFYAUTOSTARTAPPSDISALLOWED_001
     * @tc.desc   test isModifyAutoStartAppsDisallowed method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyAutoStartAppsDisallowed_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODIFYKEEPALIVEAPPSDISALLOWED_001
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, TEST_BUNDLENAME);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsDisallowModify_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_DISALLOWMODIFY_001
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsDisallowModify_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_001
     * @tc.desc   test addKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_001
     * @tc.desc   test removeKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_001
     * @tc.desc   test getKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        keepAliveApps = applicationManager.getKeepAliveApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test addFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test removeFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test getFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_001
     * @tc.desc   test addUserNonStopApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_001
     * @tc.desc   test removeUserNonStopApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_001
     * @tc.desc   test getUserNonStopApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getUserNonStopApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_clearUpApplicationData
     * @tc.number SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA
     * @tc.desc   test clearUpApplicationData method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_clearUpApplicationData", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.clearUpApplicationData(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_setAllowedKioskApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_001
     * @tc.desc   test setAllowedKioskApps method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAllowedKioskApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleNames: Array<string> = [];
        applicationManager.setAllowedKioskApps(SELFWANT, bundleNames);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedKioskApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_001
     * @tc.desc   test getAllowedKioskApps method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedKioskApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setKioskFeatures_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SETKIOSKFEATURES_001
     * @tc.desc   test setKioskFeatures method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setKioskFeatures_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_GESTURE_CONTROL);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_SIDE_DOCK);
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES
     * @tc.desc   test addAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES
     * @tc.desc   test removeAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES
     * @tc.desc   test getAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP
     * @tc.desc   test addDockApp method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addDockApp(SELFWANT, TEST_BUNDLENAME, TEST_BUNDLENAME, 2);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDockApp_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP
     * @tc.desc   test removeDockApp method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDockApp_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeDockApp(SELFWANT, TEST_BUNDLENAME, TEST_BUNDLENAME);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDockApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDOCKAPP
     * @tc.desc   test removeDockApp method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDockApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getDockApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SETABILITYDISABLED_001
     * @tc.desc   test setAbilityDisabled method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_002
     * @tc.number SUB_CUSTOMIZATION_EDM_SETABILITYDISABLED_002
     * @tc.desc   test setAbilityDisabled method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISABILITYDISABLED_001
     * @tc.desc   test isAbilityDisabled method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test addAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test removeAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test getAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0100
     * @tc.desc   test queryTrafficStats method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0100", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 201).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    })

    /**
     * @tc.name   test_queryBundleStatsInfos_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0100
     * @tc.desc   test queryBundleStatsInfos method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryBundleStatsInfos_0100", Level.LEVEL2, async (done: Function) => {
      try {
        let startTime: number = 0;
        let endTime: number = Date.now();
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDHIDELAUNCHERICON_NO_PERMISSION_JS_0100
     * @tc.desc   test addHideLauncherIcon with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      const TEST_BUNDLE_NAMES: Array<string> = ['com.test.bundle1', 'com.test.bundle2'];
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addHideLauncherIcon(SELFWANT, TEST_BUNDLE_NAMES);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 201).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEHIDELAUNCHERICON_NO_PERMISSION_JS_0100
     * @tc.desc   test removeHideLauncherIcon with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      const TEST_BUNDLE_NAMES: Array<string> = ['com.test.bundle1', 'com.test.bundle2'];
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeHideLauncherIcon(SELFWANT, TEST_BUNDLE_NAMES);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 201).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getHideLauncherIcon_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETHIDELAUNCHERICON_NO_PERMISSION_JS_0100
     * @tc.desc   test getHideLauncherIcon with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getHideLauncherIcon_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getHideLauncherIcon(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === 201).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getApplicationWindowStates_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAPPLICATIONWINDOWSTATES_NO_PERMISSION_JS_0100
     * @tc.desc   test getApplicationWindowStates with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getApplicationWindowStates_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getApplicationWindowStates(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDDISTRIBUTEABILITYCONN_NO_PERMISSION_JS_0100
     * @tc.desc   test addAllowedDistributeAbilityConnBundles with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDDISTRIBUTEABILITYCONN_NO_PERMISSION_JS_0100
     * @tc.desc   test removeAllowedDistributeAbilityConnBundles with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.removeAllowedDistributeAbilityConnBundles(SELFWANT, APP_IDS_1, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedDistributeAbilityConnBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDDISTRIBUTEABILITYCONN_NO_PERMISSION_JS_0100
     * @tc.desc   test getAllowedDistributeAbilityConnBundles with permission denied 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedDistributeAbilityConnBundles_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getAllowedDistributeAbilityConnBundles(SELFWANT, applicationManager.ServiceType.COLLABORATION_SERVICE, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code === 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}