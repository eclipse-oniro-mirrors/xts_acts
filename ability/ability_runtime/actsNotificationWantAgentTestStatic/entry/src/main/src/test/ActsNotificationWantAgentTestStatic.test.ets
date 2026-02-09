/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import wantAgent from '@ohos.app.ability.wantAgent';
import { WantAgent as _WantAgent } from '@ohos.app.ability.wantAgent';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsNotificationWantAgentStaticTest() {

  describe("SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST", (): void => {
    let tag = 'SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST ===>'
    hilog.info(domain, tag, 'SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST START')

    let WantAgent: _WantAgent = {}
    let wantAgentData1: _WantAgent = {}
    let wantAgentData2: _WantAgent = {}
    let parameters: Record<String,RecordData> = {
      'myKey0': 2222,
      'myKey1': [1, 2, 3],
      'myKey2': "[1, 2, 3]",
      'myKey3': "notification",
      'myKey4': [false, true, false],
      'myKey5': ["ANS", "WANT", "AGENT"],
      'myKey6': true
    }
    let Info: Record<String,RecordData> = {
      'key': 'WantAgentInfo_test extraInfo'
    }
    let Infos: Record<String,RecordData> = {
      'key': 'WantAgentInfo_test extraInfos'
    }
    let wantAgentFlags: Array<wantAgent.WantAgentFlags> = new Array<wantAgent.WantAgentFlags>();
    let WantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          deviceId: "deviceId",
          bundleName: "com.example.actsnotificationwantagent.static",
          abilityName: "EntryAbility2",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
          parameters: parameters
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      actionFlags: wantAgentFlags,
      extraInfo: Info,
      extraInfos: Infos
    }

    beforeEach(() => {
      hilog.info(domain, tag, `${tag} beforeEach START`)
      WantAgent = {}
      hilog.info(domain, tag, `${tag} beforeEachEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4600
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4600
     * @tc.desc   function cancel(agent: WantAgent, callback: AsyncCallback<void>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4600 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          } else {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback success:' + JSON.stringify(data))
            if (data !== undefined) {
              WantAgent = data
              wantAgent.cancel(WantAgent, (err: BusinessError<void> | null) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, 'cancel AsyncCallback err:' + JSON.stringify(err))
                  expect().assertFail()
                  done()
                } else {
                  hilog.info(domain, tag, 'cancel AsyncCallback success')
                  expect(true).assertTrue()
                  done()
                }
              })
            } else {
              done()
            }
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4600 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4650
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4650
     * @tc.desc   function cancel(agent: WantAgent): Promise<void>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4650 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo).then((data: _WantAgent) => {
          WantAgent = data
          hilog.info(domain, tag, 'getWantAgent Promise success:' + JSON.stringify(data))
          wantAgent.cancel(WantAgent).then(() => {
            hilog.info(domain, tag, 'cancel Promise success')
            expect(true).assertTrue()
            done()
          }).catch((err: Error): void => {
            hilog.info(domain, tag, 'cancel Promise err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          })
        }).catch((err: Error): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err:' + JSON.stringify(err))
          expect().assertFail()
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4650 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4700
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4700
     * @tc.desc   function getBundleName(agent: WantAgent, callback: AsyncCallback<string>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4700 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err:' + JSON.stringify(err))
            expect().assertFalse()
            done()
          } else {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback success:' + JSON.stringify(data))
            if (data !== undefined) {
              WantAgent = data
              wantAgent.getBundleName(WantAgent, (err: BusinessError<void> | null, data: string | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, 'getBundleName AsyncCallback err:' + JSON.stringify(err))
                  expect().assertFail()
                  done()
                } else {
                  hilog.info(domain, tag, 'getBundleName AsyncCallback success:' + JSON.stringify(data))
                  if (data !== undefined) {
                    expect(data + '').assertEqual('com.example.actsnotificationwantagent.static')
                  }
                  done()
                }
              })
            } else {
              done()
            }
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4700 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4750
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4750
     * @tc.desc   function getBundleName(agent: WantAgent): Promise<string>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4750 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo).then((data: _WantAgent) => {
          WantAgent = data
          hilog.info(domain, tag, 'getWantAgent Promise success:' + JSON.stringify(data))
          wantAgent.getBundleName(WantAgent)
            .then((data: string): void => {
              hilog.info(domain, tag, 'getBundleName Promise success:' + JSON.stringify(data))
              expect(data + '').assertEqual('com.example.actsnotificationwantagent.static')
              done()
            })
            .catch((err: Error): void => {
              hilog.info(domain, tag, 'getBundleName Promise err:' + JSON.stringify(err))
              expect().assertFail()
              done()
            })
        }).catch((err: Error): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err:' + JSON.stringify(err))
          expect().assertFail()
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4750 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4800
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4800
     * @tc.desc   function getUid(agent: WantAgent, callback: AsyncCallback<number>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4800 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          } else {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback success:' + JSON.stringify(data))
            if (data !== undefined) {
              WantAgent = data
              wantAgent.getUid(WantAgent, (err: BusinessError<void> | null, data: Int | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, 'getUid AsyncCallback err:' + JSON.stringify(err))
                  expect().assertFail()
                  done()
                } else {
                  hilog.info(domain, tag, 'getUid AsyncCallback success:' + JSON.stringify(data))
                  expect(true).assertTrue()
                  done()
                }
              })
            } else {
              done()
            }
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4800 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4850
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4850
     * @tc.desc   function getUid(agent: WantAgent): Promise<number>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4850 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo).then((data: _WantAgent) => {
          WantAgent = data
          hilog.info(domain, tag, 'getWantAgent Promise success:' + JSON.stringify(data))
          wantAgent.getUid(WantAgent).then((data: Int) => {
            hilog.info(domain, tag, 'getUid Promise success:' + JSON.stringify(data))
            expect(true).assertTrue()
            done()
          }).catch((err: Error): void => {
            hilog.info(domain, tag, 'getUid Promise err: ' + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        }).catch((err: Error): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err: ' + JSON.stringify(err))
          expect().assertFail();
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4850 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4900
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4900
     * @tc.desc   function equal(agent: WantAgent, otherAgent: WantAgent, callback: AsyncCallback<boolean>): void,Checks whether two WantAgent objects are equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4900 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          } else {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback success:' + JSON.stringify(data))
            if (data !== undefined) {
              wantAgentData1 = data
              wantAgentData2 = data
              wantAgent.equal(wantAgentData1, wantAgentData2,
                (err: BusinessError<void> | null, data: boolean | undefined) => {
                  if (err && err.code !== 0) {
                    hilog.info(domain, tag, 'equal AsyncCallback err:' + JSON.stringify(err))
                    if (data !== undefined) {
                      expect(data).assertTrue()
                    }
                    done()
                  } else {
                    hilog.info(domain, tag, 'equal AsyncCallback success:' + JSON.stringify(data))
                    if (data !== undefined) {
                      expect(data).assertTrue()
                    }
                    done()
                  }
                })
            } else {
              done()
            }
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4900 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_4950
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_4950
     * @tc.desc   function equal(agent: WantAgent, otherAgent: WantAgent): Promise<boolean>,Checks whether two WantAgent objects are equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_static_4950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4950 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          } else {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback success:' + JSON.stringify(data))
            if (data !== undefined) {
              wantAgentData1 = data
              wantAgentData2 = data
              wantAgent.equal(wantAgentData1, wantAgentData2).then((data: boolean) => {
                hilog.info(domain, tag, 'equal Promise success:' + JSON.stringify(data))
                expect(data).assertTrue()
                done()
              }).catch((err: Error): void => {
                hilog.info(domain, tag, 'equal Promise err:' + JSON.stringify(err))
                expect().assertFail()
                done()
              })
            } else {
              done()
            }
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4950 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_5000
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_5000
     * @tc.desc   function getOperationType(agent: WantAgent, callback: AsyncCallback<number>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Notification_Ans_WantAgent_Create_static_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5000 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY;
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG];
        wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
          hilog.info(domain, tag, 'getWantAgentCallback success: ')
          if (err && err.code !== 0) {
            hilog.info(domain, tag, 'getWantAgent AsyncCallback err: ' + JSON.stringify(err))
            expect().assertFail();
            done()
          } else {
            if (data !== undefined) {
                WantAgent = data;
                hilog.info(domain, tag, 'getWantAgent AsyncCallback success: ' + JSON.stringify(data))
                wantAgent.getOperationType(WantAgent, (err: BusinessError<void> | null, data: Int | undefined) => {
                if (err && err.code !== 0) {
                  hilog.info(domain, tag, 'getOperationType AsyncCallback err:' + JSON.stringify(err))
                  expect().assertFail();
                  done()
                } else {
                  hilog.info(domain, tag, 'getOperationType AsyncCallback success: ' + JSON.stringify(data))
                  expect(true).assertTrue()
                  done()
                }
              })
           }
           done()
          }
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5000 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_static_5050
     * @tc.number Sub_Notification_Ans_WantAgent_Create_static_5050
     * @tc.desc   function getOperationType(agent: WantAgent): Promise<number>,Obtains the {@link OperationType} of a {@link WantAgent}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Notification_Ans_WantAgent_Create_static_5050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5050 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY;
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG];
        wantAgent.getWantAgent(WantAgentInfo).then((data: _WantAgent): Promise<_WantAgent> => {
          WantAgent = data
          hilog.info(domain, tag, 'getWantAgent Promise success: ' + JSON.stringify(data))
          wantAgent.getOperationType(WantAgent).then((data: Int): Promise<Int> => {
            hilog.info(domain, tag, 'getOperationType Promise success: ' + JSON.stringify(data))
            expect(true).assertTrue()
            done()
          }).catch((err: Error): void => {
            hilog.info(domain, tag, 'getOperationType Promise err: ' + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        }).catch((err: Error): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err: ' + JSON.stringify(err))
          expect().assertFail();
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5050 END')
      })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_Static_5100
     * @tc.number Sub_Notification_Ans_WantAgent_Create_Static_5100
     * @tc.desc   function trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void,Triggers a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `Sub_Notification_Ans_WantAgent_Create_Static_5100 START`)
      WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY;
      WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG];
      wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
        if (err?.code !== 0) {
          hilog.info(domain, tag, `getWantAgent, code: ${JSON.stringify(err?.code)}, message: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done()
        } else {
          let wantAgentData: _WantAgent = data as _WantAgent
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0,
            want: {
              deviceId: "deviceId",
              bundleName: "com.example.actsnotificationwantagent.static",
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true,true,false}",
              parameters: parameters,
            } as Want,
            permission: '',
            startOptions: undefined,
            extraInfo: Info,
            extraInfos: Infos
          }
          wantAgent.trigger(wantAgentData, triggerInfo, (err: BusinessError<void> | null, data: wantAgent.CompleteData | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `trigger, code: ${JSON.stringify(err?.code)}, message: ${JSON.stringify(err?.message)}`);
              expect().assertFail();
              done()
            } else {
              hilog.info(domain, tag, `trigger ok!`);
              expect(typeof(data?.info)).assertEqual('object')
              expect(data?.finalCode).assertEqual(0)
              expect(data?.finalData).assertEqual('')
              expect(typeof(data?.extraInfo)).assertEqual('object')
              expect(data?.want.deviceId).assertEqual('deviceId')
              expect(data?.want.bundleName).assertEqual('com.example.actsnotificationwantagent.static')
              expect(data?.want.abilityName).assertEqual('EntryAbility2')
              done()
            }
          })
        }
      })
      hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_Static_5100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_WantAgent_Create_Static_5150
     * @tc.number Sub_Notification_Ans_WantAgent_Create_Static_5150
     * @tc.desc   function trigger(agent: WantAgent, triggerInfo: TriggerInfo): void,Triggers a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_WantAgent_Create_Static_5150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `Sub_Notification_Ans_WantAgent_Create_Static_5150 START`)
      WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY;
      WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG];
      wantAgent.getWantAgent(WantAgentInfo, (err: BusinessError<void> | null, data: _WantAgent | undefined) => {
        if (err?.code !== 0) {
          hilog.info(domain, tag, `getWantAgent, code: ${JSON.stringify(err?.code)}, message: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done()
        } else {
          let wantAgentData: _WantAgent = data as _WantAgent
          let triggerInfo: wantAgent.TriggerInfo = {
            code: 0,
            want: {
              deviceId: "deviceId",
              bundleName: "com.example.actsnotificationwantagent.static",
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true,true,false}",
              parameters: parameters,
            } as Want,
            permission: '',
            startOptions: undefined,
            extraInfo: Info,
            extraInfos: Infos
          }
          try {
            wantAgent.trigger(wantAgentData, triggerInfo)
            expect(true).assertTrue()
            done();
          } catch (err: BusinessError) {
            hilog.info(domain, tag, `err: code ${err.code}, message ${err.message}`);
            expect().assertFail()
            done();
          }
        }
      })
      hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_Static_5150 END')
    })
  })
}