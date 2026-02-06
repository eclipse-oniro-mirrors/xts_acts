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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, UPDATE_VERSION, INVALID_UPDATE_VERSION, DEFAULT_USER_ID } from '../commom';
import { BusinessError } from '@ohos.base';

import adminManager from '@ohos.enterprise.adminManager';
import systemManager from '@ohos.enterprise.systemManager';

export default function systemManagerTest() {
  describe('systemManager_test', () => {
    testSetNTPSever();
    testGetNTPSever();
    testSetOtaUpdatePolicy();
    testGetOtaUpdatePolicy();
    testNotifyUpdatePackages();
    testGetUpdateResult();
    testGetUpdateAuthData();
    testSetAutoUnlockAfterReboot();
    testGetAutoUnlockAfterReboot();
    testGetDisallowedNearLink();
    testAddDisallowedNearLinkProtocols();
    testRemoveDisallowedNearLinkProtocols();
    testSetInstallLocalEnterpriseAppEnabled();
    testGetInstallLocalEnterpriseAppEnabled();
  })
}

function testSetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NTP_SERVER_JS_0100
   * @tc.name      : test_set_ntp_sever_0100
   * @tc.desc      : test systemManager setNTPServer with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setNTPServer(SELFWANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetNTPSever() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_NTP_SERVER_JS_0100
   * @tc.name      : test_get_ntp_sever_0100
   * @tc.desc      : test systemManager getNTPServer with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ntp_sever_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getNTPServer(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetOtaUpdatePolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_OTA_UPDATE_POLICY_JS_0001
   * @tc.name      : test_set_ota_update_policy_0001
   * @tc.desc      : test systemManager setOtaUpdatePolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_ota_update_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let policy: systemManager.OtaUpdatePolicy = {
      "policyType": systemManager.PolicyType.PROHIBIT,
      "version": UPDATE_VERSION,
    }
    try {
      systemManager.setOtaUpdatePolicy(SELFWANT, policy);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetOtaUpdatePolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_OTA_UPDATE_POLICY_JS_0001
   * @tc.name      : test_get_ota_update_policy_0001
   * @tc.desc      : test systemManager getOtaUpdatePolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ota_update_policy_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getOtaUpdatePolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testNotifyUpdatePackages() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_NOTIFY_UPDATE_PACKAGES_JS_0001
   * @tc.name      : test_notify_update_packages_0001
   * @tc.desc      : test systemManager notifyUpdatePackages without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_notify_update_packages_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    let updatePaskageInfo: Array<systemManager.Package> = [{
      "type": systemManager.PackageType.FIRMWARE,
      "path": "path"
    }]
    let updatePackageInfo: systemManager.UpdatePackageInfo = {
      "version" : UPDATE_VERSION,
      "packages" : updatePaskageInfo,
    };
    await systemManager.notifyUpdatePackages(SELFWANT, updatePackageInfo).then(()=>{
      expect(false).assertTrue();
    }).catch ((error: BusinessError)=> {
      expect(error.code == 201).assertTrue();
    });
    await adminManager.disableAdmin(SELFWANT);
    done();
  });
}

function testGetUpdateResult() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.name      : test_get_update_result_0001
   * @tc.desc      : test systemManager getOtaUpdatePolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_result_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    await systemManager.getUpdateResult(SELFWANT, UPDATE_VERSION).then((data: systemManager.UpdateResult) => {
      expect(false).assertTrue();
    }).catch((error: BusinessError) => {
      expect(error.code == 201).assertTrue();
    });
    await adminManager.disableAdmin(SELFWANT);
    done();
  });
}

function testGetUpdateAuthData() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_UPDATE_RESULT_JS_0001
   * @tc.name      : test_get_update_auth_data_0001
   * @tc.desc      : test systemManager getUpdateAuthData with admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_update_auth_data_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let authData: string = await systemManager.getUpdateAuthData(SELFWANT);
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetAutoUnlockAfterReboot() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.name      : test_set_auto_unlock_after_reboot_0001
   * @tc.desc      : test systemManager getUpdateAuthData with admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      await systemManager.setAutoUnlockAfterReboot(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAutoUnlockAfterReboot() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_AUTO_UNLOCK_AFTER_REBOOT_JS_0001
   * @tc.name      : test_get_auto_unlock_after_reboot_0001
   * @tc.desc      : test systemManager getUpdateAuthData with admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_auto_unlock_after_reboot_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      await systemManager.getAutoUnlockAfterReboot(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedNearLink() {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_NEARLINK_JS_0003
     * @tc.name      : test_get_disallowed_near_link_0003
     * @tc.desc      : test systemManager getDisallowedNearLinkProtocols with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_get_disallowed_near_link_0003', Level.LEVEL2, async (done: Function) => {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        try {
            let protocols: Array<number> =
                systemManager.getDisallowedNearLinkProtocols(SELFWANT, DEFAULT_USER_ID);
        } catch (error) {
            expect(error.code == 801 ||error.code == 201).assertTrue();
        } finally {
            await adminManager.disableAdmin(SELFWANT);
        }
        done();
    });
}

function testAddDisallowedNearLinkProtocols() {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
     * @tc.name      : test_add_disallowed_nearlink_protocols_0002
     * @tc.desc      : test systemManager addDisallowedNearLinkProtocols with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_add_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let nearlinkProtocols: Array<number> = new Array();
        nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
        nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
        try {
            systemManager.addDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
            expect(false).assertTrue();
        } catch (error) {
            expect(error.code == 801 ||error.code == 201).assertTrue();
        } finally {
            await adminManager.disableAdmin(SELFWANT);
        }
        done();
    });
}

function testRemoveDisallowedNearLinkProtocols() {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_NEARLINK_PROTOCOLS_JS_0002
     * @tc.name      : test_remove_disallowed_nearlink_protocols_0002
     * @tc.desc      : test systemManager removeDisallowedNearLinkProtocols with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it('test_remove_disallowed_nearlink_protocols_0002', Level.LEVEL2, async (done: Function) => {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        let nearlinkProtocols: Array<number> = new Array();
        nearlinkProtocols.push(systemManager.NearLinkProtocol.SSAP);
        nearlinkProtocols.push(systemManager.NearLinkProtocol.DATA_TRANSFER);
        try {
            systemManager.removeDisallowedNearLinkProtocols(SELFWANT, nearlinkProtocols, DEFAULT_USER_ID);
            expect(false).assertTrue();
        } catch (error) {
            expect(error.code == 801 ||error.code == 201).assertTrue();
        } finally {
            await adminManager.disableAdmin(SELFWANT);
        }
        done();
    });
}

function testSetInstallLocalEnterpriseAppEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_INSTALL_LOCAL_ENTERPRISE_APP_JS_0100
   * @tc.name      : test_set_install_local_enterprise_app_0100
   * @tc.desc      : test systemManager setInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_install_local_enterprise_app_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.setInstallLocalEnterpriseAppEnabled(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetInstallLocalEnterpriseAppEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INSTALL_LOCAL_ENTERPRISE_APP_JS_0100
   * @tc.name      : test_get_install_local_enterprise_app_0100
   * @tc.desc      : test systemManager getInstallLocalEnterpriseAppEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_install_local_enterprise_app_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      systemManager.getInstallLocalEnterpriseAppEnabled(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801 || error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}