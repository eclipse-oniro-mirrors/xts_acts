/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function BooleanTest() {
  describe('booleanTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0100
     * @tc.name       : testBooleanConstructor0001
     * @tc.desc       : Boolean()transfer parameters 0 return false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBooleanConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBooleanConstructor0001";
      try {
        let result = new Boolean(0);
        expect(result.valueOf()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0200
     * @tc.name       : testBooleanConstructor0002
     * @tc.desc       : Boolean()transfer parameters null  return false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBooleanConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBooleanConstructor0002";
      try {
        let result = new Boolean(null);
        expect(result.valueOf()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0300
     * @tc.name       : testBooleanConstructor0003
     * @tc.desc       : Boolean()transfer parameters undefined  return false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBooleanConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBooleanConstructor0003";
      try {
        let result = new Boolean(undefined);
        expect(result.valueOf()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0400
     * @tc.name       : testBooleanConstructor0004
     * @tc.desc       : Boolean()transfer parameters ""  return false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBooleanConstructor0004";
      try {
        let result = new Boolean("");
        expect(result.valueOf()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0500
     * @tc.name       : testBooleanConstructor0005
     * @tc.desc       : Boolean()transfer parameters false   expect 1：typeof false; "object"，expect 2：Boolean(false)true
     Number5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBooleanConstructor0005";
      try {
        let bfalse = new Boolean(false);
        expect(typeof bfalse).assertEqual("object");
        expect(Boolean(bfalse)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0600
     * @tc.name       : testBoolean0006
     * @tc.desc       : Test the function of the Boolean() function
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBoolean0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBoolean0006";
      try {
        let value = true;
        let result = Boolean(value);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0700
     * @tc.name       : testBoolean0007
     * @tc.desc       : Test the function of the Boolean() function
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBoolean0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBoolean0007";
      try {
        let value = "true";
        let result = Boolean(value);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0800
     * @tc.name       : testBoolean0008
     * @tc.desc       : Test the function of the Boolean() function
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBoolean0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBoolean0008";
      try {
        let value = "false";
        let result = Boolean(value);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0900
     * @tc.name       : testNewBoolean0009
     * @tc.desc       : Test the function of the new Boolean([]) function
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNewBoolean0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNewBoolean0009";
      try {
        let bArray = new Boolean([]);
        let result = Boolean(bArray);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1000
     * @tc.name       : testNewBoolean0010
     * @tc.desc       : Test the function of the Boolean({}) function
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNewBoolean0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testNewBoolean0010";
      try {
        let bObject = new Boolean({});
        let result = Boolean(bObject);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1100
     * @tc.name       : testBooleanprototypetoString0001
     * @tc.desc       : Test the function of the Interface Boolean.prototype.toString(0).
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanprototypetoString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanprototypetoString0001';
      try {
        let boolean = new Boolean(0);
        console.info(boolean.toString());
        expect(boolean.toString()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1200
     * @tc.name       : testBooleanprototypetoString0002
     * @tc.desc       : Test the function of the Interface Boolean.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanprototypetoString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanprototypetoString0002';
      try {
        let boolean = new Boolean(null);
        console.info(boolean.toString());
        expect(boolean.toString()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1300
     * @tc.name       : testBooleanprototypetoString0003
     * @tc.desc       : Test the function of the Interface Boolean.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanprototypetoString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanprototypetoString0003';
      try {
        let boolean = new Boolean(undefined);
        console.info(boolean.toString());
        expect(boolean.toString()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1400
     * @tc.name       : testBooleanprototypetoString0004
     * @tc.desc       : Test the function of the Interface Boolean.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanprototypetoString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanprototypetoString0004';
      try {
        let boolean = new Boolean("");
        console.info(boolean.toString());
        expect(boolean.toString()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1500
     * @tc.name       : testBooleanprototypetoString000
     * @tc.desc       : Test the function of the Interface Boolean.prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBoolean0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBoolean0015';
      try {
        let boolean = new Boolean(false);
        console.info(boolean.toString());
        expect(boolean.toString()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1600
     * @tc.name       : testBoolean.prototype.toString0006
     * @tc.desc       : Test the function of the interface prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textBoolean.prototype.toString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textBoolean.prototype.toString0006';
      try {
        expect(Boolean(true).toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1700
     * @tc.name       : testBoolean.prototype.toString0007
     * @tc.desc       : Test the function of the interface prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textBoolean.prototype.toString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textBoolean.prototype.toString0007';
      try {
        expect(Boolean("true").toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1800
     * @tc.name       : testBoolean.prototype.toString0008
     * @tc.desc       : Test the function of the interface prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textBoolean.prototype.toString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textBoolean.prototype.toString0008';
      try {
        expect(Boolean("false").toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1900
     * @tc.name       : testBoolean.prototype.toString0009
     * @tc.desc       : Test the function of the interface prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textBoolean.prototype.toString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textBoolean.prototype.toString0009';
      try {
        expect(Boolean([]).toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2000
     * @tc.name       : testBoolean.prototype.toString0010
     * @tc.desc       : Test the function of the interface prototype.toString().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('textBoolean.prototype.toString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'textBoolean.prototype.toString0010';
      try {
        const result = new Boolean({});
        expect(result.toString()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2100
     * @tc.name       : testBooleanPrototypeValueOf0001
     * @tc.desc       : Test the function of the interface BooleanPrototypeValueOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0001';
      try {
        let flag1 = new Boolean(0);
        expect(flag1.valueOf()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2200
     * @tc.name       : testBooleanPrototypeValueOf0002
     * @tc.desc       : Test the function of the interface BooleanPrototypeValueOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0002';
      try {
        let flag1 = new Boolean(null);
        expect(flag1.toString().valueOf()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2300
     * @tc.name       : testBooleanPrototypeValueOf0003
     * @tc.desc       : Test the function of the interface BooleanPrototypeValueOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0003';
      try {
        let flag1 = new Boolean(undefined);
        expect(flag1.toString().valueOf()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2400
     * @tc.name       : testBooleanPrototypeValueOf0004
     * @tc.desc       : Test the function of the interface BooleanPrototypeValueOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0004';
      try {
        let flag1 = new Boolean("");
        expect(flag1.toString().valueOf()).assertEqual('false');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2500
     * @tc.name       : testBooleanPrototypeValueOf0006
     * @tc.desc       : Test the function of the interface valueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0006';
      try {
        let flag = Boolean(true);
        expect(flag.toString().valueOf()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2600
     * @tc.name       : testBooleanPrototypeValueOf0007
     * @tc.desc       : Test the function of the interface valueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0007';
      try {
        let flag = new Boolean("true");
        expect(flag.toString().valueOf()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2700
     * @tc.name       : testBooleanPrototypeValueOf0008
     * @tc.desc       : Test the function of the interface valueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0008';
      try {
        let flag = new Boolean("false");
        expect(flag.toString().valueOf()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2800
     * @tc.name       : testBooleanPrototypeValueOf0009
     * @tc.desc       : Test the function of the interface valueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0009';
      try {
        let flag = new Boolean([]);
        expect(flag.toString().valueOf()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2900
     * @tc.name       : testBooleanPrototypeValueOf0010
     * @tc.desc       : Test the function of the interface valueOf.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBooleanPrototypeValueOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testBooleanPrototypeValueOf0010';
      try {
        let flag = new Boolean({});
        expect(flag.toString().valueOf()).assertEqual('true');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}