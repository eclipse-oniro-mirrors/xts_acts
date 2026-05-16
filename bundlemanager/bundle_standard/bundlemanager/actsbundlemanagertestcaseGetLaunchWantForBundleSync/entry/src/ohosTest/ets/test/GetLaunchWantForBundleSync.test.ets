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
import bundleMgr from '@ohos.bundle.bundleManager';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import hilog from '@ohos.hilog';

const NAME1 = "ohos.acts.bundlemanager.test.getLaunchWantForBundleSync";
const ABILITYNAME_1 = "TestAbility";
const ERROR_CODE_PARAM_CHECK_ERROR = 401;
const ERROR_CODE_BUNDLE_NOT_EXIST = 17700001;
const ERROR_CODE_INVALID_USER_ID = 17700004;
const ERROR_MESSAGE_PARAM_CHECK_ERROR = "BusinessError 401: Parameter error. The type of bundleName must be string.";
const ERROR_MESSAGE_PARAM_CHECK_ERROR_NULL_STRING = "param type check error";
const ERROR_MESSAGE_BUNDLE_NOT_EXIST = "BusinessError 17700001: The specified bundle is not found.";
const ERROR_MESSAGE_INVALID_USER_ID = "BusinessError 17700004: The specified user id is not found.";
const TAG = 'BundleMgrHits';
const TEST_SUITE_NAME = 'testGetLaunchWantForBundleSync';

export default function testGetLaunchWantForBundleSync() {
  describe('testGetLaunchWantForBundleSync', () => {

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7300
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7300
     * @tc.desc   Test getLaunchWantForBundleSync with bundleName and userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7300';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(NAME1, 100);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error).assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7320
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7320
     * @tc.desc   Test getLaunchWantForBundleSync with bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7320', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7320';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(NAME1);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error).assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7360
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7360
     * @tc.desc   Test getLaunchWantForBundleSync with error bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7360', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7360';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync('bundleName');
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect().assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertEqual(ERROR_CODE_BUNDLE_NOT_EXIST);
        expect(error.message).assertEqual(ERROR_MESSAGE_BUNDLE_NOT_EXIST);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7380
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7380
     * @tc.desc   Test getLaunchWantForBundleSync with error userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7380', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7380';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(NAME1, 999);
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect().assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertEqual(ERROR_CODE_INVALID_USER_ID);
        expect(error.message).assertEqual(ERROR_MESSAGE_INVALID_USER_ID);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7440
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7440
     * @tc.desc   Test getLaunchWantForBundleSync with empty string as bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7440', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7440';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync('');
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect().assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertEqual(ERROR_CODE_PARAM_CHECK_ERROR);
        expect(error.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7420
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7420
     * @tc.desc   Test getLaunchWantForBundleSync with null as bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7420', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7420';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(null);
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect().assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertEqual(ERROR_CODE_PARAM_CHECK_ERROR);
        expect(error.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7460
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7460
     * @tc.desc   Test getLaunchWantForBundleSync with undefined as bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7460', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7460';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(undefined);
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect().assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertEqual(ERROR_CODE_PARAM_CHECK_ERROR);
        expect(error.message).assertEqual(ERROR_MESSAGE_PARAM_CHECK_ERROR);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7500
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7500
     * @tc.desc   Test getLaunchWantForBundleSync with null as userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7500';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(NAME1, null);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_7480
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7480
     * @tc.desc   Test getLaunchWantForBundleSync with undefined as userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AbilityInfo_7480', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_Query_AbilityInfo_7480';
      try {
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        let res = bundleMgr.getLaunchWantForBundleSync(NAME1, undefined);
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWantForBundle success, LaunchWant is: %{public}s', JSON.stringify(res));
        expect(res.bundleName).assertEqual(NAME1);
        expect(res.deviceId).assertEqual('');
        expect(res.abilityName).assertEqual(ABILITYNAME_1);
        expect(res.action).assertEqual('action.system.home');
        expect(res.moduleName).assertEqual('');
        expect(res.entities?.[0]).assertEqual('entity.system.home');
        hilog.info(0x0000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (error) {
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'get LaunchWant failed, err is: %{public}s', JSON.stringify(error));
        expect(error.code).assertFail();
        hilog.warn(0x0001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });
  });
}