import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

export default function booleanTest() {
  describe('booleanTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0100
     * @tc.name testBooleanConstructor0001
     * @tc.desc Boolean()transfer parameters 0 return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBooleanConstructor0001";
      try {
        let result = new Boolean(0);
        expect(JSON.stringify(result.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0200
     * @tc.name testBooleanConstructor0002
     * @tc.desc Boolean()transfer parameters null  return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBooleanConstructor0002";
      try {
        let result = new Boolean(null);
        expect(String(result.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0300
     * @tc.name testBooleanConstructor0003
     * @tc.desc Boolean()transfer parameters undefined  return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBooleanConstructor0003";
      try {
        let result = new Boolean(undefined);
        expect(String(result.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0400
     * @tc.name testBooleanConstructor0004
     * @tc.desc Boolean()transfer parameters ""  return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBooleanConstructor0004";
      try {
        let result = new Boolean("");
        expect(String(result.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0500
     * @tc.name testBooleanConstructor0005
     * @tc.desc Boolean()transfer parameters false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBooleanConstructor0005";
      try {
        let bfalse = new Boolean(false);
        expect(typeof bfalse).assertEqual("boolean");
        expect(String(Boolean(bfalse))).assertEqual("false");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0600
     * @tc.name testBoolean0006
     * @tc.desc Test the function of the Boolean() function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoolean0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBoolean0006";
      try {
        let value = true;
        let result = Boolean(value);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0700
     * @tc.name testBoolean0007
     * @tc.desc Test the function of the Boolean() function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoolean0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBoolean0007";
      try {
        let value = "true";
        let result = Boolean(value);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_0800
     * @tc.name testBoolean0008
     * @tc.desc Test the function of the Boolean() function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoolean0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBoolean0008";
      try {
        let value = "false";
        let result = Boolean(value);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1000
     * @tc.name testNewBoolean0010
     * @tc.desc Test the function of the Boolean({}) function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNewBoolean0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testNewBoolean0010";
      try {
        let bObject = new Boolean({} as object);
        let result = Boolean(bObject);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1100
     * @tc.name testBooleanprototypetoString0001
     * @tc.desc Test the function of the Interface Boolean.prototype.toString(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanprototypetoString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanprototypetoString0001';
      try {
        let boo = new Boolean(0);
        console.info(boo.toString());
        expect(String(boo)).assertEqual('false');
        ;
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1200
     * @tc.name testBooleanprototypetoString0002
     * @tc.desc Test the function of the Interface Boolean.prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanprototypetoString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanprototypetoString0002';
      try {
        let boo = new Boolean(null);
        console.info(boo.toString());
        expect(String(boo)).assertEqual('false');
        ;
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1300
     * @tc.name testBooleanprototypetoString0003
     * @tc.desc Test the function of the Interface Boolean.prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanprototypetoString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanprototypetoString0003';
      try {
        let boo = new Boolean(undefined);
        console.info(boo.toString());
        expect(String(boo)).assertEqual('false');
        ;
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1400
     * @tc.name testBooleanprototypetoString0004
     * @tc.desc Test the function of the Interface Boolean.prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanprototypetoString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanprototypetoString0004';
      try {
        let boo = new Boolean("");
        console.info(boo.toString());
        expect(String(boo)).assertEqual('false');
        ;
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1500
     * @tc.name testBoolean0015
     * @tc.desc Test the function of the Interface Boolean.prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoolean0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBoolean0015';
      try {
        let boo = new Boolean(false);
        console.info(boo.toString());
        expect(String(boo)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1600
     * @tc.name testBoolean.prototype.toString0006
     * @tc.desc Test the function of the interface prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBoolean.prototype.toString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBoolean.prototype.toString0006';
      try {
        expect(String(Boolean(true))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1700
     * @tc.name textBoolean.prototype.toString0007
     * @tc.desc Test the function of the interface prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('textBoolean.prototype.toString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'textBoolean.prototype.toString0007';
      try {
        expect(String(Boolean("true"))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_1800
     * @tc.name textBoolean.prototype.toString0008
     * @tc.desc Test the function of the interface prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('textBoolean.prototype.toString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'textBoolean.prototype.toString0008';
      try {
        expect(String(Boolean("false"))).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2000
     * @tc.name textBoolean.prototype.toString0010
     * @tc.desc Test the function of the interface prototype.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('textBoolean.prototype.toString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'textBoolean.prototype.toString0010';
      try {
        const result = new Boolean({} as object);
        expect(result.toString()).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2100
     * @tc.name testBooleanPrototypeValueOf0001
     * @tc.desc Test the function of the interface BooleanPrototypeValueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0001';
      try {
        let flag1 = new Boolean(0);
        expect(String(flag1.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2200
     * @tc.name testBooleanPrototypeValueOf0002
     * @tc.desc Test the function of the interface BooleanPrototypeValueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0002';
      try {
        let flag1 = new Boolean(null);
        expect(String(flag1.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2300
     * @tc.name testBooleanPrototypeValueOf0003
     * @tc.desc Test the function of the interface BooleanPrototypeValueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0003';
      try {
        let flag1 = new Boolean(undefined);
        expect(String(flag1.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2400
     * @tc.name testBooleanPrototypeValueOf0004
     * @tc.desc Test the function of the interface BooleanPrototypeValueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0004';
      try {
        let flag1 = new Boolean("");
        expect(String(flag1.valueOf())).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2500
     * @tc.name testBooleanPrototypeValueOf0006
     * @tc.desc Test the function of the interface valueOf.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0006';
      try {
        let flag = Boolean(true);
        expect(String(flag).valueOf()).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2600
     * @tc.name testBooleanPrototypeValueOf0007
     * @tc.desc Test the function of the interface valueOf.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0007';
      try {
        let flag = new Boolean("true");
        expect(String(flag.valueOf())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BOOLEAN_2700
     * @tc.name testBooleanPrototypeValueOf0008
     * @tc.desc Test the function of the interface valueOf.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBooleanPrototypeValueOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBooleanPrototypeValueOf0008';
      try {
        let flag = new Boolean("false");
        expect(String(flag.valueOf())).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

  })
}