import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function variableOperationsTest() {

  describe("ActsVariableOperationsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    try {
      loadLibrary("entry")
    } catch (e: Error) {
      hilog.info(domain, tag, 'loadFailed', e.message);
    }

    /*
    * @tc.number    : Variable_SetValue_Long_0100
    * @tc.name      : Variable_SetValue_Long_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("Variable_SetValue_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Long_0100 end');
      })

    /*
    * @tc.number    : Variable_SetValue_Int_0100
    * @tc.name      : Variable_SetValue_Int_0100
    * @tc.desc      : MediumTest
    * @tc.size      : Function
    * @tc.type      : Function test
    * @tc.level     : Level 0
    */
    it("Variable_SetValue_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Int_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Double_0100
     * @tc.name      : Variable_SetValue_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Double_0100 end');
      })


    /*
     * @tc.number    : Variable_GetValue_Ref_0100
     * @tc.name      : Variable_GetValue_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Ref_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Double_0100
     * @tc.name      : Variable_GetValue_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Double();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Double_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Double_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Boolean_0100
     * @tc.name      : Variable_GetValue_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Boolean_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Int_0100
     * @tc.name      : Variable_GetValue_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Int();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Int_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Int_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Long_0100
     * @tc.name      : Variable_GetValue_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Long();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Long_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Long_0100 end');
      })

    /*
     * @tc.number    : Namespace_FindVariable_0100
     * @tc.name      : Namespace_FindVariable_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Namespace_FindVariable_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Namespace_FindVariable_0100 start');
        let cls = new Foo();
        let result = cls.test_Namespace_FindVariable();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Namespace_FindVariable_0100 done');
        done();
        hilog.info(domain, tag, 'Namespace_FindVariable_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Boolean_0100
     * @tc.name      : Variable_SetValue_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Boolean();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Boolean_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Boolean_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Char_0100
     * @tc.name      : Variable_SetValue_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Char_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Byte_0100
     * @tc.name      : Variable_SetValue_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Byte_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Short_0100
     * @tc.name      : Variable_SetValue_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Short_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Float_0100
     * @tc.name      : Variable_SetValue_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Float_0100 end');
      })

    /*
     * @tc.number    : Variable_SetValue_Ref_0100
     * @tc.name      : Variable_SetValue_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_SetValue_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_SetValue_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_SetValue_Ref();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_SetValue_Ref_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_SetValue_Ref_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Char_0100
     * @tc.name      : Variable_GetValue_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Char();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Char_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Char_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Byte_0100
     * @tc.name      : Variable_GetValue_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Byte();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Byte_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Byte_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Short_0100
     * @tc.name      : Variable_GetValue_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Short();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Short_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Short_0100 end');
      })

    /*
     * @tc.number    : Variable_GetValue_Float_0100
     * @tc.name      : Variable_GetValue_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("Variable_GetValue_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Variable_GetValue_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_Variable_GetValue_Float();
        expect(result).assertTrue();
        hilog.info(domain, tag, 'Variable_GetValue_Float_0100 done');
        done();
        hilog.info(domain, tag, 'Variable_GetValue_Float_0100 end');
      })
  })
}