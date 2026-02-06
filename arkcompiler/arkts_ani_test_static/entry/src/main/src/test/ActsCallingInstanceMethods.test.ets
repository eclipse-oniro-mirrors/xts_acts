import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function callingInstanceMethodsTest() {

  describe("ActsCallingInstanceMethodsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
    * @tc.number    : test_Object_CallMethod_Double_0100
    * @tc.name      : test_Object_CallMethod_Double_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Double_A_0100
    * @tc.name      : test_Object_CallMethod_Double_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Double_V_0100
    * @tc.name      : test_Object_CallMethod_Double_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Double_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Double_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Int_0100
    * @tc.name      : test_Object_CallMethod_Int_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Int_A_0100
    * @tc.name      : test_Object_CallMethod_Int_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Int_V_0100
    * @tc.name      : test_Object_CallMethod_Int_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Int_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Int_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Boolean_0100
    * @tc.name      : test_Object_CallMethod_Boolean_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Boolean_A_0100
    * @tc.name      : test_Object_CallMethod_Boolean_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Boolean_V_0100
    * @tc.name      : test_Object_CallMethod_Boolean_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Boolean_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Boolean_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Void_0100
    * @tc.name      : test_Object_CallMethod_Void_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Void_A_0100
    * @tc.name      : test_Object_CallMethod_Void_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Void_V_0100
    * @tc.name      : test_Object_CallMethod_Void_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Void_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Void_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Long_0100
    * @tc.name      : test_Object_CallMethod_Long_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Long_A_0100
    * @tc.name      : test_Object_CallMethod_Long_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Long_V_0100
    * @tc.name      : test_Object_CallMethod_Long_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Long_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Long_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Char_0100
    * @tc.name      : test_Object_CallMethod_Char_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Char_A_0100
    * @tc.name      : test_Object_CallMethod_Char_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Char_V_0100
    * @tc.name      : test_Object_CallMethod_Char_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Char_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Char_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Byte_0100
    * @tc.name      : test_Object_CallMethod_Byte_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Byte_A_0100
    * @tc.name      : test_Object_CallMethod_Byte_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Byte_V_0100
    * @tc.name      : test_Object_CallMethod_Byte_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Byte_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Byte_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Short_0100
    * @tc.name      : test_Object_CallMethod_Short_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Short_A_0100
    * @tc.name      : test_Object_CallMethod_Short_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Short_V_0100
    * @tc.name      : test_Object_CallMethod_Short_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Short_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Short_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Float_0100
    * @tc.name      : test_Object_CallMethod_Float_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Float_A_0100
    * @tc.name      : test_Object_CallMethod_Float_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Float_V_0100
    * @tc.name      : test_Object_CallMethod_Float_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Float_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Float_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Ref_0100
    * @tc.name      : test_Object_CallMethod_Ref_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Ref_A_0100
    * @tc.name      : test_Object_CallMethod_Ref_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethod_Ref_V_0100
    * @tc.name      : test_Object_CallMethod_Ref_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethod_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethod_Ref_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethod_Ref_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Boolean_0100
    * @tc.name      : test_Object_CallMethodByName_Boolean_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Boolean_A_0100
    * @tc.name      : test_Object_CallMethodByName_Boolean_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Boolean_V_0100
    * @tc.name      : test_Object_CallMethodByName_Boolean_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Boolean_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Boolean_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Char_0100
    * @tc.name      : test_Object_CallMethodByName_Char_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Char_A_0100
    * @tc.name      : test_Object_CallMethodByName_Char_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Char_V_0100
    * @tc.name      : test_Object_CallMethodByName_Char_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Char_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Char_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Byte_0100
    * @tc.name      : test_Object_CallMethodByName_Byte_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Byte_A_0100
    * @tc.name      : test_Object_CallMethodByName_Byte_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Byte_V_0100
    * @tc.name      : test_Object_CallMethodByName_Byte_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Byte_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Byte_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Short_0100
    * @tc.name      : test_Object_CallMethodByName_Short_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Short_A_0100
    * @tc.name      : test_Object_CallMethodByName_Short_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Short_V_0100
    * @tc.name      : test_Object_CallMethodByName_Short_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Short_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Short_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Int_0100
    * @tc.name      : test_Object_CallMethodByName_Int_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Int_A_0100
    * @tc.name      : test_Object_CallMethodByName_Int_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Int_V_0100
    * @tc.name      : test_Object_CallMethodByName_Int_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Int_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Int_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Long_0100
    * @tc.name      : test_Object_CallMethodByName_Long_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Long_A_0100
    * @tc.name      : test_Object_CallMethodByName_Long_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Long_V_0100
    * @tc.name      : test_Object_CallMethodByName_Long_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Long_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Long_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Float_0100
    * @tc.name      : test_Object_CallMethodByName_Float_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Float_A_0100
    * @tc.name      : test_Object_CallMethodByName_Float_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Float_V_0100
    * @tc.name      : test_Object_CallMethodByName_Float_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Float_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Float_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Double_0100
    * @tc.name      : test_Object_CallMethodByName_Double_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Double_A_0100
    * @tc.name      : test_Object_CallMethodByName_Double_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Double_V_0100
    * @tc.name      : test_Object_CallMethodByName_Double_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Double_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Double_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Ref_0100
    * @tc.name      : test_Object_CallMethodByName_Ref_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Ref_A_0100
    * @tc.name      : test_Object_CallMethodByName_Ref_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Ref_V_0100
    * @tc.name      : test_Object_CallMethodByName_Ref_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Ref_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Ref_V_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Void_0100
    * @tc.name      : test_Object_CallMethodByName_Void_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Void_A_0100
    * @tc.name      : test_Object_CallMethodByName_Void_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_A_0100 end');
      })

    /*
    * @tc.number    : test_Object_CallMethodByName_Void_V_0100
    * @tc.name      : test_Object_CallMethodByName_Void_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Object_CallMethodByName_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Object_CallMethodByName_Void_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Object_CallMethodByName_Void_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Boolean_0100
    * @tc.name      : test_Function_Call_Boolean_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Boolean_A_0100
    * @tc.name      : test_Function_Call_Boolean_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Boolean_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Boolean_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Boolean_V_0100
    * @tc.name      : test_Function_Call_Boolean_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Boolean_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Boolean_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Boolean_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Boolean_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Char_0100
    * @tc.name      : test_Function_Call_Char_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Char_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Char_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Char_A_0100
    * @tc.name      : test_Function_Call_Char_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Char_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Char_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Char_V_0100
    * @tc.name      : test_Function_Call_Char_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Char_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Char_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Char_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Byte_0100
    * @tc.name      : test_Function_Call_Byte_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Byte_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Byte_A_0100
    * @tc.name      : test_Function_Call_Byte_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Byte_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Byte_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Byte_V_0100
    * @tc.name      : test_Function_Call_Byte_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Byte_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Byte_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Byte_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Short_0100
    * @tc.name      : test_Function_Call_Short_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Short_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Short_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Short_A_0100
    * @tc.name      : test_Function_Call_Short_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Short_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Short_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Short_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Short_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Short_V_0100
    * @tc.name      : test_Function_Call_Short_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Short_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Short_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Short_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Short_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Short_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Int_0100
    * @tc.name      : test_Function_Call_Int_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Int_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Int_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Int_A_0100
    * @tc.name      : test_Function_Call_Int_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Int_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Int_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Int_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Int_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Int_V_0100
    * @tc.name      : test_Function_Call_Int_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Int_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Int_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Int_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Int_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Int_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Long_0100
    * @tc.name      : test_Function_Call_Long_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Long_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Long_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Long_A_0100
    * @tc.name      : test_Function_Call_Long_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Long_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Long_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Long_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Long_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Long_V_0100
    * @tc.name      : test_Function_Call_Long_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Long_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Long_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Long_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Long_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Long_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Float_0100
    * @tc.name      : test_Function_Call_Float_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Float_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Float_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Float_A_0100
    * @tc.name      : test_Function_Call_Float_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Float_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Float_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Float_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Float_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Float_V_0100
    * @tc.name      : test_Function_Call_Float_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Float_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Float_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Float_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Float_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Float_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Double_0100
    * @tc.name      : test_Function_Call_Double_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Double_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Double_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Double_A_0100
    * @tc.name      : test_Function_Call_Double_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Double_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Double_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Double_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Double_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Double_V_0100
    * @tc.name      : test_Function_Call_Double_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Double_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Double_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Double_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Double_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Double_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Ref_0100
    * @tc.name      : test_Function_Call_Ref_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Ref_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Ref_A_0100
    * @tc.name      : test_Function_Call_Ref_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Ref_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Ref_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Ref_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Ref_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Ref_V_0100
    * @tc.name      : test_Function_Call_Ref_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Ref_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Ref_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Ref_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Ref_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Ref_V_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Void_0100
    * @tc.name      : test_Function_Call_Void_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Void_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Void_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Void_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Void_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Void_A_0100
    * @tc.name      : test_Function_Call_Void_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Void_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Void_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Void_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Void_A_0100 end');
      })

    /*
    * @tc.number    : test_Function_Call_Void_V_0100
    * @tc.name      : test_Function_Call_Void_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Function_Call_Void_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Function_Call_Void_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Function_Call_Void_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Function_Call_Void_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Function_Call_Void_V_0100 end');
      })

    /*
    * @tc.number    : test_FunctionalObject_Call_0100
    * @tc.name      : test_FunctionalObject_Call_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_FunctionalObject_Call_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_FunctionalObject_Call_0100 start');
        let cls = new Foo();
        let result = cls.test_FunctionalObject_Call();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_FunctionalObject_Call_0100 done');
        done();
        hilog.info(domain, tag, 'test_FunctionalObject_Call_0100 end');
      })

    /*
    * @tc.number    : test_Module_BindNativeFunctions_0100
    * @tc.name      : test_Module_BindNativeFunctions_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Module_BindNativeFunctions_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Module_BindNativeFunctions_0100 start');
        let cls = new Foo();
        let result = cls.test_Module_BindNativeFunctions();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Module_BindNativeFunctions_0100 done');
        done();
        hilog.info(domain, tag, 'test_Module_BindNativeFunctions_0100 end');
      })

    /*
    * @tc.number    : test_Namespace_BindNativeFunctions_0100
    * @tc.name      : test_Namespace_BindNativeFunctions_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Namespace_BindNativeFunctions_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Namespace_BindNativeFunctions_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_BindNativeFunctions();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Namespace_BindNativeFunctions_0100 done');
        done();
        hilog.info(domain, tag, 'test_Namespace_BindNativeFunctions_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Char_0100
    * @tc.name      : test_Class_CallStaticMethod_Char_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Char_A_0100
    * @tc.name      : test_Class_CallStaticMethod_Char_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Char_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_A_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Char_V_0100
    * @tc.name      : test_Class_CallStaticMethod_Char_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Char_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Char_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Char_V_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Byte_0100
    * @tc.name      : test_Class_CallStaticMethod_Byte_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Byte_A_0100
    * @tc.name      : test_Class_CallStaticMethod_Byte_A_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Byte_A_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_A_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte_A();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_A_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_A_0100 end');
      })

    /*
    * @tc.number    : test_Class_CallStaticMethod_Byte_V_0100
    * @tc.name      : test_Class_CallStaticMethod_Byte_V_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("test_Class_CallStaticMethod_Byte_V_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_V_0100 start');
        let cls = new Foo();
        let result = cls.test_Class_CallStaticMethod_Byte_V();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_V_0100 done');
        done();
        hilog.info(domain, tag, 'test_Class_CallStaticMethod_Byte_V_0100 end');
      })

  })
}