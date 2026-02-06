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
import { taskpool } from '@kit.ArkTS';

const PATH = "com.acts.arktsnapiloadtest/entry_test"

interface TestModule {
  value?: number
  test?: (a: number, b: number) => number
  add?: (a: number, b: number) => number
}

@Concurrent
function sharedHarOne(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
  expect(sharedHarOne.value).assertEqual(value);
}

@Concurrent
function sharedHarOnePath(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const obj: TestModule = testNapi.loadModuleWithInfo("sharedHarOne/Index", PATH)
  expect(obj.test ? obj.test(0, 1) : -1).assertEqual(value);
}

@Concurrent
function sharedHspOne(value: number): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const obj: TestModule = testNapi.loadModuleWithInfo("sharedHspOne", PATH)
  expect(obj.test ? obj.test(2, 3) : -1).assertEqual(value);
}

async function testNapiTaskPool(): Promise<void> {
  for (let i = 0; i < 10; i++) {
    taskpool.execute(new taskpool.Task(sharedHarOne, 1))
    taskpool.execute(new taskpool.Task(sharedHarOnePath, 0))
    taskpool.execute(new taskpool.Task(sharedHspOne, 6))
  }
}

@Concurrent
function reSharedHarOne(): void {
  const PATH = "com.acts.arktsnapiloadtest/entry_test"
  const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
  expect(sharedHarOne.add ? sharedHarOne.add(2, 3) : -1).assertEqual(5);
}

async function testReNapiTaskPool(): Promise<void> {
  taskpool.execute(new taskpool.Task(reSharedHarOne))
}

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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0001
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0001
     * @tc.desc   Test the loading of SO files in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0001';
      console.info(TAG, " start");
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0002
     * @tc.desc   Test loading the HAR package into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0003
     * @tc.desc   Test loading files from the Har package into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0004
     * @tc.desc   Test loading the HSP package in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0005
     * @tc.desc   Test loading files from the HSP package in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0006
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0006
     * @tc.desc   Test loading system modules in HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0007
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0007
     * @tc.desc   Test moduleName incorrectly when loading har package in hap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0007';
        console.info(TAG, ' start');
        let har: ESObject = testNapi.loadModuleWithInfo('harTwo', 'com.acts.arttsnapiloadtest/entry_tes');
        expect(har == undefined).assertTrue;
      } catch (err) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0008
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0008
     * @tc.desc   Test moduleName incorrectly when loading hsp package in hap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0008';
        console.info(TAG, ' start');
        let hsp: ESObject = testNapi.loadModuleWithInfo('hspTwo', 'com.acts.arttsnapiloadtest/entry_tes');
        expect(hsp == undefined).assertTrue;
      } catch (err) {
        expect().assertFail();
      }

    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0009
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0009
     * @tc.desc   Test loading the shared module name into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
      expect(sharedHarOne.value).assertEqual(1);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0010
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0010
     * @tc.desc   Test loading the shared module path into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne/Index", PATH)
      expect(sharedHarOne.test ? sharedHarOne.test(0, 1) : -1).assertEqual(0);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0011
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0011
     * @tc.desc   Test loading the shared module name into the hsp package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sharedHspOne: TestModule = testNapi.loadModuleWithInfo("sharedHspOne", PATH)
      expect(sharedHspOne.test ? sharedHspOne.test(2, 3) : -1).assertEqual(6);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0012
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0012
     * @tc.desc   Test loading the shared module path into the hsp package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sharedHspOne: TestModule = testNapi.loadModuleWithInfo("sharedHspOne/Index", PATH)
      expect(sharedHspOne.test ? sharedHspOne.test(2, 3) : -1).assertEqual(6);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0013
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0013
     * @tc.desc   Test loading the Re-entrant into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sharedHarOne: TestModule = testNapi.loadModuleWithInfo("sharedHarOne", PATH)
      expect(sharedHarOne.add ? sharedHarOne.add(2, 3) : -1).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0014
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0014
     * @tc.desc   Test loading the shared module by taskpool into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      await testNapiTaskPool()
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0015
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0015
     * @tc.desc   Test re loading the shared module by taskpool into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      await testReNapiTaskPool()
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0016
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0016
     * @tc.desc   Test loading the HAR package into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0016';
      console.info(TAG, ' start');
      let har: ESObject = testNapi.loadModule('harTwo');
      console.info(TAG, 'har: ', JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0017
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0017
     * @tc.desc   Test loading files from the Har package into the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0017';
      console.info(TAG, ' start');
      let harFile: ESObject = testNapi.loadModule('harTwo/Index');
      console.info(TAG, 'harFile: ', JSON.stringify(harFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = harFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0018
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0018
     * @tc.desc   Test loading the HSP package in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0018';
      console.info(TAG, ' start');
      let hsp: ESObject = testNapi.loadModule('hspTwo');
      console.info(TAG, 'hsp: ', JSON.stringify(hsp))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hsp.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0019
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0019
     * @tc.desc   Test loading files from the HSP package in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0019';
      console.info(TAG, ' start');
      let hspFile: ESObject = testNapi.loadModule('hspTwo/Test');
      console.info(TAG, 'hspFile: ', JSON.stringify(hspFile))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = hspFile.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
    
    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0020
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0020
     * @tc.desc   Test loading system modules in HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0020';
      console.info(TAG, ' start');
      let myLog: ESObject = testNapi.loadModule('@ohos.hilog');
      try {
        myLog.info(0x0000, 'SystemModule', TAG + ' hilog print success');
        expect(5).assertEqual(5);
      } catch (err) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0021
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0021
     * @tc.desc   Test loading ets file with all path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0021';
      console.info(TAG, ' start');
      let har: ESObject = testNapi.loadModule('harTwo/src/main/ets/Test');
      console.info(TAG, 'har: ', JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add2(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0022
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0022
     * @tc.desc   Test loading ets file with all path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0022';
      console.info(TAG, ' start');
      let har: ESObject = testNapi.loadModule('hspTwo/src/main/ets/Test');
      console.info(TAG, 'har: ', JSON.stringify(har))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = har.add2(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   ARK_ETSRuntime_HAP_NAPI_LOAD_0023
     * @tc.number ARK_ETSRuntime_HAP_NAPI_LOAD_0023
     * @tc.desc   Test loading ets file with relative paths
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('ARK_ETSRuntime_HAP_NAPI_LOAD_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'ARK_ETSRuntime_HAP_NAPI_LOAD_0023';
      console.info(TAG, ' start');
      let entry: ESObject = testNapi.loadModule('ets/Test2');
      console.info(TAG, 'entry: ', JSON.stringify(entry))
      let argc1 = 2;
      let argc2 = 3;
      let result: number = entry.add2(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
  })
}