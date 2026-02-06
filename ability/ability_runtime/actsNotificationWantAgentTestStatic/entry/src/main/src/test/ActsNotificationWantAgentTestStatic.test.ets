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
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ActsNotificationWantAgentStaticTest() {

  describe("SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST", (): void => {
    let tag = 'SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST ===>'
    hilog.info(domain, tag, 'SUB_NOTIFICATION_ANS_WANT_AGENT_STATIC_TEST START')

    let WantAgent: _WantAgent = {}
    let wantAgentData1: _WantAgent = {}
    let wantAgentData2: _WantAgent = {}
    let parameters: Record<string, Object> = {
      'myKey0': 2222,
      'myKey1': [1, 2, 3],
      'myKey2': "[1, 2, 3]",
      'myKey3': "notification",
      'myKey4': [false, true, false],
      'myKey5': ["ANS", "WANT", "AGENT"],
      'myKey6': true
    }
    let Info: Record<string, Object> = {
      'key': 'WantAgentInfo_test extraInfo'
    }
    let Infos: Record<string, Object> = {
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
      actionFlags: wantAgentFlags,
      extraInfo: Info,
      extraInfos: Infos
    }

    beforeEach(() => {
      hilog.info(domain, tag, `${tag} beforeEach START`)
      WantAgent = {}
      hilog.info(domain, tag, `${tag} beforeEachEach END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4600
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4600
     * @tc.desc      : function cancel(agent: WantAgent, callback: AsyncCallback<void>): void
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

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4650
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4650
     * @tc.desc      : function cancel(agent: WantAgent): Promise<void>
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
          }).catch((err: BusinessError<void>): void => {
            hilog.info(domain, tag, 'cancel Promise err:' + JSON.stringify(err))
            expect().assertFail()
            done()
          })
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err:' + JSON.stringify(err))
          expect().assertFail()
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4650 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4700
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4700
     * @tc.desc      : function getBundleName(agent: WantAgent, callback: AsyncCallback<string>): void
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

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4750
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4750
     * @tc.desc      : function getBundleName(agent: WantAgent): Promise<string>
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
            .catch((err: BusinessError): void => {
              hilog.info(domain, tag, 'getBundleName Promise err:' + JSON.stringify(err))
              expect().assertFail()
              done()
            })
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err:' + JSON.stringify(err))
          expect().assertFail()
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_4750 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4900
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4900
     * @tc.desc      : function equal(agent: WantAgent, otherAgent: WantAgent, callback: AsyncCallback<boolean>): void,Checks whether two WantAgent objects are equal
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

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_4950
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_4950
     * @tc.desc      : function equal(agent: WantAgent, otherAgent: WantAgent): Promise<boolean>,Checks whether two WantAgent objects are equal
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
              }).catch((err: BusinessError<void>): void => {
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

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_5000
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_5000
     * @tc.desc      : function getOperationType(agent: WantAgent, callback: AsyncCallback<number>): void
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
                wantAgent.getOperationType(WantAgent, (err: BusinessError<void> | null, data: Double | undefined) => {
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

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_static_5050
     * @tc.name      : Sub_Notification_Ans_WantAgent_Create_static_5050
     * @tc.desc      : function getOperationType(agent: WantAgent): Promise<number>,Obtains the {@link OperationType} of a {@link WantAgent}
     */
    it("Sub_Notification_Ans_WantAgent_Create_static_5050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5050 START')
        WantAgentInfo.actionType = wantAgent.OperationType.START_ABILITY;
        WantAgentInfo.actionFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG];
        wantAgent.getWantAgent(WantAgentInfo).then((data: _WantAgent): Promise<_WantAgent> => {
          WantAgent = data
          hilog.info(domain, tag, 'getWantAgent Promise success: ' + JSON.stringify(data))
          wantAgent.getOperationType(WantAgent).then((data: Double): Promise<Double> => {
            hilog.info(domain, tag, 'getOperationType Promise success: ' + JSON.stringify(data))
            expect(true).assertTrue()
            done()
          }).catch((err: BusinessError): void => {
            hilog.info(domain, tag, 'getOperationType Promise err: ' + JSON.stringify(err))
            expect().assertFail();
            done()
          })
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, 'getWantAgent Promise err: ' + JSON.stringify(err))
          expect().assertFail();
          done()
        })
        hilog.info(domain, tag, 'Sub_Notification_Ans_WantAgent_Create_static_5050 END')
      })
  })
}