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
  BUNDLENAME1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM,
  EDM_INSTALL_PARAM_FOR_ALL_USER,
  HAP_FILE_PATH_ERROR
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';
import systemparameter from '@ohos.systemparameter';
import { BmsBundleInfo, BundleManagerHelper } from './BundleManagerHelper';

export default function bundleManagerTest() {
  describe('bundleManager_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addAllowedInstallBundlesSync_001
     * @tc.desc      : test addAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_addAllowedInstallBundlesSync_002
     * @tc.desc      : test addAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_addAllowedInstallBundlesSync_003
     * @tc.desc      : test addAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_addAllowedInstallBundlesSync_004
     * @tc.desc      : test addAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_addAllowedInstallBundlesSync_005
     * @tc.desc      : test addAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_addAllowedInstallBundlesSync_006
     * @tc.desc      : test addAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_addAllowedInstallBundlesSync_007
     * @tc.desc      : test addAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeAllowedInstallBundlesSync_001
     * @tc.desc      : test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_removeAllowedInstallBundlesSync_002
     * @tc.desc      : test removeAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_removeAllowedInstallBundlesSync_003
     * @tc.desc      : test removeAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_removeAllowedInstallBundlesSync_004
     * @tc.desc      : test removeAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_removeAllowedInstallBundlesSync_005
     * @tc.desc      : test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_removeAllowedInstallBundlesSync_006
     * @tc.desc      : test removeAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_removeAllowedInstallBundlesSync_007
     * @tc.desc      : test removeAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getAllowedInstallBundlesSync_001
     * @tc.desc      : test getAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_getAllowedInstallBundlesSync_002
     * @tc.desc      : test getAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_getAllowedInstallBundlesSync_003
     * @tc.desc      : test getAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_getAllowedInstallBundlesSync_004
     * @tc.desc      : test getAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_getAllowedInstallBundlesSync_005
     * @tc.desc      : test getAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_getAllowedInstallBundlesSync_006
     * @tc.desc      : test getAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_getAllowedInstallBundlesSync_007
     * @tc.desc      : test getAllowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getAllowedInstallBundlesSync(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name      : test_add_installation_allowed_app_distribution_types_0100
     * @tc.desc      : test addInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.name test_add_installation_allowed_app_distribution_types_0200
     * @tc.desc test addInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_installation_allowed_app_distribution_types_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.name test_add_installation_allowed_app_distribution_types_0300
     * @tc.desc test addInstallationAllowedAppDistributionTypes method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_installation_allowed_app_distribution_types_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(null, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.name test_add_installation_allowed_app_distribution_types_0400
     * @tc.desc test addInstallationAllowedAppDistributionTypes method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0500
     * @tc.name test_add_installation_allowed_app_distribution_types_0500
     * @tc.desc test addInstallationAllowedAppDistributionTypes type out of scope
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_installation_allowed_app_distribution_types_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name test_get_installation_allowed_app_distribution_types_0100
     * @tc.desc test getInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.name test_get_installation_allowed_app_distribution_types_0200
     * @tc.desc test getInstallationAllowedAppDistributionTypes method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.name test_get_installation_allowed_app_distribution_types_0300
     * @tc.desc test getInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.name test_get_installation_allowed_app_distribution_types_0400
     * @tc.desc test getInstallationAllowedAppDistributionTypes method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_installation_allowed_app_distribution_types_0400', Level.LEVEL2, async (done: Function) => {
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(null);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name test_remove_installation_allowed_app_distribution_types_0100
     * @tc.desc test removeInstallationAllowedAppDistributionTypes method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_installation_allowed_app_distribution_types_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0200
     * @tc.name test_remove_installation_allowed_app_distribution_types_0200
     * @tc.desc test removeInstallationAllowedAppDistributionTypes method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_installation_allowed_app_distribution_types_0200', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0300
     * @tc.name test_remove_installation_allowed_app_distribution_types_0300
     * @tc.desc test removeInstallationAllowedAppDistributionTypes method with null admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_installation_allowed_app_distribution_types_0300', Level.LEVEL2, async (done: Function) => {
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(null, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0400
     * @tc.name test_remove_installation_allowed_app_distribution_types_0400
     * @tc.desc test removeInstallationAllowedAppDistributionTypes method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_installation_allowed_app_distribution_types_0400', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
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
     * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0500
     * @tc.name test_remove_installation_allowed_app_distribution_types_0500
     * @tc.desc test removeInstallationAllowedAppDistributionTypes type out of scope
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_installation_allowed_app_distribution_types_0500', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let allowedAppDistributionTypes: Array<bundleManager.AppDistributionType>  = [0, 7];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch(error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedInstallBundlesSync_001
     * @tc.desc      : test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_addDisallowedInstallBundlesSync_002
     * @tc.desc      : test addDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_addDisallowedInstallBundlesSync_003
     * @tc.desc      : test addDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_addDisallowedInstallBundlesSync_004
     * @tc.desc      : test addDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_addDisallowedInstallBundlesSync_005
     * @tc.desc      : test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_addDisallowedInstallBundlesSync_006
     * @tc.desc      : test addDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_addDisallowedInstallBundlesSync_007
     * @tc.desc      : test addDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedInstallBundlesSync_001
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_removeDisallowedInstallBundlesSync_002
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_removeDisallowedInstallBundlesSync_003
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_removeDisallowedInstallBundlesSync_004
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_removeDisallowedInstallBundlesSync_005
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_removeDisallowedInstallBundlesSync_006
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_removeDisallowedInstallBundlesSync_007
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedInstallBundlesSync_001
     * @tc.desc      : test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_002
     * @tc.name      : test_getDisallowedInstallBundlesSync_002
     * @tc.desc      : test getDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_003
     * @tc.name      : test_getDisallowedInstallBundlesSync_003
     * @tc.desc      : test getDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_004
     * @tc.name      : test_getDisallowedInstallBundlesSync_004
     * @tc.desc      : test getDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_005
     * @tc.name      : test_getDisallowedInstallBundlesSync_005
     * @tc.desc      : test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_006
     * @tc.name      : test_getDisallowedInstallBundlesSync_006
     * @tc.desc      : test getDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_007
     * @tc.name      : test_getDisallowedInstallBundlesSync_007
     * @tc.desc      : test getDisallowedInstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedInstallBundlesSync(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedUninstallBundlesSync_001
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.name      : test_addDisallowedUninstallBundlesSync_002
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.name      : test_addDisallowedUninstallBundlesSync_003
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.name      : test_addDisallowedUninstallBundlesSync_004
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.name      : test_addDisallowedUninstallBundlesSync_005
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.name      : test_addDisallowedUninstallBundlesSync_006
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.name      : test_addDisallowedUninstallBundlesSync_007
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_001
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_002
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_003
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_004
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_005
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_006
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_007
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(null, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedUninstallBundlesSync_001
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_002
     * @tc.name      : test_getDisallowedUninstallBundlesSync_002
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_003
     * @tc.name      : test_getDisallowedUninstallBundlesSync_003
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_004
     * @tc.name      : test_getDisallowedUninstallBundlesSync_004
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_005
     * @tc.name      : test_getDisallowedUninstallBundlesSync_005
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_006
     * @tc.name      : test_getDisallowedUninstallBundlesSync_006
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_007
     * @tc.name      : test_getDisallowedUninstallBundlesSync_007
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedUninstallBundlesSync(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_001
     * @tc.name      : test_uninstall_001
     * @tc.desc      : test uninstall method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_002
     * @tc.name      : test_uninstall_002
     * @tc.desc      : test uninstall method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_003
     * @tc.name      : test_uninstall_003
     * @tc.desc      : test uninstall method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, INVALID_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_004
     * @tc.name      : test_uninstall_004
     * @tc.desc      : test uninstall method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_005
     * @tc.name      : test_uninstall_005
     * @tc.desc      : test uninstall method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_006
     * @tc.name      : test_uninstall_006
     * @tc.desc      : test uninstall method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_007
     * @tc.name      : test_uninstall_007
     * @tc.desc      : test uninstall method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_008
     * @tc.name      : test_uninstall_008
     * @tc.desc      : test uninstall method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_009
     * @tc.name      : test_uninstall_009
     * @tc.desc      : test uninstall method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_009", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_010
     * @tc.name      : test_uninstall_010
     * @tc.desc      : test uninstall method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_010", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(null, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_001
     * @tc.name      : test_install_001
     * @tc.desc      : test install method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_002
     * @tc.name      : test_install_002
     * @tc.desc      : test install method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_003
     * @tc.name      : test_install_003
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, null, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_004
     * @tc.name      : test_install_004
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_005
     * @tc.name      : test_install_005
     * @tc.desc      : test install method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_006
     * @tc.name      : test_install_006
     * @tc.desc      : test install method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_007
     * @tc.name      : test_install_007
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_007", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_008
     * @tc.name      : test_install_008
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_009
     * @tc.name      : test_install_009
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_010
     * @tc.name      : test_install_010
     * @tc.desc      : test install method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_001
     * @tc.name      : test_get_installed_bundle_list_001
     * @tc.desc      : test get installed bundle list method without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_002
     * @tc.name      : test_get_installed_bundle_list_002
     * @tc.desc      : test get installed bundle list method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installed_bundle_list_002", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_003
     * @tc.name      : test_get_installed_bundle_list_003
     * @tc.desc      : test get installed bundle list method unsupported accountId
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installed_bundle_list_003", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await bundleManager.getInstalledBundleList(SELFWANT, 100000);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_004
     * @tc.name      : test_get_installed_bundle_list_004
     * @tc.desc      : test get installed bundle list method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installed_bundle_list_004", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID);
        expect(bundleInfos).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_005
     * @tc.name      : test_get_installed_bundle_list_005
     * @tc.desc      : test get installed bundle list method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installed_bundle_list_005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT,
            DEFAULT_USER_ID);
        expect(bundleInfos).not().assertUndefined();
        let edmBundleInfo = bundleInfos.find((bundleInfo) => {
          return bundleInfo.name === 'com.edm.acts.normal';
        })
        expect(edmBundleInfo).not().assertUndefined();
        let bundleManagerHelper: BundleManagerHelper = new BundleManagerHelper();
        let bmsBundleInfo: BmsBundleInfo | undefined = await bundleManagerHelper.getBmsBundleInfo();
        expect(bmsBundleInfo).not().assertUndefined();
        console.log('test_get_installed_bundle_list_005 edmBundleInfo name' + edmBundleInfo?.name);

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
        expect(edmBundleInfo?.appInfo?.label === bmsBundleInfo?.appInfo?.label).assertTrue();
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
  })
}