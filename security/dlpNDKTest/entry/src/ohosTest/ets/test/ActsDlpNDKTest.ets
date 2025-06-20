/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsDlpNDKTest() {
  describe('ActsDlpNDKTest', () => {
    
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number getDlpPermissionInfoTest
     * @tc.name getDlpPermissionInfoTest.
     * @tc.desc Obtains the permission info of this DLP file.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('getDlpPermissionInfoTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("=======> getDlpPermissionInfoTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try {
          let result = await testNapi.osGetDlpPermissionInfoA();
          console.log("=======>getDlpPermissionInfoTest result:" + result);
          expect(result).assertEqual(19100006);
          done();
        } catch (error) {
          console.error("=======>getDlpPermissionInfoTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();
    })

    /**
     * @tc.number getOriginalFileNameTest
     * @tc.name getOriginalFileNameTest.
     * @tc.desc Obtains the original file name from a DLP file name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getOriginalFileNameTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> getOriginalFileNameTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try{
          let result = await testNapi.osGetOriginalFileNameA();
          console.log("=======>getOriginalFileNameTest result:" + result);
          expect(result).assertEqual('test.txt');
          done();
        } catch (error) {
          console.error("=======>getOriginalFileNameTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();

    })
    
    /**
     * @tc.number isInSandboxTest
     * @tc.name isInSandboxTest.
     * @tc.desc Checks whether current application is in the DLP sandbox.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('isInSandboxTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> isInSandboxTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try{
          let result = await testNapi.osIsInSandboxA();
          console.log("=======>isInSandboxTest result:" + result);
          expect(result).assertFalse();
          done();
        } catch (error) {
          console.error("=======>isInSandboxTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();

    })
    
    /**
     * @tc.number setSandboxAppConfigTest
     * @tc.name setSandboxAppConfigTest.
     * @tc.desc Sets sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> setSandboxAppConfigTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try{
          let result = await testNapi.osSetSandboxAppConfigA();
          console.log("=======>setSandboxAppConfigTest result:" + result);
          expect(result).assertEqual(0);
          done();
        } catch (error) {
          console.error("=======>setSandboxAppConfigTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();

    })
    
    /**
     * @tc.number getSandboxAppConfigTest
     * @tc.name getSandboxAppConfigTest.
     * @tc.desc Obtains sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> getSandboxAppConfigTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try{
          let result = await testNapi.osGetSandboxAppConfigA();
          console.log("=======>getSandboxAppConfigTest result:" + result);
          expect(result).assertEqual('configInfo');
          done();
        } catch (error) {
          console.error("=======>getSandboxAppConfigTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();

    })

    /**
     * @tc.number cleanSandboxAppConfigTest
     * @tc.name cleanSandboxAppConfigTest.
     * @tc.desc Cleans sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('cleanSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> cleanSandboxAppConfigTest  ==========");
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        try{
          let result = await testNapi.osCleanSandboxAppConfigA();
          console.log("=======>cleanSandboxAppConfigTest result:" + result);
          expect(result).assertEqual(0);
          done();
        } catch (error) {
          console.error("=======>cleanSandboxAppConfigTest error:" + error);
          expect(false).assertTrue();
          done();
        }
      }
      done();

    })
  })
}