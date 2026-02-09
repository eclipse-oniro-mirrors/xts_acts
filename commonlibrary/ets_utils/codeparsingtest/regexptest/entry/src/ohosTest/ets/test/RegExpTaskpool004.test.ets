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
function testRegSearch0001(str: string, pattern: RegExp): number {
  return str.search(pattern);
}

@Concurrent
function testRegSearch0002(str: string, pattern: RegExp): number {
  return str.search(pattern);
}

@Concurrent
function testRegSplit0001(str: string, pattern: RegExp): string[] {
  return str.split(pattern);
}

@Concurrent
function testRegSplit0002(str: string, pattern: RegExp): string[] {
  return str.split(pattern);
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function RegExpTaskpoolTest004() {
  describe('RegExpTaskpoolTest004', () => {
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
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_TASKPOOL_0001
     * @tc.desc   Use simple regex to find the first match and return the index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str: string = 'abc123';
      const pattern: RegExp = /b/;
      const task = new taskpool.Task(testRegSearch0001, str, pattern);
      const result = await taskpool.execute(task);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testRegSearch0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_TASKPOOL_0002
     * @tc.desc   Use regex to search for a non-existing match, should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str: string = 'abc123';
      const pattern: RegExp = /z/;
      const task = new taskpool.Task(testRegSearch0002, str, pattern);
      const result = await taskpool.execute(task);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   testRegSplit0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TASKPOOL_0001
     * @tc.desc   Split string by simple whitespace regular expression / /
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str: string = 'a b c';
      const pattern: RegExp = / /;
      const task = new taskpool.Task(testRegSplit0001, str, pattern);
      const result = await taskpool.execute(task);
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   testRegSplit0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TASKPOOL_0002
     * @tc.desc   Split string by digits using regular expression /\d/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegSplit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const str: string = 'a1b2c3';
      const pattern: RegExp = /\d/;
      const task = new taskpool.Task(testRegSplit0002, str, pattern);
      const result = await taskpool.execute(task);
      expect(result).assertDeepEquals(['a', 'b', 'c', '']);
    });
  })
}