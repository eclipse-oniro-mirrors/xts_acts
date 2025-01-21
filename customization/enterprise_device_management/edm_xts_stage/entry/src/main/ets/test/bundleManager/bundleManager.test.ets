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
  WANT1,
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  SUBSCRIBE_EVENTS,
  APP_IDS_1,
  DEFAULT_USER_ID,
  TEST_USER_ID,
  HAP_FILE_PATH,
  EDM_INSTALL_PARAM
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import bundleManager from '@ohos.enterprise.bundleManager';

export default function bundleManagerTest() {
  describe('bundleManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addAllowedInstallBundlesSync_001
     * @tc.desc      : test addAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addAllowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_addAllowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_addAllowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_addAllowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeAllowedInstallBundlesSync_001
     * @tc.desc      : test removeAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeAllowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_removeAllowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_removeAllowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeAllowedInstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_removeAllowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getAllowedInstallBundlesSync_001
     * @tc.desc      : test getAllowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAllowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_getAllowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_getAllowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getAllowedInstallBundlesSync(SELFWANT, TEST_USER_ID);
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
    it("test_getAllowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedInstallBundlesSync_001
     * @tc.desc      : test addDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_addDisallowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_addDisallowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_addDisallowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedInstallBundlesSync_001
     * @tc.desc      : test removeDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_removeDisallowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_removeDisallowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedInstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_removeDisallowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedInstallBundlesSync_001
     * @tc.desc      : test getDisallowedInstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedInstallBundlesSync_001", 0, async function (done) {
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
    it("test_getDisallowedInstallBundlesSync_002", 0, async function (done) {
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
    it("test_getDisallowedInstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedInstallBundlesSync(SELFWANT, TEST_USER_ID);
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
    it("test_getDisallowedInstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADDDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_addDisallowedUninstallBundlesSync_001
     * @tc.desc      : test addDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_addDisallowedUninstallBundlesSync_001", 0, async function (done) {
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
    it("test_addDisallowedUninstallBundlesSync_002", 0, async function (done) {
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
    it("test_addDisallowedUninstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.addDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_addDisallowedUninstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVEDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_removeDisallowedUninstallBundlesSync_001
     * @tc.desc      : test removeDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_removeDisallowedUninstallBundlesSync_001", 0, async function (done) {
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
    it("test_removeDisallowedUninstallBundlesSync_002", 0, async function (done) {
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
    it("test_removeDisallowedUninstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.removeDisallowedUninstallBundlesSync(SELFWANT, APP_IDS_1, TEST_USER_ID);
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
    it("test_removeDisallowedUninstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDISALLOWEDUNINSTALLBUNDLESSYNC_001
     * @tc.name      : test_getDisallowedUninstallBundlesSync_001
     * @tc.desc      : test getDisallowedUninstallBundlesSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDisallowedUninstallBundlesSync_001", 0, async function (done) {
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
    it("test_getDisallowedUninstallBundlesSync_002", 0, async function (done) {
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
    it("test_getDisallowedUninstallBundlesSync_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        bundleManager.getDisallowedUninstallBundlesSync(SELFWANT, TEST_USER_ID);
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
    it("test_getDisallowedUninstallBundlesSync_004", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_001
     * @tc.name      : test_uninstall_001
     * @tc.desc      : test uninstall method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_uninstall_001", 0, async function (done) {
      try {
        await bundleManager.uninstall(SELFWANT, WANT1.bundleName, DEFAULT_USER_ID, true);
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
    it("test_uninstall_002", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        await bundleManager.uninstall(SELFWANT, WANT1.bundleName, DEFAULT_USER_ID, true);
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
    it("test_uninstall_003", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, WANT1.bundleName, TEST_USER_ID, true);
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
    it("test_uninstall_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.uninstall(SELFWANT, WANT1.bundleName, DEFAULT_USER_ID, true);
      } catch (error) {
        expect(false).assertTrue();
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
    it("test_install_001", 0, async function (done) {
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
    it("test_install_002", 0, async function (done) {
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
    it("test_install_003", 0, async function (done) {
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
    it("test_install_004", 0, async function (done) {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await bundleManager.install(SELFWANT, HAP_FILE_PATH, EDM_INSTALL_PARAM);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}