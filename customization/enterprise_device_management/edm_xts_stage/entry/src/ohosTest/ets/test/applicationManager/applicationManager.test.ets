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
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_APP_INDEX,
  INVALID_APP_INDEX,
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
import { connection, statistics } from '@kit.NetworkKit';
import restrictions from '@ohos.enterprise.restrictions';

const APP_IDS_1: Array<string> = [
  "test_appid_1",
  "test_appid_2",
  "test_appid_3",
];
const LABEL_NOTIFICATION = "notification";

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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedRunningBundlesSync_013
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDRUNNINGBUNDLESSYNC_013
     * @tc.desc   test addDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedRunningBundlesSync_013", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIds: Array<string> = [];
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedRunningBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDRUNNINGBUNDLESSYNC_011
     * @tc.desc   test removeDisallowedRunningBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedRunningBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIds: Array<string> = [];
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res = applicationManager.getDisallowedRunningBundlesSync(null, DEFAULT_USER_ID);
        expect(res.length === 3).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_addAutoStartApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_005
     * @tc.desc   test addAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let autoStartApps: Array<Want> = [];
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps);
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_removeAutoStartApps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_005
     * @tc.desc   test removeAutoStartApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartApps_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let autoStartApps: Array<Want> = [];
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
        let apps = applicationManager.getAutoStartApps(null);
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test addFreezeExemptedApps method with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
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
     * @tc.desc   test addFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701825",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.addFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 9200002) {
          expect(Number(error.code) === 9200002).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 9200012).assertTrue();
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
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addFreezeExemptedApps_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDFREEZEEXEMPTEDAPPS_008
     * @tc.desc   test addFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addFreezeExemptedApps_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let applicationInstances: Array<common.ApplicationInstance> = [];
        applicationManager.addFreezeExemptedApps(SELFWANT, applicationInstances);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addFreezeExemptedApps_008 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
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
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test removeFreezeExemptedApps method with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
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
     * @tc.desc   test removeFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        let freezeExemptedApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"1230215522310701825",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.removeFreezeExemptedApps(SELFWANT, freezeExemptedApps);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 9200002) {
          expect(Number(error.code) === 9200002).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 9200012).assertTrue();
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
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeFreezeExemptedApps_008
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEFREEZEEXEMPTEDAPPS_008
     * @tc.desc   test removeFreezeExemptedApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeFreezeExemptedApps_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let applicationInstances: Array<common.ApplicationInstance> = [];
        applicationManager.removeFreezeExemptedApps(SELFWANT, applicationInstances);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
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
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getFreezeExemptedApps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETFREEZEEXEMPTEDAPPS_002
     * @tc.desc   test getFreezeExemptedApps method with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_002", Level.LEVEL2, async (done: Function) => {
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
     * @tc.desc   test getFreezeExemptedApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getFreezeExemptedApps_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let res = applicationManager.getFreezeExemptedApps(SELFWANT);
        expect(res.length === 0).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getFreezeExemptedApps(null);
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        expect(false).assertTrue();
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addUserNonStopApps_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDUSERNONSTOPAPPS_007
     * @tc.desc   test addUserNonStopApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addUserNonStopApps_007", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addUserNonStopApps_007 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeUserNonStopApps_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEUSERNONSTOPAPPS_007
     * @tc.desc   test removeUserNonStopApps method with missing param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeUserNonStopApps_007", Level.LEVEL2, async (done: Function) => {
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_removeUserNonStopApps_007 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
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
        let apps = applicationManager.getUserNonStopApps(null);
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(false).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_addAutoStartAppsByDis_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_DIS_005
     * @tc.desc   test addAutoStartAppsByDis method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartAppsByDis_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let autoStartApps: Array<Want> = [];
        applicationManager.addAutoStartApps(SELFWANT, autoStartApps, DEFAULT_USER_ID, true);
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_0031
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_0031
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_0031", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(SELFWANT, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_0032
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_0032
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_0032", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(null, [SELFWANT], DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_0033
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_0033
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_0033", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAutoStartApps(undefined, [SELFWANT], DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_0034
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_0034
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_0034", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret = applicationManager.removeAutoStartApps(SELFWANT, [SELFWANT], null);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAutoStartAppsByUserId_0035
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_0035
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_0035", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret = applicationManager.removeAutoStartApps(SELFWANT, [SELFWANT], undefined);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
     * @tc.name   test_removeAutoStartAppsByUserId_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEAUTOSTARTAPPS_USERID_005
     * @tc.desc   test removeAutoStartAppsByUserId method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAutoStartAppsByUserId_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let autoStartApps: Array<Want> = [];
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
        let apps = applicationManager.getAutoStartApps(null, DEFAULT_USER_ID);
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAutoStartAppsByIsHiddenStart_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDAUTOSTARTAPPS_ISHIDDENSTART_001
     * @tc.desc   test addAutoStartAppsByIsHiddenStart method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAutoStartAppsByIsHiddenStart_001", Level.LEVEL2, async (done: Function) => {
      try {
        let edmAutoStartApps: Array<Want> = [AUTOSTARTAPP1, AUTOSTARTAPP2];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAutoStartApps(SELFWANT, edmAutoStartApps, DEFAULT_USER_ID, true);
        let autoStartApps = applicationManager.getAutoStartApps(SELFWANT);
        expect(autoStartApps.length == 2).assertTrue();
        expect(autoStartApps[0].parameters?.isHiddenStart).assertFalse();
        expect(autoStartApps[1].parameters?.isHiddenStart).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201005).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200010).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_006
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_006", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_addKeepAliveApps_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_007
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_007", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        applicationManager.addKeepAliveApps(null, keepAliveApps, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_addKeepAliveApps_007 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 401) {
          expect(Number(error.code) === 401).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_008
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_008", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        applicationManager.addKeepAliveApps(undefined, keepAliveApps, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_addKeepAliveApps_008 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 401) {
          expect(Number(error.code) === 401).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_009
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_009
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_009", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addKeepAliveApps(SELFWANT, null, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_addKeepAliveApps_009 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 401) {
          expect(Number(error.code) === 401).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveApps_010
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_010
     * @tc.desc   test addKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveApps_010", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addKeepAliveApps(SELFWANT, undefined, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_addKeepAliveApps_010 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 401) {
          expect(Number(error.code) === 401).assertTrue();
        } else {
          expect(false).assertTrue();
        }
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
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeKeepAliveApps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEKEEPALIVEAPPS_004
     * @tc.desc   test removeKeepAliveApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeKeepAliveApps_004", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID);
      } catch (error) {
        console.info(' --- test_removeKeepAliveApps_004 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(false).assertTrue();
        }
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
        expect(keepAliveApps.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(bundleNames.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
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
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_GESTURE_CONTROL);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_SIDE_DOCK);
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
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_GESTURE_CONTROL);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_SIDE_DOCK);
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
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_GESTURE_CONTROL);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_SIDE_DOCK);
        applicationManager.setKioskFeatures(null, kioskFeatures);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_setKioskFeatures_005
     * @tc.number SUB_CUSTOMIZATION_EDM_setKioskFeatures_005
     * @tc.desc   test setKioskFeatures method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setKioskFeatures_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        applicationManager.setKioskFeatures(SELFWANT, kioskFeatures);
      } catch (error) {
        expect(false).assertTrue();
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201005).assertTrue();
        }
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
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200010).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_006
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_006", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 801).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        let ret = applicationManager.addAllowedRunningBundles(SELFWANT, BUNDLE_NAME_200, DEFAULT_USER_ID);
        expect(ret == null).assertTrue();
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
     * @tc.name   test_addAllowedRunningBundles_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDRUNNINGBUNDLES_008
     * @tc.desc   test addAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedRunningBundles_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIdentifiers: Array<string> = [];
        applicationManager.addAllowedRunningBundles(SELFWANT, appIdentifiers, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   test_removeAllowedRunningBundles_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDRUNNINGBUNDLES_007
     * @tc.desc   test removeAllowedRunningBundles method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedRunningBundles_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIdentifiers: Array<string> = [];
        applicationManager.removeAllowedRunningBundles(SELFWANT, appIdentifiers, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
     * @tc.name   addDockApp_test_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0100
     * @tc.desc   addDockApp without null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(null, bundleName, abilityName, index);	  
        console.info(' --- addDockApp_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0100 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0100  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0200
     * @tc.desc   addDockApp without undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(undefined, bundleName, abilityName, index);	  
        console.info(' --- addDockApp_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0200 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0200  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0300
     * @tc.desc   addDockApp without null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, null, abilityName, index);	  
        console.info(' --- addDockApp_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0300 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0300  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0400
     * @tc.desc   addDockApp without null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, null, index);	  
        console.info(' --- addDockApp_test_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0400 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0400  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0500
     * @tc.desc   addDockApp without undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, undefined, abilityName, index);	  
        console.info(' --- addDockApp_test_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0500 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0500  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0600
     * @tc.desc   addDockApp without undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        applicationManager.addDockApp(SELFWANT, bundleName, undefined, index);	  
        console.info(' --- addDockApp_test_0600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0600 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0600  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0700
     * @tc.desc   addDockApp without undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, undefined);	  
        console.info(' --- addDockApp_test_0700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0700 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0700  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0800
     * @tc.desc   addDockApp without null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, null);	  
        console.info(' --- addDockApp_test_0800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0800 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0800  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_0900
     * @tc.desc   addDockApp with null admin without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_0900  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(null, bundleName, abilityName);
        console.info(' --- addDockApp_test_0900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_0900 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_0900  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1000
     * @tc.desc   addDockApp with undefined admin without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1000  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(undefined, bundleName, abilityName);
        console.info(' --- addDockApp_test_1000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1000 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1000  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1100
     * @tc.desc   addDockApp with null bundleName without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, null, abilityName);
        console.info(' --- addDockApp_test_1100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1100 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1100  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1200
     * @tc.desc   addDockApp with undefined bundleName without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, undefined, abilityName);
        console.info(' --- addDockApp_test_1200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1200 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1200  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1300
     * @tc.desc   addDockApp with null abilityName without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        applicationManager.addDockApp(SELFWANT, bundleName, null);
        console.info(' --- addDockApp_test_1300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1300 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1300  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1400
     * @tc.desc   addDockApp with undefined abilityName without index param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        applicationManager.addDockApp(SELFWANT, bundleName, undefined);
        console.info(' --- addDockApp_test_1400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1400 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1400  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1500
     * @tc.desc   addDockApp with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = "";
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        console.info(' --- addDockApp_test_1500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1500 error 9201015 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1500  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1600
     * @tc.desc   addDockApp with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        console.info(' --- addDockApp_test_1600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1600 error 9200015 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1600  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1700
     * @tc.desc   addDockApp with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- addDockApp_test_1700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1700 error 9200015 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1700  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1800
     * @tc.desc   addDockApp with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = "";
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- addDockApp_test_1800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1800 error 9201015 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1800  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0100
     * @tc.desc   removeDockApp without null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(null, bundleName, abilityName);	  
        console.info(' --- removeDockApp_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0100 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0100  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0200
     * @tc.desc   removeDockApp without undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(undefined, bundleName, abilityName);	  
        console.info(' --- removeDockApp_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0200 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0200  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0300
     * @tc.desc   removeDockApp without null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, null, abilityName);	  
        console.info(' --- removeDockApp_test_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0300 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0300  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0400
     * @tc.desc   removeDockApp without null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, bundleName, null);	  
        console.info(' --- removeDockApp_test_0400 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0400 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0400  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0500
     * @tc.desc   removeDockApp without undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, undefined, abilityName);	  
        console.info(' --- removeDockApp_test_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0500 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0500  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0600
     * @tc.desc   removeDockApp without undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        applicationManager.removeDockApp(SELFWANT, bundleName, undefined);	  
        console.info(' --- removeDockApp_test_0600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0600 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0600  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0700
     * @tc.desc   removeDockApp with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = "";
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- removeDockApp_test_0700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0700 error 9201016 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201016).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0700  -------- END --------');
    })

    /**
     * @tc.name   removeDockApp_test_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDOCKAPP_0800
     * @tc.desc   removeDockApp with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDockApp_test_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDockApp_test_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- removeDockApp_test_0800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDockApp_test_0800 error 9201016 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201016).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDockApp_test_0800  -------- END --------');
    })

    /**
     * @tc.name   getDockApps_test_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDOCKAPPS_0100
     * @tc.desc   getDockApps without null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDockApps_test_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDockApps_test_0100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getDockApps(null);	  
        console.info(' --- getDockApps_test_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDockApps_test_0100 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDockApps_test_0100  -------- END --------');
    })

    /**
     * @tc.name   getDockApps_test_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDOCKAPPS_0200
     * @tc.desc   getDockApps without undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDockApps_test_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDockApps_test_0200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.getDockApps(undefined);	  
        console.info(' --- getDockApps_test_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDockApps_test_0200 error 401 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDockApps_test_0200  -------- END --------');
    })

    /**
     * @tc.name   test_addDockApp_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0100
     * @tc.desc   test addDockApp method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0100", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0200
     * @tc.desc   test addDockApp method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0300
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = SELFHAPNAME;
        let index: number = 101;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0400
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "testName";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0500
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "TestAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201014).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0600
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0600", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'testBundleName';
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201015).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0700
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0700", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.ohos.sceneboard';
        let index: number = 5;
        let abilityName: string = "com.ohos.sceneboard.recycleBin";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else if (Number(error.code) === 9201018) {
          expect(Number(error.code) === 9201018).assertTrue();
        } else {
          expect(Number(error.code) === 9201014).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0800
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0800", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = SELFHAPNAME;
        let index: number = 0;
        let abilityName: string = "EntryAbility";
        let ret = applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        expect(ret == null).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201019).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDockApp_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_ADDDOCKAPP_0900
     * @tc.desc   test addDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDockApp_0900", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_removeDockApp_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_REMOVEDOCKAPP_0100
     * @tc.desc   test removeDockApp method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDockApp_0100", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_removeDockApp_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_REMOVEDOCKAPP_0200
     * @tc.desc   test removeDockApp method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDockApp_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDockApp_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_REMOVEDOCKAPP_0600
     * @tc.desc   test removeDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDockApp_0600", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'testBundleName';
        let abilityName: string = "EntryAbility";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201016).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDockApp_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_REMOVEDOCKAPP_0700
     * @tc.desc   test removeDockApp method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDockApp_0700", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundleName: string = 'com.ohos.sceneboard';
        let index: number = 5;
        let abilityName: string = "com.ohos.sceneboard.recycleBin";
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201018).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDockApps_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_GETDOCKAPPS_0100
     * @tc.desc   test getDockApps method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDockApps_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getDockApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   test_getDockApps_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_GETDOCKAPPS_0200
     * @tc.desc   test getDockApps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDockApps_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.getDockApps(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDockApps_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_GETDOCKAPPS_0600
     * @tc.desc   test getDockApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDockApps_0600", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret: applicationManager.DockInfo[] = applicationManager.getDockApps(SELFWANT);
        expect(ret != null).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDockApps_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_TEST_GETDOCKAPPS_0700
     * @tc.desc   test getDockApps method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDockApps_0700", Level.LEVEL2, async (done: Function) => {
      if (sysDeviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let bundleName: string = SELFHAPNAME;
      let abilityName: string = "TestAbility";
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
      } catch (error) {
        console.info('precondition prepared');
      }
      try {
        let index: number = 5;
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        let dockInfos: applicationManager.DockInfo[] = applicationManager.getDockApps(SELFWANT);
        for (let i = 0; i < dockInfos.length; i++) {
          if (dockInfos[i].bundleName === bundleName) {
            expect(dockInfos[i].bundleName === bundleName).assertTrue();
            expect(dockInfos[i].abilityName === abilityName).assertTrue();
            expect(dockInfos[i].index >= 0).assertTrue();
          }
        }
        let ret = applicationManager.removeDockApp(SELFWANT, bundleName, abilityName);
        expect(ret == null).assertTrue();
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
        expect(Number(error.code) === 401).assertTrue();
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
        expect(isDisabled).assertFalse();
      } catch (error) {
        expect(false).assertTrue();
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

    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_001
     * @tc.number addDisallowedRunningBundlesSync_test_001
     * @tc.desc   addDisallowedRunningBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_001  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(null, APP_IDS_1);
        console.info(' --- addDisallowedRunningBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_002
     * @tc.number addDisallowedRunningBundlesSync_test_002
     * @tc.desc   addDisallowedRunningBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_002  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(undefined, APP_IDS_1);
        console.info(' --- addDisallowedRunningBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_003
     * @tc.number addDisallowedRunningBundlesSync_test_003
     * @tc.desc   addDisallowedRunningBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_003  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, null);
        console.info(' --- addDisallowedRunningBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_004
     * @tc.number addDisallowedRunningBundlesSync_test_004
     * @tc.desc   addDisallowedRunningBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_004  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, undefined);
        console.info(' --- addDisallowedRunningBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_005
     * @tc.number addDisallowedRunningBundlesSync_test_005
     * @tc.desc   addDisallowedRunningBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_005  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- addDisallowedRunningBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedRunningBundlesSync_test_006
     * @tc.number addDisallowedRunningBundlesSync_test_006
     * @tc.desc   addDisallowedRunningBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_006  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- addDisallowedRunningBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_001
     * @tc.number removeDisallowedRunningBundlesSync_test_001
     * @tc.desc   removeDisallowedRunningBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_001  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(null, APP_IDS_200);
        console.info(' --- removeDisallowedRunningBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_002
     * @tc.number removeDisallowedRunningBundlesSync_test_002
     * @tc.desc   removeDisallowedRunningBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_002  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(undefined, APP_IDS_200);
        console.info(' --- removeDisallowedRunningBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_003
     * @tc.number removeDisallowedRunningBundlesSync_test_003
     * @tc.desc   removeDisallowedRunningBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_003  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, null);
        console.info(' --- removeDisallowedRunningBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_004
     * @tc.number removeDisallowedRunningBundlesSync_test_004
     * @tc.desc   removeDisallowedRunningBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_004  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, undefined);
        console.info(' --- removeDisallowedRunningBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_005
     * @tc.number removeDisallowedRunningBundlesSync_test_005
     * @tc.desc   removeDisallowedRunningBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_005  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_200, null);
        console.info(' --- removeDisallowedRunningBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_006
     * @tc.number removeDisallowedRunningBundlesSync_test_006
     * @tc.desc   removeDisallowedRunningBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_006  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, APP_IDS_200, undefined);
        console.info(' --- removeDisallowedRunningBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedRunningBundlesSync_test_001
     * @tc.number getDisallowedRunningBundlesSync_test_001
     * @tc.desc   getDisallowedRunningBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedRunningBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedRunningBundlesSync_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let emptyRes = applicationManager.getDisallowedRunningBundlesSync(null);
        expect(emptyRes.length === 0).assertTrue();
        console.info(' --- getDisallowedRunningBundlesSync_test_001 error is expected, but it done.');
      } catch (error) {
        console.info(' --- getDisallowedRunningBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDisallowedRunningBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedRunningBundlesSync_test_002
     * @tc.number getDisallowedRunningBundlesSync_test_002
     * @tc.desc   getDisallowedRunningBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedRunningBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedRunningBundlesSync_test_002  -------- START --------');
      try {
        applicationManager.getDisallowedRunningBundlesSync(undefined);
        console.info(' --- getDisallowedRunningBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedRunningBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedRunningBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedRunningBundlesSync_test_003
     * @tc.number getDisallowedRunningBundlesSync_test_003
     * @tc.desc   getDisallowedRunningBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedRunningBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedRunningBundlesSync_test_003  -------- START --------');
      try {
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, null);
        console.info(' --- getDisallowedRunningBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedRunningBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedRunningBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedRunningBundlesSync_test_004
     * @tc.number getDisallowedRunningBundlesSync_test_004
     * @tc.desc   getDisallowedRunningBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedRunningBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedRunningBundlesSync_test_004  -------- START --------');
      try {
        applicationManager.getDisallowedRunningBundlesSync(SELFWANT, undefined);
        console.info(' --- getDisallowedRunningBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedRunningBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedRunningBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_001
     * @tc.number addAutoStartApps_test_001
     * @tc.desc   addAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_001  -------- START --------');
      try {
        applicationManager.addAutoStartApps(null, [SELFWANT]);
        console.info(' --- addAutoStartApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_002
     * @tc.number addAutoStartApps_test_002
     * @tc.desc   addAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_002  -------- START --------');
      try {
        applicationManager.addAutoStartApps(undefined, [SELFWANT]);
        console.info(' --- addAutoStartApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_003
     * @tc.number addAutoStartApps_test_003
     * @tc.desc   addAutoStartApps with null parameter autoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_003  -------- START --------');
      try {
        applicationManager.addAutoStartApps(SELFWANT, null);
        console.info(' --- addAutoStartApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004
     * @tc.number addAutoStartApps_test_004
     * @tc.desc   addAutoStartApps with undefined parameter autoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004  -------- START --------');
      try {
        applicationManager.addAutoStartApps(SELFWANT, undefined);
        console.info(' --- addAutoStartApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004  -------- END --------');
    })

    /**
     * @tc.name   removeAutoStartApps_test_001
     * @tc.number removeAutoStartApps_test_001
     * @tc.desc   removeAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAutoStartApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAutoStartApps_test_001  -------- START --------');
      try {
        applicationManager.removeAutoStartApps(null, [SELFWANT]);
        console.info(' --- removeAutoStartApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAutoStartApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAutoStartApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeAutoStartApps_test_002
     * @tc.number removeAutoStartApps_test_002
     * @tc.desc   removeAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAutoStartApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAutoStartApps_test_002  -------- START --------');
      try {
        applicationManager.removeAutoStartApps(undefined, [SELFWANT]);
        console.info(' --- removeAutoStartApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAutoStartApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAutoStartApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeAutoStartApps_test_003
     * @tc.number removeAutoStartApps_test_003
     * @tc.desc   removeAutoStartApps with null parameter autoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAutoStartApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAutoStartApps_test_003  -------- START --------');
      try {
        applicationManager.removeAutoStartApps(SELFWANT, null);
        console.info(' --- removeAutoStartApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAutoStartApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAutoStartApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeAutoStartApps_test_004
     * @tc.number removeAutoStartApps_test_004
     * @tc.desc   removeAutoStartApps with undefined parameter autoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAutoStartApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAutoStartApps_test_004  -------- START --------');
      try {
        applicationManager.removeAutoStartApps(SELFWANT, undefined);
        console.info(' --- removeAutoStartApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAutoStartApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAutoStartApps_test_004  -------- END --------');
    })

    /**
     * @tc.name   getAutoStartApps_test_001
     * @tc.number getAutoStartApps_test_001
     * @tc.desc   getAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getAutoStartApps(null);
        console.info(' --- getAutoStartApps_test_001 error is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAutoStartApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   getAutoStartApps_test_002
     * @tc.number getAutoStartApps_test_002
     * @tc.desc   getAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_002  -------- START --------');
      try {
        applicationManager.getAutoStartApps(undefined);
        console.info(' --- getAutoStartApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAutoStartApps_test_002  -------- END --------');
    })

    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_001
     * @tc.number isModifyAutoStartAppsDisallowed_test_001
     * @tc.desc   isModifyAutoStartAppsDisallowed with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_001  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(null, AUTOSTARTAPP1, DEFAULT_USER_ID);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_001  -------- END --------');
    })


    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_002
     * @tc.number isModifyAutoStartAppsDisallowed_test_002
     * @tc.desc   isModifyAutoStartAppsDisallowed with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_002  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(undefined, AUTOSTARTAPP1, DEFAULT_USER_ID);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_002  -------- END --------');
    })


    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_003
     * @tc.number isModifyAutoStartAppsDisallowed_test_003
     * @tc.desc   isModifyAutoStartAppsDisallowed with null parameter autoStartApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_003  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_003  -------- END --------');
    })


    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_004
     * @tc.number isModifyAutoStartAppsDisallowed_test_004
     * @tc.desc   isModifyAutoStartAppsDisallowed with undefined parameter autoStartApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_004  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_004  -------- END --------');
    })


    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_005
     * @tc.number isModifyAutoStartAppsDisallowed_test_005
     * @tc.desc   isModifyAutoStartAppsDisallowed with null parameter autoStartApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_005  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, null);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_005  -------- END --------');
    })

    /**
     * @tc.name   isModifyAutoStartAppsDisallowed_test_006
     * @tc.number isModifyAutoStartAppsDisallowed_test_006
     * @tc.desc   isModifyAutoStartAppsDisallowed with undefined parameter autoStartApp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyAutoStartAppsDisallowed_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyAutoStartAppsDisallowed_test_006  -------- START --------');
      try {
        applicationManager.isModifyAutoStartAppsDisallowed(SELFWANT, AUTOSTARTAPP1, undefined);
        console.info(' --- isModifyAutoStartAppsDisallowed_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyAutoStartAppsDisallowed_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyAutoStartAppsDisallowed_test_006  -------- END --------');
    })

    /**
     * @tc.name   addKeepAliveApps_test_003
     * @tc.number addKeepAliveApps_test_003
     * @tc.desc   addKeepAliveApps with null parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_003  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- addKeepAliveApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   addKeepAliveApps_test_004
     * @tc.number addKeepAliveApps_test_004
     * @tc.desc   addKeepAliveApps with undefined parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_004  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- addKeepAliveApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_004  -------- END --------');
    })

    /**
     * @tc.name   addKeepAliveApps_test_006
     * @tc.number addKeepAliveApps_test_006
     * @tc.desc   addKeepAliveApps with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_006  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(SELFWANT, [TEST_BUNDLENAME], undefined);
        console.info(' --- addKeepAliveApps_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_006  -------- END --------');
    })


    /**
     * @tc.name   addKeepAliveApps_test_0011
     * @tc.number addKeepAliveApps_test_0011
     * @tc.desc   addKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_0011", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_001  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(null, [TEST_BUNDLENAME], DEFAULT_USER_ID);
        console.info(' --- addKeepAliveApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addKeepAliveApps_test_001  -------- END --------');
    })

    /**
     * @tc.name   addKeepAliveApps_test_001
     * @tc.number addKeepAliveApps_test_001
     * @tc.desc   addKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_001  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(null, [TEST_BUNDLENAME], DEFAULT_USER_ID);
        console.info(' --- addKeepAliveApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_001  -------- END --------');
    })

    /**
     * @tc.name   addKeepAliveApps_test_005
     * @tc.number addKeepAliveApps_test_005
     * @tc.desc   addKeepAliveApps with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_005  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(SELFWANT, [TEST_BUNDLENAME], null);
        console.info(' --- addKeepAliveApps_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_005  -------- END --------');
    })

    /**
     * @tc.name   removeKeepAliveApps_test_001
     * @tc.number removeKeepAliveApps_test_001
     * @tc.desc   removeKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_001  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(null, [TEST_BUNDLENAME], DEFAULT_USER_ID);
        console.info(' --- removeKeepAliveApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeKeepAliveApps_test_002
     * @tc.number removeKeepAliveApps_test_002
     * @tc.desc   removeKeepAliveApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_002  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(undefined, [TEST_BUNDLENAME], DEFAULT_USER_ID);
        console.info(' --- removeKeepAliveApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeKeepAliveApps_test_003
     * @tc.number removeKeepAliveApps_test_003
     * @tc.desc   removeKeepAliveApps with null parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_003  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- removeKeepAliveApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeKeepAliveApps_test_004
     * @tc.number removeKeepAliveApps_test_004
     * @tc.desc   removeKeepAliveApps with undefined parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_004  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- removeKeepAliveApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_004  -------- END --------');
    })

    /**
     * @tc.name   removeKeepAliveApps_test_005
     * @tc.number removeKeepAliveApps_test_005
     * @tc.desc   removeKeepAliveApps with undefined parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_005  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(SELFWANT, [TEST_BUNDLENAME], null);
        console.info(' --- removeKeepAliveApps_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_005  -------- END --------');
    })

    /**
     * @tc.name   removeKeepAliveApps_test_006
     * @tc.number removeKeepAliveApps_test_006
     * @tc.desc   removeKeepAliveApps with undefined parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeKeepAliveApps_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeKeepAliveApps_test_006  -------- START --------');
      try {
        applicationManager.removeKeepAliveApps(SELFWANT, [TEST_BUNDLENAME], undefined);
        console.info(' --- removeKeepAliveApps_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeKeepAliveApps_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeKeepAliveApps_test_006  -------- END --------');
    })

    /**
     * @tc.name   getKeepAliveApps_test_001
     * @tc.number getKeepAliveApps_test_001
     * @tc.desc   getKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getKeepAliveApps(null, DEFAULT_USER_ID);
        console.info(' --- getKeepAliveApps_test_001 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getKeepAliveApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_002
     * @tc.number getKeepAliveApps_test_002
     * @tc.desc   getKeepAliveApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_002  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(undefined, DEFAULT_USER_ID);
        console.info(' --- getKeepAliveApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_003
     * @tc.number getKeepAliveApps_test_003
     * @tc.desc   getKeepAliveApps with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_003  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(SELFWANT, null);
        console.info(' --- getKeepAliveApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_004
     * @tc.number getKeepAliveApps_test_004
     * @tc.desc   getKeepAliveApps with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_004  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(SELFWANT, undefined);
        console.info(' --- getKeepAliveApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   addUserNonStopApps_test_001
     * @tc.number addUserNonStopApps_test_001
     * @tc.desc   addUserNonStopApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addUserNonStopApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addUserNonStopApps_test_001  -------- START --------');
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {appIdentifier:"5765880207852919475", accountId:DEFAULT_USER_ID, appIndex:0}
        ];
        applicationManager.addUserNonStopApps(null, userNonStopApps);
        console.info(' --- addUserNonStopApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addUserNonStopApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addUserNonStopApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   addUserNonStopApps_test_002
     * @tc.number addUserNonStopApps_test_002
     * @tc.desc   addUserNonStopApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addUserNonStopApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addUserNonStopApps_test_002  -------- START --------');
      try {
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {appIdentifier:"5765880207852919475", accountId:DEFAULT_USER_ID, appIndex:0}
        ];
        applicationManager.addUserNonStopApps(undefined, userNonStopApps);
        console.info(' --- addUserNonStopApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addUserNonStopApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addUserNonStopApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   addUserNonStopApps_test_003
     * @tc.number addUserNonStopApps_test_003
     * @tc.desc   addUserNonStopApps with null parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addUserNonStopApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addUserNonStopApps_test_003  -------- START --------');
      try {
        applicationManager.addUserNonStopApps(SELFWANT, null);
        console.info(' --- addUserNonStopApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addUserNonStopApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addUserNonStopApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   addUserNonStopApps_test_004
     * @tc.number addUserNonStopApps_test_004
     * @tc.desc   addUserNonStopApps with undefined parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addUserNonStopApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addUserNonStopApps_test_004  -------- START --------');
      try {
        applicationManager.addUserNonStopApps(SELFWANT, undefined);
        console.info(' --- addUserNonStopApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addUserNonStopApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addUserNonStopApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeUserNonStopApps_test_001
     * @tc.number removeUserNonStopApps_test_001
     * @tc.desc   removeUserNonStopApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeUserNonStopApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeUserNonStopApps_test_001  -------- START --------');
      try {
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
        applicationManager.removeUserNonStopApps(null, removeApps);
        console.info(' --- removeUserNonStopApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeUserNonStopApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeUserNonStopApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeUserNonStopApps_test_002
     * @tc.number removeUserNonStopApps_test_002
     * @tc.desc   removeUserNonStopApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeUserNonStopApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeUserNonStopApps_test_002  -------- START --------');
      try {
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
        applicationManager.removeUserNonStopApps(undefined, removeApps);
        console.info(' --- removeUserNonStopApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeUserNonStopApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeUserNonStopApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeUserNonStopApps_test_003
     * @tc.number removeUserNonStopApps_test_003
     * @tc.desc   removeUserNonStopApps with null parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeUserNonStopApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeUserNonStopApps_test_003  -------- START --------');
      try {
        applicationManager.removeUserNonStopApps(SELFWANT, null);
        console.info(' --- removeUserNonStopApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeUserNonStopApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeUserNonStopApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeUserNonStopApps_test_004
     * @tc.number removeUserNonStopApps_test_004
     * @tc.desc   removeUserNonStopApps with undefined parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeUserNonStopApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeUserNonStopApps_test_004  -------- START --------');
      try {
        applicationManager.removeUserNonStopApps(SELFWANT, undefined);
        console.info(' --- removeUserNonStopApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeUserNonStopApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeUserNonStopApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   getUserNonStopApps_test_001
     * @tc.number getUserNonStopApps_test_001
     * @tc.desc   getUserNonStopApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserNonStopApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserNonStopApps_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getUserNonStopApps(null);
        console.info(' --- getUserNonStopApps_test_001 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getUserNonStopApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getUserNonStopApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   getUserNonStopApps_test_002
     * @tc.number getUserNonStopApps_test_002
     * @tc.desc   getUserNonStopApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserNonStopApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserNonStopApps_test_002  -------- START --------');
      try {
        applicationManager.getUserNonStopApps(undefined);
        console.info(' --- getUserNonStopApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserNonStopApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserNonStopApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   addFreezeExemptedApps_test_001
     * @tc.number addFreezeExemptedApps_test_001
     * @tc.desc   addFreezeExemptedApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addFreezeExemptedApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addFreezeExemptedApps_test_001  -------- START --------');
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
        applicationManager.addFreezeExemptedApps(null, freezeExemptedApps);
        console.info(' --- addFreezeExemptedApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addFreezeExemptedApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addFreezeExemptedApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   addFreezeExemptedApps_test_002
     * @tc.number addFreezeExemptedApps_test_002
     * @tc.desc   addFreezeExemptedApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addFreezeExemptedApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addFreezeExemptedApps_test_002  -------- START --------');
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
        applicationManager.addFreezeExemptedApps(undefined, freezeExemptedApps);
        console.info(' --- addFreezeExemptedApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addFreezeExemptedApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addFreezeExemptedApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   addFreezeExemptedApps_test_003
     * @tc.number addFreezeExemptedApps_test_003
     * @tc.desc   addFreezeExemptedApps with null parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addFreezeExemptedApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addFreezeExemptedApps_test_003  -------- START --------');
      try {
        applicationManager.addFreezeExemptedApps(SELFWANT, null);
        console.info(' --- addFreezeExemptedApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addFreezeExemptedApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addFreezeExemptedApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   addFreezeExemptedApps_test_004
     * @tc.number addFreezeExemptedApps_test_004
     * @tc.desc   addFreezeExemptedApps with undefined parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addFreezeExemptedApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addFreezeExemptedApps_test_004  -------- START --------');
      try {
        applicationManager.addFreezeExemptedApps(SELFWANT, undefined);
        console.info(' --- addFreezeExemptedApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addFreezeExemptedApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addFreezeExemptedApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeFreezeExemptedApps_test_001
     * @tc.number removeFreezeExemptedApps_test_001
     * @tc.desc   removeFreezeExemptedApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeFreezeExemptedApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeFreezeExemptedApps_test_001  -------- START --------');
      try {
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
        applicationManager.removeFreezeExemptedApps(null, removeApps);
        console.info(' --- removeFreezeExemptedApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeFreezeExemptedApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeFreezeExemptedApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeFreezeExemptedApps_test_002
     * @tc.number removeFreezeExemptedApps_test_002
     * @tc.desc   removeFreezeExemptedApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeFreezeExemptedApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeFreezeExemptedApps_test_002  -------- START --------');
      try {
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
        applicationManager.removeFreezeExemptedApps(undefined, removeApps);
        console.info(' --- removeFreezeExemptedApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeFreezeExemptedApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeFreezeExemptedApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeFreezeExemptedApps_test_003
     * @tc.number removeFreezeExemptedApps_test_003
     * @tc.desc   removeFreezeExemptedApps with null parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeFreezeExemptedApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeFreezeExemptedApps_test_003  -------- START --------');
      try {
        applicationManager.removeFreezeExemptedApps(SELFWANT, null);
        console.info(' --- removeFreezeExemptedApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeFreezeExemptedApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeFreezeExemptedApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeFreezeExemptedApps_test_004
     * @tc.number removeFreezeExemptedApps_test_004
     * @tc.desc   removeFreezeExemptedApps with undefined parameter applicationInstances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeFreezeExemptedApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeFreezeExemptedApps_test_004  -------- START --------');
      try {
        applicationManager.removeFreezeExemptedApps(SELFWANT, undefined);
        console.info(' --- removeFreezeExemptedApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeFreezeExemptedApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeFreezeExemptedApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   getFreezeExemptedApps_test_001
     * @tc.number getFreezeExemptedApps_test_001
     * @tc.desc   getFreezeExemptedApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getFreezeExemptedApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getFreezeExemptedApps_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getFreezeExemptedApps(null);
        console.info(' --- getFreezeExemptedApps_test_001 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getFreezeExemptedApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getFreezeExemptedApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   getFreezeExemptedApps_test_002
     * @tc.number getFreezeExemptedApps_test_002
     * @tc.desc   getFreezeExemptedApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getFreezeExemptedApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getFreezeExemptedApps_test_002  -------- START --------');
      try {
        applicationManager.getFreezeExemptedApps(undefined);
        console.info(' --- getFreezeExemptedApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getFreezeExemptedApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getFreezeExemptedApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   isModifyKeepAliveAppsDisallowed_test_001
     * @tc.number isModifyKeepAliveAppsDisallowed_test_001
     * @tc.desc   isModifyKeepAliveAppsDisallowed with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyKeepAliveAppsDisallowed_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_001  -------- START --------');
      try {
        applicationManager.isModifyKeepAliveAppsDisallowed(null, DEFAULT_USER_ID, TEST_BUNDLENAME);
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_001  -------- END --------');
    })


    /**
     * @tc.name   isModifyKeepAliveAppsDisallowed_test_002
     * @tc.number isModifyKeepAliveAppsDisallowed_test_002
     * @tc.desc   isModifyKeepAliveAppsDisallowed with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyKeepAliveAppsDisallowed_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_002  -------- START --------');
      try {
        applicationManager.isModifyKeepAliveAppsDisallowed(undefined, DEFAULT_USER_ID, TEST_BUNDLENAME);
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_002  -------- END --------');
    })


    /**
     * @tc.name   isModifyKeepAliveAppsDisallowed_test_003
     * @tc.number isModifyKeepAliveAppsDisallowed_test_003
     * @tc.desc   isModifyKeepAliveAppsDisallowed with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyKeepAliveAppsDisallowed_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_003  -------- START --------');
      try {
        applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, null, TEST_BUNDLENAME);
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_003  -------- END --------');
    })


    /**
     * @tc.name   isModifyKeepAliveAppsDisallowed_test_004
     * @tc.number isModifyKeepAliveAppsDisallowed_test_004
     * @tc.desc   isModifyKeepAliveAppsDisallowed with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isModifyKeepAliveAppsDisallowed_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_004  -------- START --------');
      try {
        applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, undefined, TEST_BUNDLENAME);
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isModifyKeepAliveAppsDisallowed_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isModifyKeepAliveAppsDisallowed_test_004  -------- END --------');
    })

    /**
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_005
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_005", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, '');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_006
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_006", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_isModifyKeepAliveAppsDisallowed_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ISMODITYKEEPALIVEAPP_007
     * @tc.desc   test isModifyKeepAliveAppsDisallowed method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_isModifyKeepAliveAppsDisallowed_007", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApp: string = TEST_BUNDLENAME;
        let disallowModifty: boolean = true;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        disallowModifty = applicationManager.isModifyKeepAliveAppsDisallowed(SELFWANT, DEFAULT_USER_ID, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })


    /**
     * @tc.name   clearUpApplicationData_test_001
     * @tc.number clearUpApplicationData_test_001
     * @tc.desc   clearUpApplicationData with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_001  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(null, TEST_BUNDLENAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        console.info(' --- clearUpApplicationData_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_001  -------- END --------');
    })


    /**
     * @tc.name   clearUpApplicationData_test_002
     * @tc.number clearUpApplicationData_test_002
     * @tc.desc   clearUpApplicationData with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_002  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(undefined, TEST_BUNDLENAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        console.info(' --- clearUpApplicationData_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_002  -------- END --------');
    })


    /**
     * @tc.name   clearUpApplicationData_test_003
     * @tc.number clearUpApplicationData_test_003
     * @tc.desc   clearUpApplicationData with null parameter appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_003  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, null, DEFAULT_USER_ID);
        console.info(' --- clearUpApplicationData_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_003  -------- END --------');
    })


    /**
     * @tc.name   clearUpApplicationData_test_004
     * @tc.number clearUpApplicationData_test_004
     * @tc.desc   clearUpApplicationData with undefined parameter appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_004  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, undefined, DEFAULT_USER_ID);
        console.info(' --- clearUpApplicationData_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_004  -------- END --------');
    })


    /**
     * @tc.name   clearUpApplicationData_test_005
     * @tc.number clearUpApplicationData_test_005
     * @tc.desc   clearUpApplicationData with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_005  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX, null);
        console.info(' --- clearUpApplicationData_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_005  -------- END --------');
    })


    /**
     * @tc.name   clearUpApplicationData_test_006
     * @tc.number clearUpApplicationData_test_006
     * @tc.desc   clearUpApplicationData with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("clearUpApplicationData_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- clearUpApplicationData_test_006  -------- START --------');
      try {
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX, undefined);
        console.info(' --- clearUpApplicationData_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- clearUpApplicationData_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- clearUpApplicationData_test_006  -------- END --------');
    })


    /**
     * @tc.name   setAllowedKioskApps_test_001
     * @tc.number setAllowedKioskApps_test_001
     * @tc.desc   setAllowedKioskApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAllowedKioskApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAllowedKioskApps_test_001  -------- START --------');
      try {
        applicationManager.setAllowedKioskApps(null, [`${'1265956504964495936'}`]);
        console.info(' --- setAllowedKioskApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAllowedKioskApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAllowedKioskApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   setAllowedKioskApps_test_002
     * @tc.number setAllowedKioskApps_test_002
     * @tc.desc   setAllowedKioskApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAllowedKioskApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAllowedKioskApps_test_002  -------- START --------');
      try {
        applicationManager.setAllowedKioskApps(undefined, [`${'1265956504964495936'}`]);
        console.info(' --- setAllowedKioskApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAllowedKioskApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAllowedKioskApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   setAllowedKioskApps_test_003
     * @tc.number setAllowedKioskApps_test_003
     * @tc.desc   setAllowedKioskApps with null parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAllowedKioskApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAllowedKioskApps_test_003  -------- START --------');
      try {
        applicationManager.setAllowedKioskApps(SELFWANT, null);
        console.info(' --- setAllowedKioskApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAllowedKioskApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAllowedKioskApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   setAllowedKioskApps_test_004
     * @tc.number setAllowedKioskApps_test_004
     * @tc.desc   setAllowedKioskApps with undefined parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAllowedKioskApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAllowedKioskApps_test_004  -------- START --------');
      try {
        applicationManager.setAllowedKioskApps(SELFWANT, undefined);
        console.info(' --- setAllowedKioskApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAllowedKioskApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAllowedKioskApps_test_004  -------- END --------');
    })


    /**
     * @tc.name   getAllowedKioskApps_test_001
     * @tc.number getAllowedKioskApps_test_001
     * @tc.desc   getAllowedKioskApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedKioskApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedKioskApps_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getAllowedKioskApps(null);
        console.info(' --- getAllowedKioskApps_test_001 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedKioskApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedKioskApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   getAllowedKioskApps_test_002
     * @tc.number getAllowedKioskApps_test_002
     * @tc.desc   getAllowedKioskApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedKioskApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedKioskApps_test_002  -------- START --------');
      try {
        applicationManager.getAllowedKioskApps(undefined);
        console.info(' --- getAllowedKioskApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedKioskApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedKioskApps_test_002  -------- END --------');
    })

    /**
     * @tc.name   setKioskFeatures_test_002
     * @tc.number setKioskFeatures_test_002
     * @tc.desc   setKioskFeatures with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setKioskFeatures_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setKioskFeatures_test_002  -------- START --------');
      try {
        let kioskFeatures: Array<applicationManager.KioskFeature> = [];
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_NOTIFICATION_CENTER);
        kioskFeatures.push(applicationManager.KioskFeature.ALLOW_CONTROL_CENTER);
        applicationManager.setKioskFeatures(undefined, kioskFeatures);
        console.info(' --- setKioskFeatures_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setKioskFeatures_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setKioskFeatures_test_002  -------- END --------');
    })


    /**
     * @tc.name   setKioskFeatures_test_003
     * @tc.number setKioskFeatures_test_003
     * @tc.desc   setKioskFeatures with null parameter features
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setKioskFeatures_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setKioskFeatures_test_003  -------- START --------');
      try {
        applicationManager.setKioskFeatures(SELFWANT, null);
        console.info(' --- setKioskFeatures_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setKioskFeatures_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setKioskFeatures_test_003  -------- END --------');
    })


    /**
     * @tc.name   setKioskFeatures_test_004
     * @tc.number setKioskFeatures_test_004
     * @tc.desc   setKioskFeatures with undefined parameter features
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setKioskFeatures_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setKioskFeatures_test_004  -------- START --------');
      try {
        applicationManager.setKioskFeatures(SELFWANT, undefined);
        console.info(' --- setKioskFeatures_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setKioskFeatures_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setKioskFeatures_test_004  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_001
     * @tc.number addAllowedRunningBundles_test_001
     * @tc.desc   addAllowedRunningBundles with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_001  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(null, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- addAllowedRunningBundles_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_001  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_002
     * @tc.number addAllowedRunningBundles_test_002
     * @tc.desc   addAllowedRunningBundles with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_002  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(undefined, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- addAllowedRunningBundles_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_002  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_003
     * @tc.number addAllowedRunningBundles_test_003
     * @tc.desc   addAllowedRunningBundles with null parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_003  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- addAllowedRunningBundles_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_003  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_004
     * @tc.number addAllowedRunningBundles_test_004
     * @tc.desc   addAllowedRunningBundles with undefined parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_004  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- addAllowedRunningBundles_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_004  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_005
     * @tc.number addAllowedRunningBundles_test_005
     * @tc.desc   addAllowedRunningBundles with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_005  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, null);
        console.info(' --- addAllowedRunningBundles_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_005  -------- END --------');
    })


    /**
     * @tc.name   addAllowedRunningBundles_test_006
     * @tc.number addAllowedRunningBundles_test_006
     * @tc.desc   addAllowedRunningBundles with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_006  -------- START --------');
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- addAllowedRunningBundles_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_001
     * @tc.number removeAllowedRunningBundles_test_001
     * @tc.desc   removeAllowedRunningBundles with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_001  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(null, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- removeAllowedRunningBundles_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_002
     * @tc.number removeAllowedRunningBundles_test_002
     * @tc.desc   removeAllowedRunningBundles with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_002  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(undefined, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- removeAllowedRunningBundles_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_003
     * @tc.number removeAllowedRunningBundles_test_003
     * @tc.desc   removeAllowedRunningBundles with null parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_003  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- removeAllowedRunningBundles_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_004
     * @tc.number removeAllowedRunningBundles_test_004
     * @tc.desc   removeAllowedRunningBundles with undefined parameter appIdentifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_004  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- removeAllowedRunningBundles_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_005
     * @tc.number removeAllowedRunningBundles_test_005
     * @tc.desc   removeAllowedRunningBundles with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_005  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, null);
        console.info(' --- removeAllowedRunningBundles_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedRunningBundles_test_006
     * @tc.number removeAllowedRunningBundles_test_006
     * @tc.desc   removeAllowedRunningBundles with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_006  -------- START --------');
      try {
        applicationManager.removeAllowedRunningBundles(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- removeAllowedRunningBundles_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_006  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_001
     * @tc.number getAllowedRunningBundles_test_001
     * @tc.desc   getAllowedRunningBundles with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let empty = applicationManager.getAllowedRunningBundles(null, DEFAULT_USER_ID);
        console.info(' --- getAllowedRunningBundles_test_001 error is expected, but it done.');
        expect(empty.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_001  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_002
     * @tc.number getAllowedRunningBundles_test_002
     * @tc.desc   getAllowedRunningBundles with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_002  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(undefined, DEFAULT_USER_ID);
        console.info(' --- getAllowedRunningBundles_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_002  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_003
     * @tc.number getAllowedRunningBundles_test_003
     * @tc.desc   getAllowedRunningBundles with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_003  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(SELFWANT, null);
        console.info(' --- getAllowedRunningBundles_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_003  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_004
     * @tc.number getAllowedRunningBundles_test_004
     * @tc.desc   getAllowedRunningBundles with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_004  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(SELFWANT, undefined);
        console.info(' --- getAllowedRunningBundles_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_004  -------- END --------');
    })


    /**
     * @tc.name   setAbilityDisabled_test_001
     * @tc.number setAbilityDisabled_test_001
     * @tc.desc   setAbilityDisabled with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_001  -------- START --------');
      try {
        applicationManager.setAbilityDisabled(null, 'com.example.helloworld', DEFAULT_USER_ID, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAbilityDisabled_test_001  -------- END --------');
    })


    /**
     * @tc.name   setAbilityDisabled_test_002
     * @tc.number setAbilityDisabled_test_002
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_002  -------- START --------');
      try {
        applicationManager.setAbilityDisabled(undefined, 'com.example.helloworld', DEFAULT_USER_ID, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAbilityDisabled_test_002  -------- END --------');
    })


    /**
     * @tc.name   setAbilityDisabled_test_003
     * @tc.number setAbilityDisabled_test_003
     * @tc.desc   setAbilityDisabled with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_003  -------- START --------');
      try {
        applicationManager.setAbilityDisabled(SELFWANT, 'com.example.helloworld', null, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAbilityDisabled_test_003  -------- END --------');
    })


    /**
     * @tc.name   setAbilityDisabled_test_004
     * @tc.number setAbilityDisabled_test_004
     * @tc.desc   setAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_004  -------- START --------');
      try {
        applicationManager.setAbilityDisabled(SELFWANT, 'com.example.helloworld', undefined, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setAbilityDisabled_test_004  -------- END --------');
    })

    /**
     * @tc.name   setAbilityDisabled_test_005
     * @tc.number setAbilityDisabled_test_005
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_005  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, null, DEFAULT_USER_ID, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_005  -------- END --------');
    })

    /**
     * @tc.name   setAbilityDisabled_test_006
     * @tc.number setAbilityDisabled_test_006
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_006  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, undefined, DEFAULT_USER_ID, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_006  -------- END --------');
    })

    /**
     * @tc.name   setAbilityDisabled_test_007
     * @tc.number setAbilityDisabled_test_007
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_007  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, '', DEFAULT_USER_ID, 'EntryAbility', true);
        console.info(' --- setAbilityDisabled_test_007 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_007 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_007  -------- END --------');
    })

        /**
     * @tc.name   setAbilityDisabled_test_008
     * @tc.number setAbilityDisabled_test_008
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_008", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_008  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, '', true);
        console.info(' --- setAbilityDisabled_test_008 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_008 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_008  -------- END --------');
    })

    /**
     * @tc.name   setAbilityDisabled_test_009
     * @tc.number setAbilityDisabled_test_009
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_009", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_009  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, null, true);
        console.info(' --- setAbilityDisabled_test_009 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_009 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_009  -------- END --------');
    })

    /**
     * @tc.name   setAbilityDisabled_test_0010
     * @tc.number setAbilityDisabled_test_0010
     * @tc.desc   setAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setAbilityDisabled_test_0010", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setAbilityDisabled_test_0010  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.setAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, undefined, true);
        console.info(' --- setAbilityDisabled_test_0010 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setAbilityDisabled_test_0010 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setAbilityDisabled_test_0010  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_001
     * @tc.number isAbilityDisabled_test_001
     * @tc.desc   isAbilityDisabled with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = applicationManager.isAbilityDisabled(null, 'com.example.helloworld', DEFAULT_USER_ID, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_001 error is expected, but it done.');
        expect(ret).assertFalse();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false ).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- isAbilityDisabled_test_001  -------- END --------');
    })


    /**
     * @tc.name   isAbilityDisabled_test_002
     * @tc.number isAbilityDisabled_test_002
     * @tc.desc   isAbilityDisabled with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_002  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(undefined, 'com.example.helloworld', DEFAULT_USER_ID, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_002  -------- END --------');
    })


    /**
     * @tc.name   isAbilityDisabled_test_003
     * @tc.number isAbilityDisabled_test_003
     * @tc.desc   isAbilityDisabled with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_003  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, 'com.example.helloworld', null, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_003  -------- END --------');
    })


    /**
     * @tc.name   isAbilityDisabled_test_004
     * @tc.number isAbilityDisabled_test_004
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_004  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, 'com.example.helloworld', undefined, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_004  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_005
     * @tc.number isAbilityDisabled_test_005
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_005  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, undefined);
        console.info(' --- isAbilityDisabled_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_005  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_006
     * @tc.number isAbilityDisabled_test_006
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_006  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, null);
        console.info(' --- isAbilityDisabled_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_006  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_007
     * @tc.number isAbilityDisabled_test_007
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_007  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, 'com.example.helloworld', DEFAULT_USER_ID, '');
        console.info(' --- isAbilityDisabled_test_007 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_007 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_007  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_008
     * @tc.number isAbilityDisabled_test_008
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_008", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_008  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, undefined, DEFAULT_USER_ID, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_008 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_008 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_008  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_009
     * @tc.number isAbilityDisabled_test_009
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_009", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_009  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, null, DEFAULT_USER_ID, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_009 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_009 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_009  -------- END --------');
    })

    /**
     * @tc.name   isAbilityDisabled_test_0010
     * @tc.number isAbilityDisabled_test_0010
     * @tc.desc   isAbilityDisabled with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isAbilityDisabled_test_0010", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isAbilityDisabled_test_0010  -------- START --------');
      try {
        applicationManager.isAbilityDisabled(SELFWANT, '', DEFAULT_USER_ID, 'EntryAbility');
        console.info(' --- isAbilityDisabled_test_0010 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isAbilityDisabled_test_0010 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- isAbilityDisabled_test_0010  -------- END --------');
    })

    /**
     * @tc.name   getAutoStartApps_test_029
     * @tc.number getAutoStartApps_test_029
     * @tc.desc   getAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_029  -------- START --------');
      try {
        applicationManager.getAutoStartApps(SELFWANT, null);
        console.info(' --- getAutoStartApps_test_029 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAutoStartApps_test_029  -------- END --------');
    })


    /**
     * @tc.name   getAutoStartApps_test_030
     * @tc.number getAutoStartApps_test_030
     * @tc.desc   getAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_030  -------- START --------');
      try {
        applicationManager.getAutoStartApps(SELFWANT, undefined);
        console.info(' --- getAutoStartApps_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAutoStartApps_test_030  -------- END --------');
    })

    /**
     * @tc.name   getAutoStartApps_test_031
     * @tc.number getAutoStartApps_test_031
     * @tc.desc   getAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_031  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getAutoStartApps(null, DEFAULT_USER_ID);
        console.info(' --- getAutoStartApps_test_031 error is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAutoStartApps_test_031  -------- END --------');
    })


    /**
     * @tc.name   getAutoStartApps_test_032
     * @tc.number getAutoStartApps_test_032
     * @tc.desc   getAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAutoStartApps_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAutoStartApps_test_032  -------- START --------');
      try {
        applicationManager.getAutoStartApps(undefined, DEFAULT_USER_ID);
        console.info(' --- getAutoStartApps_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAutoStartApps_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAutoStartApps_test_032  -------- END --------');
    })

    /**
     * @tc.name   addKeepAliveApps_test_085
     * @tc.number addKeepAliveApps_test_085
     * @tc.desc   addKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addKeepAliveApps_test_085", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addKeepAliveApps_test_085  -------- START --------');
      try {
        applicationManager.addKeepAliveApps(null, [TEST_BUNDLENAME], DEFAULT_USER_ID);
        console.info(' --- addKeepAliveApps_test_085 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addKeepAliveApps_test_085 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addKeepAliveApps_test_085  -------- END --------');
    })

    /**
     * @tc.name   getKeepAliveApps_test_029
     * @tc.number getKeepAliveApps_test_029
     * @tc.desc   getKeepAliveApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_029  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getKeepAliveApps(null, DEFAULT_USER_ID);
        console.info(' --- getKeepAliveApps_test_029 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getKeepAliveApps_test_029  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_030
     * @tc.number getKeepAliveApps_test_030
     * @tc.desc   getKeepAliveApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_030  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(undefined, DEFAULT_USER_ID);
        console.info(' --- getKeepAliveApps_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_030  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_031
     * @tc.number getKeepAliveApps_test_031
     * @tc.desc   getKeepAliveApps with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_031  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(SELFWANT, null);
        console.info(' --- getKeepAliveApps_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_031  -------- END --------');
    })


    /**
     * @tc.name   getKeepAliveApps_test_032
     * @tc.number getKeepAliveApps_test_032
     * @tc.desc   getKeepAliveApps with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getKeepAliveApps_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getKeepAliveApps_test_032  -------- START --------');
      try {
        applicationManager.getKeepAliveApps(SELFWANT, undefined);
        console.info(' --- getKeepAliveApps_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getKeepAliveApps_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getKeepAliveApps_test_032  -------- END --------');
    })

    /**
     * @tc.name   getUserNonStopApps_test_015
     * @tc.number getUserNonStopApps_test_015
     * @tc.desc   getUserNonStopApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserNonStopApps_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserNonStopApps_test_015  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getUserNonStopApps(null);
        console.info(' --- getUserNonStopApps_test_015 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getUserNonStopApps_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getUserNonStopApps_test_015  -------- END --------');
    })


    /**
     * @tc.name   getUserNonStopApps_test_016
     * @tc.number getUserNonStopApps_test_016
     * @tc.desc   getUserNonStopApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserNonStopApps_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserNonStopApps_test_016  -------- START --------');
      try {
        applicationManager.getUserNonStopApps(undefined);
        console.info(' --- getUserNonStopApps_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserNonStopApps_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserNonStopApps_test_016  -------- END --------');
    })

    /**
     * @tc.name   getAllowedKioskApps_test_015
     * @tc.number getAllowedKioskApps_test_015
     * @tc.desc   getAllowedKioskApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedKioskApps_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedKioskApps_test_015  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getAllowedKioskApps(null);
        console.info(' --- getAllowedKioskApps_test_015 success is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedKioskApps_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedKioskApps_test_015  -------- END --------');
    })


    /**
     * @tc.name   getAllowedKioskApps_test_016
     * @tc.number getAllowedKioskApps_test_016
     * @tc.desc   getAllowedKioskApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedKioskApps_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedKioskApps_test_016  -------- START --------');
      try {
        applicationManager.getAllowedKioskApps(undefined);
        console.info(' --- getAllowedKioskApps_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedKioskApps_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedKioskApps_test_016  -------- END --------');
    })

    /**
     * @tc.name   getAllowedRunningBundles_test_029
     * @tc.number getAllowedRunningBundles_test_029
     * @tc.desc   getAllowedRunningBundles with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_029  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let apps = applicationManager.getAllowedRunningBundles(null, DEFAULT_USER_ID);
        console.info(' --- getAllowedRunningBundles_test_029 error is expected, but it done.');
        expect(apps.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_029  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_030
     * @tc.number getAllowedRunningBundles_test_030
     * @tc.desc   getAllowedRunningBundles with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_030  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(undefined, DEFAULT_USER_ID);
        console.info(' --- getAllowedRunningBundles_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_030  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_031
     * @tc.number getAllowedRunningBundles_test_031
     * @tc.desc   getAllowedRunningBundles with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_031  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(SELFWANT, null);
        console.info(' --- getAllowedRunningBundles_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_031  -------- END --------');
    })


    /**
     * @tc.name   getAllowedRunningBundles_test_032
     * @tc.number getAllowedRunningBundles_test_032
     * @tc.desc   getAllowedRunningBundles with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedRunningBundles_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedRunningBundles_test_032  -------- START --------');
      try {
        applicationManager.getAllowedRunningBundles(SELFWANT, undefined);
        console.info(' --- getAllowedRunningBundles_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedRunningBundles_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedRunningBundles_test_032  -------- END --------');
    })

     /**
     * @tc.name   addDisallowedRunningBundlesSync_test_003_1
     * @tc.number addDisallowedRunningBundlesSync_test_003_1
     * @tc.desc   addDisallowedRunningBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedRunningBundlesSync_test_003_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedRunningBundlesSync_test_003_1  -------- START --------');
      try {
        applicationManager.addDisallowedRunningBundlesSync(SELFWANT, []);
        console.info(' --- addDisallowedRunningBundlesSync_test_003_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedRunningBundlesSync_test_003_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- addDisallowedRunningBundlesSync_test_003_1  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedRunningBundlesSync_test_004_1
     * @tc.number removeDisallowedRunningBundlesSync_test_004_1
     * @tc.desc   removeDisallowedRunningBundlesSync with [] parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedRunningBundlesSync_test_004_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedRunningBundlesSync_test_004_1  -------- START --------');
      try {
        applicationManager.removeDisallowedRunningBundlesSync(SELFWANT, []);
        console.info(' --- removeDisallowedRunningBundlesSync_test_004_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedRunningBundlesSync_test_004_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedRunningBundlesSync_test_004_1  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004_1
     * @tc.number addAutoStartApps_test_004_1
     * @tc.desc   addAutoStartApps with [] parameter autoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_1  -------- START --------');
      try {
        applicationManager.addAutoStartApps(SELFWANT, []);
        console.info(' --- addAutoStartApps_test_004_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_1 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_1  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004_2
     * @tc.number addAutoStartApps_test_004_2
     * @tc.desc   addAutoStartApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_2", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_2  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(null, [SELFWANT], DEFAULT_USER_ID, false);
        console.info(' --- addAutoStartApps_test_004_2 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_2 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_2  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004_3
     * @tc.number addAutoStartApps_test_004_3
     * @tc.desc   addAutoStartApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_3", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_3  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(undefined, [SELFWANT], DEFAULT_USER_ID, false);
        console.info(' --- addAutoStartApps_test_004_3 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_3 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_3  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004_4
     * @tc.number addAutoStartApps_test_004_4
     * @tc.desc   addAutoStartApps with null parameter AutoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_4", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_4  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(SELFWANT, null, DEFAULT_USER_ID, false);
        console.info(' --- addAutoStartApps_test_004_4 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_4 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_4  -------- END --------');
    })


    /**
     * @tc.name   addAutoStartApps_test_004_5
     * @tc.number addAutoStartApps_test_004_5
     * @tc.desc   addAutoStartApps with undefined parameter AutoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_5", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_5  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(SELFWANT, undefined, DEFAULT_USER_ID, false);
        console.info(' --- addAutoStartApps_test_004_5 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_5 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addAutoStartApps_test_004_5  -------- END --------');
    })

    /**
     * @tc.name   addAutoStartApps_test_004_6
     * @tc.number addAutoStartApps_test_004_6
     * @tc.desc   addAutoStartApps with undefined parameter AutoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_6", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_6  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(SELFWANT, [SELFWANT], null, false);
        console.info(' --- addAutoStartApps_test_004_6 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_6 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_6  -------- END --------');
    })

    /**
     * @tc.name   addAutoStartApps_test_004_7
     * @tc.number addAutoStartApps_test_004_7
     * @tc.desc   addAutoStartApps with undefined parameter AutoStartApps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAutoStartApps_test_004_7", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAutoStartApps_test_004_7  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAutoStartApps(SELFWANT, [SELFWANT], undefined, false);
        console.info(' --- addAutoStartApps_test_004_7 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAutoStartApps_test_004_7 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAutoStartApps_test_004_7  -------- END --------');
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0012
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0012
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0012", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(null, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0013
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0013
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0013", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(undefined, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0014
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0014
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0014", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(null, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0015
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0015
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0015", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(undefined, keepAliveApps, DEFAULT_USER_ID, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0016
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0016
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0016", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, null, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addKeepAliveAppsWithDisallowModify_0017
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDKEEPALIVEAPPS_WITHDISALLOWMODIFY_0017
     * @tc.desc   test addKeepAliveAppsWithDisallowModify method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addKeepAliveAppsWithDisallowModify_0017", Level.LEVEL2, async (done: Function) => {
      try {
        let keepAliveApps: Array<string> = [];
        let disallowModifty: boolean = false;
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addKeepAliveApps(SELFWANT, keepAliveApps, undefined, disallowModifty);
      } catch (error) {
        console.info(' --- test_addKeepAliveAppsWithDisallowModify_006 error 801 is expected, actually catch: ' + error.code);
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
    /**
     * @tc.name   addAllowedRunningBundles_test_006_1
     * @tc.number addAllowedRunningBundles_test_006_1
     * @tc.desc   addAllowedRunningBundles with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedRunningBundles_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedRunningBundles_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = applicationManager.addAllowedRunningBundles(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedRunningBundles_test_006_1 done is expected, but error, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addAllowedRunningBundles_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   removeAllowedRunningBundles_test_006_1
     * @tc.number removeAllowedRunningBundles_test_006_1
     * @tc.desc   removeAllowedRunningBundles with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedRunningBundles_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedRunningBundles_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedRunningBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID)
        let ret = applicationManager.removeAllowedRunningBundles(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedRunningBundles_test_006_1 done is expected,but error, actually catch: ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeAllowedRunningBundles_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test addAllowedNotificationBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0200
     * @tc.desc   test addAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0300
     * @tc.desc   test addAllowedNotificationBundles method with super admin and invalid userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0400
     * @tc.desc   test addAllowedNotificationBundles method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(null, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0500
     * @tc.desc   test addAllowedNotificationBundles method with super admin and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(undefined, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0600
     * @tc.desc   test addAllowedNotificationBundles method with super admin and null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0600", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0700
     * @tc.desc   test addAllowedNotificationBundles method with super admin and undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0700", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0800
     * @tc.desc   test addAllowedNotificationBundles method with super admin and null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0800", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_0900
     * @tc.desc   test addAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_0900", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_1000
     * @tc.desc   test addAllowedNotificationBundles method with super admin success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_addAllowedNotificationBundles_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let emptyRes = applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(emptyRes.length == 0).assertTrue();
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res = applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 3).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_1100
     * @tc.desc   test addAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_1100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.addAllowedNotificationBundles(SELFWANT, [], DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedNotificationBundles_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDNOTIFICATIONBUNDLES_1200
     * @tc.desc   test addAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedNotificationBundles_1200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_NOTIFICATION, true);
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200010).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test removeAllowedNotificationBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0200
     * @tc.desc   test removeAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0300
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and invalid userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0400
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(null, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0500
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(undefined, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0600
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and null bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0600", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, null, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0700
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and undefined bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0700", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0800
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0800", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_0900
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_0900", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_1000
     * @tc.desc   test removeAllowedNotificationBundles method with super admin success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_removeAllowedNotificationBundles_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        applicationManager.addAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res = applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 3).assertTrue();
        applicationManager.removeAllowedNotificationBundles(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let emptyRes = applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(emptyRes.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedNotificationBundles_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDNOTIFICATIONBUNDLES_1100
     * @tc.desc   test removeAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedNotificationBundles_1100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.removeAllowedNotificationBundles(SELFWANT, [], DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0100
     * @tc.desc   test getAllowedNotificationBundles method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0100", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0200
     * @tc.desc   test getAllowedNotificationBundles method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.getAllowedNotificationBundles(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0400
     * @tc.desc   test getAllowedNotificationBundles method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0400", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let ret = applicationManager.getAllowedNotificationBundles(null, DEFAULT_USER_ID);
        expect(ret.length === 0).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0500
     * @tc.desc   test getAllowedNotificationBundles method with super admin and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0500", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAllowedNotificationBundles(undefined, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0600
     * @tc.desc   test getAllowedNotificationBundles method with super admin and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0600", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAllowedNotificationBundles(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0700
     * @tc.desc   test getAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0700", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAllowedNotificationBundles(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedNotificationBundles_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDNOTIFICATIONBUNDLES_0800
     * @tc.desc   test getAllowedNotificationBundles method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedNotificationBundles_0800", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.getAllowedNotificationBundles(SELFWANT, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0100
     * @tc.desc   test queryTrafficStats method with unActive admin
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
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200001).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0200
     * @tc.desc   test queryTrafficStats method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0200", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200002).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0300
     * @tc.desc   test queryTrafficStats method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0300", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        applicationManager.queryTrafficStats(null, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0400
     * @tc.desc   test queryTrafficStats method with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0400", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        applicationManager.queryTrafficStats(undefined, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0500
     * @tc.desc   test queryTrafficStats method with null bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0500", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, null, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0600
     * @tc.desc   test queryTrafficStats method with undefined bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0600", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, undefined, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0700
     * @tc.desc   test queryTrafficStats method with null appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0700", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, null, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0800
     * @tc.desc   test queryTrafficStats method with undefined appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0800", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, undefined, DEFAULT_USER_ID, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_0900
     * @tc.desc   test queryTrafficStats method with null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_0900", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, null, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1000
     * @tc.desc   test queryTrafficStats method with undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1000", Level.LEVEL2, async (done: Function) => {
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: 100,
          endTime: 200,
          simId: 1
        };
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, undefined, networkInfo);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1100
     * @tc.desc   test queryTrafficStats method with null networkInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1100", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1200
     * @tc.desc   test queryTrafficStats method with undefined networkInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1200", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1300
     * @tc.desc   test queryTrafficStats method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1300", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then((result)=>{
        expect(result !== undefined).assertTrue();
        expect(result.rxBytes === 0).assertTrue();
        expect(result.txBytes === 0).assertTrue();
        expect(result.rxPackets === 0).assertTrue();
        expect(result.txPackets === 0).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(false).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1400
     * @tc.desc   test queryTrafficStats method with error accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1400", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, INVALID_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1500
     * @tc.desc   test queryTrafficStats method with lower limit accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1500", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let userIdZero: number = 0;
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, userIdZero, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1600
     * @tc.desc   test queryTrafficStats method with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1600", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, "", DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1700
     * @tc.desc   test queryTrafficStats method with invalid startTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1700", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: -1,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1800
     * @tc.desc   test queryTrafficStats method with invalid endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1800", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: -1,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_1900
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_1900
     * @tc.desc   test queryTrafficStats method with startTime is greater than endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_1900", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 201,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_2000
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_2000
     * @tc.desc   test queryTrafficStats method with invalid network type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_2000", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_BLUETOOTH,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryTrafficStats_2100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYTRAFFICSTATS_2100
     * @tc.desc   test queryTrafficStats method with invalid appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryTrafficStats_2100", Level.LEVEL2, async (done: Function) => {
      let networkInfo: statistics.NetworkInfo = {
        type: connection.NetBearType.BEARER_CELLULAR,
        startTime: 100,
        endTime: 200,
        simId: 1
      };
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      await applicationManager.queryTrafficStats(SELFWANT, SELFHAPNAME, INVALID_APP_INDEX, DEFAULT_USER_ID, networkInfo).then(()=>{
        expect(false).assertTrue();
      }).catch ((error: BusinessError)=> {
        expect(Number(error.code) === 9200012).assertTrue();
      }).finally(async () => {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      });
      done();
    })

    /**
     * @tc.name   test_queryBundleStatsInfos_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0100
     * @tc.desc   test queryBundleStatsInfos method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryBundleStatsInfos_0100", Level.LEVEL2, async (done: Function) => {
      try {
        let startTime: number = 0;
        let endTime: number = Date.now();
        applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0200
     * @tc.desc   test queryBundleStatsInfos method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_queryBundleStatsInfos_0200", Level.LEVEL2, async (done: Function) => {
      try {
        let startTime: number = 0;
        let endTime: number = Date.now();
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0300
     * @tc.desc   test queryBundleStatsInfos method with super admin and invalid accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0300", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, INVALID_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 9200012).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0400
     * @tc.desc   test queryBundleStatsInfos method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0400", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         applicationManager.queryBundleStatsInfos(null, startTime, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0500
     * @tc.desc   test queryBundleStatsInfos method with super admin and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0500", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         applicationManager.queryBundleStatsInfos(undefined, startTime, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0600
     * @tc.desc   test queryBundleStatsInfos method with super admin and null startTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0600", Level.LEVEL2, async (done: Function) => {
       try {
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, null, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0700
     * @tc.desc   test queryBundleStatsInfos method with super admin and undefined startTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0700", Level.LEVEL2, async (done: Function) => {
       try {
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, undefined, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0800
     * @tc.desc   test queryBundleStatsInfos method with super admin and null endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0800", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, null, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_0900
     * @tc.desc   test queryBundleStatsInfos method with super admin and undefined endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_0900", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, undefined, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1000
     * @tc.desc   test queryBundleStatsInfos method with super admin and null accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1000", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, null);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1100
     * @tc.desc   test queryBundleStatsInfos method with super admin and undefined accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1100", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, undefined);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1200
     * @tc.desc   test queryBundleStatsInfos method with super admin and negative startTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1200", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = -1;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 9200012).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1300
     * @tc.desc   test queryBundleStatsInfos method with super admin and negative endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1300", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = -1;
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 9200012).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1400
     * @tc.desc   test queryBundleStatsInfos method with super admin and startTime is greater than endTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1400", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = Date.now() + 888888;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 9200012).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  
    /**
     * @tc.name   test_queryBundleStatsInfos_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_QUERYBUNDLESTATSINFOS_1500
     * @tc.desc   test queryBundleStatsInfos method with super admin success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_queryBundleStatsInfos_1500", Level.LEVEL2, async (done: Function) => {
       try {
         let startTime: number = 0;
         let endTime: number = Date.now();
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         let res = applicationManager.queryBundleStatsInfos(SELFWANT, startTime, endTime, DEFAULT_USER_ID);
         expect(res.length >= 0).assertTrue();
       } catch (error) {
         expect(false).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })
  })
}