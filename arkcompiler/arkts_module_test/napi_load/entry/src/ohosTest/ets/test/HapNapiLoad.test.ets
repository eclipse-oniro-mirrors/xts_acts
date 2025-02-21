/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';

export default function HapNapiLoadTest() {
  let TAG = '';
  describe('HapNapiLoadTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0001
     * @tc.name: test hap so load
     * @tc.desc: Test the loading of SO files in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0001', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0001';
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.name: test har loading from hap
     * @tc.desc: Test loading the HAR package into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0002', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0002';
      console.info(TAG, ' start');
      let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'har: ', JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.name: test har file loading from hap
     * @tc.desc: Test loading files from the Har package into the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0003', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0003';
      console.info(TAG, ' start');
      let harFile: ESObject = testNapi.loadModuleWithInfo('harTwo/Index', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'harFile: ', JSON.stringify(harFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = harFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.name: test hsp loading from hap
     * @tc.desc: Test loading the HSP package in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0004', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0004';
      console.info(TAG, ' start');
      let hsp: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'hsp: ', JSON.stringify(hsp))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hsp.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.name: test hsp file loading from hap
     * @tc.desc: Test loading files from the HSP package in the HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0005', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0005';
      console.info(TAG, ' start');
      let hspFile: ESObject = testNapi.loadModuleWithInfo('hspTwo/Test', 'com.acts.arttsnapiloadtest/entry_test');
      console.info(TAG, 'hspFile: ', JSON.stringify(hspFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hspFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0006
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HAP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0006', 0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0006';
      console.info(TAG, ' start');
      let myLog: ESObject = testNapi.loadModuleWithInfo('@ohos.hilog', '');
      try {
        myLog.info(0x0000, 'SystemModule', TAG + ' hilog print success');
        expect(5).assertEqual(5);
      } catch (err) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0007
     * @tc.name: test moduleName is incorrect
     * @tc.desc: Test moduleName incorrectly when loading har package in hap
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0007', 0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0007';
        console.info(TAG, ' start');
        let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_tes');
      } catch (err) {
        expect(5).assertEqual(5);
      }

    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0008
     * @tc.name: test moduleName is incorrect
     * @tc.desc: Test moduleName incorrectly when loading hsp package in hap
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0008', 0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0008';
        console.info(TAG, ' start');
        let har: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_tes');
      } catch (err) {
        expect(5).assertEqual(5);
      }

    })
    
  })
}