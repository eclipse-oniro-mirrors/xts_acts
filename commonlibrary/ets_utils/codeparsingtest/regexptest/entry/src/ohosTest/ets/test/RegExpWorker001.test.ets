/*
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

import worker, { MessageEvents } from '@ohos.worker';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpWorkerTest001() {
  describe('RegExpWorkerTest001', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testRegCtr0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_WORKER_0001
     * @tc.desc   Verify RegExp can be created from a string pattern with flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workerInstance = new worker.ThreadWorker('../workers/Worker001.ets');
      workerInstance.postMessage('testRegCtr0001')
      workerInstance.onmessage = (e: MessageEvents) => {
        const testData: object = e.data;
        expect(testData['result']).assertTrue();
        expect(testData['re'].source).assertEqual('abc');
        expect(testData['re'].flags).assertEqual('i');
      }
      workerInstance.terminate();
    });

    /**
     * @tc.name   testRegCtr0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_WORKER_0002
     * @tc.desc   Verify RegExp constructed from another RegExp copies source and flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workerInstance = new worker.ThreadWorker('../workers/Worker001.ets');
      workerInstance.postMessage('testRegCtr0002');

      workerInstance.onmessage = (e: MessageEvents) => {
        const testData: object = e.data;
        expect(testData['result']).assertTrue();
        expect(testData['re2'].source).assertEqual('foo');
        expect(testData['re2'].flags).assertEqual('gi');
      };
      workerInstance.terminate();
    });
  })
}