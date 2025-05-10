/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import worker from '@ohos.worker'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

let TAG = ''

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function WorkerTransmitTest() {
  describe('WorkerTransmitTest', () => {
    beforeAll(() => {
      console.info("TransContext start")
    })
    afterAll(() => {
      console.info("TransContext end")
    })

    /*
     * @tc.number  SUB_AA_AMS_Stage_StageContextSupportsWorker_0100
     * @tc.name    .
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Stage_StageContextSupportsWorker_0100', Level.LEVEL0, async (done : Function) => {
      TAG = 'SUB_AA_AMS_Stage_StageContextSupportsWorker_0100 == '
      console.info(TAG + "start")
      let trans = new worker.Worker('entry/ets/workers/worker_SUB_AA_AMS_Stage_StageContextSupportsWorker_0100.js')
      let isTerminate = false
      let flag = false
      let expectValue = undefined

      trans.onexit = () => {
        console.info(TAG + "onexit")
        isTerminate = true
      }

      trans.onerror = () => {
        console.info(TAG + "onerror")
        flag = true
      }

      trans.onmessageerror = () => {
        console.info(TAG + "onmessageerror")
        flag = true
      }

      trans.onmessage = (message: ESObject) => {
        console.info(TAG + "onmessage")
        expectValue = message.data
        flag = true
      }

      trans.postMessage(globalThis.abilityStageContext)
      while (!flag) {
        console.info(TAG + "await onmessage")
        await sleep(100)
      }

      trans.terminate()
      while (!isTerminate) {
        console.info(TAG + "await onexit")
        await sleep(100)
      }

      expect(expectValue).assertTrue()
      console.info(TAG + "end")
      done()
    })

    /*
     * @tc.number  SUB_AA_AMS_Stage_StageContextSupportsWorker_0300
     * @tc.name    .
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Stage_StageContextSupportsWorker_0300', Level.LEVEL0, async (done : Function) => {
      TAG = 'SUB_AA_AMS_Stage_StageContextSupportsWorker_0300 == '
      console.info(TAG + "start")
      let trans = new worker.Worker('entry/ets/workers/worker_SUB_AA_AMS_Stage_StageContextSupportsWorker_0300.js')
      let isTerminate = false
      let flag = false
      let expectValue = undefined

      trans.onexit = () => {
        console.info(TAG + "onexit")
        isTerminate = true
      }

      trans.onerror = () => {
        console.info(TAG + "onerror")
        flag = true
      }

      trans.onmessageerror = () => {
        console.info(TAG + "onmessageerror")
        flag = true
      }

      trans.onmessage =(message: ESObject) => {
        console.info(TAG + "onmessage")
        expectValue = message.data
        flag = true
      }

      trans.postMessage(globalThis.abilityContext)
      while (!flag) {
        console.info(TAG + "await onmessage")
        await sleep(100)
      }

      trans.terminate()
      while (!isTerminate) {
        console.info(TAG + "await onexit")
        await sleep(100)
      }

      expect(expectValue).assertTrue()
      console.info(TAG + "end")
      done()
    })

    /*
     * @tc.number  SUB_AA_AMS_Stage_StageContextSupportsWorker_0400
     * @tc.name    .
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Stage_StageContextSupportsWorker_0400', Level.LEVEL0, async (done : Function) => {
      TAG = 'SUB_AA_AMS_Stage_StageContextSupportsWorker_0400 == '
      console.info(TAG + "start")
      let trans = new worker.Worker('entry/ets/workers/worker_SUB_AA_AMS_Stage_StageContextSupportsWorker_0400.js')
      let isTerminate = false
      let flag = false
      let expectValue = undefined

      trans.onexit = () => {
        console.info(TAG + "onexit")
        isTerminate = true
      }

      trans.onerror = () => {
        console.info(TAG + "onerror")
        flag = true
      }

      trans.onmessageerror = () => {
        console.info(TAG + "onmessageerror")
        flag = true
      }

      trans.onmessage = (message: ESObject) => {
        console.info(TAG + "onmessage")
        expectValue = message.data
        flag = true
      }

      trans.postMessage(globalThis.abilityContext)
      while (!flag) {
        console.info(TAG + "await onmessage")
        await sleep(100)
      }

      trans.terminate()
      while (!isTerminate) {
        console.info(TAG + "await onexit")
        await sleep(100)
      }

      expect(expectValue).assertTrue()
      console.info(TAG + "end")
      done()
    })

    /*
    * @tc.number  SUB_AA_AMS_Stage_StageContextSupportsWorker_0800
    * @tc.name    .
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_AMS_Stage_StageContextSupportsWorker_0800', Level.LEVEL0, async (done : Function) => {
      TAG = 'SUB_AA_AMS_Stage_StageContextSupportsWorker_0800 == '
      console.info(TAG + "start")
      let trans = new worker.Worker('entry/ets/workers/worker_SUB_AA_AMS_Stage_StageContextSupportsWorker_0800.js')
      let isTerminate = false
      let flag = false
      let expectValue = undefined

      trans.onexit = () => {
        console.info(TAG + "onexit")
        isTerminate = true
      }

      trans.onerror = () => {
        console.info(TAG + "onerror")
        flag = true
      }

      trans.onmessageerror = () => {
        console.info(TAG + "onmessageerror")
        flag = true
      }

      trans.onmessage = (message: ESObject) => {
        console.info(TAG + "onmessage")
        expectValue = message.data
        flag = true
      }

      trans.postMessage(globalThis.abilityContext)
      while (!flag) {
        console.info(TAG + "await onmessage")
        await sleep(100)
      }

      trans.terminate()
      while (!isTerminate) {
        console.info(TAG + "await onexit")
        await sleep(100)
      }

      expect(expectValue).assertTrue()
      console.info(TAG + "end")
      done()
    })
  })
}