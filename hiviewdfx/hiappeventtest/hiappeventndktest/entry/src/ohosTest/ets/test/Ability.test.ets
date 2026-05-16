import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testOHHiAppEventWrite001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_WRITE_0100
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventWrite001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventWrite();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventConfigure001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CONFIGURE_0100
     * @tc.desc   test OH_HiAppEvent_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventConfigure001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventConfigure();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddBoolParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddBoolParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddBoolParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddBoolArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddBoolArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddBoolArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt8Param001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8PARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt8Param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt8Param001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt8ArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8ARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt8ArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt8ArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt16Param001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16PARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt16Param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt16Param001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt16ArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16ARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt16ArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt16ArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt32Param001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32PARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt32Param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt32Param001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt32ArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32ARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt32ArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt32ArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt64Param001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64PARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt64Param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt64Param001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddInt64ArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64ARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddInt64ArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddInt64ArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddFloatParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddFloatParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddFloatParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddFloatArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddFloatArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddFloatArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddDoubleParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddDoubleParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddDoubleParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddDoubleArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddDoubleArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddDoubleArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddStringParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddStringParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddStringParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventAddStringArrayParam001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGARRAYPARAM_0100
     * @tc.desc   test OH_HiAppEvent_AddStringArrayParam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventAddStringArrayParam001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiAppEventCreateParamList001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CREATEPARAMLIST_0100
     * @tc.desc   test OH_HiAppEvent_CreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiAppEventCreateParamList001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventCreateParamList();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OHHiAppEventAddBoolParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddBoolParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHHiAppEventAddBoolParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddBoolParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   OHHiAppEventAddBoolArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddBoolArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHHiAppEventAddBoolArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddBoolArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   OHHiAppEventAddInt8ParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt8Param_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHHiAppEventAddInt8ParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt8ParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt8ArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt8ArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt8ArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt8ArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt16ParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt16Param_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt16ParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt16ParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt16ArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt16ArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt16ArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt16ArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt32ParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt32Param_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt32ParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt32ParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt32ArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt32ArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt32ArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt32ArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt64ParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt64Param_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt64ParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt64ParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddInt64ArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddInt64ArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddInt64ArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddInt64ArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddFloatParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddFloatParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddFloatParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddFloatParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddFloatArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddFloatArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddFloatArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddFloatArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddDoubleParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddDoubleParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddDoubleParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddDoubleParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddDoubleArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddDoubleArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddDoubleArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddDoubleArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddStringParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddStringParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddStringParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddStringParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AddStringArrayParamReturn001
     * @tc.number SUB_DFX_OHHiAppEventAddStringArrayParam_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AddStringArrayParamReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventAddStringArrayParamReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   CreateWatcherReturn001
     * @tc.number SUB_DFX_OHHiAppEventCreateWatcher_Return_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CreateWatcherReturn001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventCreateWatcherReturn();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   ConfigureReturnTrue001
     * @tc.number SUB_DFX_OHHiAppEventConfigure_ReturnTrue_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConfigureReturnTrue001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventConfigureReturnTrue();
      console.log("hiappevent=================================" + result);
      expect(result == 0).assertTrue();
      done();
    });

    /**
     * @tc.name   ConfigureReturnFalse001
     * @tc.number SUB_DFX_OHHiAppEventConfigure_ReturnFalse_0100
     * @tc.desc   test OHHiAppEventCreateParamList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConfigureReturnFalse001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OHHiAppEventConfigureReturnFalse();
      console.log("hiappevent=================================" + result);
      expect(result == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHiAppEventWatcherCode01
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100
     * @tc.desc   验证hiappevent-OH_HiAppEvent_SetAppEventFilter所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.setAppEventFilter();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.setAppEventFilterInvName();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100 code2 : ${code}`);
        expect(code == -1).assertTrue();
        code = hiappevent.setAppEventFilterInvDomain();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100 code3 : ${code}`);
        expect(code == -4).assertTrue();
        code = hiappevent.setAppEventFilterInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100 code4 : ${code}`);
        expect(code == -5).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode02
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200
     * @tc.desc   验证hiappevent-OH_HiAppEvent_SetTriggerCondition所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.setTriggerCondition();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.setTriggerConditionInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code2 : ${code}`);
        expect(code == -5).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode03
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0300
     * @tc.desc   验证hiappevent-OH_HiAppEvent_SetWatcherOnTrigger所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.setWatcherOnTrigger();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0300 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.setWatcherOnTriggerInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0300 code2 : ${code}`);
        expect(code == -5).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0300 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode04
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0400
     * @tc.desc   验证hiappevent-OH_HiAppEvent_SetWatcherOnReceive所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.setWatcherOnReceive();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0400 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.setWatcherOnReceiveInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0400 code2 : ${code}`);
        expect(code == -5).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0400 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode05
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500
     * @tc.desc   验证hiappevent-OH_HiAppEvent_TakeWatcherData所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.takeWatcherData();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.takeWatcherDataInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500 code2 : ${code}`);
        expect(code == -5).assertTrue();
        code = hiappevent.takeWatcherDataInvOperation();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500 code2 : ${code}`);
        expect(code == -6).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode06
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0600
     * @tc.desc   验证hiappevent-OH_HiAppEvent_AddWatcher所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.addWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0600 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.addWatcherInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0600 code2 : ${code}`);
        expect(code == -5).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0600 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventWatcherCode07
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700
     * @tc.desc   验证hiappevent-OH_HiAppEvent_RemoveWatcher所有场景返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventWatcherCode07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.removeWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700 code1 : ${code}`);
        expect(code == 0).assertTrue();
        code = hiappevent.removeWatcherInvWatcher();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700 code2 : ${code}`);
        expect(code == -5).assertTrue();
        code = hiappevent.removeWatcherInvOperation();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700 code3 : ${code}`);
        expect(code == -6).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
       }
      })
    })
  }
