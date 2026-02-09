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


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function testRegCtr0001(re: RegExp): boolean {
  return re.test('ABC');
}

@Concurrent
function testRegCtr0002(re1: RegExp): boolean {
  const re2: RegExp = new RegExp(re1);
  return re2.test('FOO') && re2.source === 'foo' && re2.flags === 'gi';
}

@Concurrent
function testRegTest0001(re: RegExp): boolean {
  return re.test('table football');
}

@Concurrent
function testRegTest0002(re: RegExp): boolean {
  const firstResult = re.test('table football');
  re.lastIndex = 6;
  const secondResult = re.test('table football');
  return !firstResult && secondResult;
}

@Concurrent
function testRegExec0001(): boolean {
  const regex = /(\w+)\s(\w+)/;
  const str = 'Hello World';
  const result = regex.exec(str);

  return (
    result![0] === 'Hello World' &&
      result![1] === 'Hello' &&
      result![2] === 'World' &&
      result!.index === 0 &&
      result!.input === 'Hello World'
  );
}

@Concurrent
function testRegExec0002(): boolean {
  const regex = /foo/g;
  const str = 'foo foo foo';
  const results: string[] = [];
  let match: RegExpExecArray | null;

  while ((match = regex.exec(str)) !== null) {
    results.push(match[0]);
  }

  return results.length === 3 && results[0] === 'foo' && regex.lastIndex === 0;
}

export default function RegExpTaskpoolTest001() {
  describe('RegExpTaskpoolTest001', () => {
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
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TASKPOOL_0001
     * @tc.desc   Verify RegExp can be created from a string pattern with flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const re: RegExp = new RegExp('abc', 'i');
      const task = new taskpool.Task(testRegCtr0001, re);
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
      expect(re.source).assertEqual('abc');
      expect(re.flags).assertEqual('i');
    });

    /**
     * @tc.name   testRegCtr0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TASKPOOL_0002
     * @tc.desc   Verify RegExp constructed from another RegExp copies source and flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegCtr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const re1: RegExp = /foo/gi;
      const re2: RegExp = new RegExp(re1);
      const task = new taskpool.Task(testRegCtr0002, re1);
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
      expect(re2.source).assertEqual('foo');
      expect(re2.flags).assertEqual('gi');
      expect(re2.test('FOO')).assertTrue();
    });

    /**
     * @tc.name   testRegTest0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_TASKPOOL_0001
     * @tc.desc   Basic match: check if a pattern exists in the string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const regex = /foo/;
      const task = new taskpool.Task(testRegTest0001, regex);
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testRegTest0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TEST_TASKPOOL_0003
     * @tc.desc   Sticky flag: test behavior of test() with /y flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const regex = /foo/y;
      const task = new taskpool.Task(testRegTest0002, regex);
      const result = await taskpool.execute(task);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testRegExec0001
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_TASKPOOL_0001
     * @tc.desc   Verify exec() returns full match, capture groups, index, input and groups properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const regex = /(\w+)\s(\w+)/;
      const str = 'Hello World';
      const task = new taskpool.Task(testRegExec0001);
      const result = await taskpool.execute(task);

      expect(result).assertTrue();

      expect(regex.source).assertEqual('(\\w+)\\s(\\w+)');
      expect(regex.flags).assertEqual('');
      expect(regex.test(str)).assertTrue();
    });

    /**
     * @tc.name   testRegExec0002
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_TASKPOOL_0003
     * @tc.desc   Verify exec() iterates through all matches with global flag and updates lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExec0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const regex = /foo/g;
      const str = 'foo foo foo';
      const task = new taskpool.Task(testRegExec0002);
      const result = await taskpool.execute(task);

      expect(result).assertTrue();

      expect(regex.source).assertEqual('foo');
      expect(regex.flags).assertEqual('g');
      expect(regex.lastIndex).assertEqual(0);
    });
  })
}