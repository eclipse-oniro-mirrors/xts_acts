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


interface CharNumGroups {
  char: string;
  num: string;
}

@Concurrent
function testRegReplace0001(str: string, pattern: string, replacement: string): boolean {
  const result = str.replace(pattern, replacement);
  return result === 'orange banana apple';
}

@Concurrent
function testRegReplace0002(str: string, pattern: RegExp, replacement: string): boolean {
  const result = str.replace(pattern, replacement);
  return result === 'orange banana orange';
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTaskpoolTest003() {
  describe('RegExpTaskpoolTest003', () => {
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
     * @tc.name   testRegReplace0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_TASKPOOL_0001
     * @tc.desc   Replace the first occurrence of a substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str = 'apple banana apple';
      const task = new taskpool.Task(testRegReplace0001, str, 'apple', 'orange');
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testRegReplace0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_TASKPOOL_0002
     * @tc.desc   Replace all occurrences using global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str = 'apple banana apple';
      const pattern = /apple/g;
      const replacement = 'orange';
      const task = new taskpool.Task(testRegReplace0002, str, pattern, replacement);
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
    });
  });
}