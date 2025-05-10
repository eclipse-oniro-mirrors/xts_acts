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

export default function HspNapiLoadTest() {
  let TAG = '';
  let HspProject: ESObject = testNapi.loadModuleWithInfo('hspOne', 'com.acts.arttsnapiloadtest/entry_test');
  let HspProject2: ESObject = testNapi.loadModule('hspOne');
  describe('HspNapiLoadTest', () => {
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
     * @tc.name: test hsp so load
     * @tc.desc: Test the loading of SO files in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0001', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0001';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject.hspSOAdd(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0002
     * @tc.name: test hsp loading from hap
     * @tc.desc: Test loading the HAR package into the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0002', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0002';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject.otherHarAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0003
     * @tc.name: test har file loading from hsp
     * @tc.desc: Test loading files from the Har package into the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0003', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0003';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject.otherFileHarAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0004
     * @tc.name: test hsp file loading from hsp
     * @tc.desc: Test loading files from the HSP package in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0004', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0004';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject.otherHspAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0005
     * @tc.name: test hsp file loading from hsp
     * @tc.desc: Test loading files from the HSP package in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0005', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0005';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject.otherHspFileAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

      /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0006
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
      it('ARK_ETSRuntime_HSP_NAPI_LOAD_0006', 0, () => {
        TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0006';
        console.info(TAG, ' start');
        let result: Boolean = HspProject.loadSystemModule(TAG);
        console.info(TAG, ' ' + JSON.stringify(result));
        if (!result) {
          expect().assertFail();
          }
      })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0007
     * @tc.name: test hsp so load
     * @tc.desc: Test the loading of SO files in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0007', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0007';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject2.hspSOAdd(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0008
     * @tc.name: test hsp loading from hap
     * @tc.desc: Test loading the HAR package into the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0008', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0008';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject2.otherHarAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0009
     * @tc.name: test har file loading from hsp
     * @tc.desc: Test loading files from the Har package into the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0009', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0009';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject2.otherFileHarAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0010
     * @tc.name: test hsp file loading from hsp
     * @tc.desc: Test loading files from the HSP package in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0010', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0010';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject2.otherHspAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0011
     * @tc.name: test hsp file loading from hsp
     * @tc.desc: Test loading files from the HSP package in the HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0011', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0011';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HspProject2.otherHspFileAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0012
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HSP package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HSP_NAPI_LOAD_0012', 0, () => {
      TAG = 'ARK_ETSRuntime_HSP_NAPI_LOAD_0012';
      console.info(TAG, ' start');
      let result: Boolean = HspProject.loadSystemModule2(TAG);
      console.info(TAG, ' ' + JSON.stringify(result));
      if (!result) {
        expect().assertFail();
      }
    })
  })
}