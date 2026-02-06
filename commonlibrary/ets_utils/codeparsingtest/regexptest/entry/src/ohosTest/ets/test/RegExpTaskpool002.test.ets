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

import taskpool from '@ohos.taskpool';

@Concurrent
function testRegMatch0001(str: string, regex: RegExp): string[] | null {
  return str.match(regex);
}

@Concurrent
function testRegMatch0002(str: string, regex: RegExp): string | undefined {
  const result = str.match(regex);
  return result?.[0];
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTaskpoolTest002() {
  describe('RegExpTaskpoolTest002', () => {
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
     * @tc.name   testRegMatch0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_TASKPOOL_0001
     * @tc.desc   Test match() with global regex returning all matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegMatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str = 'apple banana apple';
      const regex = /apple/g;
      const task = new taskpool.Task(testRegMatch0001, str, regex);
      const result = await taskpool.execute(task);
      expect(result).assertDeepEquals(['apple', 'apple']);
    });

    /**
     * @tc.name   testRegMatch0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCH_TASKPOOL_0002
     * @tc.desc   Test match() with regex without global flag returning match info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegMatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str = 'apple banana apple';
      const regex = /apple/;
      const task = new taskpool.Task(testRegMatch0002, str, regex);
      const result = await taskpool.execute(task);
      expect(result).assertEqual('apple');
    });
  })
}