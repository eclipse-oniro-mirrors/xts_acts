/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Level, Size} from '@ohos/hypium'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import fs from '@ohos.file.fs';

interface Processor {
  name: string;
  configName: string;
}

export default function HiAppEventPamTest() {
  describe('HiAppEventPamTest', () => {
    /**
     * @tc.name   testHiAppEventSetPam01
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0100
     * @tc.desc   验证setEventParam接口可设置事件关联自定义参数,并通过onReceive回调获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam01 start');
      try {
        let msgArray: Array<string> = []
        for (let i = 0; i < 100; i++) {
          msgArray[i] = "a"
        }
        let keyString = "";
        for (let i = 0; i < 1024; i++) {
          keyString += "a"
        }
        hiAppEvent.addWatcher({
          name: "watcher0100",
          appEventFilters: [{domain: "t"}, {domain: "Test_123domain_Test_123domain_TE"}, {domain: "test_domain"},
            {domain: "test_domain123"}],
          onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
            console.log('testHiAppEventSetPam01 onReceive domain=', domain)
            expect(domain == "t" || domain == "Test_123domain_Test_123domain_TE" || domain == "test_domain" ||
              domain == "test_domain123").assertTrue();
            for (const eventGroup of appEventGroups) {
              console.log('testHiAppEventSetPam01 onReceive eventName=', eventGroup.name)
              for (const info of eventGroup.appEventInfos) {
                console.log(`testHiAppEventSetPam01 onReceive event=${JSON.stringify(info)}`)
                console.log('testHiAppEventSetPam01 onReceive eventType=', info.eventType)
                console.log('testHiAppEventSetPam01 onReceive params=', JSON.stringify(info.params))
                console.log('testHiAppEventSetPam01 onReceive params.exception', JSON.stringify(info.params))
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

        hiAppEvent.setEventParam(eventParams1, "t", "Test_123name_Test_123name_Test_123name_Test_123N").then(() => {
          console.log('testHiAppEventSetPam01 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        });

        hiAppEvent.setEventParam(eventParams1, "Test_123domain_Test_123domain_TE", "t").then(() => {
          console.log('testHiAppEventSetPam01 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        });

        hiAppEvent.setEventParam(eventParams2, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam01 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        });

        hiAppEvent.setEventParam(eventParams2, "test_domain123", "$test_name123").then(() => {
          console.log('testHiAppEventSetPam01 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam01 Error:', error.message, 'testHiAppEventSetPam01 Code:', error.code);
          expect().assertFail();
        });

        setTimeout(() => {
          hiAppEvent.write({
            domain: "t",
            name: "Test_123name_Test_123name_Test_123name_Test_123N",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string1",
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSetPam01 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSetPam01 success to write event: ${value}`)
          });
        }, 500)
        setTimeout(() => {
          hiAppEvent.write({
            domain: "Test_123domain_Test_123domain_TE",
            name: "t",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSetPam01 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSetPam01 success to write event: ${value}`)
          });
        }, 600)

        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain",
            name: "test_name",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSetPam01 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSetPam01 success to write event: ${value}`)
          });
        }, 700)

        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain123",
            name: "$test_name123",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string2",
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSetPam01 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSetPam01 success to write event: ${value}`)
          });
        }, 800)

        setTimeout(() => {
          hiAppEvent.removeWatcher({"name":"watcher0100"})
          console.info('testHiAppEventSetPam01 end')
          done()
        }, 3000)
      } catch (err) {
        console.error(`testHiAppEventSetPam01 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam02
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0200
     * @tc.desc   验证setEventParam接口可设置事件关联自定义参数,并通过onTrigger回调获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam02 start');
      try {
        hiAppEvent.addWatcher({
          name: "watcher0200",
          triggerCondition: {
            row: 1
          },
          appEventFilters: [
            {domain: hiAppEvent.domain.OS,
              names: [hiAppEvent.event.APP_LAUNCH, hiAppEvent.event.SCROLL_JANK, hiAppEvent.event.CPU_USAGE_HIGH,
                hiAppEvent.event.BATTERY_USAGE, hiAppEvent.event.RESOURCE_OVERLIMIT, hiAppEvent.event.ADDRESS_SANITIZER,
                hiAppEvent.event.MAIN_THREAD_JANK, hiAppEvent.event.APP_HICOLLIE, hiAppEvent.event.AUDIO_JANK_FRAME,
                hiAppEvent.event.SCROLL_ARKWEB_FLING_JANK]}
          ],
          onTrigger: (curRow, curSize, holder) => {
            expect(holder != null).assertTrue();

            let eventPkg = holder.takeNext();
            if (eventPkg == null) {
              return;
            }
            console.info("testHiAppEventSetPam02 eventPkg.packageId=" + eventPkg.packageId);
            console.info("testHiAppEventSetPam02 eventPkg.row=" + eventPkg.row);
            console.info("testHiAppEventSetPam02 eventPkg.size=" + eventPkg.size);
            for (const eventInfo of eventPkg.data) {
              console.info("testHiAppEventSetPam02 eventPkg.data=" + eventInfo);
            }
            expect(eventPkg.row == 1).assertTrue()
          }
        });

        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "paramname_add_boll": true,
          "paramname_add_number": 100,
        };

        hiAppEvent.setEventParam(eventParams, hiAppEvent.domain.OS, hiAppEvent.event.SCROLL_JANK).then(() => {
          console.log('testHiAppEventSetPam02 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam02 Error:', error.message, 'testHiAppEventSetPam02 Code:', error.code);
          expect().assertFail();
        });

        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.SCROLL_JANK,
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "string1",
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSetPam02 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSetPam02 success to write event: ${value}`)
          });
        }, 500)

        setTimeout(() => {
          hiAppEvent.removeWatcher({"name":"watcher0200"})
          console.info('testHiAppEventSetPam02 end')
          done()
        }, 2000)
      } catch (err) {
        console.error(`testHiAppEventSetPam02 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam03
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0300
     * @tc.desc   验证setEventParam接口domain下划线结尾,返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam03 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain_").then(() => {
          console.log('testHiAppEventSetPam03 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam03 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam03 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam031
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0301
     * @tc.desc   验证setEventParam接口在关闭打点功能后,返回错误码11100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam031 start');
      hiAppEvent.configure({disable: true});
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, hiAppEvent.domain.OS).then(() => {
          console.log('testHiAppEventSetPam031 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam031 Error:', error.message, 'testHiAppEventSetPam031 Code:', error.code);
          expect(error.code == 11100001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam031 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
      hiAppEvent.configure({disable: false});
    })

    /**
     * @tc.name   testHiAppEventSetPam04
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0400
     * @tc.desc   验证setEventParam接口domain包含特殊字符,返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam04 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_?domain").then(() => {
          console.log('testHiAppEventSetPam04 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam04 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam04 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam05
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0500
     * @tc.desc   验证setEventParam接口domain以数字开头,返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam05 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "123test_domain").then(() => {
          console.log('testHiAppEventSetPam05 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam05 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam05 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam06
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0600
     * @tc.desc   验证setEventParam接口domain为空,返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam06 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "").then(() => {
          console.log('testHiAppEventSetPam06 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam06 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam06 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam07
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0700
     * @tc.desc   验证setEventParam接口domain为33字节,返回错误码11101001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam07 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "Test_123domain_Test_123domain_TES").then(() => {
          console.log('testHiAppEventSetPam07 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam07 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101001).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam07 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam08
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0800
     * @tc.desc   验证setEventParam接口domain为undefined,返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam08 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, undefined).then(() => {
          console.log('testHiAppEventSetPam08 Event parameters set successfully.');
          expect(false).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam08 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam08 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam09
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0900
     * @tc.desc   验证setEventParam接口name下划线结尾,返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam09 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name_").then(() => {
          console.log('testHiAppEventSetPam09 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam09 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam09 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam10
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1000
     * @tc.desc   验证setEventParam接口name包含特殊字符,返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam10 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_?name").then(() => {
          console.log('testHiAppEventSetPam10 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam10 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam10 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam11
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1100
     * @tc.desc   验证setEventParam接口name以数字开头,返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam11 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "123test_name").then(() => {
          console.log('testHiAppEventSetPam11 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam11 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam11 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam12
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1200
     * @tc.desc   验证setEventParam接口name为空,返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam12 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "").then(() => {
          console.log('testHiAppEventSetPam12 Event parameters set successfully.');
          expect(true).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam12 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam12 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam13
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1300
     * @tc.desc   验证setEventParam接口name49字节,返回错误码11101002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam13 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain",
            "Test_123name_Test_123name_Test_123name_Test_123Na").then(() => {
          console.log('testHiAppEventSetPam13 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam13 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101002).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam13 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam14
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1400
     * @tc.desc   验证setEventParam接口name为undefined,返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam14 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", undefined).then(() => {
          console.log('testHiAppEventSetPam14 Event parameters set successfully.');
          expect(false).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam14 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam14 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam15
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1500
     * @tc.desc   验证setEventParam接口paramname下划线结尾,返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam15 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param_": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam15 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam15 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam15 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam16
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1600
     * @tc.desc   验证setEventParam接口paramname包含特殊字符,返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam16 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_?param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam16 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam16 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam16 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam17
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1700
     * @tc.desc   验证setEventParam接口paramname下划线结尾,返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam17 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam17 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam17 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam17 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam18
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1800
     * @tc.desc   验证setEventParam接口paramname为空,返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam18 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam18 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam18 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam18 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam19
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1900
     * @tc.desc   验证setEventParam接口paramname为33字节,返回错误码11101005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam19 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "Test_paramname_add1_Test_paramnAM": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam19 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam19 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101005).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam19 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam20
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2000
     * @tc.desc   验证setEventParam接口paramvalue为超长字符串,返回错误码11101004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam20 start');
      try {
        let keyString = "";
        for (let i = 0; i < 1025; i++) {
          keyString += "a"
        }
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "test_param": keyString,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam20 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam20 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101004).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam20 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSetPam21
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2100
     * @tc.desc   验证setEventParam接口自定义参数设置65个,返回错误码11101007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetPam21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSetPam21 start');
      try {
        let eventParams: Record<string, hiAppEvent.ParamType> = {};
        for (let i = 0; i < 65; i++) {
          eventParams["name" + i] = i
        }
        hiAppEvent.setEventParam(eventParams, "test_domain", "test_name").then(() => {
          console.log('testHiAppEventSetPam21 Event parameters set successfully.');
        }).catch((error: BusinessError) => {
          console.error('testHiAppEventSetPam21 Error:', error.message, 'HiAppEventSub71 Code:', error.code);
          expect(error.code == 11101007).assertTrue()
          done()
        });
      } catch (err) {
        console.error(`testHiAppEventSetPam21 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSub70
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7000
     * @tc.desc   验证hiappevent订阅setRow接口默认设置取出的应用事件包的数据条数为1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSub70', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSub70 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher70",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        for (let counts = 0; counts < 2; counts++) { //write 2 events
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: "test_name",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 70
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSub70 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSub70 success to write event: ${value}`)
          });
        }
        setTimeout(() => {
          if (holder != null) {
            for (let index = 0; index < 2; index++) { //takenext 2 events
              let eventPkg = holder.takeNext();
              if (eventPkg == null) {
                return;
              }
              expect(eventPkg.row == 1).assertTrue()
              console.info("testHiAppEventSub70 eventPkg.packageId=" + eventPkg.packageId);
              console.info("testHiAppEventSub70 eventPkg.row=" + eventPkg.row);
              console.info("testHiAppEventSub70 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                console.info("testHiAppEventSub70 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            "name": "watcher70"
          })
          done()
          console.info('testHiAppEventSub70 end')
        }, 5000)
      } catch (err) {
        console.error(`testHiAppEventSub70 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSub71
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7100
     * @tc.desc   验证hiappevent订阅setRow接口设置可取出的应用事件包的数据条数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSub71', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSub71 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher71",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        holder.setRow(2);
        for (let counts = 0; counts < 4; counts++) { //write 4 events
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: "test_name",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 71
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSub71 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSub71 success to write event: ${value}`)
          });
        }
        setTimeout(() => {
          if (holder != null) {
            for (let index = 0; index < 2; index++) { //takenext 4 events for 2 counts
              let eventPkg = holder.takeNext();
              if (eventPkg == null) {
                return;
              }
              expect(eventPkg.row == 2).assertTrue()
              console.info("testHiAppEventSub71 eventPkg.packageId=" + eventPkg.packageId);
              console.info("testHiAppEventSub71 eventPkg.row=" + eventPkg.row);
              console.info("testHiAppEventSub71 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                console.info("testHiAppEventSub71 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            "name": "watcher71"
          })
          done()
          console.info('testHiAppEventSub71 end')
        }, 5000)
      } catch (err) {
        console.error(`testHiAppEventSub71 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSub72
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7200
     * @tc.desc   验证setRow接口设置条数为0,返回错误码11104001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSub72', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSub72 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher72",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        holder.setRow(0);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.error(`testHiAppEventSub72 > error code: ${err.code}, error msg: ${err.message}`);
        hiAppEvent.removeWatcher({
          "name": "watcher72"
        })
        expect(err.code == 11104001).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSub73
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_73
     * @tc.desc   验证setRow接口设置条数为0,返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEventSub73',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info('testHiAppEventSub73 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher73",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        holder.setRow(null);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.error(`testHiAppEventSub73 > error code: ${err.code}, error msg: ${err.message}`);
        hiAppEvent.removeWatcher({
          "name": "watcher73"
        })
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventSub74
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7400
     * @tc.desc   验证hiappevent订阅setRow接口默认设置取出的应用事件包的数据条数为1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSub74', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('testHiAppEventSub74 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher74",
          appEventFilters: [{
            domain: hiAppEvent.domain.OS,
            names: ["test_name"]
          }],
        });
        holder.setSize(200);
        for (let counts = 0; counts < 2; counts++) { //write 2 events
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: "test_name",
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 74
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSub74 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSub74 success to write event: ${value}`)
          });
        }
        setTimeout(() => {
          if (holder != null) {
            for (let index = 0; index < 2; index++) { //takenext 2 events
              let eventPkg = holder.takeNext();
              if (eventPkg == null) {
                return;
              }
              expect(eventPkg.row == 1).assertTrue()
              console.info("testHiAppEventSub74 eventPkg.packageId=" + eventPkg.packageId);
              console.info("testHiAppEventSub74 eventPkg.row=" + eventPkg.row);
              console.info("testHiAppEventSub74 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                console.info("testHiAppEventSub74 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            "name": "watcher74"
          })
          done()
          console.info('testHiAppEventSub74 end')
        }, 5000)
      } catch (err) {
        console.error(`testHiAppEventSub74 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_2900
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_2900
     * @tc.desc   验证addProcessorFromConfig入参name正常，返回对应代理id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_2900 start');
        const targetPath = '/system/etc/hiappevent/processor.json';
        let fileExists = fs.accessSync(targetPath);
        if (fileExists) {
          console.info('file exists,run testcase');
            let processor: Processor = {
                name: "ha_app_event",
                configName: "SDK_OCG"
            }
            try {
                let processorId = hiAppEvent.addProcessor(processor)
                console.info(`SUB_DFX_DFT_HiAppEvent_Js_2900 > processorId: ${processorId}`)
                expect(processorId).assertLarger(0)
                done()
            }
            catch (err) {
                console.error(`SUB_DFX_DFT_HiAppEvent_Js_2900 > error code: ${err.code}, error msg: ${err.message}`);
                expect(false).assertTrue()
                done();
            }
          }else {
              console.info('file not exists,skip testcase');
              expect(true).assertTrue();
              done();
            }
      });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3000
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3000
     * @tc.desc   验证addProcessorFromConfig入参name正常，返回对应代理id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3000 start');
        const targetPath = '/system/etc/hiappevent/processor.json';
        let fileExists = fs.accessSync(targetPath);
        if (fileExists) {
              console.info('file exists,run testcase');
              hiAppEvent.addProcessorFromConfig("ha_app_event").then((processorId) => {
              console.log('SUB_DFX_DFT_HiAppEvent_Js_3000 Event parameters set successfully.');
              expect(processorId).assertLarger(0);
              done()
          }).catch((error: BusinessError) => {
              console.error('SUB_DFX_DFT_HiAppEvent_Js_3000 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3000 Code:', error.code);
              expect(error).assertNull();
              done()
            })
          }else {
              console.info('file not exists,skip testcase');
              expect(true).assertTrue();
              done();
            }
      });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3001
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3001
     * @tc.desc   验证addProcessorFromConfig入参name和configName正常，返回对应代理id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3001 start');
        const targetPath = '/system/etc/hiappevent/processor.json';
        let fileExists = fs.accessSync(targetPath);
        if (fileExists) {
              console.info('file exists,run testcase');
              hiAppEvent.addProcessorFromConfig("ha_app_event", "SDK_OCG").then((processorId) => {
                  console.log('SUB_DFX_DFT_HiAppEvent_Js_3001 Event parameters set successfully.');
                  expect(processorId).assertLarger(0);
                  hiAppEvent.removeProcessor(processorId);
                  done()
              }).catch((error: BusinessError) => {
                  console.error('SUB_DFX_DFT_HiAppEvent_Js_3001 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3001 Code:', error.code);
                  expect(error).assertNull();
                  done()
              })
          }else {
          console.info('file not exists,skip testcase');
          expect(true).assertTrue();
          done();
        }
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3002
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3002
     * @tc.desc   验证addProcessorFromConfig入参configName为异常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3002 start');
        hiAppEvent.addProcessorFromConfig("ha_app_event", "undefined").then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3002 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3002 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3002 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3003
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3003
     * @tc.desc   验证addProcessorFromConfig入参configName为空常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3003 start');
        hiAppEvent.addProcessorFromConfig("ha_app_event", "").then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3003 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3003 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3003 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

     /**
      * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3004
      * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3004
      * @tc.desc   验证addProcessorFromConfig入参configName为null，返回值401
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_DFX_DFT_HiAppEvent_Js_3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3004 start');
        try {
            hiAppEvent.addProcessorFromConfig("ha_app_event", null).then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3004 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3004 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3004 Code:', error.code);
            expect(error).assertNull();
            done()
        });
        } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Js_3004 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3005
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3005
     * @tc.desc   验证addProcessorFromConfig入参configName为数字，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3005 start');
        hiAppEvent.addProcessorFromConfig("ha_app_event", "123_SDG").then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3005 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3005 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3005 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3006
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3006
     * @tc.desc   验证addProcessorFromConfig入参configName为257字节，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3006 start');
        let configName = 'a'.repeat(256 +1);
        hiAppEvent.addProcessorFromConfig("ha_app_event", configName).then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3006 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3006 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3006 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3007
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3007
     * @tc.desc   验证addProcessorFromConfig入参name为异常字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('SUB_DFX_DFT_HiAppEvent_Js_3007 start');
      hiAppEvent.addProcessorFromConfig("undefined").then((processorId) => {
          console.log('SUB_DFX_DFT_HiAppEvent_Js_3007 Event parameters set successfully.');
          expect(processorId).assertLarger(0);
          done()
      }).catch((error: BusinessError) => {
          console.error('SUB_DFX_DFT_HiAppEvent_Js_3007 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3007 Code:', error.code);
          expect(error.code == 11105001).assertTrue();
          done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3008
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3008
     * @tc.desc   验证addProcessorFromConfig入参name为空字符串，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3008 start');
        hiAppEvent.addProcessorFromConfig("").then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3008 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3008 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3008 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3009
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3009
     * @tc.desc   验证addProcessorFromConfig入参name为null，返回值401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3009 start');
        try {
            hiAppEvent.addProcessorFromConfig(null).then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3009 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3009 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3009 Code:', error.code);
            expect(error).assertNull();
            done()
        });
        } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Js_3009 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
        }
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3010
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3010
     * @tc.desc   验证addProcessorFromConfig入参name为数字，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3010 start');
        hiAppEvent.addProcessorFromConfig("123_processor").then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3010 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3010 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3010 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });

    /**
     * @tc.name   SUB_DFX_DFT_HiAppEvent_Js_3011
     * @tc.number SUB_DFX_DFT_HiAppEvent_Js_3011
     * @tc.desc   验证addProcessorFromConfig入参name为257字节，返回值11105001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_HiAppEvent_Js_3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
        console.info('SUB_DFX_DFT_HiAppEvent_Js_3011 start');
        let processorName = 'a'.repeat(256 +1);
        hiAppEvent.addProcessorFromConfig(processorName).then((processorId) => {
            console.log('SUB_DFX_DFT_HiAppEvent_Js_3011 Event parameters set successfully.');
            expect(processorId).assertLarger(0);
            done()
        }).catch((error: BusinessError) => {
            console.error('SUB_DFX_DFT_HiAppEvent_Js_3011 Error:', error.message, 'SUB_DFX_DFT_HiAppEvent_Js_3011 Code:', error.code);
            expect(error.code == 11105001).assertTrue();
            done()
        })
    });
  })
}
