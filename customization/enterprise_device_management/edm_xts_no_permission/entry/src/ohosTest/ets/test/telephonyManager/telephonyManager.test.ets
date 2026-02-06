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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';

export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {
    testSetSimDisabled();
    testSetSimEnabled();
    testIsSimDisabled();
    testAddOutgoingCallPolicyNumbers();
    testRemoveOutgoingCallPolicyNumbers();
    testGetOutgoingCallPolicyNumbers();
    testAddIncomingCallPolicyNumbers();
    testRemoveIncomingCallPolicyNumbers();
    testGetIncomingCallPolicyNumbers();
  })
}

function testSetSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_DISABLED_0100
   * @tc.name      : test_set_sim_disabled_0100
   * @tc.desc      : test telephonyManager setSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetSimEnabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_SIM_ENABLED_0100
   * @tc.name      : test_set_sim_enabled_0100
   * @tc.desc      : test telephonyManager setSimEnabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_sim_enabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.setSimEnabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testIsSimDisabled() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_SIM_DISABLED_0100
   * @tc.name      : test_is_sim_disabled_0100
   * @tc.desc      : test telephonyManager isSimDisabled with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_sim_disabled_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.isSimDisabled(SELFWANT, 0);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddOutgoingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_OUTGOING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_add_outgoing_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager addOutgoingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_outgoing_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let numbers: Array<string> = ["13112345678","13687654321"];
      telephonyManager.addOutgoingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST, numbers);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetOutgoingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_OUTGOING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_get_outgoing_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager getOutgoingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_outgoing_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.getOutgoingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveOutgoingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_OUTGOING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_remove_outgoing_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager removeOutgoingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_outgoing_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let numbers: Array<string> = ["13112345678","13687654321"];
      telephonyManager.removeOutgoingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST, numbers);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddIncomingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_INCOMING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_add_incoming_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager addIncomingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_incoming_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let numbers: Array<string> = ["13112345678","13687654321"];
      telephonyManager.addIncomingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST, numbers);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetIncomingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_INCOMING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_get_incoming_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager getIncomingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_incoming_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      telephonyManager.getIncomingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveIncomingCallPolicyNumbers() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_INCOMING_CALL_POLICY_NUMBERS_0100
   * @tc.name      : test_remove_incoming_call_policy_numbers_0100
   * @tc.desc      : test telephonyManager removeIncomingCallPolicyNumbers with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_incoming_call_policy_numbers_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let numbers: Array<string> = ["13112345678","13687654321"];
      telephonyManager.removeIncomingCallPolicyNumbers(SELFWANT, adminManager.Policy.BLOCK_LIST, numbers);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}