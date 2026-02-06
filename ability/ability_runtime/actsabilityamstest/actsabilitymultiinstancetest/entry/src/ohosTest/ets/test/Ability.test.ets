/**
 * Copyright (C) 2024 HiHope Open Source Organization
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, StartOptions } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from '@kit.TestKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('AbilityMultiInstanceTest', () => {

    let bundleName = 'com.example.abilitymultiinstancetesta';
    let bundleName2 = 'com.example.abilitymultiinstancetestb';
    let bundleName3 = 'com.example.abilitymultiinstancetestc';
    let bundleName4 = 'com.example.abilitymultiinstancetestd';
    let cmdBeforeEach = 'aa start -d 0 -a TestAbility' + ' -b ' + 'com.example.abilitymultiinstance';
    let cmdBeforeEach2 = 'aa force-stop com.example.abilitymultiinstancetesta';
    let cmdBeforeEach3 = 'aa force-stop com.example.abilitymultiinstancetestb';
    let cmdBeforeEach4 = 'aa force-stop com.example.abilitymultiinstancetestc';
    let cmdBeforeEach5 = 'aa force-stop com.example.abilitymultiinstancetestd';
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const TAG: string = 'AbilityMultiInstance';
    const TEST_SUITE_NAME: string = 'AbilityMultiInstanceTest';
    let context: common.UIAbilityContext;
    let driver = Driver.create();

    beforeAll(async (done: Function) => {
      await sleep(1000);
      context = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
      done();
    });
    beforeEach(async () => {
      await sleep(2000);
      await delegator.executeShellCommand(cmdBeforeEach2);
      await delegator.executeShellCommand(cmdBeforeEach3);
      await delegator.executeShellCommand(cmdBeforeEach4);
      await delegator.executeShellCommand(cmdBeforeEach5);
      await sleep(2000);
      await delegator.executeShellCommand(cmdBeforeEach);
      await sleep(2000);
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1000
     * @tc.name      : Launch multiple applications with specific type ability for different instances
     * @tc.desc      : Launch multiple applications with specific type ability for different instances
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';
      let event4 = TEST_CASE_NAME + '_4';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3, event4]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(0);
            }
            if (commonEventData.event == event3) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(0);
            }
            if (commonEventData.event == event4) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
          } catch {
          }
          if (reburnNumber == 4) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility',
            action: event2,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want2: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want3: Want = {
            bundleName: bundleName3,
            abilityName: 'EntryAbility',
            action: event3,
            parameters: {
              instanceKey: '3'
            }
          }
          await context.startAbility(want3).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed3 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed3) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want4: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event4,
            parameters: {
              instanceKey: '4'
            }
          }
          await context.startAbility(want4).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed4 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed4) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0800
     * @tc.name      : When there are multiple abilities within a mission, different instances of non stack top specific abilities can be initiated across different missions
     * @tc.desc      : When there are multiple abilities within a mission, different instances of non stack top specific abilities can be initiated across different missions
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
          } catch {
          }
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {

          let want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want2: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility',
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want3: Want = {
            bundleName: bundleName3,
            abilityName: 'EntryAbility',
            parameters: {
              instanceKey: '3'
            }
          }
          await context.startAbility(want3).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed3 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed3) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);

          let want4: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event2,
            parameters: {
              instanceKey: '4'
            }
          }
          await context.startAbility(want4).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed4 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed4) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1700
     * @tc.name      : Verify that when launching the specified type Ability, the onAcceptWant key value of AbilityStage is set to undefined
     * @tc.desc      : Verify that when launching the specified type Ability, the onAcceptWant key value of AbilityStage is set to undefined
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
            expect(commonEventData.parameters?.data?.onCreate).assertTrue();
            expect(commonEventData.parameters?.data?.onForeground).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });

        try {
          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility2',
            action: event,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1300
     * @tc.name      : Verify that non specific type Ability is launched, and the onAcceptWant of AbilityStage does not callback
     * @tc.desc      : Verify that non specific type Ability is launched, and the onAcceptWant of AbilityStage does not callback
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(0);
            expect(commonEventData.parameters?.data?.onCreate).assertTrue();
            expect(commonEventData.parameters?.data?.onForeground).assertTrue();
          } catch {
          }
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want2: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0200
     * @tc.name      : Initiate a new specific type of ability in the same mission
     * @tc.desc      : Initiate a new specific type of ability in the same mission
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(0);
            }
            if (commonEventData.event == event3) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
          } catch {
          }
          if (reburnNumber == 3) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want2: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility',
            action: event2,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want3: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility3',
            action: event3,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want3).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed3 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed3) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1200
     * @tc.name      : Launching specific types of ability instances in multiple ability scenarios of the same application
     * @tc.desc      : Launching specific types of ability instances in multiple ability scenarios of the same application
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_1200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';
      let event4 = TEST_CASE_NAME + '_4';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3, event4]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
            }
            if (commonEventData.event == event3) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
            }
            if (commonEventData.event == event4) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
          } catch {
          }
          if (reburnNumber == 4) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName4,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want2: Want = {
            bundleName: bundleName4,
            abilityName: 'SecondAbility',
            action: event2,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want3: Want = {
            bundleName: bundleName4,
            abilityName: 'ThirdAbility',
            action: event3,
            parameters: {
              instanceKey: '3'
            }
          }
          await context.startAbility(want3).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed3 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed3) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want4: Want = {
            bundleName: bundleName4,
            abilityName: 'EntryAbility2',
            action: event4,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want4).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed4 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed4) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0600
     * @tc.name      : Continuously starting different instances of specified type ability
     * @tc.desc      : Continuously starting different instances of specified type ability
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            expect(commonEventData.parameters?.data?.onCreate).assertTrue();
            expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
            }
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
            }
          } catch {
          }
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want2: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility3',
            action: event2,
            parameters: {
              instanceKey: '2'
            }
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0400
     * @tc.name      : Launch specific UIAbilities for different applications
     * @tc.desc      : Launch specific UIAbilities for different applications
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0400', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_LaunchType_AbilityMultiInstance_0400';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';
      let reburnNumber = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(1);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
            if (commonEventData.event == event3) {
              expect(commonEventData.parameters?.data?.onAcceptWant).assertEqual(2);
              expect(commonEventData.parameters?.data?.onCreate).assertTrue();
              expect(commonEventData.parameters?.data?.onForeground).assertTrue();
            }
          } catch {
          }
          if (reburnNumber == 3) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        try {
          let want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility',
            action: event,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want2: Want = {
            bundleName: bundleName3,
            abilityName: 'EntryAbility',
            action: event2
          }
          await context.startAbility(want2).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed2) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(300);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(300);
          let want3: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility3',
            action: event3,
            parameters: {
              instanceKey: '1'
            }
          }
          await context.startAbility(want3).then(async () => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed3 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed3) {
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      });
    });

  });
}
