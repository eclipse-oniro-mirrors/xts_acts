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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import testNapi from 'libentry.so';

export default function HarNapiLoadTest() {
  let TAG = '';
  let HarProject: ESObject = testNapi.loadModuleWithInfo('harOne', 'com.acts.arttsnapiloadtest/entry_test');
  let HarProject2: ESObject = testNapi.loadModule('harOne');
  describe('HarNapiLoadTest', () => {
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
     * @tc.number: ARK_ETSRuntime_HAR_NAPI_LOAD_0001
     * @tc.name: test har so load
     * @tc.desc: Test the loading of SO files in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0001';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.harSOAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.name: test har loading from har
     * @tc.desc: Test loading the HAR package into the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0002';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHarAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.name: test har file loading from har
     * @tc.desc: Test loading files from the Har package into the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0003';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherFileHarAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.name: test hsp loading from har
     * @tc.desc: Test loading the HSP package in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0004';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHspAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.name: test hsp file loading from har
     * @tc.desc: Test loading files from the HSP package in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0005';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject.otherHspFileAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

      /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0006
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
      it('ARK_ETSRuntime_HAR_NAPI_LOAD_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0006';
        console.info(TAG, ' start');
        let result: Boolean = HarProject.loadSystemModule(TAG);
        console.info(TAG, ' ' + JSON.stringify(result));
        if (!result) {
          expect().assertFail();
          }
      })

    /**
     * @tc.number: ARK_ETSRuntime_HAR_NAPI_LOAD_0007
     * @tc.name: test har so load
     * @tc.desc: Test the loading of SO files in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0007';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject2.harSOAdd(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0008
     * @tc.name: test har loading from har
     * @tc.desc: Test loading the HAR package into the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0008';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject2.otherHarAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0009
     * @tc.name: test har file loading from har
     * @tc.desc: Test loading files from the Har package into the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0009';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject2.otherFileHarAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0010
     * @tc.name: test hsp loading from har
     * @tc.desc: Test loading the HSP package in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0010';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject2.otherHspAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number: ARK_ETSRuntime_HAP_NAPI_LOAD_0011
     * @tc.name: test hsp file loading from har
     * @tc.desc: Test loading files from the HSP package in the HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('ARK_ETSRuntime_HAR_NAPI_LOAD_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0011';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = HarProject2.otherHspFileAdd2(argc1, argc2, TAG);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

     /**
     * @tc.number: ARK_ETSRuntime_HSP_NAPI_LOAD_0012
     * @tc.name: test loading system modules
     * @tc.desc: Test loading system modules in HAR package
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
      it('ARK_ETSRuntime_HAR_NAPI_LOAD_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        TAG = 'ARK_ETSRuntime_HAR_NAPI_LOAD_0012';
        console.info(TAG, ' start');
        let result: Boolean = HarProject.loadSystemModule2(TAG);
        console.info(TAG, ' ' + JSON.stringify(result));
        if (!result) {
          expect().assertFail();
          }
      })
  })
}