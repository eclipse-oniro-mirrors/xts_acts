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
} from "../../../../../../../hypium"

class Int1 {
  value: int = 0
  constructor() {}
}
class Double1 {
  value: double = 0.0
  constructor() {}
}

class PointIntDouble<T extends Int1 | Double1> {}
abstract class AbstractPointIntDouble<T extends Int1 | Double1> {}
final class FinalPointIntDouble<T extends Int1 | Double1> {}

class PointAB<T extends "a" | "b"> {}
abstract class AbstractPointAB<T extends "a" | "b"> {}
final class FinalPointAB<T extends "a" | "b"> {}

class PointByte<T extends number> {}
abstract class AbstractPointByte<T extends number> {}
final class FinalPointByte<T extends number> {}

class PointShort<T extends number> {}
abstract class AbstractPointShort<T extends number> {}
final class FinalPointShort<T extends number> {}

class ChildIntDouble<T extends Int1 | Double1> extends AbstractPointIntDouble<T> {}
class ChildAB<T extends "a" | "b"> extends AbstractPointAB<T> {}
class ChildByte<T extends number> extends AbstractPointByte<T> {}
class ChildShort<T extends number> extends AbstractPointShort<T> {}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericTypeAliasConstraintTest() {
  describe("GenericTypeAliasConstraintTest", () => {
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
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0100
     * @tc.name      testGenericTypeAliasConstraintGroup0001
     * @tc.desc      Generic type alias constraint test for PointIntDouble and ChildIntDouble with Int1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointIntDouble<Int1>()
      let x2 = new ChildIntDouble<Int1>()
      expect(x1 instanceof PointIntDouble).assertTrue()
      expect(x2 instanceof AbstractPointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0200
     * @tc.name      testGenericTypeAliasConstraintGroup0002
     * @tc.desc      Generic type alias constraint test for FinalPointIntDouble and PointIntDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new FinalPointIntDouble<Int1>()
      let x2 = new PointIntDouble<Double1>()
      expect(x1 instanceof FinalPointIntDouble).assertTrue()
      expect(x2 instanceof PointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0300
     * @tc.name      testGenericTypeAliasConstraintGroup0003
     * @tc.desc      Generic type alias constraint test for ChildIntDouble and FinalPointIntDouble with Double1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new ChildIntDouble<Double1>()
      let x2 = new FinalPointIntDouble<Double1>()
      expect(x1 instanceof AbstractPointIntDouble).assertTrue()
      expect(x2 instanceof FinalPointIntDouble).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0400
     * @tc.name      testGenericTypeAliasConstraintGroup0004
     * @tc.desc      Generic type alias constraint test for PointAB and ChildAB with "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointAB<"a">()
      let x2 = new ChildAB<"a">()
      expect(x1 instanceof PointAB).assertTrue()
      expect(x2 instanceof AbstractPointAB).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0500
     * @tc.name      testGenericTypeAliasConstraintGroup0005
     * @tc.desc      Generic type alias constraint test for FinalPointAB and PointByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new FinalPointAB<"a">()
      let x2 = new PointByte<number>()
      expect(x1 instanceof FinalPointAB).assertTrue()
      expect(x2 instanceof PointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0600
     * @tc.name      testGenericTypeAliasConstraintGroup0006
     * @tc.desc      Generic type alias constraint test for ChildByte and FinalPointByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new ChildByte<number>()
      let x2 = new FinalPointByte<number>()
      expect(x1 instanceof AbstractPointByte).assertTrue()
      expect(x2 instanceof FinalPointByte).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0700
     * @tc.name      testGenericTypeAliasConstraintGroup0007
     * @tc.desc      Generic type alias constraint test for PointShort and ChildShort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1 = new PointShort<number>()
      let x2 = new ChildShort<number>()
      expect(x1 instanceof PointShort).assertTrue()
      expect(x2 instanceof AbstractPointShort).assertTrue()
    });

    /**
     * @tc.number    SUB_GENERIC_TYPE_ALIAS_CONSTRAINT_0800
     * @tc.name      testGenericTypeAliasConstraintGroup0008
     * @tc.desc      Generic type alias constraint test for FinalPointShort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericTypeAliasConstraintGroup0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new FinalPointShort<number>()
      expect(x instanceof FinalPointShort).assertTrue()
    });

  })
}