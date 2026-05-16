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
    public anotherField: number = 42;
    public thirdField: boolean = true;
}

class AnotherTestClass {
    public name: string = "test";
    public value: number = 0;
}

class SinglePublicFieldClass {
    public onlyField: string = "only";
}

class MixedAccessClass {
    public publicField: string = "public";
    public privateField: number = 1;
    public protectedField: boolean = false;
    public static staticPublic: number = 10;
    public static staticAnother: number = 20;
}

export default function BuiltinsIsPublicTest(): void {
  describe('BuiltinsIsPublicTest', () => {
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
     * @tc.name    BuiltinsIsPublicTest0100
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0100
     * @tc.desc    Verify public instance field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsPublicTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fields = Class.from<TestClass>().getInstanceFields();
      let found = false;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "publicField") {
          expect(fields[i].isPublic()).assertTrue();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0200
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0200
     * @tc.desc    Verify another public instance field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getInstanceField("anotherField");
      expect(field !== undefined).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0300
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0300
     * @tc.desc    Verify third public instance field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<TestClass>().getInstanceField("thirdField");
      expect(field !== undefined).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0400
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0400
     * @tc.desc    Verify different public fields in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cls = Class.from<TestClass>();
      const publicField1 = cls.getInstanceField("publicField");
      const publicField2 = cls.getInstanceField("anotherField");
      expect(publicField1 !== undefined).assertTrue();
      expect(publicField2 !== undefined).assertTrue();
      expect(publicField1!.isPublic()).assertTrue();
      expect(publicField2!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0500
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0500
     * @tc.desc    Verify isPublic returns consistent results across multiple calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPublicTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<TestClass>().getInstanceFields();
      let field: reflect.Field | undefined;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "publicField") {
          field = fields[i];
          break;
        }
      }
      expect(field !== undefined).assertTrue();
      const result1 = field!.isPublic();
      const result2 = field!.isPublic();
      const result3 = field!.isPublic();
      expect(result1).assertTrue();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0600
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0600
     * @tc.desc    Verify public fields in different classes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields1 = Class.from<TestClass>().getInstanceFields();
      const fields2 = Class.from<AnotherTestClass>().getInstanceFields();
      let field1: reflect.Field | undefined;
      let field2: reflect.Field | undefined;
      for (let i = 0; i < fields1.length; i++) {
        if (fields1[i].getName() === "publicField") {
          field1 = fields1[i];
          break;
        }
      }
      for (let i = 0; i < fields2.length; i++) {
        if (fields2[i].getName() === "name") {
          field2 = fields2[i];
          break;
        }
      }
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.isPublic()).assertTrue();
      expect(field2!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0700
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0700
     * @tc.desc    Verify single public field in class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields = Class.from<SinglePublicFieldClass>().getInstanceFields();
      let field: reflect.Field | undefined;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "onlyField") {
          field = fields[i];
          break;
        }
      }
      expect(field !== undefined).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0800
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0800
     * @tc.desc    Verify public fields in same class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPublicTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
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

      expect(publicField1!.isPublic()).assertTrue();
      expect(publicField2!.isPublic()).assertTrue();
      expect(publicField3!.isPublic()).assertTrue();
      expect(staticPublic1!.isPublic()).assertTrue();
      expect(staticPublic2!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest0900
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_0900
     * @tc.desc    Verify isPublic returns non-undefined for fields retrieved via getInstanceFields iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsPublicTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const fields = Class.from<MixedAccessClass>().getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        const isPublic = fields[i].isPublic();
        expect(isPublic !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsIsPublicTest1000
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_1000
     * @tc.desc    Verify public static field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fields = Class.from<MixedAccessClass>().getStaticFields();
      let field: reflect.Field | undefined;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === "staticPublic") {
          field = fields[i];
          break;
        }
      }
      expect(field !== undefined).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsPublicTest1100
     * @tc.number  SUB_BUILTINS_IS_PUBLIC_TEST_1100
     * @tc.desc    Verify another public static field returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsPublicTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const field = Class.from<MixedAccessClass>().getStaticField("staticAnother");
      expect(field !== undefined).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });
  });
}
