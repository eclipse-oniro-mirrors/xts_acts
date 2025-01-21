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

import { describe, expect, it } from '@ohos/hypium'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'

export default function HiAppEventPamTest() {
  describe('HiAppEventPamTest', () => {
    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0100
     * @tc.name testHiAppEventSetPam01
     * @tc.desc 验证setEventParam接口可设置事件关联自定义参数，并通过onReceive回调获取
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam01', 0, async (done:Function) => {
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
          onReceive: (domain, groups) => {
            console.log('testHiAppEventSetPam01 onReceive domain=', domain)
            expect(domain == "t" || domain == "Test_123domain_Test_123domain_TE" || domain == "test_domain" ||
              domain == "test_domain123").assertTrue();
            for (const group of groups) {
              console.log('testHiAppEventSetPam01 onReceive eventName=', group.name)
              for (const info of group.appEventInfos) {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0200
     * @tc.name testHiAppEventSetPam02
     * @tc.desc 验证setEventParam接口可设置事件关联自定义参数，并通过onTrigger回调获取
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam02', 0, async (done:Function) => {
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
                hiAppEvent.event.MAIN_THREAD_JANK]}
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0300
     * @tc.name testHiAppEventSetPam03
     * @tc.desc 验证setEventParam接口domain下划线结尾，返回错误码11101001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam03', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0400
     * @tc.name testHiAppEventSetPam04
     * @tc.desc 验证setEventParam接口domain包含特殊字符，返回错误码11101001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam04', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0500
     * @tc.name testHiAppEventSetPam05
     * @tc.desc 验证setEventParam接口domain以数字开头，返回错误码11101001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam05', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0600
     * @tc.name testHiAppEventSetPam06
     * @tc.desc 验证setEventParam接口domain为空，返回错误码11101001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam06', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0700
     * @tc.name testHiAppEventSetPam07
     * @tc.desc 验证setEventParam接口domain为33字节，返回错误码11101001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam07', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0800
     * @tc.name testHiAppEventSetPam08
     * @tc.desc 验证setEventParam接口domain为undefined，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam08', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_0900
     * @tc.name testHiAppEventSetPam09
     * @tc.desc 验证setEventParam接口name下划线结尾，返回错误码11101002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam09', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1000
     * @tc.name testHiAppEventSetPam10
     * @tc.desc 验证setEventParam接口name包含特殊字符，返回错误码11101002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam10', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1100
     * @tc.name testHiAppEventSetPam11
     * @tc.desc 验证setEventParam接口name以数字开头，返回错误码11101002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam11', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1200
     * @tc.name testHiAppEventSetPam12
     * @tc.desc 验证setEventParam接口name为空，返回错误码11101002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam12', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1300
     * @tc.name testHiAppEventSetPam13
     * @tc.desc 验证setEventParam接口name49字节，返回错误码11101002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam13', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1400
     * @tc.name testHiAppEventSetPam14
     * @tc.desc 验证setEventParam接口name为undefined，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam14', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1500
     * @tc.name testHiAppEventSetPam15
     * @tc.desc 验证setEventParam接口paramname下划线结尾，返回错误码11101005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam15', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1600
     * @tc.name testHiAppEventSetPam16
     * @tc.desc 验证setEventParam接口paramname包含特殊字符，返回错误码11101005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam16', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1700
     * @tc.name testHiAppEventSetPam17
     * @tc.desc 验证setEventParam接口paramname下划线结尾，返回错误码11101005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam17', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1800
     * @tc.name testHiAppEventSetPam18
     * @tc.desc 验证setEventParam接口paramname为空，返回错误码11101005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam18', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_1900
     * @tc.name testHiAppEventSetPam19
     * @tc.desc 验证setEventParam接口paramname为33字节，返回错误码11101005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam19', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2000
     * @tc.name testHiAppEventSetPam20
     * @tc.desc 验证setEventParam接口paramvalue为超长字符串，返回错误码11101004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam20', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_SetPam_2100
     * @tc.name testHiAppEventSetPam21
     * @tc.desc 验证setEventParam接口自定义参数设置65个，返回错误码11101007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSetPam21', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7000
     * @tc.name testHiAppEventSub70
     * @tc.desc 验证hiappevent订阅setRow接口默认设置取出的应用事件包的数据条数为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSub70', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7100
     * @tc.name testHiAppEventSub71
     * @tc.desc 验证hiappevent订阅setRow接口设置可取出的应用事件包的数据条数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSub71', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7200
     * @tc.name testHiAppEventSub72
     * @tc.desc 验证setRow接口设置条数为0，返回错误码11104001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSub72', 0, async (done:Function) => {
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
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7300
     * @tc.name testHiAppEventSub73
     * @tc.desc 验证hiappevent订阅setRow接口默认设置取出的应用事件包的数据条数为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSub73', 0, async (done:Function) => {
      console.info('testHiAppEventSub73 start');
      try {
        let holder = hiAppEvent.addWatcher({
          name: "watcher73",
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
              "key_int": 73
            }
          }, (err, value) => {
            if (err) {
              console.error(`testHiAppEventSub73 failed to write event because ${err.code}`);
              expect().assertFail();
              done();
            }
            console.log(`testHiAppEventSub73 success to write event: ${value}`)
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
              console.info("testHiAppEventSub73 eventPkg.packageId=" + eventPkg.packageId);
              console.info("testHiAppEventSub73 eventPkg.row=" + eventPkg.row);
              console.info("testHiAppEventSub73 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                console.info("testHiAppEventSub73 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            "name": "watcher73"
          })
          done()
          console.info('testHiAppEventSub73 end')
        }, 5000)
      } catch (err) {
        console.error(`testHiAppEventSub73 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })
  })
}
