import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function classOperationsTest() {

  describe("ActsClassOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : findClass_static_0100
     * @tc.name      : findClass_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("findClass_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'findClass_static_0100 start');
      let cls = new Foo();
      let result = cls.test_FindClass();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'findClass_static_0100 done');
      done();
      hilog.info(domain, tag, 'findClass_static_0100 end');
    })

    /*
     * @tc.number    : class_FindStaticMethodBoolean_0100
     * @tc.name      : class_FindStaticMethodBoolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("class_FindStaticMethodBoolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'class_FindStaticMethodBoolean_0100 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodBoolean();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'class_FindStaticMethodBoolean_0100 done');
      done();
      hilog.info(domain, tag, 'class_FindStaticMethodBoolean_0100 end');
    })

    /*
     * @tc.number    : class_FindStaticMethodInt_0100
     * @tc.name      : class_FindStaticMethodInt_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("class_FindStaticMethodInt_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'class_FindStaticMethodInt_0100 start');
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethodInt();
      expect(result).assertTrue();
      hilog.info(domain, tag, 'class_FindStaticMethodInt_0100 done');
      done();
      hilog.info(domain, tag, 'class_FindStaticMethodInt_0100 end');
    })

    /*
     * @tc.number    : Class_BindNativeMethods_0100
     * @tc.name      : Class_BindNativeMethods_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_BindNativeMethods_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_BindNativeMethods_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_BindNativeMethods();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_BindNativeMethods_0100 done');
        done();
        hilog.info(domain, tag, 'Class_BindNativeMethods_0100 end');
      })

    /*
     * @tc.number    : Type_GetSuperClass_0100
     * @tc.name      : Type_GetSuperClass_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Type_GetSuperClass_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Type_GetSuperClass_0100 start');
        let cls = new Foo();
        let result = cls.test_Type_GetSuperClass();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Type_GetSuperClass_0100 done');
        done();
        hilog.info(domain, tag, 'Type_GetSuperClass_0100 end');
      })

    /*
     * @tc.number    : test_Type_IsAssignableFrom_0100
     * @tc.name      : test_Type_IsAssignableFrom_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_Type_IsAssignableFrom_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Type_IsAssignableFrom_0100 start');
        let cls = new Foo();
        let result = cls.test_Type_IsAssignableFrom();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Type_IsAssignableFrom_0100 done');
        done();
        hilog.info(domain, tag, 'test_Type_IsAssignableFrom_0100 end');
      })

    /*
     * @tc.number    : FindModule_0100
     * @tc.name      : FindModule_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("FindModule_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FindModule_0100 start');
        let cls = new Foo();
        let result = cls.test_FindModule();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FindModule_0100 done');
        done();
        hilog.info(domain, tag, 'FindModule_0100 end');
      })

    /*
     * @tc.number    : FindNamespace_0100
     * @tc.name      : FindNamespace_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("FindNamespace_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FindNamespace_0100 start');
        let cls = new Foo();
        let result = cls.test_FindNamespace();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FindNamespace_0100 done');
        done();
        hilog.info(domain, tag, 'FindNamespace_0100 end');
      })

    /*
     * @tc.number    : FindEnum_0100
     * @tc.name      : FindEnum_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("FindEnum_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'FindEnum_0100 start');
        let cls = new Foo();
        let result = cls.test_FindEnum();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'FindEnum_0100 done');
        done();
        hilog.info(domain, tag, 'FindEnum_0100 end');
      })
  })
}