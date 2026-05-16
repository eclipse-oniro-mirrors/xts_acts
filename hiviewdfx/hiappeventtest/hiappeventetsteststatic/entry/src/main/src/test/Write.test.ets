/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HiAppEventWriteTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function writeTest() {

  describe("writeTest", (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   testHiAppEvent001
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0100
     * @tc.desc   HiAppEvent write by Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent001 start');
      try {
        await hiAppEvent.write({
          domain: "test_domain",
          name: "write",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "key_int": 100, "key_string": "demo",
            "key_bool":true, "key_float":1.1,"key_array_int": [1, 2, 3], "key_array_float": [1.1, 2.2, 3.3],
            "key_array_str": ["a", "b", "c"], "key_array_bool": [true, false],"key_array_int2": [1, 2, 3],
            "key_arr_float2": [1.1, 2.2, 3.3], "key_arr_str2": ["a", "b", "c"], "key_array_bool2": [true, false]
          } as Record<string, Double|string|boolean|(Double|string|boolean)[]>
        })
        hilog.info(domain, tag, 'success to write event');
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        hilog.error(domain, tag, "failed to write event because: " + error.code);
        expect(0).assertEqual(error.code);
        done();
      }
      hilog.info(domain, tag, 'testHiAppEvent001 end');
    })

    /**
     * @tc.name   testHiAppEvent002
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0200
     * @tc.desc   HiAppEvent write by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent002 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "test_event",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100, "key_string": "demo",
          "key_bool":true, "key_float":1.1,"key_array_int": [1, 2, 3], "key_array_float": [1.1, 2.2, 3.3],
          "key_array_str": ["a", "b", "c"], "key_array_bool": [true, false],"key_array_int2": [1, 2, 3],
          "key_arr_float2": [1.1, 2.2, 3.3], "key_arr_str2": ["a", "b", "c"], "key_array_bool2": [true, false]
        } as Record<string, Double|string|boolean|(Double|string|boolean)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      });
      hilog.info(domain, tag, 'testHiAppEvent002 end');
    })

    /**
     * @tc.name   testHiAppEvent003
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0300
     * @tc.desc   验证Write(API9)接口传入参数为特殊number，中文字符，可调用成功，无返回错误码.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent003 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "test_event",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_max": Int.MAX_VALUE, "key_min": Int.MIN_VALUE, "key_chinese": "中文"
        } as Record<string, int|string|boolean|Double|Long|(int|string|boolean|Double|Long)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      }
      );
      hilog.info(domain, tag, 'testHiAppEvent003 end');
    })

    /**
     * @tc.name   testHiAppEvent004
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0400
     * @tc.desc   验证Write(API9)接口成功，传入参数名称可以符合规格.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent004', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent004 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "test_event",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "kEy9_int": 100, "KEy99_strinG_KEY": "demo", "$kEy9_bool9":true
        } as Record<string, int|string|boolean|(int|string|boolean)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      });
      hilog.info(domain, tag, 'testHiAppEvent004 end');
    })

    /**
     * @tc.name   testHiAppEvent005
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0500
     * @tc.desc   验证Write(API9)接口成功，传入事件名称大写字母、小写字母、数字、_为中间字符，大写字母为开头和结尾.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent005', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent005 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "TEst9_evenT",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100, "key_string": "demo"
        } as Record<string, int|string|boolean|(int|string|boolean)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      });
      hilog.info(domain, tag, 'testHiAppEvent005 end');
    })

    /**
     * @tc.name   testHiAppEvent006
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0600
     * @tc.desc   验证Write(API9)接口成功，传入事件名称大写字母、小写字母、数字、_为中间字符，小写字母为开头和结尾.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent006', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent006 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "tEst9_event",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100, "key_string": "demo"
        } as Record<string, int|string|boolean|(int|string|boolean)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      });
      hilog.info(domain, tag, 'testHiAppEvent006 end');
    })

    /**
     * @tc.name   testHiAppEvent007
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSANI_0700
     * @tc.desc   验证Write(API9)接口成功，传入事件名称大写字母、小写字母、数字、_为中间字符，$开头,以数字结尾，长度48字符.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEvent007', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent007 start');
      hiAppEvent.write({
        domain: "test_domain",
        name: "$tEst9_event9_tEst9_event9_tEst9_event9_tEst9_e9",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100, "key_string": "demo"
        } as Record<string, int|string|boolean|(int|string|boolean)[]>
      }, (error: BusinessError<void> | null) => {
        hilog.info(domain, tag, 'HiAppEvent json-callback code=' + error?.code);
        expect(0).assertEqual(error?.code);
        done();
      });
      hilog.info(domain, tag, 'testHiAppEvent007 end');
    })

    /**
     * @tc.name   HiAppEventSub33
     * @tc.number DFX_DFT_HiAppEvent_Sub_3300
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub33', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub33 start')
      try{
        hiAppEvent.write({
          domain: "test_?domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub33 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101001).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub33 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub33 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub34
     * @tc.number DFX_DFT_HiAppEvent_Sub_3400
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub34', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub34 start')
      try{
        hiAppEvent.write({
          domain: "test_domain_",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub34 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101001).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub34 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub34 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub35
     * @tc.number DFX_DFT_HiAppEvent_Sub_3500
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub35', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub35 start')
      try{
        hiAppEvent.write({
          domain: "",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub35 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101001).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub35 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub35 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub36
     * @tc.number DFX_DFT_HiAppEvent_Sub_3600
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub36', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub36 start')
      try{
        hiAppEvent.write({
          domain: "test_domain_test_domain_test_doma",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub36 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101001).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub36 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub36 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub37
     * @tc.number DFX_DFT_HiAppEvent_Sub_3700
     * @tc.desc   验证调用write接口，事件领域名称大写字母开头，32字符，打点成功.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub37', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub37 start')
      try{
        hiAppEvent.write({
          domain: "Test_domain_Test_domain_Test_dom",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub37 > code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue()
            done()
            return;
          } else {
            hilog.info(domain, tag, `success to write event`);
            expect(true).assertTrue()
            done()
          }
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub37 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub37 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub38
     * @tc.number DFX_DFT_HiAppEvent_Sub_3800
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub38', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub38 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_?event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub38 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101002).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub38 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub38 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub39
     * @tc.number DFX_DFT_HiAppEvent_Sub_3900
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub39', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub39 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event_",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub39 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101002).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub39 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub39 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub40
     * @tc.number DFX_DFT_HiAppEvent_Sub_4000
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub40', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub40 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub40 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101002).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub40 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub40 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub41
     * @tc.number DFX_DFT_HiAppEvent_Sub_4100
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub41', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub41 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event_test_event_test_event_test_event_test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub41 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101002).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub41 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub41 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub42
     * @tc.number DFX_DFT_HiAppEvent_Sub_4200
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub42', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub42 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "9Test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub42 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101002).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub42 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub42 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub43
     * @tc.number DFX_DFT_HiAppEvent_Sub_4300
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub43', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub43 start')
      try{
        let largeParams: Record<string, number | string | boolean | (number | string | boolean)[]> = {}
        for (let i = 0; i <33 ; i++) {
          largeParams["name" + i] = i
        }
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: largeParams
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub43 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101003).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub43 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub43 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub44
     * @tc.number DFX_DFT_HiAppEvent_Sub_4400
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub44', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub44 start')
      try{
        let longStr = "a".repeat(8*1024 + 1);
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data":longStr
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub44 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101004).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub44 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub44 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub45
     * @tc.number DFX_DFT_HiAppEvent_Sub_4500
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub45', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub45 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_?data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub45 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101005).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub45 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub45 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub46
     * @tc.number DFX_DFT_HiAppEvent_Sub_4600
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub46', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub46 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data_": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub46 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101005).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub46 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub46 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub47
     * @tc.number DFX_DFT_HiAppEvent_Sub_4700
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub47', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub47 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub47 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101005).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub47 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub47 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub48
     * @tc.number DFX_DFT_HiAppEvent_Sub_4800
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub48', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub48 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data_int_data_int_data_int_da": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub48 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101005).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub48 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub48 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub49
     * @tc.number DFX_DFT_HiAppEvent_Sub_4900
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub49', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub49 start')
      try{
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "9Int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub49 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101005).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub49 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub49 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub50
     * @tc.number DFX_DFT_HiAppEvent_Sub_5000
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub50', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub50 start')
      try{
        let msgArray: number | string | boolean | (number | string | boolean)[] = []
        for (let i = 0; i < 101; i++) {
          msgArray.push(i);
        }
        let params: Record<string, number | string | boolean | (number | string | boolean)[]> = {
          "int_data": 100,
          "str_data": "strValue",
          "msg": msgArray
        }
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub50 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11101006).assertTrue()
            done()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub50 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub50 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub51
     * @tc.number DFX_DFT_HiAppEvent_Sub_5100
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub51', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub51 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1?",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub51 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub51 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub52
     * @tc.number DFX_DFT_HiAppEvent_Sub_5200
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub52', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub52 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher_?",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub52 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub52 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub53
     * @tc.number DFX_DFT_HiAppEvent_Sub_5300
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub53', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub53 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub53 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub53 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub54
     * @tc.number DFX_DFT_HiAppEvent_Sub_5400
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub54', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub54 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1watcher2watcher3watcher4w",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub54 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub54 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub55
     * @tc.number DFX_DFT_HiAppEvent_Sub_5500
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub55', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub55 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "Watcher1Watcher2Watcher3Watcher4",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result != null).assertTrue();
        done()
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub55 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub55 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub56
     * @tc.number DFX_DFT_HiAppEvent_Sub_5600
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub56', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub56 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_?domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub56 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102002).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub56 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub57
     * @tc.number DFX_DFT_HiAppEvent_Sub_5700
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub57', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub57 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_domain_"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub57 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102002).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub57 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub58
     * @tc.number DFX_DFT_HiAppEvent_Sub_5800
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub58', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub58 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: ""
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub58 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102002).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub58 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub59
     * @tc.number DFX_DFT_HiAppEvent_Sub_5900
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub59', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub59 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_domain_test_domain_test_doma"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub59 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102002).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub59 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub60
     * @tc.number DFX_DFT_HiAppEvent_Sub_6000
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub60', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub60 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "Test_domain_Test_domain_Test_dom"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result != null).assertTrue();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub60 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub60 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub61
     * @tc.number DFX_DFT_HiAppEvent_Sub_6100
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub61', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub61 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: -1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub61 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102003).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub61 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub62
     * @tc.number DFX_DFT_HiAppEvent_Sub_6200
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub62', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub62 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          size: -1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub62 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102004).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub62 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub63
     * @tc.number DFX_DFT_HiAppEvent_Sub_6300
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub63', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub63 start')
      try{
        let triggerCondition: hiAppEvent.TriggerCondition = {
          timeOut: -1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: "test_domain"
            }
          ],
          triggerCondition,
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
          }
        })
        expect(result == null).assertTrue();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub63 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11102005).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub63 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub64
     * @tc.number DFX_DFT_HiAppEvent_Sub_6400
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub64', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'HiAppEventSub64 start')
      try{
        hiAppEvent.configure({
          maxStorage: '100M?'
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub64 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11103001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub64 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub65
     * @tc.number DFX_DFT_HiAppEvent_Sub_6500
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub65', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub65 start')
      try{
        hiAppEvent.configure({
          maxStorage: '100A'
        });
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub65 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11103001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub65 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub66
     * @tc.number DFX_DFT_HiAppEvent_Sub_6600
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub66', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEventSub66 start')
      try{
        let holder = hiAppEvent.addWatcher({
          name: "watcher",
        });
        holder.setSize(-1000);
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub66 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 11104001).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub66 end')
        done()
      }
    })

    /**
     * @tc.name   HiAppEventSub32
     * @tc.number DFX_DFT_HiAppEvent_Sub_3200
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub32', Level.LEVEL3, ():void => {
      hilog.info(domain, tag, 'testHiAppEventSub32 start')
      try{
        hiAppEvent.configure({
          disable: true
        });
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub32 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11100001).assertTrue()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
        setTimeout(() => {
          hiAppEvent.configure({
            disable: false
          });
        }, 50)

      } catch (err: BusinessError) {
        hilog.error(domain, tag, `HiAppEventSub32 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub32 end')
      }
    })

    /**
     * @tc.name   testHiAppEventApi45
     * @tc.number DFX_DFT_HiviewKit_HiAppEvent_JSNAPI_4500
     * @tc.desc   HiAppEvent with predefined event and param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventApi45', Level.LEVEL3, ():void => {
      console.info('testHiAppEventApi45 start');
      hiAppEvent.configure({
        disable: false
      });
      hiAppEvent.write({
        domain: "test_domain",
        name: "test_name",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "USER_ID": hiAppEvent.param.USER_ID,
          "DISTRIBUTED_SERVICE_NAME": hiAppEvent.param.DISTRIBUTED_SERVICE_NAME,
          "DISTRIBUTED_SERVICE_INSTANCE_ID": hiAppEvent.param.DISTRIBUTED_SERVICE_INSTANCE_ID,
        } as Record<string, int|string|boolean|(int|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        if (err) {
          hilog.error(domain, tag, `testHiAppEventApi45 > code: ${err.code}, message: ${err.message}`);
          expect(err?.code == 0).assertTrue()
          return;
        }
        console.log(`testHiAppEventApi45 success to write event`)
      });
      console.info('testHiAppEventApi45 end');
    })
  })
  hilog.info(domain, tag, 'writeTest end');
}