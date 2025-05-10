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

import { describe, it, expect, afterEach, Level } from '@ohos/hypium';
import commonEvent from '@ohos.commonEvent';
import { Constant } from '../Common';
import display from '@ohos.display';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';

const displayId = 'displayId';
const TAG: string = 'StartAbilityGetDisplayIdTest';
const TEST_SUITE_NAME: string = 'StartAbilityGetDisplayIdTest';
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

async function startAbilityForResult(want: Want, display: number | undefined = undefined) {
  await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbilityForResult(
    want,
    {
      displayId: display
    }
  )
    .then(() => {
      console.info(`${TEST_SUITE_NAME}====>startAbilityForResult success====>`);
    })
    .catch((err: BusinessError) => {
      expect().assertFail();
      console.info(`${TEST_SUITE_NAME}====>ACTS_startAbilityForResult err====> ${err}`);
    })
}

async function startAbility(want: Want, display: ESObject = undefined) {
  await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(
    want,
    {
      displayId: display
    }
  )
    .then(() => {
      console.info(`${TEST_SUITE_NAME}====>startAbility success====>`);
    })
    .catch((err: BusinessError) => {
      expect().assertFail();
      console.info(`${TEST_SUITE_NAME}====>ACTS_startAbility err====> ${err}`)
    })
}

export default function StartAbilityGetDisplayIdTest() {

  describe('ActsAbilityTest', () => {
    afterEach(async (done:Function) => {
      await abilityDelegator.executeShellCommand('aa start -b com.ohos.startabilitygetdisplayidtest -a TestAbility');
      done();
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0500
     * @tc.name      : The device has only one physical screen, call the startAbilityForResult parameter to start the application,
     *                 and set the displayId parameter in the StartOptions parameter to the displayId of the screen
     * @tc.desc      : for testing call startAbilityForResult to start app with startOption's displayId  which is current screen displayId
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0500", Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0500';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 500=====> data: ${JSON.stringify(commonEventData)}`);
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })

        let currentDisplayId = display.getDefaultDisplaySync().id;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult_0500 get current screen display id=====: ${currentDisplayId}`);
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility5',
        }
        await startAbilityForResult(want, currentDisplayId)
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0600
     * @tc.name      : The device has only one physical screen, and the startAbilityForResult parameter is called to start the application,
     *                 and the displayId parameter in the StartOptions parameter is set to undefined
     * @tc.desc      : for testing call startAbilityForResult to start app with startOption's displayId = undefined
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0600';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 600=====> data: ${JSON.stringify(commonEventData)}`);
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility6',
        }
        await sleep(1000);
        await startAbilityForResult(want);
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0700
     * @tc.name      : The device has only one physical screen, call startAbilityForResult to start the application,
     *                 and the parameter want filters the DISPLAY_ID of parameters
     * @tc.desc      : for testing startAbilityForResult filter want parameter DISPLAY_ID
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0700';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_700]
        }
        commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility7',
          parameters: {
            'ohos.aafwk.param.displayId': 5
          }
        }
        await sleep(1000);
        await startAbilityForResult(want);
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0300
     * @tc.name      : The device has only one physical screen, and the startAbility parameter is called to start the application,
     *                 and the displayId parameter in the StartOptions parameter is set to undefined
     * @tc.desc      : for testing startAbility with startOption displayId equal undefined
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0300';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_300]
        }
        commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 300=====> data: ${JSON.stringify(commonEventData)}`);

              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility3',
        }
        await sleep(1000);
        await startAbility(want)
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0200
     * @tc.name      : The device has only one physical screen, call startAbility to start the application,
     *                 and set the displayId parameter to a string in the StartOptions parameter
     * @tc.desc      : for testing startAbility with startOption displayId which is a String
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0200", Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0200'
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_200]
        }
        commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 200=====> data: ${JSON.stringify(commonEventData)}`);
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility2',
        }
        await sleep(500);
        await startAbility(want, '1')
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0100
     * @tc.name      : The device has only one physical screen, call startAbility to start the application,
     *                 and set the displayId parameter in the StartOptions parameter to the displayId of the screen
     * @tc.desc      : for testing startAbility with startOption displayId which is current screen value
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0100", Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0100';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_100]
        }
        commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 100=====> data: ${JSON.stringify(commonEventData)}`);
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility1',
        }
        let currentDisplayId = display.getDefaultDisplaySync().id;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult_0100 get current screen display id=====: ${currentDisplayId}`);
        await sleep(500);
        await startAbility(want, currentDisplayId)
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0400
     * @tc.name      : The device has only one physical screen, call startAbility to start the application,
     *                 and the parameter want filters the parameters DISPLAY_ID
     * @tc.desc      : for testing startAbilityForResult filter want parameter DISPLAY_ID
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it("SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0400", Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_getDisplayIdTest_0400';
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_400]
        }
        commonEvent.createSubscriber(commonEventSubscribeInfo)
          .then((subscriber) => {
            commonEvent.subscribe(subscriber, (err, commonEventData) => {
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbilityForResult  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
              expect(commonEventData.parameters![displayId]).assertEqual(0);
              commonEvent.unsubscribe(subscriber, (err, data) => {
                done();
              });
            })
          })
        let want: Want = {
          bundleName: 'com.ohos.startabilitygetdisplayidtest',
          abilityName: 'MainAbility4',
          parameters: {
            'ohos.aafwk.param.displayId': 6
          }
        }
        await sleep(500);
        await startAbility(want)
        await sleep(4000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        done()
      }
    })
  })
}