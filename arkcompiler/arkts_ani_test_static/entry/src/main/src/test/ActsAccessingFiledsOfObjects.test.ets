import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function accessingFiledsOfObjectsTest() {

  describe("ActsAccessingFiledsOfObjectsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
     * @tc.number    : Object_SetProperty_Boolean_0100
     * @tc.name      : Object_SetProperty_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Char_0100
     * @tc.name      : Object_SetProperty_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Char_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Byte_0100
     * @tc.name      : Object_SetProperty_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Short_0100
     * @tc.name      : Object_SetProperty_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Short_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Int_0100
     * @tc.name      : Object_SetProperty_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Int_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Long_0100
     * @tc.name      : Object_SetProperty_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Long_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Float_0100
     * @tc.name      : Object_SetProperty_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Float_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Double_0100
     * @tc.name      : Object_SetProperty_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Double_0100 end');
      })

    /*
     * @tc.number    : Object_SetProperty_Ref_0100
     * @tc.name      : Object_SetProperty_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetProperty_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetProperty_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetProperty_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetProperty_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetProperty_Ref_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Boolean_0100
     * @tc.name      : Object_GetPropertyByName_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Char_0100
     * @tc.name      : Object_GetPropertyByName_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Char_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Byte_0100
     * @tc.name      : Object_GetPropertyByName_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Short_0100
     * @tc.name      : Object_GetPropertyByName_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Short_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Int_0100
     * @tc.name      : Object_GetPropertyByName_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Int_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Long_0100
     * @tc.name      : Object_GetPropertyByName_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Long_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Float_0100
     * @tc.name      : Object_GetPropertyByName_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Float_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Double_0100
     * @tc.name      : Object_GetPropertyByName_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Double_0100 end');
      })

    /*
     * @tc.number    : Object_GetPropertyByName_Ref_0100
     * @tc.name      : Object_GetPropertyByName_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetPropertyByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetPropertyByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetPropertyByName_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetPropertyByName_Ref_0100 end');
      })

    /*
     * @tc.number    : Class_FindField_0100
     * @tc.name      : Class_FindField_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindField_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindField_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindField();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindField_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindField_0100 end');
      })

    /*
     * @tc.number    : Class_FindSetter_0100
     * @tc.name      : Class_FindSetter_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindSetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindSetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindSetter();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindSetter_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindSetter_0100 end');
      })

    /*
     * @tc.number    : Class_FindGetter_0100
     * @tc.name      : Class_FindGetter_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindGetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindGetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindGetter();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindGetter_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindGetter_0100 end');
      })

    /*
     * @tc.number    : Class_FindIndexableGetter_0100
     * @tc.name      : Class_FindIndexableGetter_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindIndexableGetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindIndexableGetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIndexableGetter();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindIndexableGetter_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindIndexableGetter_0100 end');
      })

    /*
     * @tc.number    : Class_FindIndexableSetter_0100
     * @tc.name      : Class_FindIndexableSetter_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindIndexableSetter_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindIndexableSetter_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIndexableSetter();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindIndexableSetter_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindIndexableSetter_0100 end');
      })

    /*
     * @tc.number    : Class_FindIterator_0100
     * @tc.name      : Class_FindIterator_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Class_FindIterator_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Class_FindIterator_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_FindIterator();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Class_FindIterator_0100 done');
        done();
        hilog.info(domain, tag, 'Class_FindIterator_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Boolean_0100
     * @tc.name      : Object_GetField_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Char_0100
     * @tc.name      : Object_GetField_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Char_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Byte_0100
     * @tc.name      : Object_GetField_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Short_0100
     * @tc.name      : Object_GetField_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Short_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Int_0100
     * @tc.name      : Object_GetField_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Int_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Long_0100
     * @tc.name      : Object_GetField_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Long_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Float_0100
     * @tc.name      : Object_GetField_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Float_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Double_0100
     * @tc.name      : Object_GetField_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Double_0100 end');
      })

    /*
     * @tc.number    : Object_GetField_Ref_0100
     * @tc.name      : Object_GetField_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetField_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetField_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetField_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetField_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetField_Ref_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Boolean_0100
     * @tc.name      : Object_SetField_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Char_0100
     * @tc.name      : Object_SetField_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Char_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Byte_0100
     * @tc.name      : Object_SetField_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Short_0100
     * @tc.name      : Object_SetField_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Short_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Int_0100
     * @tc.name      : Object_SetField_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Int_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Long_0100
     * @tc.name      : Object_SetField_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Long_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Float_0100
     * @tc.name      : Object_SetField_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Float_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Double_0100
     * @tc.name      : Object_SetField_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Double_0100 end');
      })

    /*
     * @tc.number    : Object_SetField_Ref_0100
     * @tc.name      : Object_SetField_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetField_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetField_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetField_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetField_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetField_Ref_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Boolean_0100
     * @tc.name      : Object_GetFieldByName_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Char_0100
     * @tc.name      : Object_GetFieldByName_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Char_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Byte_0100
     * @tc.name      : Object_GetFieldByName_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Short_0100
     * @tc.name      : Object_GetFieldByName_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Short_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Int_0100
     * @tc.name      : Object_GetFieldByName_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Int_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Long_0100
     * @tc.name      : Object_GetFieldByName_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Long_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Float_0100
     * @tc.name      : Object_GetFieldByName_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Float_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Double_0100
     * @tc.name      : Object_GetFieldByName_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Double_0100 end');
      })

    /*
     * @tc.number    : Object_GetFieldByName_Ref_0100
     * @tc.name      : Object_GetFieldByName_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_GetFieldByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_GetFieldByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_GetFieldByName_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_GetFieldByName_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_GetFieldByName_Ref_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Boolean_0100
     * @tc.name      : Object_SetFieldByName_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Boolean_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Char_0100
     * @tc.name      : Object_SetFieldByName_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Char_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Byte_0100
     * @tc.name      : Object_SetFieldByName_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Byte_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Short_0100
     * @tc.name      : Object_SetFieldByName_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Short_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Int_0100
     * @tc.name      : Object_SetFieldByName_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Int_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Long_0100
     * @tc.name      : Object_SetFieldByName_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Long_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Float_0100
     * @tc.name      : Object_SetFieldByName_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Float_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Double_0100
     * @tc.name      : Object_SetFieldByName_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Double_0100 end');
      })

    /*
     * @tc.number    : Object_SetFieldByName_Ref_0100
     * @tc.name      : Object_SetFieldByName_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Object_SetFieldByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Object_SetFieldByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_SetFieldByName_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Object_SetFieldByName_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Object_SetFieldByName_Ref_0100 end');
      })
  })
}