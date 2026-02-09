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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0100', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200
     * @tc.desc   OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0200', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300
     * @tc.desc   OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0300', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400
     * @tc.desc   OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0400', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500
     * @tc.desc   OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0500', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0600', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700
     * @tc.desc   OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0700', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800
     * @tc.desc   OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0800', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900
     * @tc.desc   OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_0900', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000
     * @tc.desc   OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1000', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1100', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200
     * @tc.desc   OperationType.START_ABILITY & WantAgentFlags.NO_BUILD_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1200', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300
     * @tc.desc   OperationType.START_ABILITIES & WantAgentFlags.CANCEL_PRESENT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1300', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400
     * @tc.desc   OperationType.START_SERVICE & WantAgentFlags.UPDATE_PRESENT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1400', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500
     * @tc.desc   OperationType.SEND_COMMON_EVENT & WantAgentFlags.CONSTANT_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1500', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600
     * @tc.desc   OperationType.UNKNOWN_TYPE & WantAgentFlags.REPLACE_ELEMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1600', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700
     * @tc.desc   OperationType.START_ABILITY & WantAgentFlags.REPLACE_ACTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1700', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800
     * @tc.desc   OperationType.START_ABILITIES & WantAgentFlags.REPLACE_URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1800', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900
     * @tc.desc   OperationType.START_SERVICE & WantAgentFlags.REPLACE_ENTITIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_1900', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000
     * @tc.desc   OperationType.SEND_COMMON_EVENT & WantAgentFlags.REPLACE_BUNDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2000', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100
     * @tc.desc   Cancels a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2100', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200
     * @tc.desc   Cancels a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2200', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300
     * @tc.desc   Obtains the bundle name of a WantAgent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2300', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400
     * @tc.desc   Obtains the bundle name of a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2400', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500
     * @tc.desc   Obtains the UID of a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2500', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600
     * @tc.desc   Obtains the UID of a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2600', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700
     * @tc.desc   Checks whether two WantAgent objects are equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2700', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800
     * @tc.desc   Checks whether two WantAgent objects are equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_2800', Level.LEVEL0, async function (done) {
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100
     * @tc.desc   Triggers a WantAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3100', Level.LEVEL0, async function (done) {
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
              expect(typeof(data.info)).assertEqual('object')
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

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3200
     * @tc.desc   Test getBundleName with null agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3200', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3200 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.getBundleName(null, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} getBundleName null agent error: ${err.code}`)
              try {
                expect(err.code).assertEqual(-1)
              } catch {
              }
            } else {
              console.info(`${TAG} getBundleName null agent should fail`)
            }
            done()
          } catch (error) {
            console.info(`${TAG} getBundleName callback error: ${JSON.stringify(error)}`)
            expect().assertFail()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3300
     * @tc.desc   Test getBundleName with null agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3300', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3300 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getBundleName(null)
        console.info(`${TAG} getBundleName null agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} getBundleName null agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3400
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3400
     * @tc.desc   Test getBundleName with undefined agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3400', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3400 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.getBundleName(undefined, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} getBundleName undefined agent error: ${err.code}`)
              expect(err.code).assertEqual(-1)
            } else {
              console.info(`${TAG} getBundleName undefined agent should fail`)
            }
            done()
          } catch (error) {
            console.info(`${TAG} getBundleName callback error: ${JSON.stringify(error)}`)
            expect().assertFail()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3500
     * @tc.desc   Test getBundleName with undefined agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3500', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3500 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getBundleName(undefined)
        console.info(`${TAG} getBundleName undefined agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} getBundleName undefined agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3600
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3600
     * @tc.desc   Test getUid with null agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3600', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3600 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.getUid(null, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} getUid null agent error: ${err.code}`)
              expect(err.code).assertEqual(-1)
            } else {
              console.info(`${TAG} getUid null agent should fail`)
            }
          } catch (error) {
            console.info(`${TAG} getUid callback error: ${JSON.stringify(error)}`)
          }
          done()
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3700
     * @tc.desc   Test getUid with null agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3700', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3700 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getUid(null)
        console.info(`${TAG} getUid null agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} getUid null agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3800
     * @tc.desc   Test getUid with undefined agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3800', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3800 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.getUid(undefined, (err, data) => {
          if (err.code) {
            console.info(`${TAG} getUid undefined agent error: ${err.code}`)
            try {
              expect(err.code).assertEqual(-1)
            } catch {
            }
          } else {
            console.info(`${TAG} getUid undefined agent should fail`)
            expect().assertFail()
          }
          done()
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3900
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3900
     * @tc.desc   Test getUid with undefined agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3900', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_3900 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getUid(undefined)
        console.info(`${TAG} getUid undefined agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} getUid undefined agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4000
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4000
     * @tc.desc   Test cancel with null agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4000', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4000 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.cancel(null, (err) => {
          if (err.code) {
            console.info(`${TAG} cancel null agent error: ${err.code}`)
            try {
              expect(err.code).assertEqual(-1)
            } catch {
            }
          } else {
            console.info(`${TAG} cancel null agent should fail`)
            expect().assertFail()
          }
          done()
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4100
     * @tc.desc   Test cancel with null agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4100', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4100 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.cancel(null)
        console.info(`${TAG} cancel null agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} cancel null agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4200
     * @tc.desc   Test cancel with undefined agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4200', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4200 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.cancel(undefined, (err) => {
          try {
            if (err.code) {
              console.info(`${TAG} cancel undefined agent error: ${err.code}`)
              try {
                expect(err.code).assertEqual(-1)
              } catch {
              }
            } else {
              console.info(`${TAG} cancel undefined agent should fail`)
              expect().assertFail()
            }
            done()
          } catch (error) {
            console.info(`${TAG} cancel callback error: ${JSON.stringify(error)}`)
            expect().assertFail()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} error: ${JSON.stringify(err)}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4300
     * @tc.desc   Test cancel with undefined agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4300', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4300 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.cancel(undefined)
        console.info(`${TAG} cancel undefined agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} cancel undefined agent error: ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500
     * @tc.desc   Test trigger with null agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        let triggerInfo = {
          code: 0,
          want: {},
          permission: '',
          extraInfo: {}
        }
        await wantAgent.trigger(null, triggerInfo)
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500 trigger null agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4500 trigger null agent error ` + err.code)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700
     * @tc.desc   Test trigger with undefined agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        let triggerInfo = {
          code: 0,
          want: {},
          permission: '',
          extraInfo: {}
        }
        await wantAgent.trigger(undefined, triggerInfo)
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700 trigger undefined agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4700 trigger undefined agent error`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800
     * @tc.desc   Test equal with null agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.equal(null, null, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800 equal null agent error: ${err.code}`)
              expect(err.code).assertEqual(-1)
            } else {
              console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800 equal null agent should fail`)
              expect().assertFail()
            }
          } catch (error) {
            console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800 equal callback error`)
          }
          done()
        })
      } catch (err) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4800 error`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4900
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4900
     * @tc.desc   Test equal with null agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4900', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_4900 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.equal(null, null)
        console.info(`${TAG} equal null agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} equal null agent error`)
        try {
          expect(err.code).assertEqual(-1)
        } catch {
        }
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5000
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5000
     * @tc.desc   Test equal with undefined agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5000', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5000 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        wantAgent.equal(undefined, undefined, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} equal undefined agent error: ${err.code}`)
              try {
                expect(err.code).assertEqual(-1)
              } catch {
              }
            } else {
              console.info(`${TAG} equal undefined agent should fail`)
              expect().assertFail()
            }
            done()
          } catch (error) {
            console.info(`${TAG} equal callback error`)
            expect().assertFail()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} error`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5100
     * @tc.desc   Test equal with undefined agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5100', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5100 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.equal(undefined, undefined)
        console.info(`${TAG} equal undefined agent should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} equal undefined agent error`)
        expect(err.code).assertEqual(-1)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300
     * @tc.desc   Test getWantAgent with null info (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getWantAgent(null)
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300 getWantAgent null info should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5300 getWantAgent null info error`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500
     * @tc.desc   Test getWantAgent with undefined info (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500 START`)
      try {
        expect(typeof (wantAgent)).assertEqual("object")
        await wantAgent.getWantAgent(undefined)
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500 getWantAgent undefined info should fail`)
        expect().assertFail()
        done()
      } catch (err) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5500 getWantAgent undefined info error ` + err.code)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600
     * @tc.desc   Test getBundleName return value with valid agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600 getWantAgent error: ${err.code}`)
          expect().assertFail()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600 getWantAgent success`)
          wantAgent.getBundleName(WantAgent, (err, data) => {
            try {
              console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600 getBundleName success: ${data}`)
              expect(data).assertEqual('com.example.actsnotificationwantagent')
            } catch (error) {
              console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5600 getBundleName callback error`)
            }
            done()
          })
        }
      })
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5700
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5700
     * @tc.desc   Test getBundleName return value with valid agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5700', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5700 START`)
      try {
        WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        const agent = await wantAgent.getWantAgent(WantAgentInfo)
        console.info(`${TAG} getWantAgent success`)
        const bundleName = await wantAgent.getBundleName(agent)
        console.info(`${TAG} getBundleName success: ${bundleName}`)
        expect(bundleName).assertEqual('com.example.actsnotificationwantagent')
        done()
      } catch (err) {
        console.info(`${TAG} error: ${err.code}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5800
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5800
     * @tc.desc   Test getUid return value with valid agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5800', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5800 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent error: ${err.code}`)
          expect().assertFail()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent success`)
          wantAgent.getUid(WantAgent, (err, data) => {
            try {
              if (err.code) {
                console.info(`${TAG} getUid error: ${err.code}`)
                expect().assertFail()
              } else {
                console.info(`${TAG} getUid success: ${data}`)
                expect(typeof data).assertEqual('number')
              }
              done()
            } catch (error) {
              console.info(`${TAG} getUid callback error`)
              expect().assertFail()
              done()
            }
          })
        }
      })
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5900
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5900
     * @tc.desc   Test getUid return value with valid agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5900', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_5900 START`)
      try {
        WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        const agent = await wantAgent.getWantAgent(WantAgentInfo)
        console.info(`${TAG} getWantAgent success`)
        const uid = await wantAgent.getUid(agent)
        console.info(`${TAG} getUid success: ${uid}`)
        expect(typeof uid).assertEqual('number')
        done()
      } catch (err) {
        console.info(`${TAG} error: ${err.code}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6000
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6000
     * @tc.desc   Test cancel return value with valid agent (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6000', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6000 START`)
      WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
      WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
        if (err.code) {
          console.info(`${TAG} getWantAgent error: ${err.code}`)
          expect().assertFail()
          done()
        } else {
          WantAgent = data
          console.info(`${TAG} getWantAgent success`)
          wantAgent.cancel(WantAgent, (err) => {
            try {
              if (err.code) {
                console.info(`${TAG} cancel error: ${err.code}`)
                expect().assertFail()
              } else {
                console.info(`${TAG} cancel success`)
                expect(true).assertTrue()
              }
              done()
            } catch (error) {
              console.info(`${TAG} cancel callback error`)
              expect().assertFail()
              done()
            }
          })
        }
      })
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6100
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6100
     * @tc.desc   Test cancel return value with valid agent (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6100', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6100 START`)
      try {
        WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        const agent = await wantAgent.getWantAgent(WantAgentInfo)
        console.info(`${TAG} getWantAgent success`)
        await wantAgent.cancel(agent)
        console.info(`${TAG} cancel success`)
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.info(`${TAG} error: ${err.code}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6200
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6200
     * @tc.desc   Test getWantAgent return value with valid info (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6200', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6200 START`)
      try {
        WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          try {
            if (err.code) {
              console.info(`${TAG} getWantAgent error: ${err.code}`)
              expect().assertFail()
            } else {
              console.info(`${TAG} getWantAgent success`)
              expect(data !== undefined).assertTrue()
              expect(typeof data).assertEqual('object')
            }
            done()
          } catch (error) {
            console.info(`${TAG} getWantAgent callback error`)
            expect().assertFail()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} error`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6300
     * @tc.number SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6300
     * @tc.desc   Test getWantAgent return value with valid info (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6300', Level.LEVEL0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_GET_WANT_AGENT_TEST_6300 START`)
      try {
        WantAgentInfo.operationType = wantAgent.OperationType.START_ABILITY
        WantAgentInfo.wantAgentFlags = [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        const agent = await wantAgent.getWantAgent(WantAgentInfo)
        console.info(`${TAG} getWantAgent success`)
        expect(agent !== undefined).assertTrue()
        expect(typeof agent).assertEqual('object')
        done()
      } catch (err) {
        console.info(`${TAG} error: ${err.code}`)
        expect().assertFail()
        done()
      }
    })

    console.info(TAG + 'SUB_NOTIFICATION_ANS_WANT_AGENT_TEST END')
  })
}
