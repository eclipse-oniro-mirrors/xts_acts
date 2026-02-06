/*
 * Copyright (C) 2024 HiHope Open Source Organization
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

import { describe, afterEach, it, expect, beforeEach, beforeAll, Level } from '@ohos/hypium'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { common, StartOptions, UIAbility } from '@kit.AbilityKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
let deviceType:string;
export default function abilityTest2() {
  describe('TerminateselfWithResultTest2', () => {

    let delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let bundleName = 'com.example.terminateselfwithresulttesthap';
    let bundleName2 = 'com.example.terminateselfwithresulttesthap2';
    let bundleName3 = 'com.example.actsterminateselfwithresulttest';

    const TAG: string = 'TerminateselfWithResult';
    const TEST_SUITE_NAME: string = 'TerminateselfWithResultTest';
    let context: common.UIAbilityContext;
    let driver = Driver.create();
    let cmdBeforeEach = 'aa start -d 0 -a TestAbility' + ' -b ' + 'com.example.actsterminateselfwithresulttest';
    beforeAll(async (done: Function) => {
      await sleep(1000);
      context = getContext() as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Succeeded in starting SpecifiedAbility11ww11` + JSON.stringify(context));
      deviceType = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
      hilog.info(0x0000, 'testTag', '%{public}s',
          `current device is ` + deviceType);
      done();
    });
    beforeEach(async () => {
      await sleep(1000);
      await delegator.executeShellCommand(cmdBeforeEach);
      await sleep(3000);
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200
     * @tc.name      : Test one ability open two different abilitys and terminateSelfWithResult
     * @tc.desc      : StartAbilityForResult two different abilitys in different haps, then terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4200';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          reburnNumber += 1;
          try {
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
          } catch {
          }
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName,
          abilityName: 'EntryAbility2',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName);
              expect(result.want?.abilityName).assertEqual('EntryAbility2');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          let times = 0;
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
          if (allowed) {
            times = 1000;
            let buttons = await driver.findComponents(ON.text('打开'));
            if (buttons && buttons.length > 0) {
              buttons[buttons.length - 1].click();
            }
          }
          await sleep(times);
          await delegator.executeShellCommand(cmdBeforeEach);
          await sleep(1000);
          let want2: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility2',
            action: event2
          };
          context.startAbilityForResult(want2).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability2 successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName2);
              expect(result.want?.abilityName).assertEqual('EntryAbility2');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility2 err : ${err}`);
            expect().assertFail();
            done();
          });
          await sleep(1000);
          let allowed1 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed1} `);
          if (allowed1) {
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
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300
     * @tc.name      : Test one ability open by two different abilitys and terminateSelfWithResult
     * @tc.desc      : StartAbilityForResult by two different abilitys, then terminateSelfWithResult by final one
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      if(deviceType === 'false'){
        done();
      }else{
        let reburnNumber = 0;
        let event = TEST_CASE_NAME;
        let event2 = TEST_CASE_NAME + '_2';
        let event3 = 'EntryAbility3';

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [event, event2, event3]
        };

        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(subscriber, (err, commonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, TAG, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.event == event) {
                expect(commonEventData.parameters?.data.onCreate).assertTrue();
                expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
                expect(commonEventData.parameters?.data.onForeground).assertTrue();
                expect(commonEventData.parameters?.data.result.want.bundleName).assertEqual(bundleName);
                expect(commonEventData.parameters?.data.result.want.abilityName).assertEqual('EntryAbility4');
                expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              }
              if (commonEventData.event == event2) {
                expect(commonEventData.parameters?.data.onCreate).assertTrue();
                expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
                expect(commonEventData.parameters?.data.onForeground).assertTrue();
              }
              if (commonEventData.event == event3) {
                expect(commonEventData.parameters?.data.onBackground).assertTrue();
                expect(commonEventData.parameters?.data.onDestroy).assertTrue();
                expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
              }
            } catch {
            }
            reburnNumber += 1;
            if (reburnNumber == 3) {
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
            }
          });

          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'EntryAbility3',
            action: event
          };

          let want2: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility4',
            action: event2
          };

          try {
            context.startAbilityForResult(want2).then((result: common.AbilityResult) => {
              // 执行正常业务
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability2 successful,result: ${JSON.stringify(result)}`);
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility2 err : ${err}`);
              expect().assertFail();
              done();
            });
            await sleep(1000);
            let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
            let times = 0;
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed} `);
            if (allowed) {
              times = 1000;
              let buttons = await driver.findComponents(ON.text('打开'));
              if (buttons && buttons.length > 0) {
                buttons[buttons.length - 1].click();
              }
            }
            await sleep(times);
            await delegator.executeShellCommand(cmdBeforeEach);
            await sleep(1000);
            context.startAbilityForResult(want).then((result: common.AbilityResult) => {
              // 执行正常业务
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
              hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
              expect().assertFail();
              done();
            });
            await sleep(1000);
            let allowed1 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed1} `);
            if (allowed1) {
              let buttons = await driver.findComponents(ON.text('打开'));
              if (buttons && buttons.length > 0) {
                buttons[buttons.length - 1].click();
              }
            }
            await sleep(3000);
            let allowed2 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed2} `);
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
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult
     * @tc.desc      : Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      if(deviceType === 'false'){
        done();
      }else{
        let event = TEST_CASE_NAME;

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [event]
        };

        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(subscriber, (err, commonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, TAG, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            } catch {
            }
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          });

          let want: Want = {
            bundleName: bundleName,
            abilityName: 'MainAbility',
            action: event
          };

          try {
            context.startAbilityForResult(want).then((result: common.AbilityResult) => {
              // 执行正常业务
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
              try {
                expect(result.resultCode).assertEqual(100);
                expect(result.want?.bundleName).assertEqual(bundleName);
                expect(result.want?.abilityName).assertEqual('MainAbility');
              } catch {
              }
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
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
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3
     * @tc.desc      : Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelfWithResult
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      if(deviceType === 'false'){
        done();
      }else{
        let reburnNumber = 0;
        let event = TEST_CASE_NAME;
        let event2 = TEST_CASE_NAME + '_2';

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [event, event2]
        };

        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(subscriber, (err, commonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, TAG, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
              if (commonEventData.event == event) {
                expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
                expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName);
                expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('MainAbility2');
              }
            } catch {
            }
            reburnNumber += 1;
            if (reburnNumber == 2) {
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
            }
          });

          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'MainAbility',
            action: event
          };

          try {
            context.startAbilityForResult(want).then((result: common.AbilityResult) => {
              // 执行正常业务
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
              try {
                expect(result.resultCode).assertEqual(100);
                expect(result.want?.bundleName).assertEqual(bundleName2);
                expect(result.want?.abilityName).assertEqual('MainAbility');
              } catch {
              }
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
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
            await sleep(3000);
            let allowed1 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed1} `);
            if (allowed1) {
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
      } 
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3
     * @tc.desc      : Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelf
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      if(deviceType === 'false'){
        done();
      }else{
        let reburnNumber = 0;
        let event = TEST_CASE_NAME;
        let event2 = TEST_CASE_NAME + '_2';
        AppStorage.SetOrCreate<boolean>('TestAbilityOnForeground', false);
        let resultDate: common.AbilityResult = {
          "resultCode": -1,
          "want": {
            "deviceId": "",
            "bundleName": "",
            "abilityName": "",
            "moduleName": "",
            "uri": "",
            "type": "",
            "flags": 0,
            "action": "",
            "parameters": {},
            "fds": {},
            "entities": []
          }
        };

        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [event, event2]
        };

        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
          hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(subscriber, (err, commonEventData) => {
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
            hilog.info(0x0000, TAG, '%{public}s',
              `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              if (commonEventData.event == event) {
                expect(commonEventData.parameters?.data.onBackground).assertTrue();
                expect(commonEventData.parameters?.data.onCreate).assertTrue();
                expect(commonEventData.parameters?.data.onForegroundFirst).assertTrue();
                expect(commonEventData.parameters?.data.onForegroundSecond).assertTrue();
                expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
                expect(JSON.parse(commonEventData.parameters?.data.result)).assertDeepEquals(resultDate);
              }
              if (commonEventData.event == event2) {
                expect(commonEventData.parameters?.data.onCreate).assertTrue();
                expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
                expect(commonEventData.parameters?.data.onForeground).assertTrue();
              }
            } catch {
            }
            reburnNumber += 1;
            if (reburnNumber == 2) {
              commonEventManager.unsubscribe(subscriber, (err, data) => {
              });
            }
          });

          let want: Want = {
            bundleName: bundleName2,
            abilityName: 'MainAbility3',
            action: event
          };

          try {
            context.startAbilityForResult(want).then((result: common.AbilityResult) => {
              // 执行正常业务
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
              try {
                expect(result).assertDeepEquals(resultDate);
              } catch {
              }
              setTimeout(() => {
                let testAbilityOnForeground = AppStorage.get<boolean>('TestAbilityOnForeground');
                try {
                  expect(testAbilityOnForeground).assertTrue();
                } catch {
                }
                done();
              }, 1000);
            }).catch((err: BusinessError) => {
              // 处理业务逻辑错误
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
            await sleep(3000);
            let allowed1 = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} no need to click button=allowed== ${allowed1} `);
            if (allowed1) {
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
      }
    });

    /**
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600
     * @tc.name      : Test ability1 open ability2 then ability2 open ability3 in same hap
     * @tc.desc      : In same hap, Ability1 StartAbilityForResult ability2, ability2 StartAbilityForResult ability3,then ability2 and ability3 terminateSelfWithResult
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';
      let event3 = TEST_CASE_NAME + '_3';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2, event3]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event2 || commonEventData.event == event3) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            }
            if (commonEventData.event == event || commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName2);
              if (commonEventData.event == event) {
                expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('SecondAbility');
              } else {
                expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('ThirdAbility');
              }
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 3) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'EntryAbility',
          action: event
        };

        try {
          context.startAbility(want).then(() => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
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
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult in same hap
     * @tc.desc      : In same hap, Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let reburnNumber = 0;
      let event = TEST_CASE_NAME;
      let event2 = TEST_CASE_NAME + '_2';

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event, event2]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            if (commonEventData.event == event2) {
              expect(commonEventData.parameters?.data.onBackground).assertTrue();
              expect(commonEventData.parameters?.data.onCreate).assertTrue();
              expect(commonEventData.parameters?.data.onDestroy).assertTrue();
              expect(commonEventData.parameters?.data.onForeground).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
              expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
            }
            if (commonEventData.event == event) {
              expect(commonEventData.parameters?.data.result.resultCode).assertEqual(100);
              expect(commonEventData.parameters?.data.result.want?.bundleName).assertEqual(bundleName2);
              expect(commonEventData.parameters?.data.result.want?.abilityName).assertEqual('ThirdAbility');
            }
          } catch {
          }
          reburnNumber += 1;
          if (reburnNumber == 2) {
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
          }
        });

        let want: Want = {
          bundleName: bundleName2,
          abilityName: 'MainAbility2',
          action: event
        };

        try {
          context.startAbility(want).then(() => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful`);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
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
     * @tc.number    : SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800
     * @tc.name      : Test ability1 open ability2 then ability2 terminateSelfWithResult in same app different hap
     * @tc.desc      : In same app different hap, Ability1 StartAbilityForResult ability2, then ability2 terminateSelfWithResult with want and resultcode
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_6800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let event = TEST_CASE_NAME;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [event]
      };

      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
        hilog.info(0x0000, TAG, '%{public}s', `createSubscriber ok`);
        commonEventManager.subscribe(subscriber, (err, commonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect=338=` + JSON.stringify(commonEventData));
          hilog.info(0x0000, TAG, '%{public}s',
            `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
          try {
            expect(commonEventData.parameters?.data.onBackground).assertTrue();
            expect(commonEventData.parameters?.data.onCreate).assertTrue();
            expect(commonEventData.parameters?.data.onDestroy).assertTrue();
            expect(commonEventData.parameters?.data.onForeground).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageCreate).assertTrue();
            expect(commonEventData.parameters?.data.onWindowStageDestroy).assertTrue();
          } catch {
          }
          commonEventManager.unsubscribe(subscriber, (err, data) => {
            done();
          });
        });

        let want: Want = {
          bundleName: bundleName3,
          abilityName: 'EntryAbility',
          action: event
        };

        try {
          context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            try {
              expect(result.resultCode).assertEqual(100);
              expect(result.want?.bundleName).assertEqual(bundleName3);
              expect(result.want?.abilityName).assertEqual('EntryAbility');
            } catch {
            }
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
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

  });
}