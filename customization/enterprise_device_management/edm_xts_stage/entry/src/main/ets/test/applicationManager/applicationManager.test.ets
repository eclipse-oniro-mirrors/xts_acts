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

import { describe, expect, it } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  APP_IDS_1,
  DEFAULT_USER_ID,
  TEST_USER_ID,
  AUTOSTARTAPP1,
  AUTOSTARTAPP2,
  TEST_BUNDLENAME
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';
import sysDeviceInfo from '@ohos.deviceInfo';

export default function applicationManagerTest() {
  describe('applicationManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedRunningBundlesSync_001
     * @tc.desc      : test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_001", 0, async function (done) {
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
    it("test_addDisallowedRunningBundlesSync_002", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.name      : test_addDisallowedRunningBundlesSync_003
     * @tc.desc      : test addDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.name      : test_addDisallowedRunningBundlesSync_004
     * @tc.desc      : test addDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedRunningBundlesSync_001
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_001", 0, async function (done) {
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
    it("test_removeDisallowedRunningBundlesSync_002", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.name      : test_removeDisallowedRunningBundlesSync_003
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.name      : test_removeDisallowedRunningBundlesSync_004
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedRunningBundlesSync_001
     * @tc.desc      : test getDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_001", 0, async function (done) {
      try {
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
    it("test_getDisallowedRunningBundlesSync_002", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.name      : test_getDisallowedRunningBundlesSync_003
     * @tc.desc      : test getDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, TEST_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.name      : test_getDisallowedRunningBundlesSync_004
     * @tc.desc      : test getDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_001
     * @tc.name      : test_addAutoStartApps_001
     * @tc.desc      : test addAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartApps_001", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_002
     * @tc.name      : test_addAutoStartApps_002
     * @tc.desc      : test addAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartApps_002", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_003
     * @tc.name      : test_addAutoStartApps_003
     * @tc.desc      : test addAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartApps_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_004
     * @tc.name      : test_addAutoStartApps_004
     * @tc.desc      : test addAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartApps_004", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_001
     * @tc.name      : test_removeAutoStartApps_001
     * @tc.desc      : test removeAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartApps_001", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_002
     * @tc.name      : test_removeAutoStartApps_002
     * @tc.desc      : test removeAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartApps_002", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_003
     * @tc.name      : test_removeAutoStartApps_003
     * @tc.desc      : test removeAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartApps_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_004
     * @tc.name      : test_removeAutoStartApps_004
     * @tc.desc      : test removeAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartApps_004", 0, async function (done) {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_001
     * @tc.name      : test_getAutoStartApps_001
     * @tc.desc      : test getAutoStartApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartApps_001", 0, async function (done) {
      try {
        applicationManager.getAutoStartApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_002
     * @tc.name      : test_getAutoStartApps_002
     * @tc.desc      : test getAutoStartApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartApps_002", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAutoStartApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_003
     * @tc.name      : test_getAutoStartApps_003
     * @tc.desc      : test getAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartApps_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAutoStartApps(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_004
     * @tc.name      : test_getAutoStartApps_004
     * @tc.desc      : test getAutoStartApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartApps_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAutoStartApps(SELFWANT);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_001
     * @tc.name      : test_addKeepAliveApps_001
     * @tc.desc      : test addKeepAliveApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveApps_001", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_002
     * @tc.name      : test_addKeepAliveApps_002
     * @tc.desc      : test addKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveApps_002", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_003
     * @tc.name      : test_addKeepAliveApps_003
     * @tc.desc      : test addKeepAliveApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveApps_003", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, TEST_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_004
     * @tc.name      : test_addKeepAliveApps_004
     * @tc.desc      : test addKeepAliveApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveApps_004", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9201005).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_005
     * @tc.name      : test_addKeepAliveApps_005
     * @tc.desc      : test addKeepAliveApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveApps_005", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_001
     * @tc.name      : test_removeKeepAliveApps_001
     * @tc.desc      : test removeKeepAliveApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeKeepAliveApps_001", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_002
     * @tc.name      : test_removeKeepAliveApps_002
     * @tc.desc      : test removeKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeKeepAliveApps_002", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_003
     * @tc.name      : test_removeKeepAliveApps_003
     * @tc.desc      : test removeKeepAliveApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeKeepAliveApps_003", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, TEST_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETEKEEPALIVEAPPS_001
     * @tc.name      : test_getKeepAliveApps_001
     * @tc.desc      : test getKeepAliveApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getKeepAliveApps_001", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [];
        keepAliveApps = applicationManager.getKeepAliveApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_002
     * @tc.name      : test_getKeepAliveApps_002
     * @tc.desc      : test getKeepAliveApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getKeepAliveApps_002", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        keepAliveApps = applicationManager.getKeepAliveApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })
  })
}