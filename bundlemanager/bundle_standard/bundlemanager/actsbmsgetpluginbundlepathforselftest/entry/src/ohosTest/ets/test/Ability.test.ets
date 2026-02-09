/** 
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
let domain = 0;
let tag: string = 'testTag';


export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /** 
      * @tc.number Test_getPluginBundlePathForSelf_0010
      * @tc.name Test_getPluginBundlePathForSelf_0010
      * @tc.desc test getPluginBundlePathForSelf value is null string
      * @tc.size MediumTest
      * @tc.type Function
      * @tc.level Level 2
      */
    it('Test_getPluginBundlePathForSelf_0010', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void) => {
      const TEST_CASE_NAME = 'Test_getPluginBundlePathForSelf_0010'
      let pluginBundleName = '';
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, `${TEST_CASE_NAME} it begin`);
      try {
        let path = bundleManager.getPluginBundlePathForSelf(pluginBundleName);
        hilog.info(0x0000, 'testTag', 'getPluginBundlePathForSelf successfully. path: %{public}s', path);
        expect().assertFail();
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        hilog.error(domain, tag, `getPluginBundlePathForSelf failed. Cause:: ${JSON.stringify(err.message)}, error code:  ${JSON.stringify( err.code)}`);
        expect(err.message).assertEqual("BusinessError 17700001: The specified bundle is not found.")
        expect(code).assertEqual(17700001)
        hilog.info(domain, tag, `${TEST_CASE_NAME} it end`);
        done();
      }
    })
    /** 
      * @tc.number Test_getPluginBundlePathForSelf_0020
      * @tc.name Test_getPluginBundlePathForSelf_0020
      * @tc.desc test getPluginBundlePathForSelf value is Non-existent value
      * @tc.size MediumTest
      * @tc.type Function
      * @tc.level Level 2
      */
    it('Test_getPluginBundlePathForSelf_0020', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void) => {
      const TEST_CASE_NAME = 'Test_getPluginBundlePathForSelf_0020'
      let pluginBundleName = 'ohos.example.test111';
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, `${TEST_CASE_NAME} it begin`);
      try {
        let path = bundleManager.getPluginBundlePathForSelf(pluginBundleName);
        hilog.info(domain, tag, 'getPluginBundlePathForSelf successfully. path: %{public}s', path);
        expect().assertFail();
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        hilog.error(domain, tag, `getPluginBundlePathForSelf failed. Cause:: ${JSON.stringify(err.message)}, error code:  ${JSON.stringify( err.code)}`);
        expect(err.message).assertEqual("BusinessError 17700001: The specified bundle is not found.")
        expect(code).assertEqual(17700001)
        done();
      }
    })

    /** 
      * @tc.number Test_getPluginBundlePathForSelf_0030
      * @tc.name Test_getPluginBundlePathForSelf_0030
      * @tc.desc test getPluginBundlePathForSelf value is null
      * @tc.size MediumTest
      * @tc.type Function
      * @tc.level Level 2
      */
    it('Test_getPluginBundlePathForSelf_0030', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void) => {
      const TEST_CASE_NAME = 'Test_getPluginBundlePathForSelf_0030'
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, `${TEST_CASE_NAME} it begin`);
      try {
        let path = bundleManager.getPluginBundlePathForSelf(null);
        hilog.info(domain, tag, 'getPluginBundlePathForSelf successfully. path: %{public}s', path);
        expect().assertFail();
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        hilog.error(domain, tag, `getPluginBundlePathForSelf failed. Cause:: ${JSON.stringify(err.message)}, error code:  ${JSON.stringify( err.code)}`);
        expect(err.message).assertEqual("BusinessError 401: Parameter error. The type of pluginBundleName must be string.")
        expect(code).assertEqual(401)
        done();
      }
    })

    /** 
      * @tc.number Test_getPluginBundlePathForSelf_0040
      * @tc.name Test_getPluginBundlePathForSelf_0040
      * @tc.desc test getPluginBundlePathForSelf value is undefined
      * @tc.size MediumTest
      * @tc.type Function
      * @tc.level Level 2
      */
    it('Test_getPluginBundlePathForSelf_0040', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void) => {
      const TEST_CASE_NAME = 'Test_getPluginBundlePathForSelf_0040'
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, `${TEST_CASE_NAME} it begin`);
      try {
        let path = bundleManager.getPluginBundlePathForSelf(undefined);
        hilog.info(domain, tag, 'getPluginBundlePathForSelf successfully. path: %{public}s', path);
        expect().assertFail();
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        hilog.error(domain, tag, `getPluginBundlePathForSelf failed. Cause:: ${JSON.stringify(err.message)}, error code:  ${JSON.stringify( err.code)}`);
        expect(err.message).assertEqual("BusinessError 401: Parameter error. The type of pluginBundleName must be string.")
        expect(code).assertEqual(401)
        done();
      }
    })
  })
}