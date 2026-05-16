/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

class Test2ClassA1 {
}

class Test2ClassB1 {
  value: int = 0;
}

class Test2Container5 {
  value: int = 0;
}

class Test2Node8 {
  next: Test2Node8 | undefined = undefined;
  value: int = 0;
}

class Test2Box10<T> {
  value: T;

  constructor(v: T) {
    this.value = v;
  }

  getValue(): T {
    return this.value;
  }
}

interface Test2Gettable {
  get(): int;
}

class Test2Getter13 implements Test2Gettable {
  value: int = 0;

  get(): int {
    return this.value;
  }
}

class Test2Base14 {
}

class Test2Derived14 extends Test2Base14 {
}

class Test2SubDerived14 extends Test2Derived14 {
}

class Test2Parent17 {
}

class Test2Child17 extends Test2Parent17 {
}

class Test2Base20 {
  name: string = "Base";
}

class Test2Derived20 extends Test2Base20 {
  derivedName: string = "Derived";
}

function test2GetValue(): int {
  return 10;
}

export default function test2ForLoopCasesTest(): void {
  describe('Test2ForLoopCasesTest', (): void => {
    beforeAll((): void => {
    });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0100
     * @tc.name test2ForLoopCases0001
     * @tc.desc Test Class.of and getSuper traversal in a for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let a1 = new Test2ClassA1();
        let expects: Array<string> = ["Test2ClassA1", "Object"];
        let index: int = 0;

        for (let cls: Class | undefined = Class.of(a1); cls !== undefined; cls = cls!.getSuper()) {
          expect(cls!.getName().contains(expects[index], 0)).assertTrue();
          index += 1;
        }

        expect(index).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0200
     * @tc.name test2ForLoopCases0002
     * @tc.desc Test nullable variable initialized in for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: int = 0;

        for (let b: Test2ClassB1 | undefined = new Test2ClassB1(); b !== undefined; b = undefined) {
          result = b!.value;
        }

        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0300
     * @tc.name test2ForLoopCases0003
     * @tc.desc Test integer accumulation in for-loop header initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let sum: int = 0;

        for (let i: int = 0; i < 10; i++) {
          sum += i;
        }

        expect(sum).assertEqual(45);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0400
     * @tc.name test2ForLoopCases0004
     * @tc.desc Test string variable declared in for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let count: int = 0;

        for (let s: string = "start"; s.length < 10; s = s + "x") {
          count += 1;
        }

        expect(count).assertEqual(5);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0500
     * @tc.name test2ForLoopCases0005
     * @tc.desc Test object reassignment inside a for-loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let container: Test2Container5 | undefined = new Test2Container5();

        for (let i: int = 0; i < 3; i++) {
          container = new Test2Container5();
          container.value = i;
        }

        expect(container!.value).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0600
     * @tc.name test2ForLoopCases0006
     * @tc.desc Test nested for-loops with header variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let total: int = 0;

        for (let i: int = 0; i < 3; i++) {
          for (let j: int = 0; j < 3; j++) {
            total += i * j;
          }
        }

        expect(total).assertEqual(9);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0700
     * @tc.name test2ForLoopCases0007
     * @tc.desc Test multiple variables in a for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: int = 0;

        for (let x: int = 1, y: int = 2; x < 5 && y < 10; x++, y++) {
          result += x + y;
        }

        expect(result).assertEqual(24);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0800
     * @tc.name test2ForLoopCases0008
     * @tc.desc Test linked structure iteration from for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let head: Test2Node8 = new Test2Node8();
        head.value = 1;
        head.next = new Test2Node8();
        head.next!.value = 2;

        let sum: int = 0;
        for (let current: Test2Node8 | undefined = head; current !== undefined; current = current!.next) {
          sum += current!.value;
        }

        expect(sum).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_0900
     * @tc.name test2ForLoopCases0009
     * @tc.desc Test array iteration with index initialized in for-loop header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let arr: int[] = [1, 2, 3, 4, 5];
        let sum: int = 0;

        for (let i: int = 0; i < arr.length; i++) {
          sum += arr[i];
        }

        expect(sum).assertEqual(15);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1000
     * @tc.name test2ForLoopCases0010
     * @tc.desc Test generic object usage in a for-loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let box: Test2Box10<int> = new Test2Box10<int>(42);
        let result: int = 0;

        for (let i: int = 0; i < 3; i++) {
          box = new Test2Box10<int>(i);
          result = box.getValue();
        }

        expect(result).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1100
     * @tc.name test2ForLoopCases0011
     * @tc.desc Test object variable reassignment in a for-loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let obj: Object = new Object();
        let count: int = 0;

        for (let i: int = 0; i < 5; i++) {
          obj = new Number(i);
          count += 1;
        }

        expect(count).assertEqual(5);
        expect(obj !== undefined).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1200
     * @tc.name test2ForLoopCases0012
     * @tc.desc Test function return value used in for-loop header initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: int = 0;

        for (let init: int = test2GetValue(); init < 15; init++) {
          result = init;
        }

        expect(result).assertEqual(14);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1300
     * @tc.name test2ForLoopCases0013
     * @tc.desc Test interface implementation object reassignment in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let getter: Test2Gettable = new Test2Getter13();
        let result: int = 0;

        for (let i: int = 0; i < 3; i++) {
          getter = new Test2Getter13();
          getter.get();
          result = i;
        }

        expect(result).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1400
     * @tc.name test2ForLoopCases0014
     * @tc.desc Test multi-level inheritance chain traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let obj: Test2SubDerived14 = new Test2SubDerived14();
        let count: int = 0;

        for (let cls: Class | undefined = Class.of(obj); cls !== undefined; cls = cls!.getSuper()) {
          count += 1;
        }

        expect(count).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1500
     * @tc.name test2ForLoopCases0015
     * @tc.desc Test variable reassignment in loop body after header initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let x: int = 0;

        for (let i: int = 0; i < 5; i++) {
          x = i;
        }

        expect(x).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1600
     * @tc.name test2ForLoopCases0016
     * @tc.desc Test captured loop value derived from header variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: int = 0;

        for (let i: int = 0; i < 5; i++) {
          let captured: int = i;
          result = captured * 2;
        }

        expect(result).assertEqual(8);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1700
     * @tc.name test2ForLoopCases0017
     * @tc.desc Test Class traversal with parent class detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let child: Test2Child17 = new Test2Child17();
        let result: boolean = false;

        for (let cls: Class | undefined = Class.of(child); cls !== undefined; cls = cls!.getSuper()) {
          if (cls!.getName().contains("Test2Parent17", 0)) {
            result = true;
          }
        }

        expect(result).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1800
     * @tc.name test2ForLoopCases0018
     * @tc.desc Test Map usage inside a loop after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let map: Map<string, int> = new Map<string, int>();
        map.set("a", 1);
        map.set("b", 2);

        let sum: int = 0;
        for (let i: int = 0; i < 2; i++) {
          let key: string = i === 0 ? "a" : "b";
          sum += map.get(key)!;
        }

        expect(sum).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_1900
     * @tc.name test2ForLoopCases0019
     * @tc.desc Test Set initialization alongside a loop counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let set: Set<int> = new Set<int>();
        set.add(1);
        set.add(2);
        set.add(3);

        let count: int = 0;
        for (let i: int = 0; i < 3; i++) {
          count += 1;
        }

        expect(set.has(2)).assertTrue();
        expect(count).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_ARKTS_STATEMENTS_FOR_LOOP_CASES_2000
     * @tc.name test2ForLoopCases0020
     * @tc.desc Test smart-cast after reassignment in a loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('test2ForLoopCases0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let obj: Test2Base20 = new Test2Base20();
        let result: string = "";

        for (let i: int = 0; i < 2; i++) {
          obj = i === 0 ? new Test2Base20() : new Test2Derived20();
          if (obj instanceof Test2Derived20) {
            result = obj.derivedName;
          }
        }

        expect(result).assertEqual("Derived");
        done();
      });
  });
}
