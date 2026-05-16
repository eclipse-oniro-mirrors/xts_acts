/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  toLocaleString(locales?: Intl.LocalesArgument, options?: object): string {
    return `${this.name}, ${this.age}`;
  }

  toString(): string {
    return `${this.name}, ${this.age}`;
  }
}

export default function BuiltinsArrayToLocateStringTest(): void {
  describe('BuiltinsArrayToLocateStringTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayToLocaleStringTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_LOCALE_STRING_TEST_0100
     * @tc.desc    Verify toLocaleString with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToLocaleStringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toLocaleString();

      expect(result).assertEqual("");
    });

    /**
     * @tc.name    builtinsArrayToLocaleStringTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_LOCALE_STRING_TEST_0200
     * @tc.desc    Verify toLocaleString with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToLocaleStringTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.toLocaleString();

      expect(result).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.name    builtinsArrayToLocaleStringTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_LOCALE_STRING_TEST_0300
     * @tc.desc    Verify toLocaleString with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToLocaleStringTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = Array.create<string>(3, '');
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";

      const result = arr.toLocaleString();

      expect(result).assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.name    builtinsArrayToLocaleStringTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_LOCALE_STRING_TEST_0400
     * @tc.desc    Verify toLocaleString with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToLocaleStringTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Person[] = Array.create<Person>(2, new Person("", 0));
      arr[0] = new Person("Alice", 25);
      arr[1] = new Person("Bob", 30);

      const result = arr.toLocaleString();

      expect(result).assertEqual("Alice, 25,Bob, 30");
    });

    /**
     * @tc.name    builtinsArrayToLocaleStringTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_LOCALE_STRING_TEST_0500
     * @tc.desc    Verify toLocaleString with mixed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToLocaleStringTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: object[] = Array.create<object>(3, {});
      arr[0] = 1 as object;
      arr[1] = "apple" as object;
      arr[2] = new Person("Alice", 25);

      const result = arr.toLocaleString();

      expect(result).assertEqual("1,apple,Alice, 25");
    });

    /**
     * @tc.name    builtinsArrayToStringTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_STRING_TEST_0100
     * @tc.desc    Verify toString with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToStringTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toString();

      expect(result).assertEqual("");
    });

    /**
     * @tc.name    builtinsArrayToStringTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_STRING_TEST_0200
     * @tc.desc    Verify toString with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToStringTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.toString();

      expect(result).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.name    builtinsArrayToStringTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_STRING_TEST_0300
     * @tc.desc    Verify toString with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToStringTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = Array.create<string>(3, '');
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";

      const result = arr.toString();

      expect(result).assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.name    builtinsArrayToStringTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_STRING_TEST_0400
     * @tc.desc    Verify toString with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToStringTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Person[] = Array.create<Person>(2, new Person("", 0));
      arr[0] = new Person("Alice", 25);
      arr[1] = new Person("Bob", 30);

      const result = arr.toString();

      expect(result).assertEqual("Alice, 25,Bob, 30");
    });

    /**
     * @tc.name    builtinsArrayToStringTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_STRING_TEST_0500
     * @tc.desc    Verify toString with mixed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToStringTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: object[] = Array.create<object>(3, {});
      arr[0] = 1 as object;
      arr[1] = "apple" as object;
      arr[2] = new Person("Alice", 25);

      const result = arr.toString();

      expect(result).assertEqual("1,apple,Alice, 25");
    });
  });
}