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
  EDM_INSTALL_PARAM
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';

export default function bundleManagerTest() {
  describe('bundleManager_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addAllowedInstallBundlesSync_001
     * @tc.desc      : test addAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeAllowedInstallBundlesSync_001
     * @tc.desc      : test removeAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getAllowedInstallBundlesSync_001
     * @tc.desc      : test getAllowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.getAllowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedInstallBundlesSync_001
     * @tc.desc      : test addDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedInstallBundlesSync_001
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedInstallBundlesSync_001
     * @tc.desc      : test getDisallowedInstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedUninstallBundlesSync_001
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_001
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedUninstallBundlesSync_001
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
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
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_001
     * @tc.name      : test_uninstall_001
     * @tc.desc      : test uninstall method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
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
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_003
     * @tc.name      : test_uninstall_003
     * @tc.desc      : test uninstall method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await bundleManager.uninstall(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_001
     * @tc.name      : test_install_001
     * @tc.desc      : test install method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_install_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
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
        await bundleManager.install(SELFWANT, HAP_FILE_PATH);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLED_BUNDLE_LIST_001
     * @tc.name      : test_get_installed_bundle_list_001
     * @tc.desc      : test get installed bundle list method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installed_bundle_list_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let bundleInfos: bundleManager.BundleInfo[] = await bundleManager.getInstalledBundleList(SELFWANT, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name      : test_add_installation_allowed_app_distribution_types_0100
     * @tc.desc      : test addInstallationAllowedAppDistributionTypes with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_add_installation_allowed_app_distribution_types_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.addInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name      : test_remove_installation_allowed_app_distribution_types_0100
     * @tc.desc      : test removeInstallationAllowedAppDistributionTypes with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_remove_installation_allowed_app_distribution_types_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let allowedAppDistributionTypes:
          Array<bundleManager.AppDistributionType>  = [bundleManager.AppDistributionType.APP_GALLERY];
        bundleManager.removeInstallationAllowedAppDistributionTypes(SELFWANT, allowedAppDistributionTypes);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALLATION_ALLOWED_APP_DISTRIBUTION_TYPES_0100
     * @tc.name      : test_get_installation_allowed_app_distribution_types_0100
     * @tc.desc      : test getInstallationAllowedAppDistributionTypes with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_installation_allowed_app_distribution_types_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        bundleManager.getInstallationAllowedAppDistributionTypes(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
  })
}