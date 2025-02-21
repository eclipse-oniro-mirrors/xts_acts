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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';

const LABEL_BLUETOOTH = "bluetooth";
const LABEL_MODIFY_DATETIME = "modifyDateTime";
const LABEL_PRINTER = "printer";
const LABEL_HDC = "hdc";
const LABEL_MIC = "microphone";
const LABEL_FINGER_PRINT = "fingerprint";
const LABEL_USB = "usb";
const LABEL_WIFI = "wifi";

export default function restrictionsTest() {
  describe('restrictions_test', () => {
    testSetDisallowedPolicy();
    testGetDisallowedPolicy();
  })
}

function testSetDisallowedPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0100
   * @tc.name      : test_set_disallowed_policy_0100
   * @tc.desc      : test restrictions setDisallowedPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0101
   * @tc.name      : test_set_disallowed_policy_0101
   * @tc.desc      : test restrictions setDisallowedPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0102
   * @tc.name      : test_set_disallowed_policy_0102
   * @tc.desc      : test restrictions setDisallowedPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0103
   * @tc.name      : test_set_disallowed_policy_0103
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0104
   * @tc.name      : test_set_disallowed_policy_0104
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0105
   * @tc.name      : test_set_disallowed_policy_0105
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRINTER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_PRINTER)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0106
   * @tc.name      : test_set_disallowed_policy_0106
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0107
   * @tc.name      : test_set_disallowed_policy_0107
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MIC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MIC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0108
   * @tc.name      : test_set_disallowed_policy_0108
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });  

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0109
   * @tc.name      : test_set_disallowed_policy_0109
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  }); 

 /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0110
   * @tc.name      : test_set_disallowed_policy_0110
   * @tc.desc      : test restrictions setDisallowedPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_WIFI)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0111
   * @tc.name      : test_set_disallowed_policy_0111
   * @tc.desc      : test restrictions setDisallowedPolicy with unsupported label
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, '123', false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0100
   * @tc.name      : test_get_disallowed_policy_0100
   * @tc.desc      : test restrictions getDisallowedPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0101
   * @tc.name      : test_get_disallowed_policy_0101
   * @tc.desc      : test restrictions getDisallowedPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0102
   * @tc.name      : test_get_disallowed_policy_0102
   * @tc.desc      : test restrictions getDisallowedPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0103
   * @tc.name      : test_get_disallowed_policy_0103
   * @tc.desc      : test restrictions getDisallowedPolicy with unsupported label
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, '123');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}