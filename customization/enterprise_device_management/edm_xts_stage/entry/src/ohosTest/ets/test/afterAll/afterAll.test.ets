/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  DEFAULT_USER_ID,
  INVALID_USER_ID,
  TEST_BUNDLENAME,
  INVALID_BUNDLE_NAME,
  DEFAULT_APP_INDEX,
  INVALID_APP_INDEX
} from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';

export default function afterAllTest() {
  describe('afterAll_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_001
     * @tc.name      : test_clearUpApplicationData_001
     * @tc.desc      : test clearUpApplicationData method without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_001", Level.LEVEL2, async (done: Function) => {
      try {
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_002
     * @tc.name      : test_clearUpApplicationData_002
     * @tc.desc      : test clearUpApplicationData method with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_002", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
        applicationManager.clearUpApplicationData(SELFWANT, TEST_BUNDLENAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_003
     * @tc.name      : test_clearUpApplicationData_003
     * @tc.desc      : test clearUpApplicationData method with invalid bundle name
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_003", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.clearUpApplicationData(SELFWANT, INVALID_BUNDLE_NAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
         expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_004
     * @tc.name      : test_clearUpApplicationData_004
     * @tc.desc      : test clearUpApplicationData method with invalid app index
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_004", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.clearUpApplicationData(SELFWANT, SELFHAPNAME, INVALID_APP_INDEX, DEFAULT_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
         expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_005
     * @tc.name      : test_clearUpApplicationData_005
     * @tc.desc      : test clearUpApplicationData method with invalid user id
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_005", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.clearUpApplicationData(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
         expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_CLEARUPAPPLICATIONDATA_006
     * @tc.name      : test_clearUpApplicationData_006
     * @tc.desc      : test clearUpApplicationData method success
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_clearUpApplicationData_006", Level.LEVEL2, async (done: Function) => {
      try {
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        applicationManager.clearUpApplicationData(SELFWANT, SELFHAPNAME, DEFAULT_APP_INDEX, DEFAULT_USER_ID);
      } catch (error) {
         expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })
  })
}