/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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
import wantAgent from '@ohos.wantAgent'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsNotificationWantAgentTest() {
  describe('SUB_NOTIFICATION_ANS_WANT_AGENT_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_WANT_AGENT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_WANT_AGENT_TEST START')

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
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.NO_BUILD_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ELEMENT]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ACTION]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_URI]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ENTITIES]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000
     * @tc.name      : function getWantAgent(info: WantAgentInfo, callback: AsyncCallback<WantAgent>): void
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_BUNDLE]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500 START`)
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.UNKNOWN_TYPE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ELEMENT]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ACTION]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITIES
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_URI]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_SERVICE
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_ENTITIES]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000
     * @tc.name      : function getWantAgent(info: WantAgentInfo): Promise<WantAgent>
     * @tc.desc      : OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.SEND_COMMON_EVENT
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.REPLACE_BUNDLE]
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100
     * @tc.name      : function cancel(agent: WantAgent, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a WantAgent
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.cancel(WantAgent, (err) => {
            if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200
     * @tc.name      : function cancel(agent: WantAgent): Promise<void>
     * @tc.desc      : Cancels a WantAgent
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300
      * @tc.name      : function getBundleName(agent: WantAgent, callback: AsyncCallback<string>): void
      * @tc.desc      : Obtains the bundle name of a WantAgent.
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.getBundleName(WantAgent, (err, data) => {
            if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400
      * @tc.name      : function getBundleName(agent: WantAgent): Promise<string>
      * @tc.desc      : Obtains the bundle name of a WantAgent
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500
      * @tc.name      : function getUid(agent: WantAgent, callback: AsyncCallback<number>): void
      * @tc.desc      : Obtains the UID of a WantAgent
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.getUid(WantAgent, (err, data) => {
            if (err.code) {
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600
      * @tc.name      : function getUid(agent: WantAgent): Promise<number>
      * @tc.desc      : Obtains the UID of a WantAgent
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600 START`)
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

      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700
      * @tc.name      : function equal(agent: WantAgent, otherAgent: WantAgent, callback: AsyncCallback<boolean>): void
      * @tc.desc      : Checks whether two WantAgent objects are equal
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          wantAgentData1 = data
          wantAgentData2 = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.equal(wantAgentData1, wantAgentData2, (err, data) => {
            if (err.code) {
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
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800
      * @tc.name      : function equal(agent: WantAgent, otherAgent: WantAgent): Promise<boolean>
      * @tc.desc      : Checks whether two WantAgent objects are equal
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          wantAgentData1 = data
          wantAgentData2 = data
          console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
          wantAgent.equal(wantAgentData1, wantAgentData2).then((data) => {
            console.info(`${TAG} equal Promise success: ${JSON.stringify(data)}`)
            expect(data).assertTrue()
            done()
          }).catch((err) => {
            console.info(`${TAG} equal Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800 END`)
    })

    /*
      * @tc.number    : SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100
      * @tc.name      : function trigger(agent: WantAgent, triggerInfo: TriggerInfo, callback?: AsyncCallback<CompleteData>): void
      * @tc.desc      : Triggers a WantAgent
      */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
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
            if (err.code) {
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
              done()
            }

          })
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100 END`)
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_WANT_AGENT_TEST END')
  })
}
