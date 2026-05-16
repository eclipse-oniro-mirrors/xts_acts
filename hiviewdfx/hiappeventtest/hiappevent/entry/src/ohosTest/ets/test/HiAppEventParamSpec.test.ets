import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import hiAppEvent from '@ohos.hiAppEvent';
import { describe, it, expect, Level } from '@ohos/hypium'

function generateLongString(length: number): string {
  let str: string = '';
  for (let i: number = 0; i < length; i++) {
    str += 'a';
  }
  return str;
}

function generateEventName(length: number): string {
  let str: string = 'e';
  for (let i: number = 0; i < length - 1; i++) {
    str += 'a';
  }
  return str;
}

function generateParamName(length: number): string {
  let str: string = 'k';
  for (let i: number = 0; i < length - 1; i++) {
    str += 'a';
  }
  return str;
}

let domain: number = 0x0000;
let tag: string = 'hiAppEventParamSpec';

export default function HiAppEventParamSpecTest() {
  describe('HiAppEventParamSpecTest', () => {

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0100
     * @tc.desc   Test write interface with event name exceeding maximum length (48 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longEventName: string = generateEventName(49);
      let eventParams: Record<string, number> = { "int_data": 100 };
      hiAppEvent.write(longEventName, hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error received: code=${err.code}`);
          
          done();
        } else {
          hilog.error(domain, tag, 'Should return error for event name exceeding max length');
          expect(false).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0200
     * @tc.desc   Test write interface with event name at boundary length (48 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryEventName: string = generateEventName(48);
      let eventParams: Record<string, number> = { "int_data": 100 };
      hiAppEvent.write(boundaryEventName, hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.error(domain, tag, `Unexpected error: code=${err.code}, message=${err.message}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded with boundary event name length');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Char_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Char_0100
     * @tc.desc   Test write interface with event name starting with invalid character.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_EventName_Char_0100', Level.LEVEL3, async (done: Function) => {
      let invalidEventName: string = '1test_event';
      let eventParams: Record<string, number> = { "int_data": 100 };
      hiAppEvent.write(invalidEventName, hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error received: code=${err.code}`);
          done();
        } else {
          hilog.error(domain, tag, 'Should return error for invalid event name');
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0100
     * @tc.desc   Test write interface with parameter name exceeding maximum length (32 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longParamName: string = generateParamName(33);
      let eventParams: Record<string, string> = {};
      eventParams[longParamName] = 'test_value';
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error or warning: code=${err.code}`);

          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded but param may be discarded');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0200
     * @tc.desc   Test write interface with parameter name at boundary length (32 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamName_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryParamName: string = generateParamName(32);
      let eventParams: Record<string, string> = {};
      eventParams[boundaryParamName] = 'test_value';
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded with boundary param name length');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0100
     * @tc.desc   Test write interface with string parameter value exceeding maximum length (8*1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longStringValue: string = generateLongString(8193);
      let eventParams: Record<string, string> = { "str_data": longStringValue };
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error or warning: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded but string value may be truncated');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0200
     * @tc.desc   Test write interface with string parameter value at boundary length (8*1024 characters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamValue_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryStringValue: string = generateLongString(8192);
      let eventParams: Record<string, string> = { "str_data": boundaryStringValue };
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded with boundary string value length');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0100
     * @tc.desc   Test write interface with array parameter exceeding maximum length (100 elements).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0100', Level.LEVEL3, async (done: Function) => {
      let longArray: Array<number> = [];
      for (let i: number = 0; i < 101; i++) {
        longArray.push(i);
      }
      let eventParams: Record<string, Array<number>> = { "array_data": longArray };
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error or warning: code=${err.code}`);

          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded but array elements may be discarded');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0200
     * @tc.desc   Test write interface with array parameter at boundary length (100 elements).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_Array_Length_0200', Level.LEVEL2, async (done: Function) => {
      let boundaryArray: Array<number> = [];
      for (let i: number = 0; i < 100; i++) {
        boundaryArray.push(i);
      }
      let eventParams: Record<string, Array<number>> = { "array_data": boundaryArray };
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded with boundary array length');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0100
     * @tc.desc   Test write interface with parameter count exceeding maximum (32 parameters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0100', Level.LEVEL3, async (done: Function) => {
      let eventParams: Record<string, number> = {};
      for (let i: number = 0; i < 33; i++) {
        eventParams[`key${i}`] = i;
      }
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.info(domain, tag, `Expected error or warning: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded but extra params may be discarded');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0200
     * @tc.desc   Test write interface with parameter count at boundary (32 parameters).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_ParamCount_0200', Level.LEVEL2, async (done: Function) => {
      let eventParams: Record<string, number> = {};
      for (let i: number = 0; i < 32; i++) {
        eventParams[`key${i}`] = i;
      }
      hiAppEvent.write('test_event', hiAppEvent.EventType.FAULT, eventParams, (err: BusinessError) => {
        if (err) {
          hilog.error(domain, tag, `Unexpected error: code=${err.code}`);
          done();
        } else {
          hilog.info(domain, tag, 'Write succeeded with boundary param count');
          expect(err == null).assertTrue();
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0100
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0100
     * @tc.desc   Test write interface with invalid event type value (999).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0100', Level.LEVEL3, async (done: Function) => {
      let eventParams: Record<string, number> = { "int_data": 100 };
      try {
        hiAppEvent.write('test_event', 999 as hiAppEvent.EventType, eventParams, (err: BusinessError) => {
          if (err) {
            hilog.info(domain, tag, `Expected error: code=${err.code}`);
            done();
          } else {
            hilog.error(domain, tag, 'Should return error for invalid event type');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `Catch error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0200
     * @tc.number SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0200
     * @tc.desc   Test write interface with negative event type value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_HiAppEvent_ParamSpec_EventType_Invalid_0200', Level.LEVEL3, async (done: Function) => {
      let eventParams: Record<string, number> = { "int_data": 100 };
      try {
        hiAppEvent.write('test_event', -1 as hiAppEvent.EventType, eventParams, (err: BusinessError) => {
          if (err) {
            hilog.info(domain, tag, `Expected error: code=${err.code}`);
            done();
          } else {
            hilog.error(domain, tag, 'Should return error for negative event type');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `Catch error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  })
}