/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEvent';

const TEST_SUITE_NAME: string = 'StartAbilityGetStartParameterTest'
const EVENT_CASE_300 = 'ABILITY_StartAbility_GetStartParameters_0300'
const EVENT_CASE_400 = 'ABILITY_StartAbility_GetStartParameters_0400'
const EVENT_CASE_500 = 'ABILITY_StartAbility_GetStartParameters_0500'
const EVENT_CASE_600 = 'ABILITY_StartAbility_GetStartParameters_0600'
const EVENT_CASE_700 = 'ABILITY_StartAbility_GetStartParameters_0700'
const EVENT_CASE_800 = 'ABILITY_StartAbility_GetStartParameters_0800'
const EVENT_CASE_1400 = 'ABILITY_StartAbility_GetStartParameters_1400'
const EVENT_CASE_1500 = 'ABILITY_StartAbility_GetStartParameters_1500'
const CALLER_PID = 'ohos.aafwk.param.callerPid'
const CALLER_TOKEN = 'ohos.aafwk.param.callerToken'
const CALLER_UID = 'ohos.aafwk.param.callerUid'
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let accessTokenId: any;
let uid: any;
let pid: any;

async function sleep(time) {
  await new Promise((resolve, reject) => {
    setTimeout(resolve, time)
  })
}

export default function StartAbilityGetStartParameterTest() {

  async function getLocalHapData() {
    try {
      console.info(`${TEST_SUITE_NAME} case begin getLocalHapData`);
      let cmd2 = 'ps -ef | grep com.ohos.startabilitygetstartparametertest';
      await abilityDelegator.executeShellCommand(cmd2).then((result) => {
        console.info(`${TEST_SUITE_NAME} executeShellCommand result: ${JSON.stringify(result.stdResult)}`);
        pid = JSON.stringify(result.stdResult);
      }).catch((err => {
        console.info(`${TEST_SUITE_NAME} executeShellCommand catch: ${JSON.stringify(err)}`);
        expect().assertFail()
      }))
    } catch (err) {
      console.info(`${TEST_SUITE_NAME} executeShellCommand exception: ${JSON.stringify(err)}`);
      expect().assertFail()
    }
  }

  describe('StartAbilityGetStartParameterTest', function () {
    beforeAll(async (done) => {
      console.info(`${TEST_SUITE_NAME} case begin beforeAll`);
      let cmd = 'bm dump -n com.ohos.startabilitygetstartparametertest';
      await abilityDelegator.executeShellCommand(cmd).then((result) => {
        console.info(`${TEST_SUITE_NAME} executeShellCommand result: ${JSON.stringify(result.stdResult)}`);
        let resultObject = JSON.parse(result.stdResult.split('com.ohos.startabilitygetstartparametertest:')[1])
        console.info(`${TEST_SUITE_NAME} executeShellCommand resultObject: ${resultObject}`);
        accessTokenId = resultObject.applicationInfo.accessTokenId
        uid = resultObject.applicationInfo.uid
        console.info(`${TEST_SUITE_NAME} accessTokenId result: ${accessTokenId}`);
        console.info(`${TEST_SUITE_NAME} uid result: ${uid}`);
      }).catch((err => {
        console.info(`${TEST_SUITE_NAME} executeShellCommand catch: ${JSON.stringify(err)}`);
        expect().assertFail()
      }))
      done();
    })
    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0700
     * @tc.name      : For different applications, ability1 starts ability2 by startAbility
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */

    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0700", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0700';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);
        await commonEvent.createSubscriber({
          events: [EVENT_CASE_700]}).then((subscriber) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'createSubscriber success');
          commonEvent.subscribe(subscriber, async (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success pid: ${pid}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })

        await getLocalHapData();

        abilityDelegator.startAbility({
          bundleName: 'com.ohos.getstartparameterhelper',
          abilityName: 'EntryAbility',
        }, (err, data) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'start ability success');
        })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0800
     * @tc.name      : For different applications, ability1 starts ability by startAbilityForResult
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */

    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0800", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0800';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_800]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })

        globalThis.abilityContext.startAbilityForResult({
          bundleName: 'com.ohos.getstartparameterhelper2',
          abilityName: 'EntryAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1500
     * @tc.name      : Different applications, different users can launch ability2 under ability1
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1500", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1500';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);
        abilityDelegator.executeShellCommand('su root', (err, result) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
          data : ${JSON.stringify(result)}`);
        })

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_1500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })

        globalThis.abilityContext.startAbility({
          bundleName: 'com.ohos.getstartparameterhelper3',
          abilityName: 'EntryAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0500
     * @tc.name      : Unlike hap, ability1 starts ability2 via startAbility
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0500", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0500';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })
        globalThis.abilityContext.startAbility({
          bundleName: 'com.ohos.startabilitygetstartparametertest',
          abilityName: 'FirstAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0600
     * @tc.name      : Unlike hap, ability1 starts ability2 via startAbilityForResult
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0600", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0600';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })
        globalThis.abilityContext.startAbilityForResult({
          bundleName: 'com.ohos.startabilitygetstartparametertest',
          abilityName: 'SecondAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0300
     * @tc.name      : As with the application, ability1 starts ability2 via startaAbility
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0300", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0300';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);
        abilityDelegator.executeShellCommand('su root', (err, result) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
          data : ${JSON.stringify(result)}`);
        })

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_300]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })
        globalThis.abilityContext.startAbility({
          bundleName: 'com.ohos.startabilitygetstartparametertest',
          abilityName: 'ThirdAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0400
     * @tc.name      : As with the application, ability1 starts ability2 via startaAbilityForResult
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0400", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_0400';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_400]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })
        globalThis.abilityContext.startAbilityForResult({
          bundleName: 'com.ohos.startabilitygetstartparametertest',
          abilityName: 'FourthAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success,
             data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1400
     * @tc.name      : For the same application, different users can launch ability2 under ability1
     * @tc.desc      : Compare the parameters of pid and ohos.aafwk.param.callerPid, accessTokenId
     *                 and ohos.aafwk.param.callerToken,uid and ohos.aafwk.param.callerUid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1400", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_GetStartParameters_1400';
      try {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case begin`);
        abilityDelegator.executeShellCommand('su leba', (err, result) => {
          console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success,
           data : ${JSON.stringify(result)}`);
        })

        let commonEventSubscribeInfo = {
          events: [EVENT_CASE_1400]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, eventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success: ${JSON.stringify(eventData)}`);
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe success localhapuid: ${uid}, accessTokenId: ${accessTokenId}`);
            let callPid = eventData.parameters.pid
            let tokenId = eventData.parameters.tokenId
            let userId = eventData.parameters.uid
            expect(pid).assertContain(callPid);
            expect(userId == uid).assertEqual(true)
            expect(tokenId == accessTokenId).assertEqual(true)
            commonEvent.unsubscribe(subscriber, (err, data) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} unsubscribe success`);
              done()
            })
          })
        })
        globalThis.abilityContext.startAbility({
          bundleName: 'com.ohos.startabilitygetstartparametertest',
          abilityName: 'FifthAbility',
        },
          (err, data) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, `err ${JSON.stringify(err)} start ability success, 
            data : ${JSON.stringify(data)}`);
          })
      } catch (err) {
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} case fail: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
  })
}
