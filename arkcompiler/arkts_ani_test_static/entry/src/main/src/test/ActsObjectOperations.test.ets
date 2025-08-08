import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function objectOperationsTest() {

  describe("ActsObjectOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
      * @tc.number    : Object_InstanceOf_0100
      * @tc.name      : Object_InstanceOf_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Object_InstanceOf_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_InstanceOf_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_InstanceOf();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_InstanceOf_0100 done');
        done();
        hilog.info(domain, tag, 'Object_InstanceOf_0100 end');
      })

    /*
      * @tc.number    : Object_GetType_0100
      * @tc.name      : Object_GetType_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Object_GetType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetType_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetType();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetType_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetType_0100 end');
      })

    /*
      * @tc.number    : Object_New_0100
      * @tc.name      : Object_New_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Object_New_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'Object_New_0100 start');
      let cls = new Foo();
      let result = cls.test_Object_New();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'Object_New_0100 done');
      done();
      hilog.info(domain, tag, 'Object_New_0100 end');
    })

    /*
      * @tc.number    : Reference_IsNull_0100
      * @tc.name      : Reference_IsNull_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Reference_IsNull_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_IsNull_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsNull();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_IsNull_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_IsNull_0100 end');
      })

    /*
      * @tc.number    : Reference_IsUndefined_0100
      * @tc.name      : Reference_IsUndefined_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Reference_IsUndefined_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_IsUndefined_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsUndefined();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_IsUndefined_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_IsUndefined_0100 end');
      })

    /*
      * @tc.number    : Reference_IsNullishValue_0100
      * @tc.name      : Reference_IsNullishValue_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Reference_IsNullishValue_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_IsNullishValue_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_IsNullishValue();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_IsNullishValue_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_IsNullishValue_0100 end');
      })

    /*
      * @tc.number    : Reference_Equals_0100
      * @tc.name      : Reference_Equals_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Reference_Equals_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Reference_Equals_0100 start');
        let cls = new Foo();
        let result = cls.test_Reference_Equals();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Reference_Equals_0100 done');
        done();
        hilog.info(domain, tag, 'Reference_Equals_0100 end');
      })

    /*
      * @tc.number    : Array_New_Ref_0100
      * @tc.name      : Array_New_Ref_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Array_New_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Array_New_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Array_New_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Array_New_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Array_New_Ref_0100 end');
      })

    /*
      * @tc.number    : Object_New_A_0100
      * @tc.name      : Object_New_A_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Object_New_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_New_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_New_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_New_A_0100 done');
        done();
        hilog.info(domain, tag, 'Object_New_A_0100 end');
      })

    /*
      * @tc.number    : Object_New_V_0100
      * @tc.name      : Object_New_V_0100
      * @tc.desc      : MediumTest
      * @tc.size      : Function
      * @tc.type      : Function test
      * @tc.level     : Level 0
      */
    it("Object_New_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_New_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_New_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_New_V_0100 done');
        done();
        hilog.info(domain, tag, 'Object_New_V_0100 end');
      })
  })
}