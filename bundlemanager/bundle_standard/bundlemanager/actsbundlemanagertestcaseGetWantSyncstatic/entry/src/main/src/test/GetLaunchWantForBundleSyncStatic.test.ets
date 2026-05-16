/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';

const NAME1 = "ohos.acts.bundlemanagergetwant.test.static";
const ABILITYNAME_1 = "EntryAbility";
const ERROR_CODE_PARAM_CHECK_ERROR = 401;
const ERROR_CODE_BUNDLE_NOT_EXIST = 17700001;
const ERROR_CODE_INVALID_USER_ID = 17700004;
const ERROR_MESSAGE_PARAM_CHECK_ERROR = "BusinessError 401: Parameter error. The type of bundleName must be string.";
const ERROR_MESSAGE_BUNDLE_NOT_EXIST = "BusinessError 17700001: The specified bundle is not found.";
const ERROR_MESSAGE_INVALID_USER_ID = "BusinessError 17700004: The specified user id is not found.";
const TAG = 'testTag';
const TEST_SUITE_NAME = "testGetLaunchWantForBundleSyncStatic"

export default function GetLaunchWantForBundleSyncStatic() {
  describe('testGetLaunchWantForBundleSyncStatic', (): void => {

    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0100
     * @tc.number GetLaunchWantForBundleSyncStatic_0100
     * @tc.desc   Test getLaunchWantForBundleSync with bundleName and userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetLaunchWantForBundleSyncStatic_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0100';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync(NAME1, 100);
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + ` catch failed: ${err.code}, message: ${err.message}`);
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0200
     * @tc.number GetLaunchWantForBundleSyncStatic_0200
     * @tc.desc   Test getLaunchWantForBundleSync with bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetLaunchWantForBundleSyncStatic_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0200';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync(NAME1);
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + ` catch failed: ${err.code}, message: ${err.message}`);
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0300
     * @tc.number GetLaunchWantForBundleSyncStatic_0300
     * @tc.desc   Test getLaunchWantForBundleSync with error bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetLaunchWantForBundleSyncStatic_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0300';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync('bundleName');
        expect().assertFail();
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + ` catch failed: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(ERROR_CODE_BUNDLE_NOT_EXIST);
        expect(err.message).assertEqual(ERROR_MESSAGE_BUNDLE_NOT_EXIST);
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0400
     * @tc.number GetLaunchWantForBundleSyncStatic_0400
     * @tc.desc   Test getLaunchWantForBundleSync with error userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetLaunchWantForBundleSyncStatic_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0400';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync(NAME1, 999);
        expect().assertFail();
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + ` catch failed: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(ERROR_CODE_INVALID_USER_ID);
        expect(err.message).assertEqual(ERROR_MESSAGE_INVALID_USER_ID);
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0500
     * @tc.number GetLaunchWantForBundleSyncStatic_0500
     * @tc.desc   Test getLaunchWantForBundleSync with empty string as bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetLaunchWantForBundleSyncStatic_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0500';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync('');
        expect().assertFail();
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + ` catch failed: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(ERROR_CODE_PARAM_CHECK_ERROR);
        expect(err.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

  });
}