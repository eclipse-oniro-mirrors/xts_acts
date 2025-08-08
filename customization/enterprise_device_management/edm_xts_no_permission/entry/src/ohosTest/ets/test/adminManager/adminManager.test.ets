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
     * @tc.desc      : test subscribeManagedEventSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_001", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.subscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_UNSUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_unsubscribeManagedEventSync_001
     * @tc.desc      : test unsubscribeManagedEventSync method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_001", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.unsubscribeManagedEventSync(SELFWANT, SUBSCRIBE_EVENTS);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETDELEGATEDPOLICIES_001
     * @tc.name      : test_setDelegatedPolicies_001
     * @tc.desc      : test setDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setDelegatedPolicies_001", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.setDelegatedPolicies(SELFWANT, BUNDLENAME1, DELEGATED_POLICIES);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDPOLICIES_001
     * @tc.name      : test_getDelegatedPolicies_001
     * @tc.desc      : test getDelegatedPolicies method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedPolicies_001", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.getDelegatedPolicies(SELFWANT, BUNDLENAME1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETDELEGATEDBUNDLENAMES_001
     * @tc.name      : test_getDelegatedBundleNames_001
     * @tc.desc      : test getDelegatedBundleNames method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getDelegatedBundleNames_001", Level.LEVEL0, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.getDelegatedBundleNames(SELFWANT, DELEGATED_POLICIES[0]);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_ISBYODADMIN_001
     * @tc.name      : test_isByodAdmin_001
     * @tc.desc      : test isByodAdmin method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_isByodAdmin_001", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        adminManager.isByodAdmin(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_STARTADMINPROVISION_001
     * @tc.name      : test_startadminprovision_001
     * @tc.desc      : test startadminprovision method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_startadminprovision_001", Level.LEVEL0, async (done: Function) => {
      try {
        adminManager.startAdminProvision(SELFWANT, adminManager.AdminType.ADMIN_TYPE_BYOD,
          AppStorage.get("context"), PARAMETERS_LOWER_BOUND);
        expect(false).assertTrue();
      } catch (error) {
        console.log('test_startadminprovision_001 ' + error.code);
        console.log('test_startadminprovision_001 ' + error.message);
        expect(error.code == 201).assertTrue();
      }
      done();
    })
  })
}