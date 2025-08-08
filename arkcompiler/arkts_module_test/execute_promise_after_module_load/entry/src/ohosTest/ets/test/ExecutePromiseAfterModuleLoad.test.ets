/**
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { LogMap } from "../utils/LogMap"
import {
  testLoadSoExecutePromisePendingJobDone
} from "./executePromiseAfterModuleLoad/loadSo/TestLoadSoExecutePromisePendingJob"
import {
  testLoadSoInTaskPoolNotExecutePromisePendingJobDone
} from "./executePromiseAfterModuleLoad/loadSoInTaskPool/TestLoadSoInTaskPoolNotExecutePromisePendingJob"
import {
  testLoadCjsNotExecutePromisePendingJobDone
} from "./executePromiseAfterModuleLoad/loadCjs/TestLoadCjsNotExecutePromisePendingJob"
import {
  testLoadJsonNotExecutePromisePendingJobDone
} from "./executePromiseAfterModuleLoad/loadJson/TestLoadJsonNotExecutePromisePendingJob"
import { testStaticImportModuleDone } from "./executePromiseAfterModuleLoad/staticImport/TestStaticImportModule"
import { testLazyImportModuleDone } from "./executePromiseAfterModuleLoad/lazyImport/TestLazyImportModule"
import {
  testLazyImportSendableValueDone
} from "./executePromiseAfterModuleLoad/lazyImportSendableValue/TestLazyImportSendableValue"
import { testDynamicImportModuleDone } from "./executePromiseAfterModuleLoad/dynamicImport/TestDynamicImportModule"
import { testNapiImportModuleDone } from "./executePromiseAfterModuleLoad/napiImport/TestNapiImportModule"

export default function executePromiseAfterModuleLoadTest() {
  describe('ExecutePromiseAfterModuleLoadTest', () => {
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0001
     * @tc.name: testLoadSoExecutePromisePendingJob
     * @tc.desc: load so will execute pending promise job
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLoadSoExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLoadSoExecutePromisePendingJob");
      expect(testLoadSoExecutePromisePendingJobDone).assertTrue();
      expect(sequence?.length).assertEqual(4)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("libentry.so")
      // load so will execute pending promise job
      expect(sequence?.[index++]).assertEqual("NormalModule.ets")
      expect(sequence?.[index++]).assertEqual("LoadNativeModule.ets")
      expect(sequence?.[index++]).assertEqual("ReExportModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0002
     * @tc.name: testLoadSoInTaskPoolNotExecutePromisePendingJob
     * @tc.desc: load so in taskpool will not execute pending promise job
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLoadSoInTaskPoolNotExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLoadSoInTaskPoolNotExecutePromisePendingJob");
      expect(testLoadSoInTaskPoolNotExecutePromisePendingJobDone).assertTrue();
      expect(sequence?.length).assertEqual(4)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("libentrytaskpool.so")
      expect(sequence?.[index++]).assertEqual("LoadNativeModule.ets")
      // load so in taskpool will not execute pending promise job
      expect(sequence?.[index++]).assertEqual("ReExportModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0003
     * @tc.name: testLoadCjsNotExecutePromisePendingJob
     * @tc.desc: load cjs will not execute pending promise job
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLoadCjsNotExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLoadCjsNotExecutePromisePendingJob");
      expect(testLoadCjsNotExecutePromisePendingJobDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("LoadCjsModule.ets")
      // load cjs will not execute pending promise job
      expect(sequence?.[index++]).assertEqual("ReExportModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0004
     * @tc.name: testLoadJsonNotExecutePromisePendingJob
     * @tc.desc: load json will not execute pending promise job
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLoadJsonNotExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLoadJsonNotExecutePromisePendingJob");
      expect(testLoadJsonNotExecutePromisePendingJobDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("LoadJsonModule.ets")
      // load json will not execute pending promise job
      expect(sequence?.[index++]).assertEqual("ReExportModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0005
     * @tc.name: testStaticImportExecutePromisePendingJob
     * @tc.desc: when the entry module is static imported, pending promise job will immediately execute after every module loaded
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testStaticImportExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testStaticImportExecutePromisePendingJob");
      expect(testStaticImportModuleDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("UseDynamicImportModule.ets")
      // when the entry module is static imported, pending promise job will immediately execute after every module loaded
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
      expect(sequence?.[index++]).assertEqual("StaticImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0006
     * @tc.name: testLazyImportExecutePromisePendingJob
     * @tc.desc: when the entry module is lazy imported, pending promise job will immediately execute after all module loaded
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLazyImportExecutePromisePendingJob");
      expect(testLazyImportModuleDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("UseDynamicImportModule.ets")
      // when the entry module is lazy imported, pending promise job will immediately execute after all module loaded
      expect(sequence?.[index++]).assertEqual("LazyImportedEntryModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0007
     * @tc.name: testLazyImportSendableValueExecutePromisePendingJob
     * @tc.desc: when the entry module is lazy imported, and the lazy imported module value is sendable, pending promise job will immediately execute after every module loaded
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSendableValueExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testLazyImportSendableValueExecutePromisePendingJob");
      expect(testLazyImportSendableValueDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("UseDynamicImportModule.ets")
      // when the entry module is lazy imported, and the lazy imported module value is sendable
      // pending promise job will immediately execute after every module loaded
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
      expect(sequence?.[index++]).assertEqual("LazyImportedEntryModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0008
     * @tc.name: testDynamicImportExecutePromisePendingJob
     * @tc.desc: when the entry module is dynamic imported, pending promise job will immediately execute after all module loaded
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testDynamicImportExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testDynamicImportExecutePromisePendingJob");
      expect(testDynamicImportModuleDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("UseDynamicImportModule.ets")
      // when the entry module is dynamic imported, pending promise job will immediately execute after all module loaded
      expect(sequence?.[index++]).assertEqual("DynamicImportedEntryModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
    /**
     * @tc.number: SUB_Runtime_Language_Execute_Promise_After_Module_Load_0009
     * @tc.name: testNapiImportExecutePromisePendingJob
     * @tc.desc: when the entry module is napi imported, pending promise job will immediately execute after all module loaded
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testNapiImportExecutePromisePendingJob', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let sequence = LogMap.getModuleLoadSequence("testNapiImportExecutePromisePendingJob");
      expect(testNapiImportModuleDone).assertTrue();
      expect(sequence?.length).assertEqual(3)
      let index = 0;
      expect(sequence?.[index++]).assertEqual("UseDynamicImportModule.ets")
      // when the entry module is napi imported, pending promise job will immediately execute after all module loaded
      expect(sequence?.[index++]).assertEqual("NapiImportedEntryModule.ets")
      expect(sequence?.[index++]).assertEqual("DynamicImportedModule.ets")
    })
  })
}