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
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';

export default function adminManagerTest() {
  describe('adminManager_test', function () {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SUBSCRIBEMANAGEDEVENTSYNC_001
     * @tc.name      : test_subscribeManagedEventSync_001
     * @tc.desc      : test subscribeManagedEventSync method with unActive admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_subscribeManagedEventSync_001", 0, async function (done) {
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
    it("test_subscribeManagedEventSync_002", 0, async function (done) {
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
    it("test_subscribeManagedEventSync_003", 0, async function (done) {
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
    it("test_subscribeManagedEventSync_004", 0, async function (done) {
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
    it("test_unsubscribeManagedEventSync_001", 0, async function (done) {
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
     * @tc.name      : test_subscribeManagedEventSync_002
     * @tc.desc      : test subscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_002", 0, async function (done) {
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
     * @tc.name      : test_subscribeManagedEventSync_003
     * @tc.desc      : test subscribeManagedEventSync method with Active admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_003", 0, async function (done) {
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
     * @tc.name      : test_subscribeManagedEventSync_004
     * @tc.desc      : test subscribeManagedEventSync method with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_unsubscribeManagedEventSync_004", 0, async function (done) {
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
  })
}