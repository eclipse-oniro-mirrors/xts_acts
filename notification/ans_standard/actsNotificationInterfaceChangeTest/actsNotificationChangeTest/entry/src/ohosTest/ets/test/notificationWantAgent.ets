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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import wantAgent, {WantAgent} from '@ohos.app.ability.wantAgent';
import ohosWantAgent from '@ohos.wantAgent';

let TAG: string;

export default function wantAgentInfoTest() {
  describe('WantAgentTest',  ()=> {

    /**
     * @tc.name   Acts_WantAgentInfo_0100
     * @tc.number Acts_WantAgentInfo_0100
     * @tc.desc   Set wantAgent.OperationType.START_ABILITY and [wantAgent.WantAgentFlags.ONE_TIME_FLAG].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_WantAgentInfo_0100', Level.LEVEL2, async  (done:Function)=> {
      TAG = 'Acts_WantAgentInfo_0100 ==>';
      console.info('Acts_WantAgentInfo_0100 START')

      let WantAgent: WantAgent;
      let WantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.notificationchangetest",
            abilityName: "EntryAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true.true,false}",
            parameters: {
              myKey0: 2222
            }
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
      }

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
      console.info('Acts_WantAgentInfo_0100 END')
    });

    /**
     * @tc.name   Acts_WantAgentInfo_0200
     * @tc.number Acts_WantAgentInfo_0200
     * @tc.desc   Set wantAgent.OperationType.START_ABILITY and [wantAgent.WantAgentFlags.NO_BUILD_FLAG].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_WantAgentInfo_0200', Level.LEVEL2, async  (done:Function)=> {
      TAG = 'Acts_WantAgentInfo_0200 ==>';
      console.info('Acts_WantAgentInfo_0200 START')

      let WantAgent: WantAgent;
      let WantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.notificationchangetest",
            abilityName: "EntryAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true.true,false}",
            parameters: {
              myKey0: 2222
            }
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.NO_BUILD_FLAG]
      }

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
      console.info('Acts_WantAgentInfo_0200 END')
    });

    /**
     * @tc.name   Acts_WantAgentInfo_0300
     * @tc.number Acts_WantAgentInfo_0300
     * @tc.desc   Set wantAgent.OperationType.START_ABILITIES and [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_WantAgentInfo_0300', Level.LEVEL2, async  (done:Function)=> {
      TAG = 'Acts_WantAgentInfo_0300 ==>';
      console.info('Acts_WantAgentInfo_0300 START')

      let WantAgent: WantAgent;
      let WantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.notificationchangetest",
            abilityName: "EntryAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true.true,false}",
            parameters: {
              myKey0: 2222
            }
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITIES,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG]
      }

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
      console.info('Acts_WantAgentInfo_0300 END')
    });

    /**
     * @tc.name   Acts_WantAgentInfo_0400
     * @tc.number Acts_WantAgentInfo_0400
     * @tc.desc   Set wantAgent.OperationType.START_SERVICE and [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_WantAgentInfo_0400', Level.LEVEL2, async  (done:Function)=> {
      TAG = 'Acts_WantAgentInfo_0400 ==>';
      console.info('Acts_WantAgentInfo_0400 START')

      let WantAgent: WantAgent;
      let WantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.notificationchangetest",
            abilityName: "EntryAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true.true,false}",
            parameters: {
              myKey0: 2222
            }
          }
        ],
        operationType: ohosWantAgent.OperationType.START_SERVICE,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      }

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
      console.info('Acts_WantAgentInfo_0400 END')
    });

    /**
     * @tc.name   Acts_WantAgentInfo_0500
     * @tc.number Acts_WantAgentInfo_0500
     * @tc.desc   Set wantAgent.OperationType.SEND_COMMON_EVENT and [wantAgent.WantAgentFlags.CONSTANT_FLAG].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_WantAgentInfo_0500', Level.LEVEL2, async  (done:Function)=> {
      TAG = 'Acts_WantAgentInfo_0500 ==>';
      console.info('Acts_WantAgentInfo_0500 START')

      let WantAgent: WantAgent;
      let WantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: "deviceId",
            bundleName: "com.example.notificationchangetest",
            abilityName: "EntryAbility",
            action: "action1",
            entities: ["entity1"],
            type: "MIMETYPE",
            uri: "key={true.true,false}",
            parameters: {
              myKey0: 2222
            }
          }
        ],
        operationType: ohosWantAgent.OperationType.SEND_COMMON_EVENT,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }

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
      console.info('Acts_WantAgentInfo_0500 END')
    });
  })
}