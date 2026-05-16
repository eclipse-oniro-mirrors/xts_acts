/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


export default function builtinsArrayConstructorTest() {
  describe('BuiltinsArrayConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   buildinsArrayConstructorTest1001
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayConstructorTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
      const array: Array<string> = new Array<string>();
      expect(array.length).assertEqual(0)
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1005
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: number[] = [];
      expect(array.length).assertEqual(0)
      expect(array.toString()).assertEqual("")
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1006
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      const array = ["", 1];
      expect(array.length).assertEqual(2)
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1007
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0700
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      const array = [undefined, "", null];
      expect(array.length).assertEqual(3)
      done()
    })


    /**
     * @tc.name   buildinsArrayConstructorTest1008
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0800
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let str = "!\"#$%&'()* +,-./:;<=>?@[\\]^_`{|}~";
      const array = [str];
      expect(array.toString()).assertEqual(str)
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1009
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_0900
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let str = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const array = [str];
      expect(array.toString()).assertEqual(str)
      done()
    })


    /**
     * @tc.name   buildinsArrayConstructorTest1010
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1000
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let str = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const array = [str];
      expect(array.toString()).assertEqual(str)
      done()
    })


    /**
     * @tc.name   buildinsArrayConstructorTest1011
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array = ["\a", "\b", "\f", "\n", "\r", "\t", "\v", "\\", "\'", "\?", "\0", "\d12", "\x1d"];
      expect(encodeURI(array.toString())).assertEqual("a,%08,%0C,%0A,%0D,%09,%0B,%5C,',?,%00,d12,%1D");
      done()
    })


    /**
     * @tc.name   buildinsArrayConstructorTest1012
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array = ["", "\ud83d\udc46", "\ud83d"];
      expect(array.toString()).assertContain(",");
      expect(array.length).assertEqual(3);
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1013
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array = [Math.floor(1.5)];
      expect(array.toString()).assertEqual('1');
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1014
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity];
      expect(array.length).assertEqual(5);
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1015
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let x = Math.PI;
      let array = [x + x, x * x];
      expect(array.length).assertEqual(2);
      expect(array[0]).assertLarger(6)
      expect(array[1]).assertLarger(9)
      done()
    })

    /**
     * @tc.name   buildinsArrayConstructorTest1016
     * @tc.number SUB_BUILDINS_ARRAY_CONSTRUCTOR_TEST_1600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayConstructorTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array = [123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3];
      expect(array.length).assertEqual(5);
      expect(array[1]).assertEqual(0xcafebabe)
      expect(array[4]).assertEqual(0x3)
      done()
    })
  })
}