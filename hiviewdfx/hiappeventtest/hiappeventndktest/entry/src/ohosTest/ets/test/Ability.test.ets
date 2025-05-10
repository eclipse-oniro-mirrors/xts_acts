import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_WRITE_0100
     * @tc.name       : testOHHiAppEventWrite001
     * @tc.desc       : test OH_HiAppEvent_Write
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventWrite001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventWrite();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CONFIGURE_0100
     * @tc.name       : testOHHiAppEventConfigure001
     * @tc.desc       : test OH_HiAppEvent_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventConfigure001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventConfigure();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLPARAM_0100
     * @tc.name       : testOHHiAppEventAddBoolParam001
     * @tc.desc       : test OH_HiAppEvent_AddBoolParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddBoolParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddBoolArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddBoolArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddBoolArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt8Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt8Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt8Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt8ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt8ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt8ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt16Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt16Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt16Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt16ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt16ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt16ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt32Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt32Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt32Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt32ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt32ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt32ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt64Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt64Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt64Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt64ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt64ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt64ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATPARAM_0100
     * @tc.name       : testOHHiAppEventAddFloatParam001
     * @tc.desc       : test OH_HiAppEvent_AddFloatParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddFloatParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddFloatArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddFloatArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddFloatArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEPARAM_0100
     * @tc.name       : testOHHiAppEventAddDoubleParam001
     * @tc.desc       : test OH_HiAppEvent_AddDoubleParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddDoubleParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddDoubleArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddDoubleArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddDoubleArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGPARAM_0100
     * @tc.name       : testOHHiAppEventAddStringParam001
     * @tc.desc       : test OH_HiAppEvent_AddStringParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddStringParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddStringArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddStringArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddStringArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CREATEPARAMLIST_0100
     * @tc.name       : testOHHiAppEventCreateParamList001
     * @tc.desc       : test OH_HiAppEvent_CreateParamList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventCreateParamList001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventCreateParamList();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0100
     * @tc.name testHiAppEventWatcherCode01
     * @tc.desc 验证hiappevent-OH_HiAppEvent_SetAppEventFilter所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode01', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200
     * @tc.name testHiAppEventWatcherCode02
     * @tc.desc 验证hiappevent-OH_HiAppEvent_SetTriggerCondition所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode02', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0300
     * @tc.name testHiAppEventWatcherCode03
     * @tc.desc 验证hiappevent-OH_HiAppEvent_SetWatcherOnTrigger所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode03', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0400
     * @tc.name testHiAppEventWatcherCode04
     * @tc.desc 验证hiappevent-OH_HiAppEvent_SetWatcherOnReceive所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode04', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0500
     * @tc.name testHiAppEventWatcherCode05
     * @tc.desc 验证hiappevent-OH_HiAppEvent_TakeWatcherData所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode05', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0600
     * @tc.name testHiAppEventWatcherCode06
     * @tc.desc 验证hiappevent-OH_HiAppEvent_AddWatcher所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode06', 1, async (done: Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Watcher_Code_0700
     * @tc.name testHiAppEventWatcherCode07
     * @tc.desc 验证hiappevent-OH_HiAppEvent_RemoveWatcher所有场景返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventWatcherCode07', 1, async (done: Function) => {
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
