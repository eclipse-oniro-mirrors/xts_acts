/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

interface ValueObject {
  value: string;
}

class Person {
  age: number;

  constructor(age: number) {
    this.age = age;
  }
}

export default function ArrayTest() {
  describe("ArrayTest", (): void => {

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0100
     * @tc.name      testArrayConstructor001
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConstructor001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<number>(1, 2, 3, 4);
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0200
     * @tc.name      testArrayConstructor002
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConstructor002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<string>('a', 'b', 'c', 'd');
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0300
     * @tc.name      testArrayConstructor003
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConstructor003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<string[]>(
          ['a'],
          ['b'],
          ['c'],
          ['d']
        );
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0400
     * @tc.name      testArrayConstructor004
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConstructor004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<ValueObject>({
          value: 'a'
        });
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0500
     * @tc.name      testArrayConstructor005
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConstructor005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<boolean>(true, false);
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0600
     * @tc.name      testArrayConstructor006
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConstructor006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<undefined>(undefined);
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0700
     * @tc.name      testArrayConstructor007
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConstructor007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<null>(null);
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONSTRUCTOR_TEST_0800
     * @tc.name      testArrayConstructor008
     * @tc.desc      Test the function of the interface ArrayConstructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConstructor008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<number | string | boolean>(2, 's', true);
        expect(String(array != undefined)).assertEqual('true');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_TEST_0100
     * @tc.name      testArrayConcat001
     * @tc.desc      Test the function of the interface ArrayConcat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcat001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(4, 5, 6);
        let array2 = new Array<number>(7, 8, 9);
        let concatArray = array1.concat(array2);
        expect(JSON.stringify(concatArray)).assertEqual('[4,5,6,7,8,9]');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_TEST_0200
     * @tc.name      testArrayConcat002
     * @tc.desc      Test the function of the interface ArrayConcat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcat002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<number>(1, 2, 3);
        let array1 = new Array<number>(4, 5, 6);
        let array2 = new Array<number>(7, 8, 9);
        let concatArray = array.concat(array1, array2);
        expect(JSON.stringify(concatArray)).assertEqual('[1,2,3,4,5,6,7,8,9]');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_TEST_0300
     * @tc.name      testArrayConcat003
     * @tc.desc      Test the function of the interface ArrayConcat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConcat003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array2D1: Array<Array<number>> = [[1, 2, 3], [4, 5, 6]];
        let array2D2: Array<Array<number>> = [[7, 8, 9], [10, 11, 12]];
        let concatArray: Array<Array<number>> = array2D1.concat(array2D2)
        expect(JSON.stringify(concatArray)).assertEqual('[[1,2,3],[4,5,6],[7,8,9],[10,11,12]]');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_TEST_0400
     * @tc.name      testArrayConcat004
     * @tc.desc      Test the function of the interface ArrayConcat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConcat004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<number>(1, 2, 3);
        let concatArray = array.concat(array);
        expect(JSON.stringify(concatArray)).assertEqual('[1,2,3,1,2,3]');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CONCAT_TEST_0500
     * @tc.name      testArrayConcat005
     * @tc.desc      Test the function of the interface ArrayConcat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayConcat005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array = new Array<number>(1, 2, 3);
        let array1 = new Array<number>(4, 5, 6);
        let array2 = new Array<number>(7, 8, 9);
        let concatArray = array.concat(array1);
        let concatArray1 = concatArray.concat(array2);
        expect(JSON.stringify(concatArray1)).assertEqual('[1,2,3,4,5,6,7,8,9]');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0100
     * @tc.name      testArrayShrinkTo001
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayShrinkTo001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(0);
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0200
     * @tc.name      testArrayShrinkTo002
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(-0);
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0300
     * @tc.name      testArrayShrinkTo003
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(-2);
        expect(array1.length).assertEqual(5);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0400
     * @tc.name      testArrayShrinkTo004
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(1);
        expect(array1.length).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0500
     * @tc.name      testArrayShrinkTo005
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(Infinity.toInt());
        expect(array1.length).assertEqual(5);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0600
     * @tc.name      testArrayShrinkTo006
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo((-Infinity).toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0700
     * @tc.name      testArrayShrinkTo007
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(6);
        expect(array1.length).assertEqual(5);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0800
     * @tc.name      testArrayShrinkTo008
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3, 4, 5);
        array1.shrinkTo(5);
        expect(array1.length).assertEqual(5);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_0900
     * @tc.name      testArrayShrinkTo009
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>();
        array1.shrinkTo(0);
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1000
     * @tc.name      testArrayShrinkTo010
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(2);
        expect(array1.length).assertEqual(2);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1100
     * @tc.name      testArrayShrinkTo011
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number | string>(1, 2, 3, 'a');
        array1.shrinkTo(3);
        expect(array1.length).assertEqual(3);
        array1.shrinkTo(2);
        expect(array1.length).assertEqual(2);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1200
     * @tc.name      testArrayShrinkTo012
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number | string>(1, 2, 3, 'a', 'b', 'c');
        array1.shrinkTo(5);
        expect(array1.length).assertEqual(5);
        array1.shrinkTo(5);
        expect(array1.length).assertEqual(5);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1300
     * @tc.name      testArrayShrinkTo013
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number | string>(1, 2, 3, 'a', 'b', 'c');
        array1.shrinkTo(4);
        expect(array1.length).assertEqual(4);
        array1.shrinkTo(5);
        expect(array1.length).assertEqual(4);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1400
     * @tc.name      testArrayShrinkTo014
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number | string>(1, 2, 3);
        array1.extendTo(5, 10);
        array1.shrinkTo(3);
        expect(array1.length).assertEqual(3);
        array1.extendTo(5, 10);
        array1.shrinkTo(3);
        expect(array1.length).assertEqual(3);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1500
     * @tc.name      testArrayShrinkTo015
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.MAX_SAFE_INTEGER.toInt());
        expect(array1.length).assertEqual(3);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1600
     * @tc.name      testArrayShrinkTo016
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.MIN_SAFE_INTEGER.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1700
     * @tc.name      testArrayShrinkTo017
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.MAX_VALUE.toInt());
        expect(array1.length).assertEqual(3);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1800
     * @tc.name      testArrayShrinkTo018
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>();
        array1.shrinkTo(Number.MIN_VALUE.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_1900
     * @tc.name      testArrayShrinkTo019
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1);
        array1.shrinkTo(Number.MIN_VALUE.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2000
     * @tc.name      testArrayShrinkTo020
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.MIN_VALUE.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2100
     * @tc.name      testArrayShrinkTo021
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.NEGATIVE_INFINITY.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2200
     * @tc.name      testArrayShrinkTo022
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.POSITIVE_INFINITY.toInt());
        expect(array1.length).assertEqual(3);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2300
     * @tc.name      testArrayShrinkTo023
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayShrinkTo023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>();
        array1.shrinkTo(Number.EPSILON.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2400
     * @tc.name      testArrayShrinkTo024
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1);
        array1.shrinkTo(Number.EPSILON.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_SHRINK_TO_TEST_2500
     * @tc.name      testArrayShrinkTo025
     * @tc.desc      Test the function of the interface ArrayShrinkTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayShrinkTo025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        let array1 = new Array<number>(1, 2, 3);
        array1.shrinkTo(Number.EPSILON.toInt());
        expect(array1.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0100
     * @tc.name      testArrayCreate001
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate001';
      try {
        let array = Array.create<number>(0, 0);
        expect(array.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0200
     * @tc.name      testArrayCreate002
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate002';
      try {
        let array = Array.create<number>(-0, 0);
        expect(array.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0300
     * @tc.name      testArrayCreate003
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate003';
      try {
        let array = Array.create<number>(-5, 0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(err.message).assertEqual('size = -5');
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0400
     * @tc.name      testArrayCreate004
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate004';
      try {
        let array = Array.create<number>(8, 0);
        expect(array.length).assertEqual(8);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0800
     * @tc.name      testArrayCreate008
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate008';
      try {
        let array = Array.create<number>(Int.MIN_VALUE, 0);
      } catch (err) {
        err = err as Error;
        console.error(`Expected error caught: ${err.message}`);
        expect(err.message).assertEqual('size = -2147483648');
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_0900
     * @tc.name      testArrayCreate009
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayCreate009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate009';
      try {
        let array = Array.create<number>(Int.MAX_VALUE, 0);
        expect(array.length).assertEqual(8);
      } catch (err) {
        err = err as Error;
        console.error(`Expected error caught: ${err.message}`);
        expect(err.message).assertEqual('size = -8');
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1400
     * @tc.name      testArrayCreate014
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate014';
      try {
        let array = Array.create<number>(4, 2);
        expect(array[2]).assertEqual(2);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1500
     * @tc.name      testArrayCreate015
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate015';
      try {
        let array = Array.create<string>(4, 'a');
        expect(array[2]).assertEqual('a');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1600
     * @tc.name      testArrayCreate016
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate016';
      try {
        let array = Array.create<boolean>(4, true);
        expect(array[2]).assertEqual(true);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1700
     * @tc.name      testArrayCreate017
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate017';
      try {
        let array = Array.create<Array<number>>(4, new Array<number>(1, 2));
        expect(array[2][0]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1800
     * @tc.name      testArrayCreate018
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate018';
      try {
        let array = Array.create<undefined>(4, undefined);
        expect(array[0]).assertEqual(undefined);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_1900
     * @tc.name      testArrayCreate019
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate019';
      try {
        let array = Array.create<null>(4, null);
        expect(array[0]).assertEqual(null);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_CREATE_TEST_2000
     * @tc.name      testArrayCreate020
     * @tc.desc      Test the function of the interface ArrayCreate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayCreate020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayCreate020';
      try {
        let person = new Person(23);
        let array = Array.create<Person>(4, person);
        expect(array[0].age).assertEqual(23);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });


    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_0100
     * @tc.name      testArrayExtendTo001
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo001';
      try {
        let array = new Array<number>(1, 2, 3, 4);
        array.extendTo(0, 0)
        expect(array.length).assertEqual(4);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_0200
     * @tc.name      testArrayExtendTo002
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo002';
      try {
        let array = new Array<number>(1, 2, 3, 4);
        array.extendTo(-0, 0)
        expect(array.length).assertEqual(4);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_0300
     * @tc.name      testArrayExtendTo003
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo003';
      try {
        let array = new Array<number>(1, 2, 3, 4);
        array.extendTo(7, 0)
        expect(array.length).assertEqual(7);
        expect(array[5]).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_0900
     * @tc.name      testArrayExtendTo009
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo009';
      try {
        let array = Array.create<number>(0, 0);
        array.extendTo(Number.MIN_VALUE.toInt(), 0)
        expect(array.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1000
     * @tc.name      testArrayExtendTo010
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo010';
      try {
        let array = Array.create<number>(1, 1);
        array.extendTo(Number.MIN_VALUE.toInt(), 0)
        expect(array.length).assertEqual(1);
        expect(array[0]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1100
     * @tc.name      testArrayExtendTo011
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo011';
      try {
        let array = Array.create<string>(1, 'a');
        array.extendTo(Number.MIN_VALUE.toInt(), 'b')
        expect(array.length).assertEqual(1);
        expect(array[0]).assertEqual('a');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1200
     * @tc.name      testArrayExtendTo012
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo012';
      try {
        let array = Array.create<number>(6, 3);
        array.extendTo(Number.MIN_VALUE.toInt(), 2)
        expect(array.length).assertEqual(6);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1300
     * @tc.name      testArrayExtendTo013
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo013';
      try {
        let array = Array.create<number>(0, 0);
        array.extendTo(Number.EPSILON.toInt(), 0)
        expect(array.length).assertEqual(0);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1400
     * @tc.name      testArrayExtendTo014
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo014';
      try {
        let array = Array.create<number>(1, 1);
        array.extendTo(Number.EPSILON.toInt(), 0)
        expect(array.length).assertEqual(1);
        expect(array[0]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1500
     * @tc.name      testArrayExtendTo015
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo015';
      try {
        let array = Array.create<string>(1, 'a');
        array.extendTo(Number.EPSILON.toInt(), 'b')
        expect(array.length).assertEqual(1);
        expect(array[0]).assertEqual('a');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1600
     * @tc.name      testArrayExtendTo016
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo016';
      try {
        let array = Array.create<number>(6, 3);
        array.extendTo(Number.EPSILON.toInt(), 2)
        expect(array.length).assertEqual(6);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_1900
     * @tc.name      testArrayExtendTo019
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo019';
      try {
        let array = Array.create<number>(4, 1);
        array.extendTo(3, 0)
        expect(array.length).assertEqual(4);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2000
     * @tc.name      testArrayExtendTo020
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo020';
      try {
        let array = Array.create<number>(4, 1);
        array.extendTo(4, 0)
        expect(array.length).assertEqual(4);
        expect(array[2]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2100
     * @tc.name      testArrayExtendTo021
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo021';
      try {
        let array = Array.create<number>(0, 0);
        array.extendTo(2, 1)
        expect(array.length).assertEqual(2);
        expect(array[0]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2200
     * @tc.name      testArrayExtendTo022
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo022';
      try {
        let array = Array.create<number>(2, 0);
        array.extendTo(4, 1)
        expect(array.length).assertEqual(4);
        expect(array[1]).assertEqual(0);
        expect(array[3]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2300
     * @tc.name      testArrayExtendTo023
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo023';
      try {
        let array = Array.create<number>(2, 2);
        array.extendTo(4, 1)
        expect(array.length).assertEqual(4);
        expect(array[1]).assertEqual(2);
        expect(array[3]).assertEqual(1);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2400
     * @tc.name      testArrayExtendTo024
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo024';
      try {
        let array = Array.create<string>(2, 'a');
        array.extendTo(4, 'b')
        expect(array.length).assertEqual(4);
        expect(array[1]).assertEqual('a');
        expect(array[3]).assertEqual('b');
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2500
     * @tc.name      testArrayExtendTo025
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayExtendTo025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo025';
      try {
        let array = Array.create<boolean>(2, true);
        array.extendTo(4, true)
        expect(array.length).assertEqual(4);
        expect(array[3]).assertEqual(true);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2600
     * @tc.name      testArrayExtendTo026
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayExtendTo026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo026';
      try {
        let array = Array.create<Array<number>>(2, new Array<number>(1, 2));
        array.extendTo(4, new Array<number>(3, 4))
        expect(array.length).assertEqual(4);
        expect(array[1][1]).assertEqual(2);
        expect(array[2][1]).assertEqual(4);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2700
     * @tc.name      testArrayExtendTo027
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo027';
      try {
        let person = new Person(23);
        let array = Array.create<Person>(2, person);
        array.extendTo(4, new Person(25))
        expect(array.length).assertEqual(4);
        expect(array[1].age).assertEqual(23);
        expect(array[2].age).assertEqual(25);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2800
     * @tc.name      testArrayExtendTo028
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo028';
      try {
        let array = Array.create<undefined>(2, undefined);
        array.extendTo(4, undefined)
        expect(array.length).assertEqual(4);
        expect(array[2]).assertEqual(undefined);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_2900
     * @tc.name      testArrayExtendTo029
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayExtendTo029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testArrayExtendTo029';
      try {
        let array = Array.create<null>(2, null);
        array.extendTo(4, null)
        expect(array.length).assertEqual(4);
        expect(array[2]).assertEqual(null);
      } catch (err) {
        if (err instanceof BusinessError) {
          console.error(`Expected error caught: ${err.message}`);
          expect(false).assertFail();
        }
      }
    });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_3000
     * @tc.name      testArrayExtendTo030
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testArrayExtendTo030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG: string = 'testArrayExtendTo030';
    //   try {
    //     type union = number | string;
    //     let array = new Array<union>(0, 2, 'a', 'b')
    //     array.extendTo(6, 3)
    //     array.extendTo(8, 'c')
    //     expect(array.length).assertEqual(8);
    //     expect(array[5]).assertEqual(3);
    //     expect(array[7]).assertEqual('c');
    //   } catch (err) {
    //     if (err instanceof BusinessError) {
    //       console.error(`Expected error caught: ${err.message}`);
    //       expect(false).assertFail();
    //     }
    //   }
    // });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_3100
     * @tc.name      testArrayExtendTo031
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testArrayExtendTo031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG: string = 'testArrayExtendTo031';
    //   try {
    //     type union = number | string;
    //     let array = new Array<union>(0, 2, 'a', 'b')
    //     array.extendTo(6, 3)
    //     array.extendTo(6, 'c')
    //     expect(array.length).assertEqual(6);
    //     expect(array[5]).assertEqual(3);
    //   } catch (err) {
    //     if (err instanceof BusinessError) {
    //       console.error(`Expected error caught: ${err.message}`);
    //       expect(false).assertFail();
    //     }
    //   }
    // });

    /**
     * @tc.number    SUB_ARRAY_EXTEND_TO_TEST_3200
     * @tc.name      testArrayExtendTo032
     * @tc.desc      Test the function of the interface ArrayExtendTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // it("testArrayExtendTo032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG: string = 'testArrayExtendTo032';
    //   try {
    //     type union = number | string;
    //     let array = new Array<union>(0, 2, 'a', 'b')
    //     array.extendTo(6, 3)
    //     array.extendTo(5, 'c')
    //     expect(array.length).assertEqual(6);
    //     expect(array[5]).assertEqual(3);
    //     expect(array[4]).assertEqual(3);
    //   } catch (err) {
    //     if (err instanceof BusinessError) {
    //       console.error(`Expected error caught: ${err.message}`);
    //       expect(false).assertFail();
    //     }
    //   }
    // });
  })
}