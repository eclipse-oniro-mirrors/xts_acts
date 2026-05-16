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
class Keys {
  key: number = 0;
  key1: number = 0;
  key2: string = "";
}
class KeyHolder<T extends keyof Keys> {}

// 单泛型通用类
class A<T> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

// 双泛型通用类
class Pair<V, T> {
  private v: V;
  private t: T;
  constructor(v: V, t: T) { this.v = v; this.t = t; }
}

class AWithConstraint<T extends Object | null> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

class AWithExtendedConstraint<T extends XClass | null> {
  private t: T;
  constructor(t: T) { this.t = t; }
}

type FuncVoid = () => void;

export default function TypeArgumentsTest() {
  describe("TypeArgumentsTest", () => {
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
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0100
     * @tc.name      testTypeArguments0001
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass> = new A<XClass>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0200
     * @tc.name      testTypeArguments0002
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass> = new AWithConstraint<XClass>(new XClass())
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0300
     * @tc.name      testTypeArguments0003
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass | null> = new A<XClass | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0400
     * @tc.name      testTypeArguments0004
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>> = new A<A<XClass>>(new A<XClass>(new XClass()))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0500
     * @tc.name      testTypeArguments0005
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<A<XClass>> = new AWithConstraint<A<XClass>>(new A<XClass>(new XClass()))
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0600
     * @tc.name      testTypeArguments0006
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<IEmpty> = new A<IEmpty>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0700
     * @tc.name      testTypeArguments0007
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<A<IEmpty>> = new AWithConstraint<A<IEmpty>>(new A<IEmpty>(new XClass()))
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0800
     * @tc.name      testTypeArguments0008
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<IEmpty> | null> = new A<A<IEmpty> | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_0900
     * @tc.name      testTypeArguments0009
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[]> = new A<XClass[]>([]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1000
     * @tc.name      testTypeArguments0010
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[]> = new A<XClass[]>([]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1100
     * @tc.name      testTypeArguments0011
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[] | null> = new A<XClass[] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1200
     * @tc.name      testTypeArguments0012
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass[] | null> = new AWithConstraint<XClass[] | null>(null)
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1300
     * @tc.name      testTypeArguments0013
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>[]> = new A<A<XClass>[]>([new A<XClass>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1400
     * @tc.name      testTypeArguments0014
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>[]> = new A<A<XClass[]>[]>([new A<XClass[]>([new XClass()])]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1500
     * @tc.name      testTypeArguments0015
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<IEmpty>[]> = new A<A<IEmpty>[]>([new A<IEmpty>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1600
     * @tc.name      testTypeArguments0016
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<Color[]> = new AWithConstraint<Color[]>([Color.Red])
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1700
     * @tc.name      testTypeArguments0017
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<Color[]>[]> = new A<A<Color[]>[]>([new A<Color[]>([Color.Red])])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1800
     * @tc.name      testTypeArguments0018
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<number[]> = new A<number[]>([1, 2, 3])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_1900
     * @tc.name      testTypeArguments0019
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass> = new A<XClass>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2000
     * @tc.name      testTypeArguments0020
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass | null> = new A<XClass | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2100
     * @tc.name      testTypeArguments0021
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>> = new A<A<XClass>>(new A<XClass>(new XClass()))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2200
     * @tc.name      testTypeArguments0022
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[]> = new A<XClass[]>([]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2300
     * @tc.name      testTypeArguments0023
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>[]> = new A<A<XClass>[]>([new A<XClass>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2400
     * @tc.name      testTypeArguments0024
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<AWithConstraint<XClass | null>[]> = new AWithConstraint<AWithConstraint<XClass | null>[]>([new AWithConstraint<XClass | null>(new XClass())])
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2500
     * @tc.name      testTypeArguments0025
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>[]> = new A<A<XClass[]>[]>([new A<XClass[]>([new XClass()])]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2600
     * @tc.name      testTypeArguments0026
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>[]> = new A<A<XClass[]>[]>([new A<XClass[]>([new XClass()])])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2700
     * @tc.name      testTypeArguments0027
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<number> = new A<number>(1)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2800
     * @tc.name      testTypeArguments0028
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<Color> = new A<Color>(Color.Red)
      expect(v != null).assertTrue()
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_2900
     * @tc.name      testTypeArguments0029
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<AWithConstraint<XClass | null>[]> = new AWithConstraint<AWithConstraint<XClass | null>[]>([new AWithConstraint<XClass | null>(new XClass())])
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3000
     * @tc.name      testTypeArguments0030
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[XClass, XClass]> = new A<[XClass, XClass]>([new XClass(), new XClass()])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3100
     * @tc.name      testTypeArguments0031
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[XClass, number]> = new A<[XClass, number]>([new XClass(), 1])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3200
     * @tc.name      testTypeArguments0032
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[XClass, XClass] | null> = new A<[XClass, XClass] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3300
     * @tc.name      testTypeArguments0033
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[XClass | null, XClass]> = new A<[XClass | null, XClass]>([null, new XClass()])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3400
     * @tc.name      testTypeArguments0034
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<[XClass, XClass]>> = new A<A<[XClass, XClass]>>(new A<[XClass, XClass]>([new XClass(), new XClass()]))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3500
     * @tc.name      testTypeArguments0035
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[A<XClass>, A<XClass>]> = new A<[A<XClass>, A<XClass>]>([new A<XClass>(new XClass()), new A<XClass>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3600
     * @tc.name      testTypeArguments0036
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: FuncVoid = (): void => {}
      let v: A<FuncVoid> = new A<FuncVoid>(foo)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3700
     * @tc.name      testTypeArguments0037
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: FuncVoid = (): void => {}
      let v: A<(p: FuncVoid) => void> = new A<(p: FuncVoid) => void>((foo): void => {})
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3800
     * @tc.name      testTypeArguments0038
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<FuncVoid | [XClass, XClass] | null> = new A<FuncVoid | [XClass, XClass] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_3900
     * @tc.name      testTypeArguments0039
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: FuncVoid = (): void => {}
      let v: A<[FuncVoid | null, FuncVoid]> = new A<[FuncVoid | null, FuncVoid]>([null, foo])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4000
     * @tc.name      testTypeArguments0040
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: FuncVoid = (): void => {}
      let v: A<A<[FuncVoid, FuncVoid]>> = new A<A<[FuncVoid, FuncVoid]>>(new A<[FuncVoid, FuncVoid]>([foo, foo]))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4100
     * @tc.name      testTypeArguments0041
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foo: FuncVoid = (): void => {}
      let v: A<[A<FuncVoid>, A<FuncVoid>]> = new A<[A<FuncVoid>, A<FuncVoid>]>([new A<FuncVoid>(foo), new A<FuncVoid>(foo)])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4200
     * @tc.name      testTypeArguments0042
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[]> = new A<XClass[]>([new XClass()])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4300
     * @tc.name      testTypeArguments0043
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[] | null> = new A<XClass[] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4400
     * @tc.name      testTypeArguments0044
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>> = new A<A<XClass[]>>(new A<XClass[]>([new XClass()]))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4500
     * @tc.name      testTypeArguments0045
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>[]> = new A<A<XClass>[]>([new A<XClass>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4600
     * @tc.name      testTypeArguments0046
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<Object> = new A<Object>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4700
     * @tc.name      testTypeArguments0047
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<undefined> = new A<undefined>(undefined)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4800
     * @tc.name      testTypeArguments0048
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<null> = new A<null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_4900
     * @tc.name      testTypeArguments0049
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<string> = new A<string>("string")
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5000
     * @tc.name      testTypeArguments0050
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<bigint> = new A<bigint>(123n)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5100
     * @tc.name      testTypeArguments0051
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<KeyHolder<keyof Keys>> = new A<KeyHolder<keyof Keys>>(new KeyHolder<keyof Keys>())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5200
     * @tc.name      testTypeArguments0052
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass> = new A<XClass>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5300
     * @tc.name      testTypeArguments0053
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass | null> = new A<XClass | null>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5400
     * @tc.name      testTypeArguments0054
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass | null> = new A<XClass | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5500
     * @tc.name      testTypeArguments0055
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithExtendedConstraint<XClass> = new AWithExtendedConstraint<XClass>(new XClass())
      expect(v instanceof AWithExtendedConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5600
     * @tc.name      testTypeArguments0056
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithExtendedConstraint<XClass | null> = new AWithExtendedConstraint<XClass | null>(new XClass())
      expect(v instanceof AWithExtendedConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5700
     * @tc.name      testTypeArguments0057
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: AWithConstraint<XClass | null> = new AWithConstraint<XClass | null>(null)
      expect(v instanceof AWithConstraint).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5800
     * @tc.name      testTypeArguments0058
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<IEmpty> = new A<IEmpty>(new XClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_5900
     * @tc.name      testTypeArguments0059
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<IEmpty | null> = new A<IEmpty | null>(new YClass())
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6000
     * @tc.name      testTypeArguments0060
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<IEmpty | null> = new A<IEmpty | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6100
     * @tc.name      testTypeArguments0061
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<KeyHolder<'key'>> = new A<KeyHolder<'key'>>(new KeyHolder<'key'>());
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6200
     * @tc.name      testTypeArguments0062
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<FuncVoid> = new A<FuncVoid>(func)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6300
     * @tc.name      testTypeArguments0063
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<FuncVoid | null> = new A<FuncVoid | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6400
     * @tc.name      testTypeArguments0064
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<A<FuncVoid>> = new A<A<FuncVoid>>(new A<FuncVoid>(func))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6500
     * @tc.name      testTypeArguments0065
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<AWithConstraint<FuncVoid>> = new A<AWithConstraint<FuncVoid>>(new AWithConstraint<FuncVoid>(func))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6600
     * @tc.name      testTypeArguments0066
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<[FuncVoid, FuncVoid]> = new A<[FuncVoid, FuncVoid]>([func, func])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6700
     * @tc.name      testTypeArguments0067
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<FuncVoid[] | null> = new A<FuncVoid[] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6800
     * @tc.name      testTypeArguments0068
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<[FuncVoid | null, FuncVoid]> = new A<[FuncVoid | null, FuncVoid]>([null, func])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_6900
     * @tc.name      testTypeArguments0069
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: FuncVoid = (): void => {}
      let v: A<A<[FuncVoid, FuncVoid]>> = new A<A<[FuncVoid, FuncVoid]>>(new A<[FuncVoid, FuncVoid]>([func, func]))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7000
     * @tc.name      testTypeArguments0070
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[]> = new A<XClass[]>([new XClass()])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7100
     * @tc.name      testTypeArguments0071
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[] | null> = new A<XClass[] | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7200
     * @tc.name      testTypeArguments0072
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>> = new A<A<XClass[]>>(new A<XClass[]>([new XClass()]))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7300
     * @tc.name      testTypeArguments0073
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass>[]> = new A<A<XClass>[]>([new A<XClass>(new XClass())])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7400
     * @tc.name      testTypeArguments0074
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[][]> = new A<XClass[][]>([[new XClass()]])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7500
     * @tc.name      testTypeArguments0075
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[][]> = new A<XClass[][]>([[new XClass()]])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7600
     * @tc.name      testTypeArguments0076
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<XClass[]>[]> = new A<A<XClass[]>[]>([new A<XClass[]>([new XClass()])])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7700
     * @tc.name      testTypeArguments0077
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<XClass[][]> = new A<XClass[][]>([[new XClass()]]);
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7800
     * @tc.name      testTypeArguments0078
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<undefined> = new A<undefined>(undefined)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_7900
     * @tc.name      testTypeArguments0079
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<null> = new A<null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8000
     * @tc.name      testTypeArguments0080
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<undefined | null> = new A<undefined | null>(null)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8100
     * @tc.name      testTypeArguments0081
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[undefined, null]> = new A<[undefined, null]>([undefined, null])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8200
     * @tc.name      testTypeArguments0082
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<A<undefined | null>> = new A<A<undefined | null>>(new A<undefined | null>(null))
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8300
     * @tc.name      testTypeArguments0083
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[A<undefined>, A<null>]> = new A<[A<undefined>, A<null>]>([new A<undefined>(undefined), new A<null>(null)])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8400
     * @tc.name      testTypeArguments0084
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<bigint> = new A<bigint>(123n)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8500
     * @tc.name      testTypeArguments0085
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<string> = new A<string>("test")
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8600
     * @tc.name      testTypeArguments0086
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<boolean> = new A<boolean>(true)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8700
     * @tc.name      testTypeArguments0087
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<number> = new A<number>(123)
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8800
     * @tc.name      testTypeArguments0088
     * @tc.desc      Test of type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A<[bigint, string, boolean, number]> = new A<[bigint, string, boolean, number]>([123n, "test", true, 123])
      expect(v instanceof A).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_8900
     * @tc.name      testTypeArguments0089
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<YClass, YClass[]> = new Pair<YClass, YClass[]>(new YClass(), []);
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9000
     * @tc.name      testTypeArguments0090
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<YClass, YClass[]> = new Pair<YClass, YClass[]>(new YClass(), []);
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9100
     * @tc.name      testTypeArguments0091
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<[XClass, XClass], XClass> = new Pair<[XClass, XClass], XClass>([new XClass(), new XClass()], new XClass())
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9200
     * @tc.name      testTypeArguments0092
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<number, [XClass, XClass] | null> = new Pair<number, [XClass, XClass] | null>(1, [new XClass(), new XClass()])
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9300
     * @tc.name      testTypeArguments0093
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<number | null, [XClass, XClass] | null> = new Pair<number | null, [XClass, XClass] | null>(null, null)
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9400
     * @tc.name      testTypeArguments0094
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<[XClass, XClass], XClass | null> = new Pair<[XClass, XClass], XClass | null>([new XClass(), new XClass()], new XClass())
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9500
     * @tc.name      testTypeArguments0095
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<Object, [XClass, XClass] | null> = new Pair<Object, [XClass, XClass] | null>(new XClass(), null)
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9600
     * @tc.name      testTypeArguments0096
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<XClass[], XClass[]> = new Pair<XClass[], XClass[]>([new XClass()], [new XClass()])
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9700
     * @tc.name      testTypeArguments0097
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<number, XClass[] | null> = new Pair<number, XClass[] | null>(1, [new XClass()])
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9800
     * @tc.name      testTypeArguments0098
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<number | null, XClass | null> = new Pair<number | null, XClass | null>(null, null)
      expect(v instanceof Pair).assertTrue()
    })

    /**
     * @tc.number    SUB_TYPE_ARGUMENTS_TEST_9900
     * @tc.name      testTypeArguments0099
     * @tc.desc      Type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeArguments0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Pair<XClass[], XClass[] | null> = new Pair<XClass[], XClass[] | null>([new XClass()], [new XClass()])
      expect(v instanceof Pair).assertTrue()
    })
  })
}