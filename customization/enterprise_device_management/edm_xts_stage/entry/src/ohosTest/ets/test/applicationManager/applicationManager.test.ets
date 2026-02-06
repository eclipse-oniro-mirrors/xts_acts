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

import { describe, beforeAll, expect, it, Level } from '@ohos/hypium';
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
  bundleNamesInit,
  BUNDLE_NAME_200,
  BUNDLE_NAME_201
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import Want from '@ohos.app.ability.Want';
import sysDeviceInfo from '@ohos.deviceInfo';

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    beforeAll((done: Function) => {
      bundleNamesInit();
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedRunningBundlesSync_001
     * @tc.desc      : test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_addDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_addDisallowedRunningBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
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
    it("test_addDisallowedRunningBundlesSync_004", Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.name      : test_addDisallowedRunningBundlesSync_005
     * @tc.desc      : test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.name      : test_addDisallowedRunningBundlesSync_006
     * @tc.desc      : test addDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.name      : test_addDisallowedRunningBundlesSync_007
     * @tc.desc      : test addDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedRunningBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
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
    it("test_removeDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeDisallowedRunningBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
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
    it("test_removeDisallowedRunningBundlesSync_004", Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.name      : test_removeDisallowedRunningBundlesSync_005
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.name      : test_removeDisallowedRunningBundlesSync_006
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.name      : test_removeDisallowedRunningBundlesSync_007
     * @tc.desc      : test removeDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedRunningBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
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
    it("test_getDisallowedRunningBundlesSync_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_getDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_getDisallowedRunningBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, INVALID_USER_ID);
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
    it("test_getDisallowedRunningBundlesSync_004", Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.name      : test_getDisallowedRunningBundlesSync_005
     * @tc.desc      : test getDisallowedRunningBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.name      : test_getDisallowedRunningBundlesSync_006
     * @tc.desc      : test getDisallowedRunningBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.name      : test_getDisallowedRunningBundlesSync_007
     * @tc.desc      : test getDisallowedRunningBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedRunningBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getDisallowedRunningBundlesSync(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
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
    it("test_addAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_addAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_addAutoStartApps_003", Level.LEVEL2, async (done: Function) => {
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
    it("test_addAutoStartApps_004", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeAutoStartApps_003", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeAutoStartApps_004", Level.LEVEL2, async (done: Function) => {
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
    it("test_getAutoStartApps_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_getAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_getAutoStartApps_003", Level.LEVEL2, async (done: Function) => {
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
    it("test_getAutoStartApps_004", Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_001
     * @tc.name      : test_addAutoStartAppsByDis_001
     * @tc.desc      : test addAutoStartAppsByDis method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartAppsByDis_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_002
     * @tc.name      : test_addAutoStartAppsByDis_002
     * @tc.desc      : test addAutoStartAppsByDis method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartAppsByDis_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_003
     * @tc.name      : test_addAutoStartAppsByDis_003
     * @tc.desc      : test addAutoStartAppsByDis method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartAppsByDis_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, null, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_004
     * @tc.name      : test_addAutoStartAppsByDis_004
     * @tc.desc      : test addAutoStartAppsByDis method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAutoStartAppsByDis_004", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_001
     * @tc.name      : test_removeAutoStartAppsByUserId_001
     * @tc.desc      : test removeAutoStartAppsByUserId method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartAppsByUserId_001", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_002
     * @tc.name      : test_removeAutoStartAppsByUserId_002
     * @tc.desc      : test removeAutoStartAppsByUserId method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartAppsByUserId_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_003
     * @tc.name      : test_removeAutoStartAppsByUserId_003
     * @tc.desc      : test removeAutoStartAppsByUserId method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartAppsByUserId_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(SELFWANT, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_004
     * @tc.name      : test_removeAutoStartAppsByUserId_004
     * @tc.desc      : test removeAutoStartAppsByUserId method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAutoStartAppsByUserId_004", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_001
     * @tc.name      : test_getAutoStartAppsByUserId_001
     * @tc.desc      : test getAutoStartAppsByUserId method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartAppsByUserId_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_002
     * @tc.name      : test_getAutoStartAppsByUserId_002
     * @tc.desc      : test getAutoStartAppsByUserId method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartAppsByUserId_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_003
     * @tc.name      : test_getAutoStartAppsByUserId_003
     * @tc.desc      : test getAutoStartAppsByUserId method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartAppsByUserId_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAutoStartApps(null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_004
     * @tc.name      : test_getAutoStartAppsByUserId_004
     * @tc.desc      : test getAutoStartAppsByUserId method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAutoStartAppsByUserId_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_001
     * @tc.name      : test_isModifyAutoStartAppsDisallowed_001
     * @tc.desc      : test isModifyAutoStartAppsDisallowed method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyAutoStartAppsDisallowed_001", Level.LEVEL2, async (done: Function) => {
      try {
        let disallowModifty: boolean = true;
        disallowModifty = applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_002
     * @tc.name      : test_isModifyAutoStartAppsDisallowed_002
     * @tc.desc      : test isModifyAutoStartAppsDisallowed method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyAutoStartAppsDisallowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        disallowModifty = applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_003
     * @tc.name      : test_isModifyAutoStartAppsDisallowed_003
     * @tc.desc      : test isModifyAutoStartAppsDisallowed method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyAutoStartAppsDisallowed_003", Level.LEVEL2, async (done: Function) => {
      try {
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        disallowModifty = applicationManager.isModifyAutoStartAppsDisallowed(null, AUTOSTARTAPP1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
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
    it("test_addKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
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
    it("test_addKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002 || error.code == 801).assertTrue();
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
    it("test_addKeepAliveApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
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
    it("test_addKeepAliveApps_004", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9201005 || error.code == 801).assertTrue();
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
    it("test_addKeepAliveApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010 || error.code == 801).assertTrue();
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
    it("test_removeKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
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
    it("test_removeKeepAliveApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, INVALID_USER_ID);
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
    it("test_getKeepAliveApps_001", Level.LEVEL2, async (done: Function) => {
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
    it("test_getKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
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

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_003
     * @tc.name      : test_getKeepAliveApps_003
     * @tc.desc      : test getKeepAliveApps method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getKeepAliveApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        keepAliveApps = applicationManager.getKeepAliveApps(null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_001
     * @tc.name      : test_setAllowedKioskApps_001
     * @tc.desc      : test setAllowedKioskApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setAllowedKioskApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleNames: Array<string> = [];
        applicationManager.setAllowedKioskApps(SELFWANT, bundleNames);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_002
     * @tc.name      : test_setAllowedKioskApps_002
     * @tc.desc      : test setAllowedKioskApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setAllowedKioskApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleNames: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.setAllowedKioskApps(SELFWANT, bundleNames);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_003
     * @tc.name      : test_setAllowedKioskApps_003
     * @tc.desc      : test setAllowedKioskApps method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setAllowedKioskApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: Array<string> = [];
        applicationManager.setAllowedKioskApps(null, bundleName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_004
     * @tc.name      : test_setAllowedKioskApps_004
     * @tc.desc      : test setAllowedKioskApps method with bundleName too large
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setAllowedKioskApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.setAllowedKioskApps(SELFWANT, BUNDLE_NAME_201);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_005
     * @tc.name      : test_setAllowedKioskApps_005
     * @tc.desc      : test setAllowedKioskApps method success
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setAllowedKioskApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.setAllowedKioskApps(SELFWANT, BUNDLE_NAME_200);
      } catch (error) {
        expect(error.code == 9200007).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_001
     * @tc.name      : test_getAllowedKioskApps_001
     * @tc.desc      : test getAllowedKioskApps method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedKioskApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_002
     * @tc.name      : test_getAllowedKioskApps_002
     * @tc.desc      : test getAllowedKioskApps method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedKioskApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_003
     * @tc.name      : test_getAllowedKioskApps_003
     * @tc.desc      : test getAllowedKioskApps method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedKioskApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_004
     * @tc.name      : test_getAllowedKioskApps_004
     * @tc.desc      : test getAllowedKioskApps method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedKioskApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(bundleNames.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISAPPKIOSKALLOWED_001
     * @tc.name      : test_isAppKioskAllowed_001
     * @tc.desc      : test isAppKioskAllowed method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isAppKioskAllowed_001", Level.LEVEL2, async (done: Function) => {
      try {
        let isAllowed = applicationManager.isAppKioskAllowed(SELFHAPNAME);
        expect(isAllowed).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISAPPKIOSKALLOWED_002
     * @tc.name      : test_isAppKioskAllowed_002
     * @tc.desc      : test isAppKioskAllowed method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isAppKioskAllowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: Array<string> = [`${TEST_BUNDLENAME}`];
        applicationManager.setAllowedKioskApps(SELFWANT, bundleName);
        let isAllowed = applicationManager.isAppKioskAllowed(TEST_BUNDLENAME);
        expect(isAllowed).assertTrue();
      } catch (error) {
        expect(error.code == 9200007).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_setKioskFeatures_001
     * @tc.name      : test_setKioskFeatures_001
     * @tc.desc      : test setKioskFeatures method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setKioskFeatures_001", Level.LEVEL2, async (done: Function) => {
      try {
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_setKioskFeatures_002
     * @tc.name      : test_setKioskFeatures_002
     * @tc.desc      : test setKioskFeatures method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setKioskFeatures_002", Level.LEVEL2, async (done: Function) => {
      try {
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_setKioskFeatures_003
     * @tc.name      : test_setKioskFeatures_003
     * @tc.desc      : test setKioskFeatures method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setKioskFeatures_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        applicationManager.setKioskFeatures(null, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_setKioskFeatures_004
     * @tc.name      : test_setKioskFeatures_004
     * @tc.desc      : test setKioskFeatures method with invalid number
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setKioskFeatures_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(INVALID_USER_ID);
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_001
     * @tc.name      : test_addKeepAliveAppsWithDisallowModify_001
     * @tc.desc      : test AddKeepAliveAppsWithDisallowModify method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveAppsWithDisallowModify_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_002
     * @tc.name      : test_addKeepAliveAppsWithDisallowModify_002
     * @tc.desc      : test addKeepAliveAppsWithDisallowModify method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveAppsWithDisallowModify_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_003
     * @tc.name      : test_addKeepAliveAppsWithDisallowModify_003
     * @tc.desc      : test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveAppsWithDisallowModify_003", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, INVALID_USER_ID, disallowModifty);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_004
     * @tc.name      : test_addKeepAliveAppsWithDisallowModify_004
     * @tc.desc      : test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveAppsWithDisallowModify_004", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
      }
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9201005 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_005
     * @tc.name      : test_addKeepAliveAppsWithDisallowModify_005
     * @tc.desc      : test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addKeepAliveAppsWithDisallowModify_005", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_001
     * @tc.name      : test_isModifyKeepAliveAppsDisallowed_001
     * @tc.desc      : test isModifyKeepAliveAppsDisallowed method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyKeepAliveAppsDisallowed_001", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, keepAliveApp);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_002
     * @tc.name      : test_isModifyKeepAliveAppsDisallowed_002
     * @tc.desc      : test isModifyKeepAliveAppsDisallowed method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyKeepAliveAppsDisallowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, keepAliveApp);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_003
     * @tc.name      : test_isModifyKeepAliveAppsDisallowed_003
     * @tc.desc      : test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isModifyKeepAliveAppsDisallowed_003", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(null, DEFAULT_USER_ID, keepAliveApp);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}