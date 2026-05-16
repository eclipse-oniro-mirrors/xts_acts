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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium"

type NullableString = null | undefined | string
type ClearedString = NonNullable<NullableString>

type NullableNumber = null | undefined | number
type ClearedNumber = NonNullable<NullableNumber>


function toNonNullString(param: NullableString): ClearedString {
  if (param != null) {
    return param
  }
  return ""
}

function toNonNullNumber(param: NullableNumber): ClearedNumber {
  if (param != null) {
    return param
  }
  return 0
}

type X_6 = Object | null | undefined
type Y_6 = NonNullable<X_6>

class A_6<T> {
  field: NonNullable<T>
  constructor (field: NonNullable<T>) {
    this.field = field
  }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NonNullableUtilityTypeTest() {
  describe("NonNullableUtilityTypeTest", () => {
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
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0100
     * @tc.name      testNonNullableUtilityType0001
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString(null);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0200
     * @tc.name      testNonNullableUtilityType0002
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString(undefined);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0300
     * @tc.name      testNonNullableUtilityType0003
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString('undefined');
      expect(b).assertEqual('undefined')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0400
     * @tc.name      testNonNullableUtilityType0004
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString(a1);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0500
     * @tc.name      testNonNullableUtilityType0005
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString(a2);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0600
     * @tc.name      testNonNullableUtilityType0006
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"
      let b: ClearedString = toNonNullString(a3);
      expect(b).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0700
     * @tc.name      testNonNullableUtilityType0007
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new A_6<X_6>(new Object)
      expect(a.field instanceof Object).assertTrue() // type of field is Object
    })
  });
}