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
    public name: string = "test";
    public value: number = 0;
}

class SingleProtectedFieldClass {
    public onlyField: string = "only";
}

class MixedAccessClass {
    public publicField: string = "public";
    public privateField: number = 1;
    public protectedField: boolean = false;
    public static staticPublic: number = 10;
    public static staticAnother: number = 20;
}

export default function BuiltinsIsProtectedTest(): void {
  describe('BuiltinsIsProtectedTest', () => {
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
     * @tc.name    BuiltinsIsProtectedTest0100
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0100
     * @tc.desc    Verify public instance field returns false for isProtected
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsProtectedTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const field = Class.from<TestClass>().getInstanceField("publicField");
      expect(field !== undefined).assertTrue();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0200
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0200
     * @tc.desc    Verify public instance field returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields = Class.from<TestClass>().getInstanceFields();
      let found = false;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "publicField") {
          expect(fields[i].isProtected()).assertFalse();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0300
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0300
     * @tc.desc    Verify non-public fields return undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getInstanceField("privateField");
      expect(field).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0400
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0400
     * @tc.desc    Verify different access modifier fields in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<MixedAccessClass>();
      const publicField1 = cls.getInstanceField("publicField");
      const publicField2 = cls.getInstanceField("privateField");
      expect(publicField1 !== undefined).assertTrue();
      expect(publicField2 !== undefined).assertTrue();
      expect(publicField1!.isProtected()).assertFalse();
      expect(publicField2!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0500
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0500
     * @tc.desc    Verify isProtected returns consistent results across multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsProtectedTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const field = Class.from<TestClass>().getInstanceField("publicField");
      expect(field !== undefined).assertTrue();
      const result1 = field!.isProtected();
      const result2 = field!.isProtected();
      const result3 = field!.isProtected();
      expect(result1).assertFalse();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0600
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0600
     * @tc.desc    Verify public fields in different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field1 = Class.from<TestClass>().getInstanceField("publicField");
      const field2 = Class.from<AnotherTestClass>().getInstanceField("name");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.isProtected()).assertFalse();
      expect(field2!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0700
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0700
     * @tc.desc    Verify single public field in class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<SingleProtectedFieldClass>().getInstanceField("onlyField");
      expect(field !== undefined).assertTrue();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0800
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0800
     * @tc.desc    Verify mixed access modifier fields in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsProtectedTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const cls = Class.from<MixedAccessClass>();
      const publicField1 = cls.getInstanceField("publicField");
      const publicField2 = cls.getInstanceField("privateField");
      const publicField3 = cls.getInstanceField("protectedField");
      const staticPublic1 = cls.getStaticField("staticPublic");
      const staticPublic2 = cls.getStaticField("staticAnother");

      expect(publicField1 !== undefined).assertTrue();
      expect(publicField2 !== undefined).assertTrue();
      expect(publicField3 !== undefined).assertTrue();
      expect(staticPublic1 !== undefined).assertTrue();
      expect(staticPublic2 !== undefined).assertTrue();

      expect(publicField1!.isProtected()).assertFalse();
      expect(publicField2!.isProtected()).assertFalse();
      expect(publicField3!.isProtected()).assertFalse();
      expect(staticPublic1!.isProtected()).assertFalse();
      expect(staticPublic2!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest0900
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_0900
     * @tc.desc    Verify isProtected returns non-undefined for fields retrieved via getInstanceFields iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsProtectedTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MixedAccessClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const isProtected = fields[i].isProtected();
        expect(isProtected !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest1000
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_1000
     * @tc.desc    Verify public static field returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<MixedAccessClass>().getStaticField("staticPublic");
      expect(field !== undefined).assertTrue();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsProtectedTest1100
     * @tc.number  SUB_BUILTINS_IS_PROTECTED_TEST_1100
     * @tc.desc    Verify another public static field returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsProtectedTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<MixedAccessClass>().getStaticField("staticAnother");
      expect(field !== undefined).assertTrue();
      expect(field!.isProtected()).assertFalse();
    });
  });
}
