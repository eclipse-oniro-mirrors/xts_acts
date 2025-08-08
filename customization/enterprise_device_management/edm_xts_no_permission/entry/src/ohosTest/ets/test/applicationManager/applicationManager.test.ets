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

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedRunningBundlesSync_001
     * @tc.desc      : test addDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.name      : test_addDisallowedRunningBundlesSync_002
     * @tc.desc      : test addDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedRunningBundlesSync_001
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.name      : test_removeDisallowedRunningBundlesSync_002
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedRunningBundlesSync_001
     * @tc.desc      : test getDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.name      : test_getDisallowedRunningBundlesSync_002
     * @tc.desc      : test getDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_001
     * @tc.name      : test_addAutoStartApps_001
     * @tc.desc      : test addAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_001
     * @tc.name      : test_removeAutoStartApps_001
     * @tc.desc      : test removeAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_001
     * @tc.name      : test_getAutoStartApps_001
     * @tc.desc      : test getAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DISALLOWMODIFY_001
     * @tc.name      : test_addAutoStartApps_disallowModify_001
     * @tc.desc      : test addAutoStartAppsWithDisallowModify method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_001
     * @tc.name      : test_removeAutoStartApps_userId_001
     * @tc.desc      : test removeAutoStartAppsWithUserId method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_001
     * @tc.name      : test_getAutoStartApps_userId_001
     * @tc.desc      : test getAutoStartAppsWithUserId method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODIFYAUTOSTARTAPPSDISALLOWED_001
     * @tc.name      : test_isModifyAutoStartAppsDisallowed_001
     * @tc.desc      : test isModifyAutoStartAppsDisallowed method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODIFYKEEPALIVEAPPSDISALLOWED_001
     * @tc.name      : test_isModifyKeepAliveAppsDisallowed_001
     * @tc.desc      : test isModifyKeepAliveAppsDisallowed method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_DISALLOWMODIFY_001
     * @tc.name      : test_addKeepAliveAppsDisallowModify_001
     * @tc.desc      : test addKeepAliveAppsWithDisallowModify method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_001
     * @tc.name      : test_addKeepAliveApps_001
     * @tc.desc      : test addKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_001
     * @tc.name      : test_removeKeepAliveApps_001
     * @tc.desc      : test removeKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_001
     * @tc.name      : test_getKeepAliveApps_001
     * @tc.desc      : test getKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA
     * @tc.name      : test_clearUpApplicationData
     * @tc.desc      : test clearUpApplicationData method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_001
     * @tc.name      : test_setAllowedKioskApps_001
     * @tc.desc      : test setAllowedKioskApps method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_001
     * @tc.name      : test_getAllowedKioskApps_001
     * @tc.desc      : test getAllowedKioskApps method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETKIOSKFEATURES_001
     * @tc.name      : test_setKioskFeatures_001
     * @tc.desc      : test setKioskFeatures method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setKioskFeatures_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}