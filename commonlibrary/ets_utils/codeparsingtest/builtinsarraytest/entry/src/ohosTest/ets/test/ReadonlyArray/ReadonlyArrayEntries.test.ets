/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsReadonlyArrayEntriesTest() {
  describe('builtinsReadonlyArrayEntriesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0100
     * @tc.name builtinsReadonlyArrayEntriesTest0100
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0100';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly (number | string)[] = [1, 'abc'];

        let res: IterableIterator<[number, string | number]> = arr.entries();

        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(arr.length).assertEqual(2);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0200
     * @tc.name builtinsReadonlyArrayEntriesTest0200
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0200';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly (undefined | string | null)[] = [undefined, '', null];

        let res: IterableIterator<[number, string | null | undefined]> = arr.entries();

        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(arr.length).assertEqual(3);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0300
     * @tc.name builtinsReadonlyArrayEntriesTest0300
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0300';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly string[] = ['!"#$%&\'()* +,-./:;<=>?@[\\]^_`{|}~'];

        let res: IterableIterator<[number, string]> = arr.entries();

        expect(res.next().value[1]).assertEqual(arr[0]);

        expect(arr.length).assertEqual(1);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0400
     * @tc.name builtinsReadonlyArrayEntriesTest0400
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0400';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly string[] =
          ['!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'];

        let res: IterableIterator<[number, string]> = arr.entries();

        expect(res.next().value[1]).assertEqual(arr[0]);

        expect(arr.length).assertEqual(1);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0500
     * @tc.name builtinsReadonlyArrayEntriesTest0500
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0500';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly string[] = ['!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'];

        let res: IterableIterator<[number, string]> = arr.entries();

        expect(res.next().value[1]).assertEqual(arr[0]);

        expect(arr.length).assertEqual(1);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0600
     * @tc.name builtinsReadonlyArrayEntriesTest0600
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0600';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly string[] = ["\a", "\b", "\f", "\n", "\r", "\t", "\v", "\\", "\'", "\?", "\0", "\d12", "\x1d"];

        let res: IterableIterator<[number, string | null | undefined]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(encodeURI(arr.toString())).assertEqual("a,%08,%0C,%0A,%0D,%09,%0B,%5C,',?,%00,d12,%1D");
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0700
     * @tc.name builtinsReadonlyArrayEntriesTest0700
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0700';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly string[] = ['', '\ud83d\udc46', '\ud83d'];
        expect(arr.toString()).assertContain(',');
        expect(arr.length).assertEqual(3);

        let res: IterableIterator<[number, string]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0800
     * @tc.name builtinsReadonlyArrayEntriesTest0800
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0800';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [Math.floor(1.5)];

        let res: IterableIterator<[number, number]> = arr.entries();
        expect(res.next().value[1]).assertEqual(1);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_0900
     * @tc.name builtinsReadonlyArrayEntriesTest0900
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest0900';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity];

        let res: IterableIterator<[number, number]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(arr.length).assertEqual(5);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_1000
     * @tc.name builtinsReadonlyArrayEntriesTest1000
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest1000';
      console.info(`${caseName} test start`);
      try {
        let x: number = 3;
        let arr: readonly number[] = [x + x, x * x];

        let res: IterableIterator<[number, number]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(arr.length).assertEqual(2);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_1100
     * @tc.name builtinsReadonlyArrayEntriesTest1100
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest1100';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3];

        let res: IterableIterator<[number, number]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        expect(arr.length).assertEqual(5);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_1200
     * @tc.name builtinsReadonlyArrayEntriesTest1200
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest1200';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [];

        let res: IterableIterator<[number, number]> = arr.entries();
        expect(res.next().value).assertUndefined();

        expect(arr.length).assertEqual(0);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_ENTRIES_TEST_1300
     * @tc.name builtinsReadonlyArrayEntriesTest1300
     * @tc.desc readonlyArray entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEntriesTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEntriesTest1300';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: IterableIterator<[number, number]> = arr.entries();
        let index: number = -1;
        do {
          index++;
          expect(res.next().value[1]).assertEqual(arr[index]);
        } while (res.next().done)

        let exp: number[] = [1, 2, 4, 5];

        expect(arr.filter(item => item !== 3)).assertDeepEquals(exp);
        expect(arr.length).assertEqual(5);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}