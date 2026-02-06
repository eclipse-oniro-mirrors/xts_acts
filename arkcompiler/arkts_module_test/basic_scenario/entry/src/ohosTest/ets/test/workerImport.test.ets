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
 
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import worker from '@ohos.worker';
import { Sleep } from './Util'

export default function workerImport() {
  describe('workerImportTest', () => {
    /**
     * @tc.name   testWorkerImportLibrary
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_WorkerImport_0100
     * @tc.desc   Import Shared Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerImportLibrary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workerImportLibrary = 'failed';
      let threadWorker = new worker.ThreadWorker('./workers/workerImportLibrary')
      threadWorker.postMessage("ModuleTest host to worker")
      threadWorker.onmessage = async () => {
        workerImportLibrary = 'success';
      }
      await Sleep(2000);
      expect(workerImportLibrary).assertEqual('success');
    })

    /**
     * @tc.name   testWorkerImportHar
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_WorkerImport_0200
     * @tc.desc   Import Static Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerImportHar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workerImportHar = 'failed';
      let threadWorker = new worker.ThreadWorker('./workers/workerImportHar')
      threadWorker.postMessage("ModuleTest host to worker")
      threadWorker.onmessage = async () => {
        workerImportHar = 'success';
      }
      await Sleep(2000);
      expect(workerImportHar).assertEqual('success');
    })

    /**
     * @tc.name   testWorkerImportRelativePath
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_WorkerImport_0300
     * @tc.desc   Import Relative Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerImportRelativePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workerImportRelative = 'failed';
      let threadWorker = new worker.ThreadWorker('./workers/workerRelativePath')
      threadWorker.postMessage("ModuleTest host to worker")
      threadWorker.onmessage = async () => {
        workerImportRelative = 'success';
      }
      await Sleep(2000);
      expect(workerImportRelative).assertEqual('success');
    })
    
    /**
     * @tc.name   testWorkerImportSystem
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_WorkerImport_0400
     * @tc.desc   Import System Native Module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerImportSystem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workerImportSystem = 'failed';
      let threadWorker = new worker.ThreadWorker('./workers/workerSystem')
      threadWorker.postMessage("ModuleTest host to worker")
      threadWorker.onmessage = async () => {
        workerImportSystem = 'success';
      }
      await Sleep(2000);
      expect(workerImportSystem).assertEqual('success');
    })

    /**
     * @tc.name   testWorkerImportNapi
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_WorkerImport_0500
     * @tc.desc   Import Native Module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerImportNapi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let workerImportNapi = 'failed';
      let threadWorker = new worker.ThreadWorker('./workers/workerTestNapi')
      threadWorker.postMessage("ModuleTest host to worker")
      threadWorker.onmessage = async () => {
        workerImportNapi = 'success';
      }
      await Sleep(2000);
      expect(workerImportNapi).assertEqual('success');
    })

  })
}