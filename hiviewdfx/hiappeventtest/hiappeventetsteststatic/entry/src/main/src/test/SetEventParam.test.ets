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
let logDomain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'hiAppEventSetEventParamTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function setEventParamTest() {
  describe('setEventParamTest', (): void => {
    hilog.info(logDomain, tag, 'describe start');

    /**
     * @tc.name   testHiAppEventSetPam01
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0100
     * @tc.desc   验证setEventParam接口可设置事件关联自定义参数，并通过onReceive回调获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam01', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam01 start');
      try {
        let msgArray: Array<string> = new Array<string>()
        for (let i = 0; i < 100; i++) {
          msgArray.push("a");
        }
        let keyString = "";
        for (let i = 0; i < 1024; i++) {
          keyString += "a"
        }
        hiAppEvent.addWatcher({
          name: "watcher0100",
          appEventFilters: [{domain: "t"}, {domain: "Test_123domain_Test_123domain_TE"}, {domain: "test_domain"},
            {domain: "test_domain123"}],
          onReceive: (domain: string, groups: Array<hiAppEvent.AppEventGroup>) => {
            hilog.info(logDomain, tag, 'testHiAppEventSetPam01 onReceive domain=' + domain)
            expect(domain == "t" || domain == "Test_123domain_Test_123domain_TE" || domain == "test_domain" ||
              domain == "test_domain123").assertTrue();
            for (const group of groups) {
              hilog.info(logDomain, tag, 'testHiAppEventSetPam01 onReceive eventName=' + group.name)
              for (const info of group.appEventInfos) {
                hilog.info(logDomain, tag, `testHiAppEventSetPam01 onReceive event=${JSON.stringify(info)}`)
                hilog.info(logDomain, tag, 'testHiAppEventSetPam01 onReceive eventType=' + info.eventType)
              }
            }
          }
        });

        let eventParams1: Record<string, hiAppEvent.ParamType> = {
          "Test_paramname_add1_Test_paramnA": true,
          "test_paramname_add": 100,
          "t": keyString,
          "$test_paramname_add4": msgArray,
        };
        let eventParams2: Record<string, hiAppEvent.ParamType> = {};
        for (let i = 0; i < 64; i++) {
          eventParams2["name" + i] = i
        }

        try {
          await hiAppEvent.setEventParam(eventParams1, "t", "Test_123name_Test_123name_Test_123name_Test_123N");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam01 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        }

        try {
          await hiAppEvent.setEventParam(eventParams1, "Test_123domain_Test_123domain_TE", "t");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam01 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        }

        try {
          await hiAppEvent.setEventParam(eventParams2, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam01 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        }

        try {
          await hiAppEvent.setEventParam(eventParams2, "test_domain123", "$test_name123");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam01 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        }

        setTimeout(() => {
          hiAppEvent.write({
            domain: "t",
            name: "Test_123name_Test_123name_Test_123name_Test_123N",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string1",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (error: BusinessError<void> | null) => {
              hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.code}`);
              hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.message}`)
              expect(0).assertEqual(error?.code);
          });
        }, 500)
        setTimeout(() => {
          hiAppEvent.write({
            domain: "Test_123domain_Test_123domain_TE",
            name: "t",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (error: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.message}`)
            expect(0).assertEqual(error?.code);
          });
        }, 800)

        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain",
            name: "test_name",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (error: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.message}`)
            expect(0).assertEqual(error?.code);
          });
        }, 1000)

        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain123",
            name: "$test_name123",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (error: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSetPam01 write event: ${error?.message}`)
            expect(0).assertEqual(error?.code);
          });
        }, 1200)

        setTimeout(() => {
          hiAppEvent.removeWatcher({name:"watcher0100"})
          hilog.info(logDomain, tag, 'testHiAppEventSetPam01 end')
          done()
        }, 5000)
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam02
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0200
     * @tc.desc   验证setEventParam接口可设置事件关联自定义参数，并通过onTrigger回调获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam02', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam02 start');
      try {
        let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
        hiAppEvent.addWatcher({
          name: "watcher0200",
          triggerCondition,
          appEventFilters: [
            {domain: hiAppEvent.domain.OS,
              names: [hiAppEvent.event.APP_LAUNCH, hiAppEvent.event.SCROLL_JANK, hiAppEvent.event.CPU_USAGE_HIGH,
                hiAppEvent.event.BATTERY_USAGE, hiAppEvent.event.RESOURCE_OVERLIMIT, hiAppEvent.event.ADDRESS_SANITIZER,
                hiAppEvent.event.MAIN_THREAD_JANK, hiAppEvent.event.APP_KILLED, hiAppEvent.event.APP_HICOLLIE,
                hiAppEvent.event.AUDIO_JANK_FRAME, hiAppEvent.event.SCROLL_ARKWEB_FLING_JANK]}
          ],
          onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
            expect(holder != null).assertTrue();

            let eventPkg = holder.takeNext();
            if (eventPkg == null) {
              return;
            }
            hilog.info(logDomain, tag, "testHiAppEventSetPam02 eventPkg.packageId=" + eventPkg?.packageId);
            hilog.info(logDomain, tag, "testHiAppEventSetPam02 eventPkg.row=" + eventPkg?.row);
            hilog.info(logDomain, tag, "testHiAppEventSetPam02 eventPkg.size=" + eventPkg?.size);
            for (const eventInfo of eventPkg!.data) {
              hilog.info(logDomain, tag, "testHiAppEventSetPam02 eventPkg.data=" + eventInfo);
            }
            expect(eventPkg.row == 1).assertTrue()
          }
        });

        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "paramname_add_boll": true,
          "paramname_add_number": 100,
        };

        try {
          hiAppEvent.setEventParam(eventParams, hiAppEvent.domain.OS, hiAppEvent.event.SCROLL_JANK);
          hilog.info(logDomain, tag, 'testHiAppEventSetPam02 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam02 Error:', error.message, 'testHiAppEventSetPam02 Code:', error.code);
          expect().assertFail();
        }

        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.SCROLL_JANK,
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string1",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (error: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSetPam02 write event: ${error?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSetPam02 write event: ${error?.message}`)
            expect(0).assertEqual(error?.code);
          });
        }, 500)

        setTimeout(() => {
          hiAppEvent.removeWatcher({"name":"watcher0200"})
          hilog.info(logDomain, tag, 'testHiAppEventSetPam02 end')
          done()
        }, 2000)

      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam02 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam03
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0300
     * @tc.desc   验证setEventParam接口domain下划线结尾，返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam03', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam03 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain_");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam03 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam03 Error:', error.message, 'testHiAppEventSetPam03 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam03 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam04
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0400
     * @tc.desc   验证setEventParam接口domain包含特殊字符，返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam04', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam04 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_?domain");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam04 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam04 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam04 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam05
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0500
     * @tc.desc   验证setEventParam接口domain以数字开头，返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam05', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam05 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "123test_domain");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam05 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam05 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam05 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam06
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0600
     * @tc.desc   验证setEventParam接口domain为空，返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam06', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam06 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam06 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam06 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam06 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam07
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0700
     * @tc.desc   验证setEventParam接口domain为33字节，返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam07', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam07 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "Test_123domain_Test_123domain_TES");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam07 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam07 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam07 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam09
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0900
     * @tc.desc   验证setEventParam接口name下划线结尾，返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam09', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam09 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name_");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam09 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam09 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam09 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam10
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1000
     * @tc.desc   验证setEventParam接口name包含特殊字符，返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam10', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam10 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_?name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam10 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam10 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam10 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam11
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1100
     * @tc.desc   验证setEventParam接口name以数字开头，返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam11', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam11 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "123test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam11 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam11 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam11 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam12
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1200
     * @tc.desc   验证setEventParam接口name为空，成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam12', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam12 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam12 Event parameters set successfully.');
          expect(true).assertTrue()
          done()
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam12 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(false).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam12 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam13
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1300
     * @tc.desc   验证setEventParam接口name49字节，返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam13', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam13 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain",
            "Test_123name_Test_123name_Test_123name_Test_123Na");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam13 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam13 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam13 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam15
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1500
     * @tc.desc   验证setEventParam接口paramname下划线结尾，返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam15', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam15 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param_": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam15 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam15 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam15 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam16
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1600
     * @tc.desc   验证setEventParam接口paramname包含特殊字符，返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam16', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam16 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_?param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam16 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam16 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam16 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam17
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1700
     * @tc.desc   验证setEventParam接口paramname数字开头，返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam17', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam17 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam17 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam17 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam17 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam18
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1800
     * @tc.desc   验证setEventParam接口paramname为空，返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam18', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam18 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam18 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam18 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam18 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam19
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1900
     * @tc.desc   验证setEventParam接口paramname为33字节，返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam19', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam19 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "Test_paramname_add1_Test_paramnAM": true,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam19 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam19 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam19 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam20
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2000
     * @tc.desc   验证setEventParam接口paramvalue为超长字符串，返回错误码11101004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam20', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam20 start');
      try {
        let keyString = "";
        for (let i = 0; i < 1025; i++) {
          keyString += "a"
        }
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": keyString,
        };
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam20 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam20 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101004).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam20 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam21
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2100
     * @tc.desc   验证setEventParam接口自定义参数设置65个，返回错误码11101007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam21', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam21 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {};
        for (let i = 0; i < 65; i++) {
          eventParams["name" + i] = i
        }
        try {
          await hiAppEvent.setEventParam(eventParams, "test_domain", "test_name");
          hilog.info(logDomain, tag, 'testHiAppEventSetPam21 Event parameters set successfully.');
        } catch (error: BusinessError) {
          hilog.error(logDomain, tag, 'testHiAppEventSetPam21 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101007).assertTrue()
          done()
        }
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSetPam21 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam24
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2400
     * @tc.desc   验证setEventParam接口在关闭打点功能后,返回错误码11100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam24', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('testHiAppEventSetPam24 start');
      hiAppEvent.configure({disable: true});
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, hiAppEvent.domain.OS).then(() => {
          console.log('testHiAppEventSetPam24 Event parameters set successfully.');
      }).catch((err: Error) => {
          const bErr = err as BusinessError;
          console.error('testHiAppEventSetPam24 Error:', bErr.message, 'testHiAppEventSetPam24 Code:', bErr.code);
          expect(bErr.code == 11100001).assertTrue()
          done();
        });
      } catch (error: BusinessError) {
        console.error(`testHiAppEventSetPam24 > error code: ${error.code}, error msg: ${error.message}`);
        expect(false).assertTrue()
        done();
      }
      hiAppEvent.configure({disable: false});
      done();
    })

    /**
     * @tc.name   testHiAppEventSetPam25
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2500
     * @tc.desc   验证setEventParam接口可设置事件关联自定义参数，并通过onTrigger回调获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSetPam25', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSetPam25 start');
      let holder = hiAppEvent.addWatcher({
        name: "watcher1",
      });
      let eventPkg = holder.takeNext();
      console.log('testHiAppEventSetPam25 done');
      expect(eventPkg).assertNull()
      hiAppEvent.removeWatcher({name:"watcher1"});
      done();
    });
  })
  hilog.info(logDomain, tag, 'setEventParamTest end');
}