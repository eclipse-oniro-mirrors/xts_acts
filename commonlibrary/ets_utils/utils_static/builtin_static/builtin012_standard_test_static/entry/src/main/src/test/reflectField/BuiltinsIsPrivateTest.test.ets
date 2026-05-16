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

class TestClass {
  public publicField: string = "public";
  private privateField: number = 42;
  protected protectedField: boolean = true;
}

class AnotherTestClass {
  private name: string = "test";
  private value: number = 0;
}

class SinglePrivateFieldClass {
  private onlyField: string = "only";
}

class MixedAccessClass {
  public publicField: string = "public";
  private privateField: number = 1;
  protected protectedField: boolean = false;
  private static staticPrivate: number = 10;
  protected static staticProtected: number = 20;
}

export default function BuiltinsIsPrivateTest(): void {
  describe('BuiltinsIsPrivateTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    BuiltinsIsPrivateTest0100
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0100
     * @tc.desc    Verify private instance field is not accessible via getInstanceField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPrivateTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClass>().getInstanceField("privateField");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0200
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0200
     * @tc.desc    Verify public instance field returns false for isPrivate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields = Class.from<TestClass>().getInstanceFields();
      let found = false;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "publicField") {
          expect(fields[i].isPrivate()).assertFalse();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0300
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0300
     * @tc.desc    Verify protected instance field is not accessible via getInstanceField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getInstanceField("protectedField");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0400
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0400
     * @tc.desc    Verify different access modifier fields in same class - only public is accessible
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClass>();
      const privateField = cls.getInstanceField("privateField");
      const publicField = cls.getInstanceField("publicField");
      expect(privateField === undefined).assertTrue();
      expect(publicField !== undefined).assertTrue();
      expect(publicField!.isPrivate()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0500
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0500
     * @tc.desc    Verify isPrivate returns consistent results across multiple calls for public field
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrivateTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClass>().getInstanceField("publicField");
      expect(field !== undefined).assertTrue();
      const result1 = field!.isPrivate();
      const result2 = field!.isPrivate();
      const result3 = field!.isPrivate();
      expect(result1).assertFalse();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0600
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0600
     * @tc.desc    Verify private fields in different classes are not accessible
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClass>().getInstanceField("privateField");
      const field2 = Class.from<AnotherTestClass>().getInstanceField("name");
      expect(field1 === undefined).assertTrue();
      expect(field2 === undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0700
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0700
     * @tc.desc    Verify single private field in class is not accessible
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<SinglePrivateFieldClass>().getInstanceField("onlyField");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0800
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0800
     * @tc.desc    Verify mixed access modifier fields in same class - only public accessible
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrivateTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MixedAccessClass>();
      const publicField = cls.getInstanceField("publicField");
      const privateField = cls.getInstanceField("privateField");
      const protectedField = cls.getInstanceField("protectedField");
      const staticPrivate = cls.getStaticField("staticPrivate");
      const staticProtected = cls.getStaticField("staticProtected");

      expect(publicField !== undefined).assertTrue();
      expect(privateField === undefined).assertTrue();
      expect(protectedField === undefined).assertTrue();
      expect(staticPrivate === undefined).assertTrue();
      expect(staticProtected === undefined).assertTrue();

      expect(publicField!.isPrivate()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest0900
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_0900
     * @tc.desc    Verify isPrivate returns non-undefined for fields retrieved via getInstanceFields iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPrivateTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MixedAccessClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const isPrivate = fields[i].isPrivate();
        expect(isPrivate !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest1000
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_1000
     * @tc.desc    Verify private static field is not accessible via getStaticField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<MixedAccessClass>().getStaticField("staticPrivate");
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPrivateTest1100
     * @tc.number  SUB_BUILTINS_IS_PRIVATE_TEST_1100
     * @tc.desc    Verify protected static field is not accessible via getStaticField
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPrivateTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<MixedAccessClass>().getStaticField("staticProtected");
      expect(field === undefined).assertTrue();
    });
  });
}
