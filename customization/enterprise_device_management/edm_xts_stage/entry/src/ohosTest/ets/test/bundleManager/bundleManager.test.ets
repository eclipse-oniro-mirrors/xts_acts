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
  BUNDLENAME1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  APP_IDS_200,
  APP_IDS_201,
  APP_IDS_AND_IDENTIFIER_1,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM,
  EDM_INSTALL_PARAM_FOR_ALL_USER,
  HAP_FILE_PATH_ERROR,
  MARKET_APPS,
  ERROR_MARKET_APPS,
  bundleNamesInit,
  bundleNamesOneRealInit,
  BUNDLE_NAME_ONE_REAL_200,
  BUNDLE_NAME_201,
  EMPTY_HAP_FILE_PATH,
  TEST_REAL_APP_ID_2
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';
import systemparameter from '@ohos.systemparameter';
import { BmsBundleInfo, BmsBundleResourceInfo, BundleManagerHelper } from './BundleManagerHelper';
import { BusinessError } from '@kit.BasicServicesKit';

export default function bundleManagerTest() {
  describe('bundleManager_test', () => {
    beforeAll((done: Function) => {
      bundleNamesInit();
      bundleNamesOneRealInit();
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test addAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test addAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test addAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test addAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_addAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
       try {
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         bundleManager.addAllowedInstallBundlesSync(null, APP_IDS_1);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })

    /**
      * @tc.name   test_addAllowedInstallBundlesSync_0081
      * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_0081
      * @tc.desc   test addAllowedInstallBundlesSync method with undefined admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("test_addAllowedInstallBundlesSync_0081", Level.LEVEL2, async (done: Function) => {
       try {
         await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
         bundleManager.addAllowedInstallBundlesSync(undefined, APP_IDS_1);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_008
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_009
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
        let ret: Array<string> = bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(ret.length == 200).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_010
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addAllowedInstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_011
     * @tc.desc   test addAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_addAllowedInstallBundlesSync_011", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
       try {
         let appIds: Array<string> = [];
         bundleManager.addAllowedInstallBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
       } catch (error) {
         expect(false).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })

    /**
     * @tc.name   test_addAllowedInstallBundlesSync_012
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_012
     * @tc.desc   test addAllowedInstallBundlesSync method with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addAllowedInstallBundlesSync_012", Level.LEVEL2, async (done: Function) => {
       try {
         bundleManager.addAllowedInstallBundlesSync(undefined, APP_IDS_1, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test removeAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test removeAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_removeAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
       try {
         bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
         expect(false).assertTrue();
       } catch (error) {
         expect(error.code == 9200001).assertTrue();
       }
       done();
     })

    /**
      * @tc.name   test_removeAllowedInstallBundlesSync_0071
      * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_0071
      * @tc.desc   test removeAllowedInstallBundlesSync method with undefined admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it("test_removeAllowedInstallBundlesSync_0071", Level.LEVEL2, async (done: Function) => {
       try {
         bundleManager.removeAllowedInstallBundlesSync(undefined, APP_IDS_1);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       }
       done();
     })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_008
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_009
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeAllowedInstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_010
     * @tc.desc   test removeAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeAllowedInstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addAllowedInstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test getAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test getAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test getAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test getAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res1: Array<string> = bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res1.length > 0).assertTrue();
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res2: Array<string> = bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res2.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test getAllowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test getAllowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getAllowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test getAllowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundles = bundleManager.getAllowedInstallBundlesSync(null);
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.desc   test addInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let resBefor: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resBefor.length == 0).assertTrue();
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 1).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.desc   test addInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let resBefor: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resBefor.length == 0).assertTrue();
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 1).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.desc   test addInstallationAllowedAppDistributionTypes method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(null, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.desc   test addInstallationAllowedAppDistributionTypes method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY,
            bundleManager.AppDistributionType.ENTERPRISE, bundleManager.AppDistributionType.ENTERPRISE_NORMAL,
            bundleManager.AppDistributionType.ENTERPRISE_MDM, bundleManager.AppDistributionType.INTERNALTESTING,
            bundleManager.AppDistributionType.CROWDTESTING];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        let ret: Array<bundleManager.AppDistributionType> =
          bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(ret.length == 6).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0500
     * @tc.desc   test addInstallationAllowedAppDistributionTypes type out of scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let resBefor: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resBefor.length == 0).assertTrue();
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 1 && resAfter[0] == bundleManager.AppDistributionType.APP_GALLERY).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_add_installation_allowed_app_distribution_types_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0600
     * @tc.desc   test addInstallationAllowedAppDistributionTypes type out of scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_add_installation_allowed_app_distribution_types_0600', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let appDistributionTypes: Array<bundleManager.AppDistributionType> = [];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, appDistributionTypes);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_installation_allowed_app_distribution_types_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.desc   test getInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_installation_allowed_app_distribution_types_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.desc   test getInstallationAllowedAppDistributionTypes method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_installation_allowed_app_distribution_types_0200', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_installation_allowed_app_distribution_types_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.desc   test getInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_installation_allowed_app_distribution_types_0300', Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_installation_allowed_app_distribution_types_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.desc   test getInstallationAllowedAppDistributionTypes method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_installation_allowed_app_distribution_types_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let types = bundleManager.getInstallationAllowedAppDistributionTypes(null);
        expect(types.length === 0).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let resBefor: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resBefor.length == 0).assertTrue();
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 0).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 0).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(null, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(null);
        expect(resAfter.length == 0).assertTrue();
      } catch(error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let resBefor: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resBefor.length == 0).assertTrue();
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  =
          [bundleManager.AppDistributionType.APP_GALLERY, bundleManager.AppDistributionType.ENTERPRISE];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        let ret1: Array<bundleManager.AppDistributionType> =
          bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(ret1.length == 2).assertTrue();
        let allowedAppDistributionTypes2:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes2);
        let ret2: Array<bundleManager.AppDistributionType> =
          bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(ret2.length == 1).assertTrue();
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0500
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes type out of scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
        let resAfter: Array<bundleManager.AppDistributionType> = await bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(resAfter.length == 0).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_remove_installation_allowed_app_distribution_types_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0600
     * @tc.desc   test removeInstallationAllowedAppDistributionTypes type out of scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_remove_installation_allowed_app_distribution_types_0600', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
      } catch(error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test addDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test addDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_008
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_009
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
        let ret: Array<string> = bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(ret.length == 200).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_010
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addDisallowedInstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedInstallBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_011
     * @tc.desc   test addDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedInstallBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let appIds: Array<string> = [];
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test removeDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test removeDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_008
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_009
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_010
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_removeDisallowedInstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedInstallBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_011
     * @tc.desc   test removeDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedInstallBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIds: Array<string> = [];
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.desc   test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.desc   test getDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.desc   test getDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.desc   test getDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res1: Array<string> = bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res1.length > 0).assertTrue();
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        let res2: Array<string> = bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res2.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.desc   test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.desc   test getDisallowedInstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedInstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.desc   test getDisallowedInstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundles = bundleManager.getDisallowedInstallBundlesSync(null);
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.desc   test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.desc   test addDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.desc   test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.desc   test addDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_003Adapt001
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_003Adapt001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_008
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let emptyRes = bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(emptyRes.length == 0).assertTrue();
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
        let res = bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res.length > 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_009
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
        let ret: Array<string> = bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(ret.length == 200).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_010
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_addDisallowedUninstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_addDisallowedUninstallBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_011
     * @tc.desc   test addDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_addDisallowedUninstallBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIds: Array<string> = [];
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_008
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_008
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_AND_IDENTIFIER_1, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_009
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_009
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_200, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_010
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_010
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_removeDisallowedUninstallBundlesSync_010 error 401 is expected, actually catch: '
          + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_removeDisallowedUninstallBundlesSync_011
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_011
     * @tc.desc   test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_removeDisallowedUninstallBundlesSync_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let appIds: Array<string> = [];
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, appIds, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.desc   test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.desc   test getDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.desc   test getDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_004
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.desc   test getDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let res = bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.desc   test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_005", Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_006
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.desc   test getDisallowedUninstallBundlesSync method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_getDisallowedUninstallBundlesSync_007
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.desc   test getDisallowedUninstallBundlesSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getDisallowedUninstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let bundles = bundleManager.getDisallowedUninstallBundlesSync(null);
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_001
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_001
     * @tc.desc   test uninstall method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_001", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
        console.info(' --- test_uninstall_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_uninstall_001 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- test_uninstall_001  -------- END --------');
    })

    /**
     * @tc.name   test_uninstall_002
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_002
     * @tc.desc   test uninstall method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_003
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_003
     * @tc.desc   test uninstall method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, INVALID_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_004
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_004
     * @tc.desc   test uninstall method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_005
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_005
     * @tc.desc   test uninstall method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_005", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID);
        console.info(' --- test_uninstall_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_uninstall_005 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- test_uninstall_005  -------- END --------');
    })

    /**
     * @tc.name   test_uninstall_006
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_006
     * @tc.desc   test uninstall method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_007
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_007
     * @tc.desc   test uninstall method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_008
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_008
     * @tc.desc   test uninstall method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_008", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1);
        console.info(' --- test_uninstall_008 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_uninstall_008 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- test_uninstall_008  -------- END --------');
    })

    /**
     * @tc.name   test_uninstall_009
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_009
     * @tc.desc   test uninstall method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_uninstall_010
     * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_010
     * @tc.desc   test uninstall method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_uninstall_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(null, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_001
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_001
     * @tc.desc   test install method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_001", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        console.info(' --- test_install_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
        console.info(' --- test_install_001 error 9200001 is expected, actually catch: ' + error.code);
      }
      done();
      console.info(' --- test_install_001  -------- END --------');
    })

    /**
     * @tc.name   test_install_002
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_002
     * @tc.desc   test install method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_install_003
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_003
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, null, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_004
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_004
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_005
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_005
     * @tc.desc   test install method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_005", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.install(SELFWANT, HAP_FILE_PATH);
        console.info(' --- test_install_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
        console.info(' --- test_install_005 error 9200001 is expected, actually catch: ' + error.code);
      }
      done();
      console.info(' --- test_install_005  -------- END --------');
    })

    /**
     * @tc.name   test_install_006
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_006
     * @tc.desc   test install method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_install_007
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_007
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_008
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_008
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_008", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH_ERROR, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9201002).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_009
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_009
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH_ERROR);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9201002).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_010
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_010
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_010", Level.LEVEL2, async (done: Function) => {
      let isEnterprise: string = systemparameter.getSync('const.edm.is_enterprise_device');
      if (isEnterprise != 'true') {
        console.log('the device is not enterprise');
        done();
        return;
      }
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM_FOR_ALL_USER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_011
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_011
     * @tc.desc   test install method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_011", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let hapFilePaths: Array<string> = [];
        await bundleManager.install(SELFWANT, hapFilePaths, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_install_011 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
    
    /**
     * @tc.name   test_get_installed_bundle_list_001
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_001
     * @tc.desc   test get installed bundle list method without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_installed_bundle_list_001", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_get_installed_bundle_list_002
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_002
     * @tc.desc   test get installed bundle list method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_installed_bundle_list_002", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_get_installed_bundle_list_003
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_003
     * @tc.desc   test get installed bundle list method unsupported accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_installed_bundle_list_003", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleList(SELFWANT, 100000);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_installed_bundle_list_0051
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_0051
     * @tc.desc   test get installed bundle list method with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_installed_bundle_list_0051", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
       try {
         bundleManager.getInstalledBundleList(undefined, DEFAULT_USER_ID);
         expect(false).assertTrue();
       } catch (error) {
         expect(Number(error.code) === 401).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     })

    /**
     * @tc.name   test_get_installed_bundle_list_005
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_005
     * @tc.desc   test get installed bundle list method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_installed_bundle_list_005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        let bundleManagerHelper: BundleManagerHelper = new BundleManagerHelper();
        let bmsBundleInfo: BmsBundleInfo | undefined = await bundleManagerHelper.getBmsBundleInfo();
        expect(bmsBundleInfo).not().assertUndefined();
        console.log('test_get_installed_bundle_list_005 edmBundleInfo name' + edmBundleInfo?.name);
        let bundleResourceInfo: BmsBundleResourceInfo | undefined = bundleManagerHelper.getBmsBundleResourceInfo('com.edm.acts.normal');
        expect(bundleResourceInfo).not().assertUndefined();

        expect(edmBundleInfo?.name === bmsBundleInfo?.name).assertTrue();
        expect(edmBundleInfo?.vendor === bmsBundleInfo?.vendor).assertTrue();
        expect(edmBundleInfo?.versionCode === bmsBundleInfo?.versionCode).assertTrue();
        expect(edmBundleInfo?.versionName === bmsBundleInfo?.versionName).assertTrue();
        expect(edmBundleInfo?.minCompatibleVersionCode === bmsBundleInfo?.minCompatibleVersionCode).assertTrue();
        expect(edmBundleInfo?.targetVersion === bmsBundleInfo?.targetVersion).assertTrue();
        expect(edmBundleInfo?.installTime === bmsBundleInfo?.installTime).assertTrue();
        expect(edmBundleInfo?.updateTime === bmsBundleInfo?.updateTime).assertTrue();
        expect(edmBundleInfo?.appIndex === bmsBundleInfo?.appIndex).assertTrue();
        expect(edmBundleInfo?.firstInstallTime === bmsBundleInfo?.firstInstallTime).assertTrue();
        
        expect(edmBundleInfo?.appInfo?.name === bmsBundleInfo?.appInfo?.name).assertTrue();
        expect(edmBundleInfo?.appInfo?.description === bmsBundleInfo?.appInfo?.description).assertTrue();
        expect(edmBundleInfo?.appInfo?.descriptionId === bmsBundleInfo?.appInfo?.descriptionId).assertTrue();
        expect(edmBundleInfo?.appInfo?.enabled === bmsBundleInfo?.appInfo?.enabled).assertTrue();
        expect(edmBundleInfo?.appInfo?.label === bundleResourceInfo?.label).assertTrue();
        expect(edmBundleInfo?.appInfo?.labelId === bmsBundleInfo?.appInfo?.labelId).assertTrue();
        expect(edmBundleInfo?.appInfo?.icon === bmsBundleInfo?.appInfo?.icon).assertTrue();
        expect(edmBundleInfo?.appInfo?.iconId === bmsBundleInfo?.appInfo?.iconId).assertTrue();
        expect(edmBundleInfo?.appInfo?.process === bmsBundleInfo?.appInfo?.process).assertTrue();
        expect(edmBundleInfo?.appInfo?.codePath === bmsBundleInfo?.appInfo?.codePath).assertTrue();
        expect(edmBundleInfo?.appInfo?.removable === bmsBundleInfo?.appInfo?.removable).assertTrue();
        expect(edmBundleInfo?.appInfo?.accessTokenId === bmsBundleInfo?.appInfo?.accessTokenId).assertTrue();
        expect(edmBundleInfo?.appInfo?.uid === bmsBundleInfo?.appInfo?.uid).assertTrue();

        expect(edmBundleInfo?.appInfo?.iconResource?.bundleName === bmsBundleInfo?.appInfo?.iconResource?.bundleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.iconResource?.moduleName === bmsBundleInfo?.appInfo?.iconResource?.moduleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.iconResource?.id === bmsBundleInfo?.appInfo?.iconResource?.id).assertTrue();
        expect(edmBundleInfo?.appInfo?.labelResource?.bundleName === bmsBundleInfo?.appInfo?.labelResource?.bundleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.labelResource?.moduleName === bmsBundleInfo?.appInfo?.labelResource?.moduleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.labelResource?.id === bmsBundleInfo?.appInfo?.labelResource?.id).assertTrue();
        expect(edmBundleInfo?.appInfo?.descriptionResource?.bundleName === bmsBundleInfo?.appInfo?.descriptionResource?.bundleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.descriptionResource?.moduleName === bmsBundleInfo?.appInfo?.descriptionResource?.moduleName).assertTrue();
        expect(edmBundleInfo?.appInfo?.descriptionResource?.id === bmsBundleInfo?.appInfo?.descriptionResource?.id).assertTrue();

        expect(edmBundleInfo?.appInfo?.appDistributionType === bmsBundleInfo?.appInfo?.appDistributionType).assertTrue();
        expect(edmBundleInfo?.appInfo?.appProvisionType === bmsBundleInfo?.appInfo?.appProvisionType).assertTrue();
        expect(edmBundleInfo?.appInfo?.systemApp === bmsBundleInfo?.appInfo?.systemApp).assertTrue();
        expect(edmBundleInfo?.appInfo?.debug === bmsBundleInfo?.appInfo?.debug).assertTrue();
        expect(edmBundleInfo?.appInfo?.dataUnclearable === bmsBundleInfo?.appInfo?.dataUnclearable).assertTrue();
        expect(edmBundleInfo?.appInfo?.nativeLibraryPath === bmsBundleInfo?.appInfo?.nativeLibraryPath).assertTrue();
        expect(edmBundleInfo?.appInfo?.appIndex === bmsBundleInfo?.appInfo?.appIndex).assertTrue();
        expect(edmBundleInfo?.appInfo?.installSource === bmsBundleInfo?.appInfo?.installSource).assertTrue();
        expect(edmBundleInfo?.appInfo?.releaseType === bmsBundleInfo?.appInfo?.releaseType).assertTrue();

        expect(edmBundleInfo?.signatureInfo?.appId === bmsBundleInfo?.signatureInfo?.appId).assertTrue();
        expect(edmBundleInfo?.signatureInfo?.fingerprint === bmsBundleInfo?.signatureInfo?.fingerprint).assertTrue();
        expect(edmBundleInfo?.signatureInfo?.appIdentifier === bmsBundleInfo?.signatureInfo?.appIdentifier).assertTrue();
        expect(edmBundleInfo?.signatureInfo?.certificate === bmsBundleInfo?.signatureInfo?.certificate).assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_007
     * @tc.name    test_get_installed_bundle_list_007
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_007", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_APPLICATION_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.name != '').assertTrue();
        expect(edmBundleInfo?.signatureInfo?.appId).assertEqual('');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_008
     * @tc.name    test_get_installed_bundle_list_008
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_008", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_SIGNATURE_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.name).assertEqual('');
        expect(edmBundleInfo?.signatureInfo?.appId != '').assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_009
     * @tc.name    test_get_installed_bundle_list_009
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_009", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_APPLICATION_ICON_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.iconData != '').assertTrue();
        expect(edmBundleInfo?.appInfo?.name).assertEqual('');
        expect(edmBundleInfo?.signatureInfo?.appId).assertEqual('');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_010
     * @tc.name    test_get_installed_bundle_list_010
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_010", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_APPLICATION_INFO |
		  bundleManager.BundleInfoGetFlag.WITH_SIGNATURE_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.iconData).assertEqual('');
        expect(edmBundleInfo?.appInfo?.name != '').assertTrue();
        expect(edmBundleInfo?.signatureInfo?.appId != '').assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_011
     * @tc.name    test_get_installed_bundle_list_011
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_011", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_APPLICATION_INFO |
		  bundleManager.BundleInfoGetFlag.WITH_APPLICATION_ICON_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })

        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.iconData != '').assertTrue();
        expect(edmBundleInfo?.appInfo?.name != '').assertTrue();
        expect(edmBundleInfo?.signatureInfo?.appId).assertEqual('');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_012
     * @tc.name    test_get_installed_bundle_list_012
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_012", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_SIGNATURE_INFO |
		  bundleManager.BundleInfoGetFlag.WITH_APPLICATION_ICON_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.iconData != '').assertTrue();
        expect(edmBundleInfo?.appInfo?.name).assertEqual('');
        expect(edmBundleInfo?.signatureInfo?.appId != '').assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_013
     * @tc.name    test_get_installed_bundle_list_013
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_013", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.WITH_SIGNATURE_INFO |
		  bundleManager.BundleInfoGetFlag.WITH_APPLICATION_INFO | 
		  bundleManager.BundleInfoGetFlag.WITH_APPLICATION_ICON_INFO;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
        expect(bundleInfos.length > 0).assertTrue();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        expect(edmBundleInfo?.appInfo?.iconData != '').assertTrue();
        expect(edmBundleInfo?.appInfo?.name != '').assertTrue();
        expect(edmBundleInfo?.signatureInfo?.appId != '').assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_014
     * @tc.name    test_get_installed_bundle_list_014
     * @tc.desc    test get installed bundle list method without admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_014", Level.LEVEL2, async (done: Function) => {
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        await bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_015
     * @tc.name    test_get_installed_bundle_list_015
     * @tc.desc    test get installed bundle list method with normal admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_015", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        await bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_016
     * @tc.name    test_get_installed_bundle_list_016
     * @tc.desc    test get installed bundle list method unsupported accountId
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_016", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        await bundleManager.getInstalledBundleList(SELFWANT, 100000, bundleInfoGetFlag);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_017
     * @tc.name    test_get_installed_bundle_list_017
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_017", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
          DEFAULT_USER_ID, bundleInfoGetFlag);
        expect(bundleInfos).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_018
     * @tc.name    test_get_installed_bundle_list_018
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_018", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(null,
          DEFAULT_USER_ID, bundleInfoGetFlag);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_019
     * @tc.name    test_get_installed_bundle_list_019
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_019", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(undefined,
          DEFAULT_USER_ID, bundleInfoGetFlag);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_020
     * @tc.name    test_get_installed_bundle_list_020
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_020", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
          null, bundleInfoGetFlag);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_021
     * @tc.name    test_get_installed_bundle_list_021
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_021", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
          undefined, bundleInfoGetFlag);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_022
     * @tc.name    test_get_installed_bundle_list_022
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_022", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
          DEFAULT_USER_ID, null);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number  SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_023
     * @tc.name    test_get_installed_bundle_list_023
     * @tc.desc    test get installed bundle list method with super admin
     * @tc.level   Level 2
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it("test_get_installed_bundle_list_023", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfoGetFlag: number = bundleManager.BundleInfoGetFlag.DEFAULT;
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
          DEFAULT_USER_ID, undefined);
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_market_apps_001
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_MARKET_APPS_001
     * @tc.desc   test install market apps method without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_market_apps_001", Level.LEVEL2, async (done: Function) => {
      try {
        await bundleManager.installMarketApps(SELFWANT, MARKET_APPS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   test_install_market_apps_002
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_MARKET_APPS_002
     * @tc.desc   test install market apps method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_market_apps_002", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await bundleManager.installMarketApps(SELFWANT, MARKET_APPS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.name   test_install_market_apps_003
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_MARKET_APPS_003
     * @tc.desc   test market apps method with Super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_market_apps_003", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.installMarketApps(SELFWANT, MARKET_APPS);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9201002).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_install_market_apps_004
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_MARKET_APPS_004
     * @tc.desc   test market apps method with Super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_market_apps_004", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.installMarketApps(SELFWANT, ERROR_MARKET_APPS);
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
     * @tc.name   test_install_market_apps_005
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_MARKET_APPS_005
     * @tc.desc   test market apps method with Super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_install_market_apps_005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleNames: Array<string> = [];
        await bundleManager.installMarketApps(SELFWANT, bundleNames);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_install_market_apps_005 error 9200012 || 801 is expected, actually catch: ' + error.code);
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
     * @tc.name   addAllowedInstallBundlesSync_test_001
     * @tc.number addAllowedInstallBundlesSync_test_001
     * @tc.desc   addAllowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(null, APP_IDS_1);
        console.info(' --- addAllowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   addAllowedInstallBundlesSync_test_002
     * @tc.number addAllowedInstallBundlesSync_test_002
     * @tc.desc   addAllowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(undefined, APP_IDS_1);
        console.info(' --- addAllowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   addAllowedInstallBundlesSync_test_003
     * @tc.number addAllowedInstallBundlesSync_test_003
     * @tc.desc   addAllowedInstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- addAllowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   addAllowedInstallBundlesSync_test_004
     * @tc.number addAllowedInstallBundlesSync_test_004
     * @tc.desc   addAllowedInstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- addAllowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addAllowedInstallBundlesSync_test_005
     * @tc.number addAllowedInstallBundlesSync_test_005
     * @tc.desc   addAllowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- addAllowedInstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   addAllowedInstallBundlesSync_test_006
     * @tc.number addAllowedInstallBundlesSync_test_006
     * @tc.desc   addAllowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- addAllowedInstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_001
     * @tc.number removeAllowedInstallBundlesSync_test_001
     * @tc.desc   removeAllowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(null, APP_IDS_1);
        console.info(' --- removeAllowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_002
     * @tc.number removeAllowedInstallBundlesSync_test_002
     * @tc.desc   removeAllowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(undefined, APP_IDS_1);
        console.info(' --- removeAllowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_003
     * @tc.number removeAllowedInstallBundlesSync_test_003
     * @tc.desc   removeAllowedInstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- removeAllowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_004
     * @tc.number removeAllowedInstallBundlesSync_test_004
     * @tc.desc   removeAllowedInstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- removeAllowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_005
     * @tc.number removeAllowedInstallBundlesSync_test_005
     * @tc.desc   removeAllowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- removeAllowedInstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_006
     * @tc.number removeAllowedInstallBundlesSync_test_006
     * @tc.desc   removeAllowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- removeAllowedInstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_001
     * @tc.number getAllowedInstallBundlesSync_test_001
     * @tc.desc   getAllowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getAllowedInstallBundlesSync(null);
        console.info(' --- getAllowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_002
     * @tc.number getAllowedInstallBundlesSync_test_002
     * @tc.desc   getAllowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(undefined);
        console.info(' --- getAllowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_003
     * @tc.number getAllowedInstallBundlesSync_test_003
     * @tc.desc   getAllowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- getAllowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_004
     * @tc.number getAllowedInstallBundlesSync_test_004
     * @tc.desc   getAllowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getAllowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_001
     * @tc.number addDisallowedInstallBundlesSync_test_001
     * @tc.desc   addDisallowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(null, APP_IDS_1);
        console.info(' --- addDisallowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_002
     * @tc.number addDisallowedInstallBundlesSync_test_002
     * @tc.desc   addDisallowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(undefined, APP_IDS_1);
        console.info(' --- addDisallowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_003
     * @tc.number addDisallowedInstallBundlesSync_test_003
     * @tc.desc   addDisallowedInstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- addDisallowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_004
     * @tc.number addDisallowedInstallBundlesSync_test_004
     * @tc.desc   addDisallowedInstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- addDisallowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_005
     * @tc.number addDisallowedInstallBundlesSync_test_005
     * @tc.desc   addDisallowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- addDisallowedInstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_006
     * @tc.number addDisallowedInstallBundlesSync_test_006
     * @tc.desc   addDisallowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- addDisallowedInstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_001
     * @tc.number removeDisallowedInstallBundlesSync_test_001
     * @tc.desc   removeDisallowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(null, APP_IDS_1);
        console.info(' --- removeDisallowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_002
     * @tc.number removeDisallowedInstallBundlesSync_test_002
     * @tc.desc   removeDisallowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(undefined, APP_IDS_1);
        console.info(' --- removeDisallowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_003
     * @tc.number removeDisallowedInstallBundlesSync_test_003
     * @tc.desc   removeDisallowedInstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- removeDisallowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_004
     * @tc.number removeDisallowedInstallBundlesSync_test_004
     * @tc.desc   removeDisallowedInstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- removeDisallowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_005
     * @tc.number removeDisallowedInstallBundlesSync_test_005
     * @tc.desc   removeDisallowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- removeDisallowedInstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_006
     * @tc.number removeDisallowedInstallBundlesSync_test_006
     * @tc.desc   removeDisallowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- removeDisallowedInstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_001
     * @tc.number getDisallowedInstallBundlesSync_test_001
     * @tc.desc   getDisallowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getDisallowedInstallBundlesSync(null);
        console.info(' --- getDisallowedInstallBundlesSync_test_001 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_002
     * @tc.number getDisallowedInstallBundlesSync_test_002
     * @tc.desc   getDisallowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(undefined);
        console.info(' --- getDisallowedInstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_003
     * @tc.number getDisallowedInstallBundlesSync_test_003
     * @tc.desc   getDisallowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- getDisallowedInstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_004
     * @tc.number getDisallowedInstallBundlesSync_test_004
     * @tc.desc   getDisallowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getDisallowedInstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_001
     * @tc.number addDisallowedUninstallBundlesSync_test_001
     * @tc.desc   addDisallowedUninstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(null, APP_IDS_1);
        console.info(' --- addDisallowedUninstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_002
     * @tc.number addDisallowedUninstallBundlesSync_test_002
     * @tc.desc   addDisallowedUninstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(undefined, APP_IDS_1);
        console.info(' --- addDisallowedUninstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_003
     * @tc.number addDisallowedUninstallBundlesSync_test_003
     * @tc.desc   addDisallowedUninstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, null);
        console.info(' --- addDisallowedUninstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_004
     * @tc.number addDisallowedUninstallBundlesSync_test_004
     * @tc.desc   addDisallowedUninstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, undefined);
        console.info(' --- addDisallowedUninstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_005
     * @tc.number addDisallowedUninstallBundlesSync_test_005
     * @tc.desc   addDisallowedUninstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, null);
        console.info(' --- addDisallowedUninstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_006
     * @tc.number addDisallowedUninstallBundlesSync_test_006
     * @tc.desc   addDisallowedUninstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- addDisallowedUninstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_001
     * @tc.number removeDisallowedUninstallBundlesSync_test_001
     * @tc.desc   removeDisallowedUninstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_001  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(null, APP_IDS_200);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_002
     * @tc.number removeDisallowedUninstallBundlesSync_test_002
     * @tc.desc   removeDisallowedUninstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(undefined, APP_IDS_200);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_003
     * @tc.number removeDisallowedUninstallBundlesSync_test_003
     * @tc.desc   removeDisallowedUninstallBundlesSync with null parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, null);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_004
     * @tc.number removeDisallowedUninstallBundlesSync_test_004
     * @tc.desc   removeDisallowedUninstallBundlesSync with undefined parameter appIds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, undefined);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_005
     * @tc.number removeDisallowedUninstallBundlesSync_test_005
     * @tc.desc   removeDisallowedUninstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_005  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_200, null);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_006
     * @tc.number removeDisallowedUninstallBundlesSync_test_006
     * @tc.desc   removeDisallowedUninstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_006  -------- START --------');
      try {
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_200, undefined);
        console.info(' --- removeDisallowedUninstallBundlesSync_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_001
     * @tc.number getDisallowedUninstallBundlesSync_test_001
     * @tc.desc   getDisallowedUninstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getDisallowedUninstallBundlesSync(null);
        console.info(' --- getDisallowedUninstallBundlesSync_test_001 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_002
     * @tc.number getDisallowedUninstallBundlesSync_test_002
     * @tc.desc   getDisallowedUninstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_002  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(undefined);
        console.info(' --- getDisallowedUninstallBundlesSync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_003
     * @tc.number getDisallowedUninstallBundlesSync_test_003
     * @tc.desc   getDisallowedUninstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_003  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, null);
        console.info(' --- getDisallowedUninstallBundlesSync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_004
     * @tc.number getDisallowedUninstallBundlesSync_test_004
     * @tc.desc   getDisallowedUninstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_004  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getDisallowedUninstallBundlesSync_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_004  -------- END --------');
    })


    /**
     * @tc.name   uninstall_test_001
     * @tc.number uninstall_test_001
     * @tc.desc   uninstall with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("uninstall_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- uninstall_test_001  -------- START --------');
      try {
        bundleManager.uninstall(null, BUNDLENAME1, DEFAULT_USER_ID);
        console.info(' --- uninstall_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- uninstall_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- uninstall_test_001  -------- END --------');
    })


    /**
     * @tc.name   uninstall_test_002
     * @tc.number uninstall_test_002
     * @tc.desc   uninstall with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("uninstall_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- uninstall_test_002  -------- START --------');
      try {
        bundleManager.uninstall(undefined, BUNDLENAME1, DEFAULT_USER_ID);
        console.info(' --- uninstall_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- uninstall_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- uninstall_test_002  -------- END --------');
    })

    /**
     * @tc.name   uninstall_test_003
     * @tc.number uninstall_test_003
     * @tc.desc   uninstall with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("uninstall_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- uninstall_test_003  -------- START --------');
      try {
        bundleManager.uninstall(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- uninstall_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- uninstall_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- uninstall_test_003  -------- END --------');
    })

    /**
     * @tc.name   uninstall_test_004
     * @tc.number uninstall_test_004
     * @tc.desc   uninstall with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("uninstall_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- uninstall_test_004  -------- START --------');
      try {
        bundleManager.uninstall(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- uninstall_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- uninstall_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- uninstall_test_004  -------- END --------');
    })

    /**
     * @tc.name   install_test_001
     * @tc.number install_test_001
     * @tc.desc   install with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_001  -------- START --------');
      try {
        bundleManager.install(null, HAP_FILE_PATH, EDM_INSTALL_PARAM_FOR_ALL_USER);
        console.info(' --- install_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_001  -------- END --------');
    })


    /**
     * @tc.name   install_test_002
     * @tc.number install_test_002
     * @tc.desc   install with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_002  -------- START --------');
      try {
        bundleManager.install(undefined, HAP_FILE_PATH, EDM_INSTALL_PARAM_FOR_ALL_USER);
        console.info(' --- install_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_002  -------- END --------');
    })


    /**
     * @tc.name   install_test_003
     * @tc.number install_test_003
     * @tc.desc   install with null parameter bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_003  -------- START --------');
      try {
        bundleManager.install(SELFWANT, null, EDM_INSTALL_PARAM_FOR_ALL_USER);
        console.info(' --- install_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_003  -------- END --------');
    })


    /**
     * @tc.name   install_test_004
     * @tc.number install_test_004
     * @tc.desc   install with undefined parameter bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_004  -------- START --------');
      try {
        bundleManager.install(SELFWANT, undefined, EDM_INSTALL_PARAM_FOR_ALL_USER);
        console.info(' --- install_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_004  -------- END --------');
    })


    /**
     * @tc.name   install_test_005
     * @tc.number install_test_005
     * @tc.desc   install with null parameter callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_005  -------- START --------');
      try {
        bundleManager.install(SELFWANT, HAP_FILE_PATH, null);
        console.info(' --- install_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_005  -------- END --------');
    })


    /**
     * @tc.name   install_test_006
     * @tc.number install_test_006
     * @tc.desc   install with undefined parameter callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_006  -------- START --------');
      try {
        bundleManager.install(SELFWANT, HAP_FILE_PATH, undefined);
        console.info(' --- install_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- install_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- install_test_006  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_001
     * @tc.number getInstalledBundleList_test_001
     * @tc.desc   getInstalledBundleList with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_001  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(null, DEFAULT_USER_ID);
        console.info(' --- getInstalledBundleList_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_001  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_002
     * @tc.number getInstalledBundleList_test_002
     * @tc.desc   getInstalledBundleList with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_002  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(undefined, DEFAULT_USER_ID);
        console.info(' --- getInstalledBundleList_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_002  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_003
     * @tc.number getInstalledBundleList_test_003
     * @tc.desc   getInstalledBundleList with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_003  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(SELFWANT, null);
        console.info(' --- getInstalledBundleList_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_003  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_004
     * @tc.number getInstalledBundleList_test_004
     * @tc.desc   getInstalledBundleList with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_004  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(SELFWANT, undefined);
        console.info(' --- getInstalledBundleList_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_004  -------- END --------');
    })

    /**
     * @tc.name   getInstalledBundleList_test_005
     * @tc.number getInstalledBundleList_test_005
     * @tc.desc   getInstalledBundleList with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_005  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID, null);
        console.info(' --- getInstalledBundleList_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_005  -------- END --------');
    })

    /**
     * @tc.name   addInstallationAllowedAppDistributionTypes_test_001
     * @tc.number addInstallationAllowedAppDistributionTypes_test_001
     * @tc.desc   addInstallationAllowedAppDistributionTypes with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addInstallationAllowedAppDistributionTypes_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_001  -------- START --------');
      try {
        bundleManager.addInstallationAllowedAppDistributionTypes(null, [bundleManager.AppDistributionType.APP_GALLERY, bundleManager.AppDistributionType.ENTERPRISE]);
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_001  -------- END --------');
    })


    /**
     * @tc.name   addInstallationAllowedAppDistributionTypes_test_002
     * @tc.number addInstallationAllowedAppDistributionTypes_test_002
     * @tc.desc   addInstallationAllowedAppDistributionTypes with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addInstallationAllowedAppDistributionTypes_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_002  -------- START --------');
      try {
        bundleManager.addInstallationAllowedAppDistributionTypes(undefined, [bundleManager.AppDistributionType.APP_GALLERY, bundleManager.AppDistributionType.ENTERPRISE]);
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_002  -------- END --------');
    })


    /**
     * @tc.name   addInstallationAllowedAppDistributionTypes_test_003
     * @tc.number addInstallationAllowedAppDistributionTypes_test_003
     * @tc.desc   addInstallationAllowedAppDistributionTypes with null parameter appDistributionTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addInstallationAllowedAppDistributionTypes_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_003  -------- START --------');
      try {
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, null);
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_003  -------- END --------');
    })


    /**
     * @tc.name   addInstallationAllowedAppDistributionTypes_test_004
     * @tc.number addInstallationAllowedAppDistributionTypes_test_004
     * @tc.desc   addInstallationAllowedAppDistributionTypes with undefined parameter appDistributionTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addInstallationAllowedAppDistributionTypes_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_004  -------- START --------');
      try {
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, undefined);
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addInstallationAllowedAppDistributionTypes_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addInstallationAllowedAppDistributionTypes_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeInstallationAllowedAppDistributionTypes_test_001
     * @tc.number removeInstallationAllowedAppDistributionTypes_test_001
     * @tc.desc   removeInstallationAllowedAppDistributionTypes with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeInstallationAllowedAppDistributionTypes_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_001  -------- START --------');
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7]
        bundleManager.removeInstallationAllowedAppDistributionTypes(null, allowedAppDistributionTypes);
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeInstallationAllowedAppDistributionTypes_test_002
     * @tc.number removeInstallationAllowedAppDistributionTypes_test_002
     * @tc.desc   removeInstallationAllowedAppDistributionTypes with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeInstallationAllowedAppDistributionTypes_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_002  -------- START --------');
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7]
        bundleManager.removeInstallationAllowedAppDistributionTypes(undefined, allowedAppDistributionTypes);
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeInstallationAllowedAppDistributionTypes_test_003
     * @tc.number removeInstallationAllowedAppDistributionTypes_test_003
     * @tc.desc   removeInstallationAllowedAppDistributionTypes with null parameter appDistributionTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeInstallationAllowedAppDistributionTypes_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_003  -------- START --------');
      try {
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, null);
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeInstallationAllowedAppDistributionTypes_test_004
     * @tc.number removeInstallationAllowedAppDistributionTypes_test_004
     * @tc.desc   removeInstallationAllowedAppDistributionTypes with undefined parameter appDistributionTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeInstallationAllowedAppDistributionTypes_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_004  -------- START --------');
      try {
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, undefined);
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeInstallationAllowedAppDistributionTypes_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeInstallationAllowedAppDistributionTypes_test_004  -------- END --------');
    })


    /**
     * @tc.name   getInstallationAllowedAppDistributionTypes_test_001
     * @tc.number getInstallationAllowedAppDistributionTypes_test_001
     * @tc.desc   getInstallationAllowedAppDistributionTypes with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstallationAllowedAppDistributionTypes_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let types = bundleManager.getInstallationAllowedAppDistributionTypes(null);
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_001 error is expected, but it done.');
        expect(types.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_001  -------- END --------');
    })


    /**
     * @tc.name   getInstallationAllowedAppDistributionTypes_test_002
     * @tc.number getInstallationAllowedAppDistributionTypes_test_002
     * @tc.desc   getInstallationAllowedAppDistributionTypes with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstallationAllowedAppDistributionTypes_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_002  -------- START --------');
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(undefined);
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_002  -------- END --------');
    })


    /**
     * @tc.name   installMarketApps_test_001
     * @tc.number installMarketApps_test_001
     * @tc.desc   installMarketApps with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("installMarketApps_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- installMarketApps_test_001  -------- START --------');
      try {
        bundleManager.installMarketApps(null, MARKET_APPS);
        console.info(' --- installMarketApps_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- installMarketApps_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- installMarketApps_test_001  -------- END --------');
    })


    /**
     * @tc.name   installMarketApps_test_002
     * @tc.number installMarketApps_test_002
     * @tc.desc   installMarketApps with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("installMarketApps_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- installMarketApps_test_002  -------- START --------');
      try {
        bundleManager.installMarketApps(undefined, MARKET_APPS);
        console.info(' --- installMarketApps_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- installMarketApps_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- installMarketApps_test_002  -------- END --------');
    })


    /**
     * @tc.name   installMarketApps_test_003
     * @tc.number installMarketApps_test_003
     * @tc.desc   installMarketApps with null parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("installMarketApps_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- installMarketApps_test_003  -------- START --------');
      try {
        bundleManager.installMarketApps(SELFWANT, null);
        console.info(' --- installMarketApps_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- installMarketApps_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- installMarketApps_test_003  -------- END --------');
    })


    /**
     * @tc.name   installMarketApps_test_004
     * @tc.number installMarketApps_test_004
     * @tc.desc   installMarketApps with undefined parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("installMarketApps_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- installMarketApps_test_004  -------- START --------');
      try {
        bundleManager.installMarketApps(SELFWANT, undefined);
        console.info(' --- installMarketApps_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- installMarketApps_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- installMarketApps_test_004  -------- END --------');
    })

    /**
     * @tc.name   getAllowedInstallBundlesSync_test_029
     * @tc.number getAllowedInstallBundlesSync_test_029
     * @tc.desc   getAllowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_029  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getAllowedInstallBundlesSync(null);
        console.info(' --- getAllowedInstallBundlesSync_test_029 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_029  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_030
     * @tc.number getAllowedInstallBundlesSync_test_030
     * @tc.desc   getAllowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_030  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(undefined);
        console.info(' --- getAllowedInstallBundlesSync_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_030  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_031
     * @tc.number getAllowedInstallBundlesSync_test_031
     * @tc.desc   getAllowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_031  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- getAllowedInstallBundlesSync_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_031  -------- END --------');
    })


    /**
     * @tc.name   getAllowedInstallBundlesSync_test_032
     * @tc.number getAllowedInstallBundlesSync_test_032
     * @tc.desc   getAllowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getAllowedInstallBundlesSync_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getAllowedInstallBundlesSync_test_032  -------- START --------');
      try {
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getAllowedInstallBundlesSync_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getAllowedInstallBundlesSync_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getAllowedInstallBundlesSync_test_032  -------- END --------');
    })

    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_029
     * @tc.number getDisallowedInstallBundlesSync_test_029
     * @tc.desc   getDisallowedInstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_029  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getDisallowedInstallBundlesSync(null);
        console.info(' --- getDisallowedInstallBundlesSync_test_029 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_029  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_030
     * @tc.number getDisallowedInstallBundlesSync_test_030
     * @tc.desc   getDisallowedInstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_030  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(undefined);
        console.info(' --- getDisallowedInstallBundlesSync_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_030  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_031
     * @tc.number getDisallowedInstallBundlesSync_test_031
     * @tc.desc   getDisallowedInstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_031  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, null);
        console.info(' --- getDisallowedInstallBundlesSync_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_031  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedInstallBundlesSync_test_032
     * @tc.number getDisallowedInstallBundlesSync_test_032
     * @tc.desc   getDisallowedInstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedInstallBundlesSync_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedInstallBundlesSync_test_032  -------- START --------');
      try {
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getDisallowedInstallBundlesSync_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedInstallBundlesSync_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedInstallBundlesSync_test_032  -------- END --------');
    })

    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_029
     * @tc.number getDisallowedUninstallBundlesSync_test_029
     * @tc.desc   getDisallowedUninstallBundlesSync with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_029  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundles = bundleManager.getDisallowedUninstallBundlesSync(null);
        console.info(' --- getDisallowedUninstallBundlesSync_test_029 error is expected, but it done.');
        expect(bundles.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_029  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_030
     * @tc.number getDisallowedUninstallBundlesSync_test_030
     * @tc.desc   getDisallowedUninstallBundlesSync with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_030  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(undefined);
        console.info(' --- getDisallowedUninstallBundlesSync_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_030  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_031
     * @tc.number getDisallowedUninstallBundlesSync_test_031
     * @tc.desc   getDisallowedUninstallBundlesSync with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_031  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, null);
        console.info(' --- getDisallowedUninstallBundlesSync_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_031  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedUninstallBundlesSync_test_032
     * @tc.number getDisallowedUninstallBundlesSync_test_032
     * @tc.desc   getDisallowedUninstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedUninstallBundlesSync_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedUninstallBundlesSync_test_032  -------- START --------');
      try {
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, undefined);
        console.info(' --- getDisallowedUninstallBundlesSync_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedUninstallBundlesSync_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedUninstallBundlesSync_test_032  -------- END --------');
    })

    /**
     * @tc.name   getInstalledBundleList_test_057
     * @tc.number getInstalledBundleList_test_057
     * @tc.desc   getInstalledBundleList with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_057", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_057  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(null, DEFAULT_USER_ID);
        console.info(' --- getInstalledBundleList_test_057 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_057 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_057  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_058
     * @tc.number getInstalledBundleList_test_058
     * @tc.desc   getInstalledBundleList with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_058", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_058  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(undefined, DEFAULT_USER_ID, );
        console.info(' --- getInstalledBundleList_test_058 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_058 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_058  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_059
     * @tc.number getInstalledBundleList_test_059
     * @tc.desc   getInstalledBundleList with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_059", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_059  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(SELFWANT, null);
        console.info(' --- getInstalledBundleList_test_059 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_059 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_059  -------- END --------');
    })


    /**
     * @tc.name   getInstalledBundleList_test_060
     * @tc.number getInstalledBundleList_test_060
     * @tc.desc   getInstalledBundleList with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstalledBundleList_test_060", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstalledBundleList_test_060  -------- START --------');
      try {
        bundleManager.getInstalledBundleList(SELFWANT, undefined);
        console.info(' --- getInstalledBundleList_test_060 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstalledBundleList_test_060 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstalledBundleList_test_060  -------- END --------');
    })

    /**
     * @tc.name   getInstallationAllowedAppDistributionTypes_test_015
     * @tc.number getInstallationAllowedAppDistributionTypes_test_015
     * @tc.desc   getInstallationAllowedAppDistributionTypes with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstallationAllowedAppDistributionTypes_test_015", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_015  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let typs = bundleManager.getInstallationAllowedAppDistributionTypes(null);
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_015 error is expected, but it done.');
        expect(typs.length === 0).assertTrue();
      } catch (error) {
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_015 error 401 is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_015  -------- END --------');
    })


    /**
     * @tc.name   getInstallationAllowedAppDistributionTypes_test_016
     * @tc.number getInstallationAllowedAppDistributionTypes_test_016
     * @tc.desc   getInstallationAllowedAppDistributionTypes with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getInstallationAllowedAppDistributionTypes_test_016", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_016  -------- START --------');
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(undefined);
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_016 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getInstallationAllowedAppDistributionTypes_test_016 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getInstallationAllowedAppDistributionTypes_test_016  -------- END --------');
    })

    /**
     * @tc.name   addAllowedInstallBundlesSync_test_006_1
     * @tc.number addAllowedInstallBundlesSync_test_006_1
     * @tc.desc   addAllowedInstallBundlesSync with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addAllowedInstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addAllowedInstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.addAllowedInstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- addAllowedInstallBundlesSync_test_006_1 done is expected, but error, actually catch: ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addAllowedInstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   removeAllowedInstallBundlesSync_test_006_1
     * @tc.number removeAllowedInstallBundlesSync_test_006_1
     * @tc.desc   removeAllowedInstallBundlesSync with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeAllowedInstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeAllowedInstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.removeAllowedInstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- removeAllowedInstallBundlesSync_test_006_1 done is expected, but error, actually catch: ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeAllowedInstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   addDisallowedInstallBundlesSync_test_006_1
     * @tc.number addDisallowedInstallBundlesSync_test_006_1
     * @tc.desc   addDisallowedInstallBundlesSync with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedInstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedInstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.addDisallowedInstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedInstallBundlesSync_test_006_1 done is expected, but error, actually catch: ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDisallowedInstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   removeDisallowedInstallBundlesSync_test_006_1
     * @tc.number removeDisallowedInstallBundlesSync_test_006_1
     * @tc.desc   removeDisallowedInstallBundlesSync with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedInstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedInstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedInstallBundlesSync_test_006_1 done is expected, but error, actually catch:  ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDisallowedInstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   addDisallowedUninstallBundlesSync_test_006_1
     * @tc.number addDisallowedUninstallBundlesSync_test_006_1
     * @tc.desc   addDisallowedUninstallBundlesSync with [] parameter AppId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedUninstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedUninstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedUninstallBundlesSync_test_006_1 done is expected, but error, actually catch: ' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDisallowedUninstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   removeDisallowedUninstallBundlesSync_test_006_1
     * @tc.number removeDisallowedUninstallBundlesSync_test_006_1
     * @tc.desc   removeDisallowedUninstallBundlesSync with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedUninstallBundlesSync_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedUninstallBundlesSync_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, [], DEFAULT_USER_ID);
        expect(ret === undefined).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedUninstallBundlesSync_test_006_1 done is expected, but error, actually catch:' +
        error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- removeDisallowedUninstallBundlesSync_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   install_test_006_1
     * @tc.number install_test_006_1
     * @tc.desc   install with [] parameter path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("install_test_006_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- install_test_006_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.install(SELFWANT, [], EDM_INSTALL_PARAM)
          .then(result => {
            expect(result === null).assertTrue()
          }).catch((error:BusinessError) => {
            console.info(' --- removeDisallowedUninstallBundlesSync_test_006_1 done is expected, but error, actually catch:' +
            error.code);
            expect(Number(error.code) === 401).assertTrue();
          })
      } catch (error) {
        console.info(' --- install_test_006_1 done is expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- install_test_006_1  -------- END --------');
    })

    /**
     * @tc.name   installMarketApps_test_004_1
     * @tc.number installMarketApps_test_004_1
     * @tc.desc   installMarketApps with [] parameter bundleNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("installMarketApps_test_004_1", Level.LEVEL2, async (done: Function) => {
      console.info(' --- installMarketApps_test_004_1  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        bundleManager.installMarketApps(SELFWANT, []);
        console.info(' --- installMarketApps_test_004_1 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- installMarketApps_test_004_1 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- installMarketApps_test_004_1  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0100
     * @tc.desc   test getInstalledBundleStorageStats method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0100  -------- START --------');
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0100  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0200
     * @tc.desc   test getInstalledBundleStorageStats method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0200 error 9200002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0200  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0300
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and invalid userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0300 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0300 error 9200012 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0300  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0400
     * @tc.desc   test getInstalledBundleStorageStats method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        const bundleNames: Array<string> = [ "com.edm.acts.normal" ];
        let ret = bundleManager.getInstalledBundleStorageStats(SELFWANT, bundleNames, DEFAULT_USER_ID);
        expect(ret != null).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0400 error is not expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0400  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0500
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(null, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0500  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0600
     * @tc.desc   test getInstalledBundleStorageStats method with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0600  -------- START --------');
      try {
        await bundleManager.getInstalledBundleStorageStats(undefined, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0600 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0600  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0700
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, null, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0700 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0700  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0800
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, undefined, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_0800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0800  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_0900
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_0900  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, APP_IDS_1, null);
        console.info(' --- test_getInstalledBundleStorageStats_0900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_0900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_0900  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1000
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1000  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, APP_IDS_1, undefined);
        console.info(' --- test_getInstalledBundleStorageStats_1000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1000 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1000  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1100
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1100  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        const bundleNames: string[] = [];
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, bundleNames, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_1100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1100 error 9200012 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1100  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1200
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1200  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        const bundleNames: string[] = [""];
        await bundleManager.getInstalledBundleStorageStats(SELFWANT, bundleNames, DEFAULT_USER_ID);
        console.info(' --- test_getInstalledBundleStorageStats_1200 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1200 error 9200012 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1200  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1300
     * @tc.desc   test getInstalledBundleStorageStats method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1300  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        const bundleNames: string[] = ['com.edm.acts.normal'];
        let result: bundleManager.BundleStorageStats[] =
          await bundleManager.getInstalledBundleStorageStats(SELFWANT, bundleNames, DEFAULT_USER_ID);
        expect(result != null).assertTrue();
        expect(result[0]?.bundleName === 'com.edm.acts.normal').assertTrue();
        expect(result[0]?.appSize > 0).assertTrue();
        expect(result[0]?.dataSize >= 0).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1300 error is not expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1300  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1400
     * @tc.desc   test getInstalledBundleStorageStats method with accountId = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1400  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        const bundleNames: string[] = ['com.edm.acts.normal'];
        let result: bundleManager.BundleStorageStats[] =
          await bundleManager.getInstalledBundleStorageStats(SELFWANT, bundleNames, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1400 error 9200012 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1400  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1500
     * @tc.desc   test getInstalledBundleStorageStats method with 200 bundle names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: bundleManager.BundleStorageStats[] =
          await bundleManager.getInstalledBundleStorageStats(SELFWANT, BUNDLE_NAME_ONE_REAL_200, DEFAULT_USER_ID);
        expect(result != null).assertTrue();
        expect(result.length === 200).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1500 error is not expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1500  -------- END --------');
    })

    /**
     * @tc.name   test_getInstalledBundleStorageStats_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETINSTALLEDBUNDLESTORAGESTATS_1600
     * @tc.desc   test getInstalledBundleStorageStats method with 201 bundle names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_getInstalledBundleStorageStats_1600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_getInstalledBundleStorageStats_1600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: bundleManager.BundleStorageStats[] =
          await bundleManager.getInstalledBundleStorageStats(SELFWANT, BUNDLE_NAME_201, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_getInstalledBundleStorageStats_1600 error 9200012 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_getInstalledBundleStorageStats_1600  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0100
     * @tc.desc   test installForResult method with unActive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0100  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        console.info(' --- test_installForResult_0100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0100 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_0100  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0200
     * @tc.desc   test installForResult method with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0200  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0200 error 9200002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- test_installForResult_0200  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0300
     * @tc.desc   test installForResult method with super admin and null hapFilePaths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0300  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0300 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0300  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0400
     * @tc.desc   test installForResult method with super admin and undefined hapFilePaths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0400  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0400 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0400  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0500
     * @tc.desc   test installForResult method with super admin and null InstallParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0500  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, null);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0500 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0500  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0600
     * @tc.desc   test installForResult method with super admin and undefined InstallParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0600  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, undefined);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0600 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0600  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0700
     * @tc.desc   test installForResult method with super admin and undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0700  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(undefined, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0700 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0700  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0800
     * @tc.desc   test installForResult method with super admin and null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0800  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(null, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_0800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0800  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_0900
     * @tc.desc   test installForResult method with super admin success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_0900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_0900  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        const EDM_INSTALL_PARAM_WITH_FLAG_1 : bundleManager.InstallParam = {
          userId: 100,
          installFlag: 1,
        };
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM_WITH_FLAG_1);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
      } catch (error) {
        console.info(' --- test_installForResult_0900 error is not expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_0900  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1000
     * @tc.desc   test installForResult method with unActive admin without installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1000  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH);
        console.info(' --- test_installForResult_1000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1000 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_1000  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1100
     * @tc.desc   test installForResult method with byod admin without installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1100  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1100 error 9200002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- test_installForResult_1100  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1200
     * @tc.desc   test installForResult method with super admin and null hapFilePaths without installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1200  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1200 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_1200  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1300
     * @tc.desc   test installForResult method with error hap path (error code 9201026)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1300  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH_ERROR, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1300 error 9201026 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201026).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_1300  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1400
     * @tc.desc   test installForResult method with error hap path without installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1400  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH_ERROR);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1400 error 9201026 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201026).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_1400  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1500
     * @tc.desc   test installForResult method with enterprise device and for all user
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1500  -------- START --------');
      let isEnterprise: string = systemparameter.getSync('const.edm.is_enterprise_device');
      if (isEnterprise != 'true') {
        console.log('the device is not enterprise');
        done();
        return;
      }
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM_FOR_ALL_USER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1);
      } catch (error) {
        console.info(' --- test_installForResult_1500 error is not expected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_1500  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1600
     * @tc.desc   test installForResult method with empty hapFilePaths array (error code 401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1600  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let hapFilePaths: Array<string> = [];
        await bundleManager.installForResult(SELFWANT, hapFilePaths, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1600 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_1600  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1700
     * @tc.desc   test installForResult method with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1700  -------- START --------');
      try {
        await bundleManager.installForResult(null, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        console.info(' --- test_installForResult_1700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1700 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_1700  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1800
     * @tc.desc   test installForResult method with undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1800  -------- START --------');
      try {
        await bundleManager.installForResult(undefined, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        console.info(' --- test_installForResult_1800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1800 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_1800  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_1900
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_1900
     * @tc.desc   test installForResult method with null hapFilePaths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_1900", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_1900  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, null, EDM_INSTALL_PARAM);
        console.info(' --- test_installForResult_1900 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_1900 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_1900  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2000
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2000
     * @tc.desc   test installForResult method with undefined hapFilePaths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2000", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2000  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, undefined, EDM_INSTALL_PARAM);
        console.info(' --- test_installForResult_2000 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2000 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_2000  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2100
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2100
     * @tc.desc   test installForResult method with null installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2100", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2100  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, null);
        console.info(' --- test_installForResult_2100 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2100 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_2100  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2200
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2200
     * @tc.desc   test installForResult method with undefined installParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2200", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2200  -------- START --------');
      try {
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, undefined);
        console.info(' --- test_installForResult_2200 success is expected.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2200 error is not expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- test_installForResult_2200  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2300
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2300
     * @tc.desc   test installForResult method with invalid userId (error code 9201032)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2300", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2300  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let installParam: bundleManager.InstallParam = {
          userId: INVALID_USER_ID,
          installFlag: 0,
        };
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH, installParam);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2300 error 9201032 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201032).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_2300  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2400
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2400
     * @tc.desc   test installForResult method with invalid hap path (error code 9201026)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2400", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2400  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let invalidHapPath: Array<string> = ['/invalid/path/to/hap.hap'];
        await bundleManager.installForResult(SELFWANT, invalidHapPath, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2400 error 9201026 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201026).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_2400  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2500
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2500
     * @tc.desc   test installForResult method with empty hap file path (error code 9201002)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2500  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.installForResult(SELFWANT, EMPTY_HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2500 error 9201002 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201002).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_2500  -------- END --------');
    })

    /**
     * @tc.name   test_installForResult_2600
     * @tc.number SUB_CUSTOMIZATION_EDM_INSTALLFORRESULT_2600
     * @tc.desc   test installForResult method success with edm disallow install(error code 9201023)

     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_installForResult_2600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- test_installForResult_2600  -------- START --------');
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, [TEST_REAL_APP_ID_2], DEFAULT_USER_ID);
        await bundleManager.installForResult(SELFWANT, HAP_FILE_PATH);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- test_installForResult_2600 error is not expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9201023).assertTrue();
      } finally {
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, [TEST_REAL_APP_ID_2], DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- test_installForResult_2600  -------- END --------');
    })
  })
}
