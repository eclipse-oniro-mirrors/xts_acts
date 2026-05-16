/**
 ** Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import commonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';

const TAG: string = 'ActsAbilityDelegatorTest';
const TEST_SUITE_NAME: string = 'ActsAbilityDelegatorStageTest';
const CODE_ERROR = 401;
const WAIT_TIME_500:number = 500;
let deviceSupport  = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: ["AbilityDelegator_Destory"]
};
function sleep(time: number) {
  return new Promise < void> ((resolve) => setTimeout(resolve, time));
}

async function executeShellCmd(cmd: string, abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator) {
  abilityDelegator.executeShellCommand(cmd,
    (err: BusinessError, d: AbilityDelegatorRegistry.ShellCmdResult) => {
      hilog.info(0x0000, `${TAG}`, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(0x0000, `${TAG}`, 'executeShellCommand : data.stdResult : %{public}s', d.stdResult ?? '');
      hilog.info(0x0000, `${TAG}`, 'executeShellCommand : d.exitCode : %{public}s', d.exitCode ?? '');
    })
}

function isEmpty(info: string): boolean {
  return info == null || info == undefined || info.length == 0 || info == '';
}

export default function AbilityDelegatorStageTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500
     * @tc.desc   testing doAbilityBackground by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityTwo',
          moduleName: AbilityDelegatorRegistry.getArguments().parameters['-m'],
          onAbilityForeground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`);
            setTimeout(()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback time out`);
              abilityDelegator.getCurrentTopAbility(async (err, data) => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`);
                let state = abilityDelegator.getAbilityState(ability);
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state --in Foregroundcallback: ${state}`);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    })
                  ability.context.terminateSelf();
                  await sleep(500);
                  done();
                } else {
                  abilityDelegator.doAbilityBackground(ability)
                  .then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  })
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback==== time out`);
              let state = abilityDelegator.getAbilityState(ability);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> -- in background callback state: ${state}`);
              expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                })
              ability.context.terminateSelf();
              await sleep(500);
              done();
            }, WAIT_TIME_500)
          }
        }

        abilityDelegator.addAbilityMonitor(monitor)
          .then(async () => {
            await abilityDelegator.startAbility(
              {
                bundleName: AbilityDelegatorRegistry.getArguments().bundleName,
                abilityName: 'AssistantAbilityTwo',
              })
              .then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility------}`);
              })
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600
     * @tc.desc   testing doAbilityBackground by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600';
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      try {
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityTwo',
          moduleName: AbilityDelegatorRegistry.getArguments().parameters['-m'],
          onAbilityForeground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`);
            setTimeout(()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback time out`);
              abilityDelegator.getCurrentTopAbility(async (err, data) => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`);
                let state = abilityDelegator.getAbilityState(ability);
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state --in Foregroundcallback: ${state}`);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                if (deviceSupport === 'false') {
                  abilityDelegator.removeAbilityMonitor(monitor)
                    .then(() => {
                      console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
                    })
                  ability.context.terminateSelf();
                  await sleep(500);
                  done();
                } else {
                  abilityDelegator.doAbilityBackground(ability)
                  .then(() => {
                    console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`);
                  })
                }
              })
            }, WAIT_TIME_500)
          },
          onAbilityBackground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`);
            setTimeout(async ()=>{
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====time out`);
              let state = abilityDelegator.getAbilityState(ability);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> state: ${state}`);
              expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> end====`);
              abilityDelegator.removeAbilityMonitor(monitor)
                .then(() => {
                  console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`);
                })
              ability.context.terminateSelf();
              await sleep(500);
              done();
            }, WAIT_TIME_500)
          }
        }

        abilityDelegator.addAbilityMonitor(monitor)
          .then(async () => {
            await abilityDelegator.startAbility(
              {
                bundleName: AbilityDelegatorRegistry.getArguments().bundleName,
                abilityName: 'AssistantAbilityTwo',
              })
              .then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility finish====`);
              })
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800
     * @tc.desc   Delete the window stage destruction status listening (Promise) of Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800';
      try {
        let count = 0;
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityOne',
          onWindowStageDestroy: () => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageDestroy ..`);
            count++;
            if (count === 1) {
              abilityDelegator.removeAbilityMonitor(monitor).then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor promise ..`);
              });
              let subscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
                if (data.event === "AbilityDelegator_Destory") {
                  await sleep(2000);
                  expect(count).assertEqual(1);
                  done();
                }
              };
              commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscriber) => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} createSubscriber success ..`);
                commonEventManager.subscribe(subscriber, subscribeCB);
                executeShellCmd(cmd, abilityDelegator);
              });
            }
          }
        };
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.addAbilityMonitor(monitor)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} addAbilityMonitor promise ..`);
          })
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        executeShellCmd(cmd, abilityDelegator);
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300';
      try {
        let cmd = 'aa help';
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(isEmpty(data.stdResult)).assertFalse();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400';
      try {
        let cmd = 'aa help';
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode).assertEqual(0);
            expect(isEmpty(data.stdResult)).assertFalse();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500';
      try {
        let cmd = 'aa help';
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(isEmpty(data.stdResult)).assertFalse();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise)  timeout = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600';
      try {
        let cmd = 'aa help';
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode).assertEqual(0);
            expect(isEmpty(data.stdResult)).assertFalse();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700
     * @tc.desc   for executing shell command (AsyncCallback)  with un-exist shell parameter  shell命令参数：ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700';
      try {
        let cmd = 'ppwd -L';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertFalse();
          expect(isEmpty(data.stdResult)).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800
     * @tc.desc   for executing shell command (Promise)  with un-exist shell parameter ppwd -L  timeout = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800';
      try {
        let cmd = 'ppwd -L';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode === 0).assertFalse();
            expect(isEmpty(data.stdResult)).assertTrue();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900
     * @tc.desc   for executing shell command (AsyncCallback)  without timeout parameter ,aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900';
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertTrue();
          expect(data.stdResult).assertContain('aa');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000
     * @tc.desc   for executing shell command (Promise)  without timeout parameter, aa help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000';
      try {
        let cmd = 'aa help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode === 0).assertTrue();
            expect(data.stdResult).assertContain('aa');
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100
     * @tc.desc   for executing exception shell command (AsyncCallback),xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100';
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200
     * @tc.desc   for executing exception shell command (Promise) ,xx - help
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200';
      try {
        let cmd = 'xx - help';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode).assertEqual(-1);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300
     * @tc.desc   for executing shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300';
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(data.stdResult).assertContain('start ability successfully');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400
     * @tc.desc   for executing shell command (Promise) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400';
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName;
        let timeout = 3;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode).assertEqual(0);
            expect(data.stdResult).assertContain('start ability successfully');
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500
     * @tc.desc   for executing exception shell command (AsyncCallback) with timeout parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500'
      try {
        let cmd = 'xx start';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600
     * @tc.desc   for executing exception shell command (AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600';
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700
     * @tc.desc   for executing exception shell command (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700';
      try {
        let cmd = 'null';
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
            expect(data.exitCode).assertEqual(-1);
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800
     * @tc.desc   for executing  shell command (AsyncCallback) with timeout parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800';
      try {
        let cmd = 'aa help';
        let timeout: null = null;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(err).assertContain('parameters');
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err}`);
        expect(err.message).assertContain('parameters');
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700
     * @tc.desc   for testing command -b -s -w are valid but adding an invalid parameter -z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700';
      try {
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700 -s timeout 15000 -z test';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        await abilityDelegator.executeShellCommand(cmd)
          .then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            expect(data.stdResult).assertContain('error: unknown option');
            done();
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800
     * @tc.desc   for testing command -s -w are valid but -b invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800';
      try {
        let cmd = 'aa test -b invalid -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800 -s timeout 15000';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

        await abilityDelegator.executeShellCommand(cmd)
          .then(async data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            let msg: null = null;
            await abilityDelegator.print(msg)
              .then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------`);
                expect().assertFail();
                done();
              })
          }).catch((err: BusinessError) => {
            expect(!isEmpty(err.message)).assertTrue();
            done();
          })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })



    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300
     * @tc.desc   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let msg: null = null;
        try {
          await abilityDelegator.print(msg)
            .then(() => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------19300`);
              expect().assertFail();
              done();
            })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ,err: ${err}`);
          expect(err.message).assertContain('parameters');
          done();
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400
     * @tc.desc   for testing command -b -s -w are valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let result = -1;
        let msg = '!@#$%^&*()_+QWE{}|?><Fafq3146';
        await abilityDelegator.print(msg)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg}`);
            result = 0;
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    const length_1000 = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
      '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let result = -1;
        let msg = length_1000;
        await abilityDelegator.print(msg)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `);
            result = 0;
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600
     * @tc.desc   for testing command is valid and call print by promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600';
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let result = -1;
        let msg = length_1000 + '-----------///bbb';
        await abilityDelegator.print(msg)
          .then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `);
            result = 0;
            console.log(TAG, msg);
          }).catch((err: BusinessError) => {
            expect().assertFail();
            done();
          })
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700
     * @tc.desc   for testing getArguments()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700', Level.LEVEL1, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700';
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        let bundleName = 'com.ohos.abilitydelegatorstagetest';
        let testRunnerClassName = 'OpenHarmonyTestRunner';
        let entryTest = 'entry_test';
        hilog.info(0x000, `${TAG}${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'abilityDelegatorArguments is : %{public}s', `${JSON.stringify(abilityDelegatorArguments)}`);
        expect(abilityDelegatorArguments.bundleName).assertEqual(bundleName);
        expect(abilityDelegatorArguments.testRunnerClassName).assertEqual(testRunnerClassName);
        expect(abilityDelegatorArguments.parameters["-m"]).assertEqual(entryTest);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200
     * @tc.desc   for testing shell command
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200', Level.LEVEL3, (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200';
      try {
        const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200';
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200 -s timeout 15000 -w invalid';
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let result = -1;
        abilityDelegator.executeShellCommand(cmd)
          .then(async data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            let msg = '11';
            result = 0;
            abilityDelegator.print(msg)
              .then(() => {
                hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print 20200------------`);
                result = 1;
              })
          })
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300';
      try {
        let flag = true;
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.finishTest(null, 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          flag = false;
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`);
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400
     * @tc.number SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400
     * @tc.desc   for testing finishTest by AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400';
      try {
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.finishTest(undefined, 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`);
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })
  })
}