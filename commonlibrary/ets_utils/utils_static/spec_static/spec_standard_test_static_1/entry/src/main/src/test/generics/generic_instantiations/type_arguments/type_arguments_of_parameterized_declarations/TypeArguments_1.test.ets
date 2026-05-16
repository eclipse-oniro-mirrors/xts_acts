/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level,
  expect
} from "../../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => resolve(0), time);
  });
}

interface IEmpty {}
class XClass implements IEmpty {}
final class YClass extends XClass {}
enum Color { Red, Green, Blue }

class GenericTwo<V, T> {
  private v: V;
  private t: T;
  constructor(v: V, t: T) {
    this.v = v;
    this.t = t;
  }
}

class A<T> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

class AWithConstraint<T extends Object> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

class AWithObjectNullConstraint<T extends Object | null> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

class Keys { key: number = 0; key1: int = 0; key2: string = ""; }
function foo<T>(a: T, b: T): T { return a; }
function fooWithConstraint<T extends Object>(a: T, b: T): T { return a; }
function fooWithObjectNullConstraint<T extends Object | null>(a: T, b: T): T { return a; }
function fooWithObjectConstraint<T extends Object>(a: T, b: T): T { return a; }

export default function TypeArgumentsTest1() {
  describe("TypeArgumentsTest1", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0100
     * @tc.name      testTypeArgumentsOne0001
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass>|null, XClass> = new GenericTwo<FixedArray<XClass>|null, XClass>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0200
     * @tc.name      testTypeArgumentsOne0002
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass>|null, XClass> = new GenericTwo<FixedArray<XClass>|null, XClass>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0300
     * @tc.name      testTypeArgumentsOne0003
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<undefined, undefined> = new GenericTwo<undefined, undefined>(undefined, undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0400
     * @tc.name      testTypeArgumentsOne0004
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass> = new AWithConstraint<XClass>(new XClass());
      expect(v instanceof AWithConstraint).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0500
     * @tc.name      testTypeArgumentsOne0005
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithObjectNullConstraint<XClass|null> = new AWithObjectNullConstraint<XClass|null>(null);
      expect(v instanceof AWithObjectNullConstraint).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0600
     * @tc.name      testTypeArgumentsOne0006
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[], undefined> = new GenericTwo<XClass[], undefined>([new XClass()], undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0700
     * @tc.name      testTypeArgumentsOne0007
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[][], undefined> = new GenericTwo<XClass[][], undefined>([[new XClass()]], undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0800
     * @tc.name      testTypeArgumentsOne0008
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<[XClass, XClass], undefined> = new GenericTwo<[XClass, XClass], undefined>([new XClass(), new XClass()], undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_0900
     * @tc.name      testTypeArgumentsOne0009
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<[XClass, XClass]|null, undefined> = new GenericTwo<[XClass, XClass]|null, undefined>(null, undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1000
     * @tc.name      testTypeArgumentsOne0010
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new XClass();
      let result = foo<XClass>(v, new YClass());
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1100
     * @tc.name      testTypeArgumentsOne0011
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new YClass();
      let result = fooWithConstraint<XClass>(v, new XClass());
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1200
     * @tc.name      testTypeArgumentsOne0012
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = foo<XClass|null>(null, new XClass());
      expect(result).assertNull();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1300
     * @tc.name      testTypeArgumentsOne0013
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = fooWithObjectNullConstraint<YClass|null>(null, new YClass());
      expect(result).assertNull();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1400
     * @tc.name      testTypeArgumentsOne0014
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: IEmpty = new XClass();
      let result = foo<IEmpty>(v, v);
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1500
     * @tc.name      testTypeArgumentsOne0015
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: IEmpty = new YClass();
      let result = fooWithObjectConstraint<IEmpty>(v, new YClass());
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1600
     * @tc.name      testTypeArgumentsOne0016
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color[] = [Color.Red];
      let result = fooWithObjectConstraint<Color[]>(v, [Color.Blue]);
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1700
     * @tc.name      testTypeArgumentsOne0017
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new XClass();
      let result = foo<XClass>(v, new YClass());
      expect(result).assertEqual(v);
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1800
     * @tc.name      testTypeArgumentsOne0018
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[], XClass> = new GenericTwo<XClass[], XClass>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_1900
     * @tc.name      testTypeArgumentsOne0019
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[][]|null, XClass> = new GenericTwo<XClass[][]|null, XClass>(null, new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2000
     * @tc.name      testTypeArgumentsOne0020
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass|null, XClass[]> = new GenericTwo<XClass|null, XClass[]>(new XClass(), [new XClass()]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2100
     * @tc.name      testTypeArgumentsOne0021
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass|null, XClass|null> = new GenericTwo<XClass|null, XClass|null>(new XClass(), new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2200
     * @tc.name      testTypeArgumentsOne0022
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[], XClass[]> = new GenericTwo<XClass[], XClass[]>([new XClass(), new XClass()], [new XClass()]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2300
     * @tc.name      testTypeArgumentsOne0023
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass | null>, undefined> = new GenericTwo<FixedArray<XClass | null>, undefined>([null, new XClass()], undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2400
     * @tc.name      testTypeArgumentsOne0024
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass, XClass> = new GenericTwo<XClass, XClass>(new XClass(), new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2500
     * @tc.name      testTypeArgumentsOne0025
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass> = new AWithConstraint<XClass>(new XClass());
      expect(v instanceof AWithConstraint).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2600
     * @tc.name      testTypeArgumentsOne0026
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass> = new AWithConstraint<XClass>(new XClass());
      expect(v instanceof AWithConstraint).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2700
     * @tc.name      testTypeArgumentsOne0027
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithObjectNullConstraint<XClass|null> = new AWithObjectNullConstraint<XClass|null>(null);
      expect(v instanceof AWithObjectNullConstraint).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2800
     * @tc.name      testTypeArgumentsOne0028
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<undefined, undefined> = new GenericTwo<undefined, undefined>(undefined, undefined);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_2900
     * @tc.name      testTypeArgumentsOne0029
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[], XClass|null> = new GenericTwo<XClass[], XClass|null>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3000
     * @tc.name      testTypeArgumentsOne0030
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass>, FixedArray<XClass|null>> = new GenericTwo<FixedArray<XClass>, FixedArray<XClass|null>>([new XClass()], [new XClass(), null]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3100
     * @tc.name      testTypeArgumentsOne0031
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass|null, XClass|null> = new GenericTwo<XClass|null, XClass|null>(null, null);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3200
     * @tc.name      testTypeArgumentsOne0032
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<YClass, YClass[]> = new GenericTwo<YClass, YClass[]>(new YClass(), [new YClass()]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3300
     * @tc.name      testTypeArgumentsOne0033
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<[XClass, XClass], XClass> = new GenericTwo<[XClass, XClass], XClass>([new XClass(), new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3400
     * @tc.name      testTypeArgumentsOne0034
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass, XClass> = new GenericTwo<XClass, XClass>(new XClass(), new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3500
     * @tc.name      testTypeArgumentsOne0035
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[], XClass> = new GenericTwo<XClass[], XClass>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3600
     * @tc.name      testTypeArgumentsOne0036
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass|null, XClass> = new GenericTwo<XClass|null, XClass>(new XClass(), new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3700
     * @tc.name      testTypeArgumentsOne0037
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass, XClass|null> = new GenericTwo<XClass, XClass|null>(new XClass(), null);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3800
     * @tc.name      testTypeArgumentsOne0038
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass>, XClass> = new GenericTwo<FixedArray<XClass>, XClass>([new XClass()], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_3900
     * @tc.name      testTypeArgumentsOne0039
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass|null, FixedArray<XClass>> = new GenericTwo<XClass|null, FixedArray<XClass>>(new XClass(), [new XClass()]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4000
     * @tc.name      testTypeArgumentsOne0040
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass, XClass[]|null> = new GenericTwo<XClass, XClass[]|null>(new XClass(), null);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4100
     * @tc.name      testTypeArgumentsOne0041
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[][], XClass> = new GenericTwo<XClass[][], XClass>([[new XClass()]], new XClass());
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4200
     * @tc.name      testTypeArgumentsOne0042
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<XClass[]|null, XClass[][]> = new GenericTwo<XClass[]|null, XClass[][]>(null, [[new XClass()]]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4300
     * @tc.name      testTypeArgumentsOne0043
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<FixedArray<XClass|null>, FixedArray<XClass|null>> = new GenericTwo<FixedArray<XClass|null>, FixedArray<XClass|null>>([null, new XClass()], [new XClass(), null]);
      expect(v instanceof GenericTwo).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_ONE_4400
     * @tc.name      testTypeArgumentsOne0044
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArgumentsOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: GenericTwo<[XClass, XClass], [XClass, XClass]|null> = new GenericTwo<[XClass, XClass], [XClass, XClass]|null>([new XClass(), new XClass()], null);
      expect(v instanceof GenericTwo).assertTrue();
    });
  });
}