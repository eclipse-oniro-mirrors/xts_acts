/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http: www.apache.org/licenses/LICENSE-2.0
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
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEvent';

const domain = 0x0000;
const TAG = 'ActsFAAbilityDisplayOrientationTest';
const TEST_SUITE_NAME = 'ActsFAAbilityDisplayOrientationTest';
const Event_FA_DisplayOrientation_0100 = 'Event_FA_DisplayOrientation_0100';
const Event_FA_DisplayOrientation_0100_LifeCircle = 'Event_FA_DisplayOrientation_0100_LifeCircle';
const Event_FA_DisplayOrientation_0200 = 'Event_FA_DisplayOrientation_0200';
const Event_FA_DisplayOrientation_0200_LifeCircle = 'Event_FA_DisplayOrientation_0200_LifeCircle';
const Event_FA_DisplayOrientation_0300 = 'Event_FA_DisplayOrientation_0300';
const Event_FA_DisplayOrientation_0300_LifeCircle = 'Event_FA_DisplayOrientation_0300_LifeCircle';
const Event_FA_DisplayOrientation_0400 = 'Event_FA_DisplayOrientation_0400';
const Event_FA_DisplayOrientation_0400_LifeCircle = 'Event_FA_DisplayOrientation_0400_LifeCircle';
const Event_FA_DisplayOrientation_0500 = 'Event_FA_DisplayOrientation_0500';
const Event_FA_DisplayOrientation_0500_LifeCircle = 'Event_FA_DisplayOrientation_0500_LifeCircle';
const Event_FA_DisplayOrientation_0600 = 'Event_FA_DisplayOrientation_0600';
const Event_FA_DisplayOrientation_0600_LifeCircle = 'Event_FA_DisplayOrientation_0600_LifeCircle';
const Event_FA_DisplayOrientation_0700 = 'Event_FA_DisplayOrientation_0700';
const Event_FA_DisplayOrientation_0800 = 'Event_FA_DisplayOrientation_0800';
const Event_FA_DisplayOrientation_0900 = 'Event_FA_DisplayOrientation_0900';
const Event_FA_DisplayOrientation_1000 = 'Event_FA_DisplayOrientation_1000';
const Data_LifeCircle = ['onCreate', 'onActive'];

export default function actsFAAbilityDisplayOrientationTest() {

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  describe('ActsAbilityTest', function () {

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0200
     * @tc.name      : For different haps, set the landscape and portrait status of ability to PORTRAIT,
     *                 start ability2 and set the landscape and portrait status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0200", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0200';
      try {
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0200]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 6
          }
        }

        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0400
     * @tc.name      : For different applications, set the landscape and portrait status of ability to PORTRAIT,
     *                 start ability2 and set the landscape and portrait status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0400", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0400';
      try {
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0400]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper2',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper2.MainAbility',
          parameters: {
            number: 8
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0500
     * @tc.name      : In the same application, set the landscape and portrait status of ability to LANDSCAPE,
     *                 start ability2 and set the landscape and portrait status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0500", 3, async function (done) {
      await sleep(1000);
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0500';
      try {
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0500]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 3
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0100
     * @tc.name      : For different haps, set the horizontal and vertical status of ability to LANDSCAPE,
     *                 start ability2 and set the landscape and vertical status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0100", 3, async function (done) {
      await sleep(1000);
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0100';
      try {
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0100]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 5
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);

      }
    })



    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0300
     * @tc.name      : For different applications, set the landscape and portrait status of ability to LANDSCAPE,
     *                 start ability2 and set the landscape and portrait status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0300", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0300';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0300]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper2',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper2.MainAbility',
          parameters: {
            number: 7
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0600
     * @tc.name      : In the same application, set the landscape and portrait status of ability to PORTRAIT,
     *                 start ability2 and set the landscape and portrait status to FOLLOW_RECENT
     * @tc.desc      : Set orientation in different ability and get the result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0600", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0600';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0600]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 4
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0700
     * @tc.name      : Obtain the enumerated values of UNSPECIFIED, LANDSCAPE, PORTRAIT, and FOLLOW_RECENT
     * @tc.desc      : Start FA ability to obtain the enumerated values of UNSPECIFIED, LANDSCAPE, PORTRAIT, and FOLLOW_RECENT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0700", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0700';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0700]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 9
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0800
     * @tc.name      : Set the landscape and portrait status of the ability to LANDSCAPE
     * @tc.desc      : Start FA ability to set the landscape and portrait status of the ability to LANDSCAPE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0800", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0700';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0800]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 1
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0900
     * @tc.name      : Set the landscape and portrait status of ability to PORTRAIT
     * @tc.desc      : Start FA ability to set the landscape and portrait status of ability to PORTRAIT
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0900", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_0900';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_0900]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
          parameters: {
            number: 2
          }
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_1000
     * @tc.name      : Set the landscape and portrait status of ability to UNSPECIFIED
     * @tc.desc      : Start FA ability to set the landscape and portrait status of ability to UNSPECIFIED
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_1000", 3, async function (done) {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_FA_DisplayOrientation_1000';
      try {
        await sleep(1000);
        let commonEventSubscribeInfo = {
          events: [Event_FA_DisplayOrientation_1000]
        }
        await commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          commonEvent.subscribe(subscriber, (err, commonEventData) => {
            console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe sunccess : ${JSON.stringify(commonEventData)},err: ${JSON.stringify(err)}`);
            let result = commonEventData.parameters.data;
            expect(result).assertTrue()
            commonEvent.unsubscribe(subscriber, (err, data) => {
              done();
            });
          })
        })
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let want: Want = {
          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.SecondAbility'
        }
        abilityDelegator.startAbility(want, (err, data) => {
          hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability error: ${JSON.stringify(err)}`);
        })
      } catch (error) {
        hilog.info(domain, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

  })
}