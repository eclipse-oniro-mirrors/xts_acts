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
import Want from '@ohos.app.ability.Want'
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  BUNDLENAME1, INVALID_WANT, PARAMETERS_LOWER_BOUND, INVALID_PARAMETERS, INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';

const DELEGATED_POLICIES: Array<string> = [ "set_browser_policies" ];

export default function adminManagerTest() {
  describe('adminManager_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_subscribeManagedEventSync_001
     * @tc.desc      : test subscribeManagedEventSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_001", 0, async (done: Function) => {
      try {
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.name      : test_subscribeManagedEventSync_002
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_INVALID_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.name      : test_subscribeManagedEventSync_003
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.name      : test_subscribeManagedEventSync_004
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_004", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_unsubscribeManagedEventSync_001
     * @tc.desc      : test unsubscribeManagedEventSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_001", 0, async (done: Function) => {
      try {
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_002
     * @tc.name      : test_unsubscribeManagedEventSync_002
     * @tc.desc      : test unsubscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_INVALID_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200008).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_003
     * @tc.name      : test_unsubscribeManagedEventSync_003
     * @tc.desc      : test unsubscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_004
     * @tc.name      : test_unsubscribeManagedEventSync_004
     * @tc.desc      : test unsubscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_004", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_001
     * @tc.name      : test_setDelegatedPolicies_001
     * @tc.desc      : test setDelegatedPolicies method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_001", 0, async (done: Function) => {
      try {
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_002
     * @tc.name      : test_setDelegatedPolicies_002
     * @tc.desc      : test setDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_003
     * @tc.name      : test_setDelegatedPolicies_003
     * @tc.desc      : test setDelegatedPolicies method with invalid bundleName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.setDelegatedPolicies(SELFWANT, "invalid", DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200009).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_004
     * @tc.name      : test_setDelegatedPolicies_004
     * @tc.desc      : test setDelegatedPolicies method with invalid policy
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_004", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let invalidPolicy: Array<string> = ["invalid_policy"];
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, invalidPolicy);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_005
     * @tc.name      : test_setDelegatedPolicies_005
     * @tc.desc      : test setDelegatedPolicies method with invalid bundleName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_005", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        let policies: Array<string> = adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(policies.length == 1 && policies[0] == DELEGATED_POLICIES[0]).assertTrue();
        let bundles: Array<string> = adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(bundles.length == 1 && bundles[0] == BUNDLENAME1).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_001
     * @tc.name      : test_getDelegatedPolicies_001
     * @tc.desc      : test getDelegatedPolicies method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_001", 0, async (done: Function) => {
      try {
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_002
     * @tc.name      : test_getDelegatedPolicies_002
     * @tc.desc      : test getDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_003
     * @tc.name      : test_getDelegatedPolicies_003
     * @tc.desc      : test getDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedPolicies(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_001
     * @tc.name      : test_getDelegatedBundleNames_001
     * @tc.desc      : test getDelegatedBundleNames method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_001", 0, async (done: Function) => {
      try {
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.name      : test_getDelegatedBundleNames_002
     * @tc.desc      : test getDelegatedBundleNames method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_002", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_002
     * @tc.name      : test_getDelegatedBundleNames_002
     * @tc.desc      : test getDelegatedBundleNames method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_003", 0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        adminManager.getDelegatedBundleNames(SELFWANT, "invalid");
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_001
     * @tc.name      : test_startAdminProvision_001
     * @tc.desc      : test startAdminProvision method with invalid admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_001", 0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(INVALID_WANT, adminManager.AdminType.ADMIN_TYPE_BYOD, AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_002
     * @tc.name      : test_startAdminProvision_002
     * @tc.desc      : test startAdminProvision method with invalid adminType
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_002", 0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_NORMAL, AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_003
     * @tc.name      : test_startAdminProvision_003
     * @tc.desc      : test startAdminProvision method with invalid context
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_003", 0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD, null, PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_004
     * @tc.name      : test_startAdminProvision_004
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_004", 0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD, AppStorage.get("test"), INVALID_PARAMETERS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_005
     * @tc.name      : test_startAdminProvision_005
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_005", 0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_006
     * @tc.name      : test_startAdminProvision_006
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_006", 0, async (done: Function) => {
      let invalidActivateId: string = '';
      for (let i = 0; i < 257; i++) {
        invalidActivateId = invalidActivateId.concat('1');
      }
      let invalidParameterOverUpperBound: Record<string, string> = {
        "activateId" : invalidActivateId
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), invalidParameterOverUpperBound);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_007
     * @tc.name      : test_startAdminProvision_007
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_007", 0, async (done: Function) => {
      let invalidCustomizedInfo: string = '';
      for (let i = 0; i < 10241; i++) {
        invalidCustomizedInfo = invalidCustomizedInfo.concat('1');
      }
      let invalidParameterOverUpperBound: Record<string, string> = {
        "activateId" : "12345678901234567890123456789012",
        "customizedInfo" : invalidCustomizedInfo
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), invalidParameterOverUpperBound);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })    

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_008
     * @tc.name      : test_startAdminProvision_008
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_008", 0, async (done: Function) => {
      const otherWant: Want = {
        bundleName: "com.example.extensionzerotest",
        abilityName: "com.example.extensionzerotest.EnterpriseAdminAbility"
      };
      try {
        adminManager.startAdminProvision(otherWant, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_009
     * @tc.name      : test_startAdminProvision_009
     * @tc.desc      : test startAdminProvision method with invalid parameter
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_009", 0, async (done: Function) => {
      let parameter: Record<string, string> = {
        "activateId" : "12345678901234567890123456789012",
        "activateId2" : "12345678901234567890123456789012",
        "activateId3" : "12345678901234567890123456789012",
        "activateId4" : "12345678901234567890123456789012",
        "activateId5" : "12345678901234567890123456789012",
        "activateId6" : "12345678901234567890123456789012",
        "activateId7" : "12345678901234567890123456789012",
        "activateId8" : "12345678901234567890123456789012",
        "activateId9" : "12345678901234567890123456789012",
        "activateId10" : "12345678901234567890123456789012",
        "activateId11" : "12345678901234567890123456789012"
      }
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), parameter);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_010
     * @tc.name      : test_startAdminProvision_010
     * @tc.desc      : test startAdminProvision method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_010", 0, async (done: Function) => {
      const otherWant: Want = {
        bundleName: "com.example.extensionzerotest",
        abilityName: "com.example.extensionzerotest.MainAbility"
      };
      try {
        adminManager.startAdminProvision(otherWant, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_011
     * @tc.name      : test_startAdminProvision_011
     * @tc.desc      : test startAdminProvision method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startAdminProvision_011", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
            AppStorage.get("test"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETADMINS_001
     * @tc.name      : test_getAdmins_001
     * @tc.desc      : test getadmins method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAdmins_001", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 0);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETADMINS_002
     * @tc.name      : test_getAdmins_002
     * @tc.desc      : test getadmins method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAdmins_002", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 1);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETADMINS_003
     * @tc.name      : test_getAdmins_003
     * @tc.desc      : test getadmins method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAdmins_003", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 1).assertTrue();
        expect(res[0].bundleName == SELFWANT.bundleName);
        expect(res[0].abilityName == SELFWANT.abilityName);
        expect(res[0].parameters?.adminType == 2);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETADMINS_004
     * @tc.name      : test_getAdmins_004
     * @tc.desc      : test getadmins method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getAdmins_004", 0, async (done: Function) => {
      try {
        let res: Array<Want> = await adminManager.getAdmins();
        expect(res.length == 0).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEADMIN_001
     * @tc.name      : test_disableAdmin_001
     * @tc.desc      : test disableAdmin method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableAdmin_001", 0, async (done: Function) => {
      try {
        await adminManager.disableAdmin(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200005).assertTrue();
      } 
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEADMIN_002
     * @tc.name      : test_disableAdmin_002
     * @tc.desc      : test disableAdmin method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableAdmin_002", 0, async (done: Function) => {
      try {
        await adminManager.disableAdmin(null);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } 
      done();

      /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEADMIN_003
     * @tc.name      : test_disableAdmin_003
     * @tc.desc      : test disableAdmin method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableAdmin_003", 0, async (done: Function) => {
      try {
        let userId: number = 100;
        await adminManager.disableAdmin(SELFWANT, userId);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200005).assertTrue();
      } 
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_DISABLEADMIN_004
     * @tc.name      : test_disableAdmin_004
     * @tc.desc      : test disableAdmin method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_disableAdmin_004", 0, async (done: Function) => {
      try {
        let userId: number = 100;
        await adminManager.disableAdmin(null, userId);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } 
      done();
    })
    })
  })
}