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

export default function RegExpWorkerTest004() {
  describe('RegExpWorkerTest004', () => {
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
     * @tc.name   testRegSearch0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_WORKER_0001
     * @tc.desc   Use simple regex to find the first match and return the index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workerInstance = new worker.ThreadWorker('../workers/Worker004.ets');
      workerInstance.postMessage('testRegSearch0001');
      workerInstance.onmessage = (e: MessageEvents) => {
        const testData: object = e.data;
        expect(testData['result']).assertEqual(1);
        expect(testData['re'].source).assertEqual('b');
        expect(testData['re'].flags).assertEqual('');
      };
      workerInstance.terminate();
    });

    /**
     * @tc.name   testRegSearch0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_WORKER_0002
     * @tc.desc   Use regex to search for a non-existing match, should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let workerInstance = new worker.ThreadWorker('../workers/Worker004.ets');
      workerInstance.postMessage('testRegSearch0002');
      workerInstance.onmessage = (e: MessageEvents) => {
        const testData: object = e.data;
        expect(testData['result']).assertEqual(-1);
        expect(testData['re'].source).assertEqual('z');
        expect(testData['re'].flags).assertEqual('');
      };
      workerInstance.terminate();
    });
  });
}