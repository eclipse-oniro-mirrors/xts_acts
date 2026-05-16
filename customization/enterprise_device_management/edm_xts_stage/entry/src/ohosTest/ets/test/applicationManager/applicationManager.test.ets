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
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
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
import common from '@ohos.enterprise.common';

export default function applicationManagerTest() {
  describe('applicationManager_test', () => {
    beforeAll((done: Function) => {
      bundleNamesInit();
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test addDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addDisallowedRunningBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addDisallowedRunningBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let emptyRes = applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(emptyRes.length == 0).assertTrue();
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res = applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 3).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.desc   test addDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addDisallowedRunningBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.desc   test addDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addDisallowedRunningBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addDisallowedRunningBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLES_008
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin policy conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);		
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLES_009
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin policy conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_010
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_011
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
        let ret: Array<string> = applicationManager.getDisallowedRunningBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(ret.length == 200).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_012
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_012
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_012", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addDisallowedRunningBundlesSync_012 error 401 is expected, actually catch: '
          + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test removeDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.desc   test removeDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.desc   test removeDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeDisallowedRunningBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_008
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_009
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_010
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_removeDisallowedRunningBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedRunningBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_001
     * @tc.desc   test getDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getDisallowedRunningBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_002
     * @tc.desc   test getDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedRunningBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getDisallowedRunningBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_003
     * @tc.desc   test getDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getDisallowedRunningBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_004
     * @tc.desc   test getDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getDisallowedRunningBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_005
     * @tc.desc   test getDisallowedRunningBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getDisallowedRunningBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_006
     * @tc.desc   test getDisallowedRunningBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedRunningBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getDisallowedRunningBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDRUNNINGBUNDLESSYNC_007
     * @tc.desc   test getDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_001
     * @tc.desc   test addAutoStartApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addAutoStartApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_002
     * @tc.desc   test addAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addAutoStartApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_003
     * @tc.desc   test addAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addAutoStartApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_004
     * @tc.desc   test addAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
        let res = applicationManager.getAutoStartApps(SELFWANT);
        expect(res.length > 0).assertTrue();
        let res2 = applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(res2.length > 0).assertTrue();
        applicationManager.removeAutoStartApps(SELFWANT, autoStartApps);
        let emptyRes = applicationManager.getAutoStartApps(SELFWANT);
        expect(emptyRes.length == 0).assertTrue();
        let emptyRes2 = applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(emptyRes2.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_001
     * @tc.desc   test removeAutoStartApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeAutoStartApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_002
     * @tc.desc   test removeAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_removeAutoStartApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_003
     * @tc.desc   test removeAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeAutoStartApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_004
     * @tc.desc   test removeAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_001
     * @tc.desc   test getAutoStartApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_002
     * @tc.desc   test getAutoStartApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getAutoStartApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_003
     * @tc.desc   test getAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_004
     * @tc.desc   test getAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = applicationManager.getAutoStartApps(SELFWANT);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test addFreezeExemptedApps method with unActive admin
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
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test addFreezeExemptedApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType == '2in1') {
        done();
        return;
      }
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_003
     * @tc.desc   test addFreezeExemptedApps method with byod admin for 2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
      }
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_004
     * @tc.desc   test addFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_005
     * @tc.desc   test addFreezeExemptedApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_006
     * @tc.desc   test addFreezeExemptedApps method with invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_006", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"111",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_007
     * @tc.desc   test addFreezeExemptedApps method with overSize array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_007", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {appIdentifier:"5765880207852919475", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1207824849184017472", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1164531384803416384", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1173750081090759360", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"976752519134849856", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1081898888199154560", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207853624761", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207853068793", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1230215522310701824", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207854258995", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1062865240531676032", accountId:DEFAULT_USER_ID, appIndex:0}
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test removeFreezeExemptedApps method with unActive admin
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
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test removeFreezeExemptedApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType == '2in1') {
        done();
        return;
      }
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_003
     * @tc.desc   test removeFreezeExemptedApps method with byod admin for 2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
      }
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_004
     * @tc.desc   test removeFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeFreezeExemptedApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_005
     * @tc.desc   test removeFreezeExemptedApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_006
     * @tc.desc   test removeFreezeExemptedApps method with different data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_006", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        let removeApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"5765880207854258995",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        applicationManager.removeFreezeExemptedApps(SELFWANT, removeApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_007
     * @tc.desc   test removeFreezeExemptedApps method has different data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_007", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          },
          {
            appIdentifier:"5765880207854258995",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        let removeApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          },
          {
            appIdentifier:"1062865240531676032",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        applicationManager.removeFreezeExemptedApps(SELFWANT, removeApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_001
     * @tc.desc   test getFreezeExemptedApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test getFreezeExemptedApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType == '2in1') {
        done();
        return;
      }
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_003
     * @tc.desc   test getFreezeExemptedApps method with byod admin for 2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType != '2in1') {
        done();
        return;
      }
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        let res = applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_004
     * @tc.desc   test getFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getFreezeExemptedApps(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_005
     * @tc.desc   test getFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_001
     * @tc.desc   test addUserNonStopApps method with unActive admin
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
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_002
     * @tc.desc   test addUserNonStopApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_003
     * @tc.desc   test addUserNonStopApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_004
     * @tc.desc   test addUserNonStopApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_005
     * @tc.desc   test addUserNonStopApps method with invalid param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"111",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_006
     * @tc.desc   test addUserNonStopApps method with overSize array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_006", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {appIdentifier:"5765880207852919475", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1207824849184017472", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1164531384803416384", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1173750081090759360", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"976752519134849856", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1081898888199154560", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207853624761", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207853068793", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1230215522310701824", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"5765880207854258995", accountId:DEFAULT_USER_ID, appIndex:0},
          {appIdentifier:"1062865240531676032", accountId:DEFAULT_USER_ID, appIndex:0}
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_001
     * @tc.desc   test removeUserNonStopApps method with unActive admin
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
        applicationManager.removeUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_002
     * @tc.desc   test removeUserNonStopApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_002", Level.LEVEL2, async (done: Function) => {

      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.removeUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_003
     * @tc.desc   test removeUserNonStopApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeUserNonStopApps(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_004
     * @tc.desc   test removeUserNonStopApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_005
     * @tc.desc   test removeUserNonStopApps method with different data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        let removeApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"5765880207854258995",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        applicationManager.removeUserNonStopApps(SELFWANT, removeApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_006
     * @tc.desc   test removeUserNonStopApps method has different data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_006", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          },
          {
            appIdentifier:"5765880207854258995",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        let removeApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701824",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          },
          {
            appIdentifier:"1062865240531676032",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        applicationManager.removeUserNonStopApps(SELFWANT, removeApps);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_001
     * @tc.desc   test getUserNonStopApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getUserNonStopApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001 || error.code == 801).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_002
     * @tc.desc   test getUserNonStopApps method with byod admin for !2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.getUserNonStopApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_003
     * @tc.desc   test getUserNonStopApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getUserNonStopApps(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401 || error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_004
     * @tc.desc   test getUserNonStopApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = applicationManager.getUserNonStopApps(SELFWANT);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getUserNonStopApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETUSERNONSTOPAPPS_005
     * @tc.desc   test getUserNonStopApps method with not empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getUserNonStopApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {appIdentifier:"5765880207852919475", accountId:DEFAULT_USER_ID, appIndex:0}
        ];
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        let res = applicationManager.getUserNonStopApps(SELFWANT);
        expect(res.length == 1).assertTrue();
      } catch (error) {
        expect(error.code == 801 || error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
    
    /**
     * @tc.name   test_addAutoStartAppsByDis_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_001
     * @tc.desc   test addAutoStartAppsByDis method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addAutoStartAppsByDis_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_002
     * @tc.desc   test addAutoStartAppsByDis method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartAppsByDis_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addAutoStartAppsByDis_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_003
     * @tc.desc   test addAutoStartAppsByDis method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addAutoStartAppsByDis_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_004
     * @tc.desc   test addAutoStartAppsByDis method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartAppsByDis_004", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
        let ret = applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, DEFAULT_USER_ID);
        expect(ret).assertTrue();
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, false);
        let ret2 = applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, DEFAULT_USER_ID);
        expect(ret2).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_001
     * @tc.desc   test removeAutoStartAppsByUserId method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeAutoStartAppsByUserId_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_002
     * @tc.desc   test removeAutoStartAppsByUserId method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_002", Level.LEVEL2, async (done: Function) => {
      try {
        let autoStartApps: Array<Want> = [SELFWANT];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_removeAutoStartAppsByUserId_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_003
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeAutoStartAppsByUserId_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_004
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartAppsByUserId_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_001
     * @tc.desc   test getAutoStartAppsByUserId method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartAppsByUserId_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_002
     * @tc.desc   test getAutoStartAppsByUserId method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartAppsByUserId_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getAutoStartAppsByUserId_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_003
     * @tc.desc   test getAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAutoStartAppsByUserId_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETAUTOSTARTAPPS_USERID_004
     * @tc.desc   test getAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAutoStartAppsByUserId_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = applicationManager.getAutoStartApps(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyAutoStartAppsDisallowed_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_001
     * @tc.desc   test isModifyAutoStartAppsDisallowed method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_isModifyAutoStartAppsDisallowed_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_002
     * @tc.desc   test isModifyAutoStartAppsDisallowed method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyAutoStartAppsDisallowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_isModifyAutoStartAppsDisallowed_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYAUTOSTARTAPP_003
     * @tc.desc   test isModifyAutoStartAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_001
     * @tc.desc   test addKeepAliveApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_002
     * @tc.desc   test addKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addKeepAliveApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_003
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_004
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_005
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_001
     * @tc.desc   test removeKeepAliveApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_removeKeepAliveApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_002
     * @tc.desc   test removeKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_removeKeepAliveApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_003
     * @tc.desc   test removeKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getKeepAliveApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETEKEEPALIVEAPPS_001
     * @tc.desc   test getKeepAliveApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getKeepAliveApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_002
     * @tc.desc   test getKeepAliveApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getKeepAliveApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getKeepAliveApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_003
     * @tc.desc   test getKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getKeepAliveApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETKEEPALIVEAPPS_004
     * @tc.desc   test getKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getKeepAliveApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = applicationManager.getKeepAliveApps(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setAllowedKioskApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_001
     * @tc.desc   test setAllowedKioskApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_setAllowedKioskApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_002
     * @tc.desc   test setAllowedKioskApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAllowedKioskApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleNames: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_setAllowedKioskApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_003
     * @tc.desc   test setAllowedKioskApps method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_setAllowedKioskApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_004
     * @tc.desc   test setAllowedKioskApps method with bundleName too large
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_setAllowedKioskApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_SETALLOWEDKIOSKAPPS_005
     * @tc.desc   test setAllowedKioskApps method success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAllowedKioskApps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_001
     * @tc.desc   test getAllowedKioskApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAllowedKioskApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_002
     * @tc.desc   test getAllowedKioskApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedKioskApps_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_getAllowedKioskApps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_003
     * @tc.desc   test getAllowedKioskApps method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_getAllowedKioskApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDKIOSKAPPS_004
     * @tc.desc   test getAllowedKioskApps method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_isAppKioskAllowed_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISAPPKIOSKALLOWED_001
     * @tc.desc   test isAppKioskAllowed method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_isAppKioskAllowed_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ISAPPKIOSKALLOWED_002
     * @tc.desc   test isAppKioskAllowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAppKioskAllowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let emptyBundles: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(emptyBundles.length == 0).assertTrue();
        let bundleName: Array<string> = [`${'1265956504964495936'}`];
        applicationManager.setAllowedKioskApps(SELFWANT, bundleName);
        let bundleNames: Array<string> = applicationManager.getAllowedKioskApps(SELFWANT);
        expect(bundleNames.length > 0).assertTrue();
        let isAllowed = applicationManager.isAppKioskAllowed('1265956504964495936');
        expect(isAllowed).assertTrue();
      } catch (error) {
        expect(error.code == 9200007).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setKioskFeatures_001
     * @tc.number SUB_CUSTOMIZATION_EDM_setKioskFeatures_001
     * @tc.desc   test setKioskFeatures method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_setKioskFeatures_002
     * @tc.number SUB_CUSTOMIZATION_EDM_setKioskFeatures_002
     * @tc.desc   test setKioskFeatures method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setKioskFeatures_002", Level.LEVEL2, async (done: Function) => {
      try {
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_setKioskFeatures_003
     * @tc.number SUB_CUSTOMIZATION_EDM_setKioskFeatures_003
     * @tc.desc   test setKioskFeatures method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_setKioskFeatures_004
     * @tc.number SUB_CUSTOMIZATION_EDM_setKioskFeatures_004
     * @tc.desc   test setKioskFeatures method with invalid number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_001
     * @tc.desc   test AddKeepAliveAppsWithDisallowModify method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_002
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [TEST_BUNDLENAME];
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_003
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_004
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_005
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_001
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_002
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_002", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
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
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_004
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_004", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, keepAliveApp);
        expect(disallowModifty).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_003
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

    /**
     * @tc.name   test_addAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_001
     * @tc.desc   test addAllowedRunningBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_002
     * @tc.desc   test addAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_003
     * @tc.desc   test addAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_004
     * @tc.desc   test addAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_005
     * @tc.desc   test addAllowedRunningBundles method with super admin max size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, BUNDLE_NAME_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_006
     * @tc.desc   test addAllowedRunningBundles method with super admin over max size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, BUNDLE_NAME_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedRunningBundles_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_007
     * @tc.desc   test addAllowedRunningBundles method with super admin policy conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);		
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_001
     * @tc.desc   test removeAllowedRunningBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_002
     * @tc.desc   test removeAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_003
     * @tc.desc   test removeAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_004
     * @tc.desc   test removeAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
	
    /**
     * @tc.name   test_removeAllowedRunningBundles_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_005
     * @tc.desc   test removeAllowedRunningBundles method with super admin max size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, BUNDLE_NAME_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedRunningBundles_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_006
     * @tc.desc   test removeAllowedRunningBundles method with super admin over max size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedRunningBundles(SELFWANT, BUNDLE_NAME_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES_001
     * @tc.desc   test getAllowedRunningBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES_002
     * @tc.desc   test getAllowedRunningBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES_003
     * @tc.desc   test getAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAllowedRunningBundles(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES_004
     * @tc.desc   test getAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let arr: string[] = applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(arr.length).assertEqual(APP_IDS_1.length);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedRunningBundles_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDRUNNINGBUNDLES_005
     * @tc.desc   test getAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedRunningBundles_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let arr: string[] = applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(arr.length > 0).assertTrue();
        expect(arr.length).assertEqual(APP_IDS_1.length);
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let retRemove: string[] = applicationManager.getAllowedRunningBundles(SELFWANT, DEFAULT_USER_ID);
        expect(retRemove.length).assertEqual(0);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_001
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_001
     * @tc.desc   test setAbilityDisabled method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_001", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_002
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_002
     * @tc.desc   test setAbilityDisabled method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_003
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_003
     * @tc.desc   test setAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_004
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_004
     * @tc.desc   test setAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, false);
        let isDisabled = applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(isDisabled).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_005
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_005
     * @tc.desc   test setAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.extensionzerotest';
        let accountId: number = 100;
        let abilityName: string = "com.example.extensionzerotest.MainAbility";
        applicationManager.setAbilityDisabled(SELFWANT, bundleName, accountId, abilityName, true);
        let isDisabled = applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(isDisabled).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_setAbilityDisabled_006
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_ABILITY_DISABLED_006
     * @tc.desc   test setAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setAbilityDisabled_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.setAbilityDisabled(null, bundleName, accountId, abilityName, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_001
     * @tc.number SUB_CUSTOMIZATION_EDM_IS_ABILITY_DISABLED_001
     * @tc.desc   test isAbilityDisabled method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_001", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_002
     * @tc.number SUB_CUSTOMIZATION_EDM_IS_ABILITY_DISABLED_002
     * @tc.desc   test isAbilityDisabled method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_003
     * @tc.number SUB_CUSTOMIZATION_EDM_IS_ABILITY_DISABLED_003
     * @tc.desc   test isAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        let isDisabled = applicationManager.isAbilityDisabled(SELFWANT, bundleName, accountId, abilityName);
        expect(isDisabled).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_004
     * @tc.number SUB_CUSTOMIZATION_EDM_IS_ABILITY_DISABLED_004
     * @tc.desc   test isAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let accountId: number = 100;
        let abilityName: string = "EntryAbility";
        let isDisabled = applicationManager.isAbilityDisabled(null, bundleName, accountId, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isAbilityDisabled_005
     * @tc.number SUB_CUSTOMIZATION_EDM_IS_ABILITY_DISABLED_005
     * @tc.desc   test isAbilityDisabled method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isAbilityDisabled_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.example.helloworld';
        let abilityName: string = "EntryAbility";
        let isDisabled = applicationManager.isAbilityDisabled(SELFWANT, bundleName, INVALID_USER_ID, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}