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
import Utils from './Util.test';
let logDomain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'hiappeventAddWatcherTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function addWatcherTest() {
  describe('addWatcherTest', (): void => {
    hilog.info(logDomain, tag, 'describe start');

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_7000
     * @tc.name testHiAppEventSub70
     * @tc.desc 验证hiappevent订阅setRow接口默认设置取出的应用事件包的数据条数为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiAppEventSub70', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub70 start');
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
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSub70 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSub70 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
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
              hilog.info(logDomain, tag, "testHiAppEventSub70 eventPkg.packageId=" + eventPkg.packageId);
              hilog.info(logDomain, tag, "testHiAppEventSub70 eventPkg.row=" + eventPkg.row);
              hilog.info(logDomain, tag, "testHiAppEventSub70 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                hilog.info(logDomain, tag, "testHiAppEventSub70 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            name: "watcher70"
          })
          hilog.info(logDomain, tag, 'testHiAppEventSub70 end')
          done()
        }, 5000)

      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSub70 > error code: ${err.code}, error msg: ${err.message}`);
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
    it('testHiAppEventSub71', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub71 start');
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
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSub71 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSub71 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
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
              hilog.info(logDomain, tag, "testHiAppEventSub71 eventPkg.packageId=" + eventPkg.packageId);
              hilog.info(logDomain, tag, "testHiAppEventSub71 eventPkg.row=" + eventPkg.row);
              hilog.info(logDomain, tag, "testHiAppEventSub71 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                hilog.info(logDomain, tag, "testHiAppEventSub71 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            name: "watcher71"
          })
          hilog.info(logDomain, tag, 'testHiAppEventSub71 end')
          done()
        }, 5000)

      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSub71 > error code: ${err.code}, error msg: ${err.message}`);
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
    it('testHiAppEventSub72', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub72 start');
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
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSub72 > error code: ${err.code}, error msg: ${err.message}`);
        hiAppEvent.removeWatcher({
          name: "watcher72"
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
    it('testHiAppEventSub73', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub73 start');
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
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `testHiAppEventSub73 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `testHiAppEventSub73 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
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
              hilog.info(logDomain, tag, "testHiAppEventSub73 eventPkg.packageId=" + eventPkg.packageId);
              hilog.info(logDomain, tag, "testHiAppEventSub73 eventPkg.row=" + eventPkg.row);
              hilog.info(logDomain, tag, "testHiAppEventSub73 eventPkg.size=" + eventPkg.size);
              for (const eventInfo of eventPkg.appEventInfos) {
                hilog.info(logDomain, tag, "testHiAppEventSub73 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
              }
            }
          }
        }, 3000)
        setTimeout(() => {
          hiAppEvent.removeWatcher({
            name: "watcher73"
          })
          hilog.info(logDomain, tag, 'testHiAppEventSub73 end')
          done()
        }, 5000)

      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `testHiAppEventSub73 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_6700
     * @tc.name HiAppEventSub67
     * @tc.desc 验证应用事件订阅可通过onReceive回调获取各种类型订阅事件信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub67', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'HiAppEventSub67 start');
      try {
        hiAppEvent.addWatcher({
          name: "watcher67",
          appEventFilters: [{domain: hiAppEvent.domain.OS}, {domain: "test_domain"}],
          onReceive: (domain: string, groups: Array<hiAppEvent.AppEventGroup>) => {
            hilog.info(logDomain, tag, 'HiAppEventSub67 onReceive domain=' + domain)
            expect(domain == hiAppEvent.domain.OS || domain == "test_domain").assertTrue();
            for (const group of groups) {
              hilog.info(logDomain, tag, 'HiAppEventSub67 onReceive eventName=' + group.name)
              for (const info of group.appEventInfos) {
                hilog.info(logDomain, tag, `HiAppEventSub67 onReceive event=${JSON.stringify(info)}`)
                hilog.info(logDomain, tag, 'HiAppEventSub67 onReceive eventType=' + info.eventType)
                // hilog.info(logDomain, tag, 'HiAppEventSub67 onReceive params=' + JSON.stringify(info.params))
                // hilog.info(logDomain, tag, 'HiAppEventSub67 onReceive params.exception' + JSON.stringify(info.params))
              }
            }
          }
        });
        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.APP_CRASH,
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "appcrash",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
              hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.code}`);
              hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.message}`);
              expect(0).assertEqual(err?.code);
          });
        }, 500)
        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.APP_FREEZE,
            eventType: hiAppEvent.EventType.STATISTIC,
            params: {
              "key_int": 100, "key_string": "appfreeze",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
              hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.code}`);
              hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.message}`);
              expect(0).assertEqual(err?.code);
          });
        }, 800)
        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain",
            name: hiAppEvent.event.USER_LOGIN,
            eventType: hiAppEvent.EventType.SECURITY,
            params: {
              "key_int": 100, "key_string": "userlogin",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
        }, 1000)
        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain",
            name: hiAppEvent.event.USER_LOGOUT,
            eventType: hiAppEvent.EventType.BEHAVIOR,
            params: {
              "key_int": 100, "key_string": "userlogout",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub67 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
        }, 1200)

        setTimeout(() => {
          hiAppEvent.removeWatcher({name:"watcher67"})
          hilog.info(logDomain, tag, 'HiAppEventSub67 end')
          done()
        }, 10000)

      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `HiAppEventSub67 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_6800
     * @tc.name HiAppEventSub68
     * @tc.desc 验证应用事件订阅优先通过onReceive回调获取订阅事件信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub68', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'HiAppEventSub68 start');
      try {
        let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
        hiAppEvent.addWatcher({
          name: "watcher68",
          appEventFilters: [{domain: "test_domain", names: [hiAppEvent.event.DISTRIBUTED_SERVICE_START]}],
          triggerCondition,
          onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
            expect().assertFail()
            let eventPkg = holder.takeNext();
            hilog.info(logDomain, tag, "HiAppEventSub68 eventPkg.packageId=" + eventPkg.packageId);
            hilog.info(logDomain, tag, "HiAppEventSub68 eventPkg.row=" + eventPkg.row);
            hilog.info(logDomain, tag, "HiAppEventSub68 eventPkg.size=" + eventPkg.size);
            for (const eventInfo of eventPkg.data) {
              hilog.info(logDomain, tag, "HiAppEventSub68 eventPkg.data=" + eventInfo);
            }
            done()
          },
          onReceive: (domain: string, groups: Array<hiAppEvent.AppEventGroup>) => {
            hilog.info(logDomain, tag, 'HiAppEventSub68 onReceive domain=' + domain)
            expect(domain == "test_domain").assertTrue();
            for (const group of groups) {
              hilog.info(logDomain, tag, 'HiAppEventSub68 onReceive eventName=' + group.name)
              expect(group.name == hiAppEvent.event.DISTRIBUTED_SERVICE_START).assertTrue();
              for (const info of group.appEventInfos) {
                hilog.info(logDomain, tag, `HiAppEventSub68 onReceive event=${JSON.stringify(info)}`)
                hilog.info(logDomain, tag, 'HiAppEventSub68 onReceive eventType=' + info.eventType)
                // hilog.info(logDomain, tag, 'HiAppEventSub68 onReceive params=' + JSON.stringify(info.params))
                // hilog.info(logDomain, tag, 'HiAppEventSub68 onReceive params.exception' + JSON.stringify(info.params))
              }
            }
          }
        });
        setTimeout(() => {
          hiAppEvent.write({
            domain: "test_domain",
            name: hiAppEvent.event.DISTRIBUTED_SERVICE_START,
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "distributed_service_start",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `HiAppEventSub68 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub68 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
        }, 500)

        setTimeout(() => {
          hiAppEvent.removeWatcher({name:"watcher68"})
          hilog.info(logDomain, tag, 'HiAppEventSub68 end')
          done()
        }, 10000)
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `HiAppEventSub68 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiAppEvent_Sub_6900
     * @tc.name HiAppEventSub69
     * @tc.desc 验证新增filter-name订阅事件过滤条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub69', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'HiAppEventSub69 start');
      try {
        hiAppEvent.addWatcher({
          name: "watcher69",
          appEventFilters: [{domain: hiAppEvent.domain.OS,
            names: [hiAppEvent.event.APP_CRASH, hiAppEvent.event.APP_FREEZE]}],
          onReceive: (domain: string, groups: Array<hiAppEvent.AppEventGroup>) => {
            hilog.info(logDomain, tag, 'HiAppEventSub69 onReceive domain=' + domain)
            expect(domain == hiAppEvent.domain.OS).assertTrue();
            for (const group of groups) {
              hilog.info(logDomain, tag, 'HiAppEventSub69 onReceive eventName=' + group.name)
              expect(group.name == hiAppEvent.event.APP_CRASH || group.name == hiAppEvent.event.APP_FREEZE).assertTrue();
              for (const info of group.appEventInfos) {
                hilog.info(logDomain, tag, `HiAppEventSub69 onReceive event=${JSON.stringify(info)}`)
                hilog.info(logDomain, tag, 'HiAppEventSub69 onReceive eventType=' + info.eventType)
                // hilog.info(logDomain, tag, 'HiAppEventSub69 onReceive params=' + JSON.stringify(info.params))
                // hilog.info(logDomain, tag, 'HiAppEventSub69 onReceive params.exception' + JSON.stringify(info.params))
              }
            }
          }
        });
        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.APP_CRASH,
            eventType: hiAppEvent.EventType.FAULT,
            params: {
              "key_int": 100, "key_string": "appcrash",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `HiAppEventSub69 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub69 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
        }, 500)
        setTimeout(() => {
          hiAppEvent.write({
            domain: hiAppEvent.domain.OS,
            name: hiAppEvent.event.APP_FREEZE,
            eventType: hiAppEvent.EventType.STATISTIC,
            params: {
              "key_int": 100, "key_string": "appfreeze",
            } as Record<string, number|string|boolean|(number|string|boolean)[]>
          }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, `HiAppEventSub69 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub69 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
        }, 800)

        setTimeout(() => {
          hiAppEvent.removeWatcher({name:"watcher69"})
          hilog.info(logDomain, tag, 'HiAppEventSub69 end')
          done()
        }, 10000)
      } catch (err: BusinessError) {
        hilog.error(logDomain, tag, `HiAppEventSub69 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0100
     * @tc.name HiAppEventSub01
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub01', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub01 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          expect(holder != null).assertTrue();

          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();

      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event1",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
      }, 500)

      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event1",
          eventType: hiAppEvent.EventType.STATISTIC,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
      }, 1000)

      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event1",
          eventType: hiAppEvent.EventType.SECURITY,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
      }, 1500)
      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event1",
          eventType: hiAppEvent.EventType.BEHAVIOR,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
            hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.code}`);
            hilog.info(logDomain, tag, `HiAppEventSub01 write event: ${err?.message}`);
            expect(0).assertEqual(err?.code);
          });
      }, 2000)

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub01 end')
        done()
      }, 4000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0200
     * @tc.name HiAppEventSub02
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub02', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub02 start')
      let holder = hiAppEvent.addWatcher({
        name: "watcher2",
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event2",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event2",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event2",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event2",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub02 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      Utils.msSleep(3000);
      if (holder != null) {
        let eventPkg = holder.takeNext();
        if (eventPkg == null) {
          expect(true).assertTrue()
        }
        hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
        hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
        hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
        for (const eventInfo of eventPkg.data) {
          hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
        }
        expect(true).assertTrue()
      }
      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher2"})
        hilog.info(logDomain, tag, 'HiAppEventSub02 end')
        done()
      }, 5000)
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0600
     * @tc.name HiAppEventSub06
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub06', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub06 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default"
          }
        ],
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            hilog.info(logDomain, tag, "HiAppEventSub_result6:" + eventPkg)
            return
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event6",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event6",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event6",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event6",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub06 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub06 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0700
     * @tc.name HiAppEventSub07
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub07', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub07 start')
      try {
        let triggerCondition: hiAppEvent.TriggerCondition = {
          row: 1,
          size: 1,
          timeOut: 1
        };
        let result = hiAppEvent.addWatcher({
          name: "watcher1",
          appEventFilters: [
            {
              domain: ""
            }
          ],
          triggerCondition,

          onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
            let eventPkg = holder.takeNext();
            if (eventPkg == null) {
              expect().assertFail()
            }
            hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
            hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
            hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
            for (const eventInfo of eventPkg.data) {
              hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
            }
            expect(true).assertTrue()
          }
        })
        expect(result == null).assertTrue();
      } catch (error: BusinessError) {
        expect(error.code).assertEqual(11102002);
      }

      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event7",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub07 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub07 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub07 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0800
     * @tc.name HiAppEventSub08
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub08', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub08 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        row: 1,
        size: 1,
        timeOut: 1
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default1"
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event8",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub08 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub08 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub08 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_0900
     * @tc.name HiAppEventSub09
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub09', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub09 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event9",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event9",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event9",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event9",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub09 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub09 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1000
     * @tc.name HiAppEventSub10
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub10', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub11 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.STATISTIC]
          }
        ],
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event10",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event10",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub10 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub10 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1100
     * @tc.name HiAppEventSub11
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub11', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub11 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { size: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.SECURITY]
          }
        ],
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event11",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub11 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub11 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1200
     * @tc.name HiAppEventSub12
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub12', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub12 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { size: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.BEHAVIOR]
          }
        ],
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event12",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event12",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event12",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event12",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub12 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub12 end')
        done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1300
     * @tc.name HiAppEventSub13
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub13', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub13 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 1 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT,hiAppEvent.EventType.STATISTIC,
              hiAppEvent.EventType.SECURITY,hiAppEvent.EventType.BEHAVIOR]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            return
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event13",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event13",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event13",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event13",
        eventType: hiAppEvent.EventType.BEHAVIOR,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub13 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub13 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1600
     * @tc.name HiAppEventSub16
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub16', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub16 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 3 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          expect(holder != null).assertTrue();

          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            return;
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event16",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event16",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event16",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub16 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(3000)

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub16 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1700
     * @tc.name HiAppEventSub17
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub17', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub17 start')
      let triggerCondition: hiAppEvent.TriggerCondition = { row: 4 };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        triggerCondition,

        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          expect(holder != null).assertTrue();

          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            return;
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      hilog.info(logDomain, tag, "HiAppEventSub_result" + result)
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event17",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event17",
        eventType: hiAppEvent.EventType.STATISTIC,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event17",
        eventType: hiAppEvent.EventType.SECURITY,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub17 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(3000)

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub17 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1800
     * @tc.name HiAppEventSub18
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub18', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub18 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        row: 1,
        size: 0,
        timeOut: 0
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event18",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub18 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub18 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub18 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_1900
     * @tc.name HiAppEventSub19
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub19', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub19 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        size: 1
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default"
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event19",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub19 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub19 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub19 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2000
     * @tc.name HiAppEventSub20
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub20', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub20 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        size: 0
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default"
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event20",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub20 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub20 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub20 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2100
     * @tc.name HiAppEventSub21
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub21', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub21 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        row: 0,
        size: 1,
        timeOut: 0
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event21",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub21 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub21 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub21 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2200
     * @tc.name HiAppEventSub22
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub22', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub22 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        timeOut: 1
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event22",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub22 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub22 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(30000)
      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub22 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2300
     * @tc.name HiAppEventSub23
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub23', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub23 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        timeOut: 0
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event23",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub23 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub23 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(1000)
      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub23 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2400
     * @tc.name HiAppEventSub24
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub24', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub24 start')
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event24",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub24 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub24 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(1000)
      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub24 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2800
     * @tc.name HiAppEventSub28
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub28', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub28 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        row: 0,
        size: 0,
        timeOut: 1
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default",
            eventTypes: [hiAppEvent.EventType.FAULT]
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event28",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub28 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub28 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });
      Utils.msSleep(30000)
      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub28 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2900
     * @tc.name HiAppEventSub29
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub29', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub29 start')
      let triggerCondition: hiAppEvent.TriggerCondition = {
        size: 1
      };
      let result = hiAppEvent.addWatcher({
        name: "watcher1",
        appEventFilters: [
          {
            domain: "default"
          }
        ],
        triggerCondition,
        onTrigger: (curRow: number, curSize: number, holder: hiAppEvent.AppEventPackageHolder) => {
          let eventPkg = holder.takeNext();
          if (eventPkg == null) {
            expect().assertFail()
          }
          hilog.info(logDomain, tag, "eventPkg.packageId=" + eventPkg.packageId);
          hilog.info(logDomain, tag, "eventPkg.row=" + eventPkg.row);
          hilog.info(logDomain, tag, "eventPkg.size=" + eventPkg.size);
          for (const eventInfo of eventPkg.data) {
            hilog.info(logDomain, tag, "eventPkg.data=" + eventInfo);
          }
          expect(true).assertTrue()
        }
      })
      expect(result != null).assertTrue();
      hiAppEvent.write({
        domain: hiAppEvent.domain.OS,
        name: "test_event29",
        eventType: hiAppEvent.EventType.FAULT,
        params: {
          "key_int": 100
        } as Record<string, number|string|boolean|(number|string|boolean)[]>
      }, (err: BusinessError<void> | null) => {
        hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
        hilog.info(logDomain, tag, `HiAppEventSub29 write event: ${err?.code}`);
        hilog.info(logDomain, tag, `HiAppEventSub29 write event: ${err?.message}`);
        expect(0).assertEqual(err?.code);
      });

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
        hilog.info(logDomain, tag, 'HiAppEventSub29 end')
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2500
     * @tc.name HiAppEventSub25
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub25', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub25 start')
      let holder = hiAppEvent.addWatcher({
        name: "watcher1",
      });
      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event25",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub25 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub25 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
        done()
      }, 500)

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher1"})
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2600
     * @tc.name HiAppEventSub26
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub26', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub26 start')
      let holder = hiAppEvent.addWatcher({
        name: "watcher1",
      });
      setTimeout(() => {
        hiAppEvent.write({
          domain: hiAppEvent.domain.OS,
          name: "test_event26",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "key_int": 100
          } as Record<string, number|string|boolean|(number|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          hilog.info(logDomain, tag, 'HiAppEvent into json-callback');
          hilog.info(logDomain, tag, `HiAppEventSub26 write event: ${err?.code}`);
          hilog.info(logDomain, tag, `HiAppEventSub26 write event: ${err?.message}`);
          expect(0).assertEqual(err?.code);
        });
        done()
      }, 500)

      setTimeout(() => {
        hiAppEvent.removeWatcher({name:"watcher2"})
      done()
      }, 1000)

    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_2700
     * @tc.name HiAppEventSub27
     * @tc.desc HiAppEvent write interface test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub27', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub27 start')
      hiAppEvent.clearData()
      expect(true).assertTrue()
      hilog.info(logDomain, tag, 'HiAppEventSub27 end')
      done();
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3000
     * @tc.name HiAppEventSub30
     * @tc.desc 验证调用removeWatcher失败返回值11102001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub30', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'testHiAppEventSub30 start')
      const MAX_LEN_OF_WATCHER = 32;
      try {
        hiAppEvent.removeWatcher({name:"a".repeat(MAX_LEN_OF_WATCHER - 1) + "_"});
      } catch (error: BusinessError) {
        console.error(`testHiAppEventSub30  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code == 11102001).assertTrue()
      }
      hilog.info(logDomain, tag, 'HiAppEventSub30 end')
      done();
    })

    /**
     * @tc.number DFX_DFT_HiAppEvent_Sub_3100
     * @tc.name HiAppEventSub31
     * @tc.desc 验证调用AppEventPackageHolder.constructor().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('HiAppEventSub31', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(logDomain, tag, 'HiAppEventSub31 start')
      let holder: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("testConstructor");
      expect(true).assertTrue()
      hilog.info(logDomain, tag, 'HiAppEventSub31 end')
      done();
    })
  })
  hilog.info(logDomain, tag, 'addWatcherTest end');
}