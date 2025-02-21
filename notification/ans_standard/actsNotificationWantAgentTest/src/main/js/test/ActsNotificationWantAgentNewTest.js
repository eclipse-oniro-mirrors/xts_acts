/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import wantAgent from '@ohos.app.ability.wantAgent'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsNotificationWantAgentNewTest() {
  describe('SUB_NOTIFICATION_ANS_WANT_AGENT_NEW_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_WANT_AGENT_NEW_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_WANT_AGENT_NEW_TEST START')

    let WantAgent = {}
    let wantAgentData1 = {}
    let wantAgentData2 = {}

    let WantAgentInfo = {
      wants: [
        {
          deviceId: "deviceId",
          bundleName: "com.example.actsnotificationwantagent",
          abilityName: "com.example.actsnotificationwantagent.MainAbility",
          action: "action1",
          entities: ["entity1"],
          type: "MIMETYPE",
          uri: "key={true,true,false}",
          parameters:
          {
            myKey0: 2222,
            myKey1: [1, 2, 3],
            myKey2: "[1, 2, 3]",
            myKey3: "notification",
            myKey4: [false, true, false],
            myKey5: ["ANS", "WANT", "AGENT"],
            myKey6: true
          }
        }
      ],
      operationType: wantAgent.OperationType,
      requestCode: 0,
      wantAgentFlags: [wantAgent.WantAgentFlags],
      extraInfo: {
        key: 'WantAgentInfo_test'
      }
    }

    beforeEach(async function (done) {
      console.info(`${TAG} beforeEach START`)
      WantAgent = {}
      console.info(`${TAG} beforeEachEach END`)
      done();
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3600
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_3600', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3600 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(true).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3600 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3650
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_3650', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3650 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.NO_BUILD_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3650 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3700
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_3700', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3700 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3700 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3750
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_3750', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3750 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3750 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3800
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_3800', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3800 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3850
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     */
    it('Sub_Notification_Ans_WantAgent_Create_3850', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3850 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ELEMENT]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(true).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(false).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3850 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3900
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     */
    it('Sub_Notification_Ans_WantAgent_Create_3900', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3900 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ACTION]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3900 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_3950
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     */
    it('Sub_Notification_Ans_WantAgent_Create_3950', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3950 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_URI]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_3950 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4000
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     */
    it('Sub_Notification_Ans_WantAgent_Create_4000', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4000 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ENTITIES]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4000 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4050
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     */
    it('Sub_Notification_Ans_WantAgent_Create_4050', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4050 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_BUNDLE]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4050 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4100
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_4100', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4150
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_4150', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4150 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.NO_BUILD_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4150 END`)
    })

    //TODO
    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4200
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_4200', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4200 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4200 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4250
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_4250', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4250 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4250 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4300
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     */
    it('Sub_Notification_Ans_WantAgent_Create_4300', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4300 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4300 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4350
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     */
    it('Sub_Notification_Ans_WantAgent_Create_4350', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4350 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ELEMENT]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4350 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4400
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     */
    it('Sub_Notification_Ans_WantAgent_Create_4400', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4400 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ACTION]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4400 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4450
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     */
    it('Sub_Notification_Ans_WantAgent_Create_4450', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4450 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_URI]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4450 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4500
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     */
    it('Sub_Notification_Ans_WantAgent_Create_4500', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4500 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ENTITIES]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4500 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4550
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     */
    it('Sub_Notification_Ans_WantAgent_Create_4550', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4550 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_BUNDLE]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code} ,message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4550 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4600
     * @tc.name      : function cancel(agent: WantAgent, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a WantAgent
     */
    it('Sub_Notification_Ans_WantAgent_Create_4600', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4600 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.cancel(WantAgent, (err, data) => {
            if (err) {
              console.info(`${TAG} cancel AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} cancel AsyncCallback success`)
              expect(true).assertTrue()
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4600 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4650
     * @tc.name      : function cancel(agent: WantAgent): Promise<void>
     * @tc.desc      : Cancels a WantAgent
     */
    it('Sub_Notification_Ans_WantAgent_Create_4650', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4650 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        wantAgent.cancel(WantAgent).then(() => {
          console.info(`${TAG} cancel Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err) => {
          console.info(`${TAG} cancel Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4650 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4700
      * @tc.name      : function getBundleName(agent: WantAgent, callback: AsyncCallback<string>): void
      * @tc.desc      : Obtains the bundle name of a WantAgent.
      */
    it('Sub_Notification_Ans_WantAgent_Create_4700', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4700 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.getBundleName(WantAgent, (err, data) => {
            if (err) {
              console.info(`${TAG} getBundleName AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getBundleName AsyncCallback success: ${JSON.stringify(data)}`)
              expect(data).assertEqual('com.example.actsnotificationwantagent')
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4700 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4750
      * @tc.name      : function getBundleName(agent: WantAgent): Promise<string>
      * @tc.desc      : Obtains the bundle name of a WantAgent
      */
    it('Sub_Notification_Ans_WantAgent_Create_4750', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4750 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        wantAgent.getBundleName(WantAgent)
        .then((data) => {
          console.info(`${TAG} getBundleName Promise success: ${JSON.stringify(data)}`)
          expect(data).assertEqual('com.example.actsnotificationwantagent')
          done()
        })
        .catch((err) => {
          console.info(`${TAG} getBundleName Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4750 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4800
      * @tc.name      : function getUid(agent: WantAgent, callback: AsyncCallback<number>): void
      * @tc.desc      : Obtains the UID of a WantAgent
      */
    it('Sub_Notification_Ans_WantAgent_Create_4800', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.getUid(WantAgent, (err, data) => {
            if (err) {
              console.info(`${TAG} getUid AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getUid AsyncCallback success: ${JSON.stringify(data)}`)
              expect(true).assertTrue()
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4800 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4850
      * @tc.name      : function getUid(agent: WantAgent): Promise<number>
      * @tc.desc      : Obtains the UID of a WantAgent
      */
    it('Sub_Notification_Ans_WantAgent_Create_4850', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4850 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        wantAgent.getUid(WantAgent).then((data) => {
          console.info(`${TAG} getUid Promise success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        }).catch((err) => {
          console.info(`${TAG} getUid Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4850 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4900
      * @tc.name      : function equal(agent: WantAgent, otherAgent: WantAgent, callback: AsyncCallback<boolean>): void
      * @tc.desc      : Checks whether two WantAgent objects are equal
      */
    it('Sub_Notification_Ans_WantAgent_Create_4900', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4900 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          wantAgentData1 = data
          wantAgentData2 = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.equal(wantAgentData1, wantAgentData2, (err, data) => {
            if (err) {
              console.info(`${TAG} equal AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} equal AsyncCallback success: ${JSON.stringify(data)}`)
              expect(data).assertTrue()
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4900 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_4950
      * @tc.name      : function equal(agent: WantAgent, otherAgent: WantAgent): Promise<boolean>
      * @tc.desc      : Checks whether two WantAgent objects are equal
      */
    it('Sub_Notification_Ans_WantAgent_Create_4950', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4950 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          wantAgentData1 = data
          wantAgentData2 = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.equal(wantAgentData1, wantAgentData2).then((data) => {
            console.info(`${TAG} equal Promise success: ${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          }).catch((err) => {
            console.info(`${TAG} equal Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_4950 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_5000
      * @tc.name      : function getOperationType(agent: WantAgent, callback: AsyncCallback<number>): void
      * @tc.desc      : Obtains the {@link OperationType} of a {@link WantAgent}
      */
    it('Sub_Notification_Ans_WantAgent_Create_5000', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5000 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.getOperationType(WantAgent, (err, data) => {
            if (err != null) {
              console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
              expect(true).assertTrue()
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5000 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_5050
      * @tc.name      : function getOperationType(agent: WantAgent): Promise<number>
      * @tc.desc      : Obtains the {@link OperationType} of a {@link WantAgent}
      */
    it('Sub_Notification_Ans_WantAgent_Create_5050', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5050 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo).then((data) => {
        WantAgent = data
        console.info(`${TAG} getWantAgent Promise success: ${JSON.stringify(data)}`)
        wantAgent.getOperationType(WantAgent)
        .then((data) => {
          console.info(`${TAG} getOperationType Promise success: ${JSON.stringify(data)}`)
          expect(true).assertTrue()
          done()
        })
        .catch((err) => {
          console.info(`${TAG} getOperationType Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
      }).catch((err) => {
        console.info(`${TAG} getWantAgent Promise err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5050 END`)
    })

    /*
      * @tc.number    : Sub_Notification_Ans_WantAgent_Create_5100
      * @tc.name      : function trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void
      * @tc.desc      : Triggers a WantAgent
      */
    it('Sub_Notification_Ans_WantAgent_Create_5100', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)

          let triggerInfo = {
            code: 0,
            want: {
              deviceId: "deviceId",
              bundleName: "com.example.actsnotificationwantagent",
              abilityName: "com.example.actsnotificationwantagent.MainAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true,true,false}",
              parameters:
              {
                myKey0: 2222,
                myKey1: [1, 2, 3],
                myKey2: "[1, 2, 3]",
                myKey3: "notification",
                myKey4: [false, true, false],
                myKey5: ["ANS", "WANT", "AGENT"],
                myKey6: true,
              }
            },
            permission: '',
            extraInfo: {
              test: 'this is a test value'
            }
          }
          wantAgent.trigger(WantAgent, triggerInfo, (err, data) => {
            if (err) {
              console.info(`${TAG} trigger AsyncCallback err: ${JSON.stringify(err)}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} trigger AsyncCallback success: ${JSON.stringify(data)}`)
              expect(typeof(data.wantAgent)).assertEqual('object')
              expect(data.finalCode).assertEqual(0)
              expect(data.finalData).assertEqual('')
              expect(typeof(data.extraInfo)).assertEqual('object')
              expect(data.want.deviceId).assertEqual('deviceId')
              expect(data.want.bundleName).assertEqual('com.example.actsnotificationwantagent')
              expect(data.want.abilityName).assertEqual('com.example.actsnotificationwantagent.MainAbility')
              expect(data.want.parameters.key).assertEqual('WantAgentInfo_test')
              done()
            }

          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_5200
     * @tc.name      : function trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void
     * @tc.desc      : Test extraInfos in WantAgentInfo
     */
    it('Sub_Notification_Ans_WantAgent_Create_5200', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5200 START`)
      let newWantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.actsnotificationwantagent",
            abilityName: "com.example.actsnotificationwantagent.MainAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true,true,false}",
            parameters:
            {
              myKey0: 2222,
              myKey1: [1, 2, 3],
              myKey2: "[1, 2, 3]",
              myKey3: "notification",
              myKey4: [false, true, false],
              myKey5: ["ANS", "WANT", "AGENT"],
              myKey6: true
            }
          }
        ],
        operationType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        extraInfos: {
          test: 'this is a test value'
        }
      }
      wantAgent.getWantAgent(newWantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)

          let triggerInfo = {
            code: 0,
            want: {
              deviceId: "deviceId",
              bundleName: "com.example.actsnotificationwantagent",
              abilityName: "com.example.actsnotificationwantagent.MainAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true,true,false}",
              parameters:
              {
                myKey0: 2222,
                myKey1: [1, 2, 3],
                myKey2: "[1, 2, 3]",
                myKey3: "notification",
                myKey4: [false, true, false],
                myKey5: ["ANS", "WANT", "AGENT"],
                myKey6: true,
              }
            },
            permission: ''
          }
          wantAgent.trigger(WantAgent, triggerInfo, (err, data) => {
            if (err) {
              console.info(`${TAG} trigger AsyncCallback err: ${JSON.stringify(err)}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} trigger AsyncCallback success: ${JSON.stringify(data)}`)
              expect(typeof(data.wantAgent)).assertEqual('object')
              expect(data.finalCode).assertEqual(0)
              expect(data.finalData).assertEqual('')
              expect(typeof(data.extraInfo)).assertEqual('object')
              expect(data.want.deviceId).assertEqual('deviceId')
              expect(data.want.bundleName).assertEqual('com.example.actsnotificationwantagent')
              expect(data.want.abilityName).assertEqual('com.example.actsnotificationwantagent.MainAbility')
              expect(data.want.parameters.test).assertEqual('this is a test value')
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5200 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_WantAgent_Create_5300
     * @tc.name      : function trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void
     * @tc.desc      : Test extraInfos in WantAgentInfo
     */
    it('Sub_Notification_Ans_WantAgent_Create_5300', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5300 START`)
      let newWantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.actsnotificationwantagent",
            abilityName: "com.example.actsnotificationwantagent.MainAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true,true,false}",
            parameters:
            {
              myKey0: 2222,
              myKey1: [1, 2, 3],
              myKey2: "[1, 2, 3]",
              myKey3: "notification",
              myKey4: [false, true, false],
              myKey5: ["ANS", "WANT", "AGENT"],
              myKey6: true
            }
          }
        ],
        operationType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        extraInfo: {
          key: 'WantAgentInfo_test'
        },
        extraInfos: {
          test: 'this is a test value'
        }
      }
      wantAgent.getWantAgent(newWantAgentInfo, (err, data) => {
        if (err != null) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
  
          let triggerInfo = {
            code: 0,
            want: {
              deviceId: "deviceId",
              bundleName: "com.example.actsnotificationwantagent",
              abilityName: "com.example.actsnotificationwantagent.MainAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true,true,false}",
              parameters:
              {
                myKey0: 2222,
                myKey1: [1, 2, 3],
                myKey2: "[1, 2, 3]",
                myKey3: "notification",
                myKey4: [false, true, false],
                myKey5: ["ANS", "WANT", "AGENT"],
                myKey6: true,
              }
            },
            permission: ''
          }
          wantAgent.trigger(WantAgent, triggerInfo, (err, data) => {
            if (err) {
              console.info(`${TAG} trigger AsyncCallback err: ${JSON.stringify(err)}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} trigger AsyncCallback success: ${JSON.stringify(data)}`)
              expect(typeof(data.wantAgent)).assertEqual('object')
              expect(data.finalCode).assertEqual(0)
              expect(data.finalData).assertEqual('')
              expect(typeof(data.extraInfo)).assertEqual('object')
              expect(data.want.deviceId).assertEqual('deviceId')
              expect(data.want.bundleName).assertEqual('com.example.actsnotificationwantagent')
              expect(data.want.abilityName).assertEqual('com.example.actsnotificationwantagent.MainAbility')
              expect(data.want.parameters.test).assertEqual('this is a test value')
              done()
            }
          })
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_WantAgent_Create_5300 END`)
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_WANT_AGENT_NEW_TEST END')
  })
}
