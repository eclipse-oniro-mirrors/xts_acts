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
import { describe, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG: string = 'ActsAbilityDelegatorTest';
const TEST_SUITE_NAME: string = 'ActsAbilityDelegatorStageTest';
const CODE_ERROR = 401;

export default function AbilityDelegatorStageTest() {

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  async function executeShellCmd(cmd: string, abilityDelegator) {
    await abilityDelegator.executeShellCommand(cmd,
      (err: any, d: any) => {
        hilog.info(0x0000, `${TAG}`, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
        hilog.info(0x0000, `${TAG}`, 'executeShellCommand : data.stdResult : %{public}s', d.stdResult ?? '');
        hilog.info(0x0000, `${TAG}`, 'executeShellCommand : d.exitCode : %{public}s', d.exitCode ?? '');
      })
  }

  function isEmpty(info: string): boolean {
    return info == null || info == undefined || info.length == 0 || info == ''
  }

  describe('ActsAbilityTest', function () {

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500
     * @tc.name      : Call the doAbilityBackground API to schedule ability from  foreground to background by promise
     * @tc.desc      : testing doAbilityBackground by promise
     * @tc.size      : MediumTest
     * @tc.level     : Level 3
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500', 3, done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_23500'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityTwo',
          moduleName: AbilityDelegatorRegistry.getArguments().parameters['-m'],
          onAbilityForeground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`)
            abilityDelegator.getCurrentTopAbility((err, data) => {
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> getCurrentTopAbility_0200 err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`)

              let state = abilityDelegator.getAbilityState(ability);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 state --in Foregroundcallback: ${state}`)
              expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);

              abilityDelegator.doAbilityBackground(ability).then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`)
              })
            })

          },
          onAbilityBackground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`)
            let state = abilityDelegator.getAbilityState(ability);
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 -- in background callback state: ${state}`)
            expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 end====`)
            removeAbilityMonitor()
            done()
          }
        }

        abilityDelegator.addAbilityMonitor(monitor).then(async () => {
          await abilityDelegator.startAbility(
            {
              bundleName: AbilityDelegatorRegistry.getArguments().bundleName,
              abilityName: 'AssistantAbilityTwo',
            }).then(() => {
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility------}`)
            })

        })

        function removeAbilityMonitor() {
          abilityDelegator.removeAbilityMonitor(monitor).then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
          })
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600
     * @tc.name      : Call the doAbilityBackground API to schedule ability from  foreground to background by AsyncCallback
     * @tc.desc      : testing doAbilityBackground by AsyncCallback
     * @tc.size      : MediumTest
     * @tc.level     : Level 3
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600', 3, async done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_23600'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityTwo',
          moduleName: AbilityDelegatorRegistry.getArguments().parameters['-m'],
          onAbilityForeground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ---onAbilityForegroundCallback`)
            abilityDelegator.getCurrentTopAbility((err, data) => {
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> getCurrentTopAbility_0200 err: ${JSON.stringify(err)} data:  ${JSON.stringify(data)}`)

              let state = abilityDelegator.getAbilityState(ability);
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 state --in Foregroundcallback: ${state}`)
              expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);

              abilityDelegator.doAbilityBackground(ability).then(() => {
                console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ====> doAbilityBackground data: -----in Foregroundcallback`)
              })
            })
          },
          onAbilityBackground: (ability) => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>onAbilityBackgroundCallback====`)
            let state = abilityDelegator.getAbilityState(ability);
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 state: ${state}`)
            expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>ACTS_GetAbilityState_0200 end====`)
            removeAbilityMonitor()
            done()
          }
        }

        abilityDelegator.addAbilityMonitor(monitor).then(async () => {
          await abilityDelegator.startAbility(
            {
              bundleName: AbilityDelegatorRegistry.getArguments().bundleName,
              abilityName: 'AssistantAbilityTwo',
            }).then(() => {
              console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>startAbility finish====`)
            })
        })
        function removeAbilityMonitor() {
          abilityDelegator.removeAbilityMonitor(monitor).then(() => {
            console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>removeAbilityMonitor====`)
          })
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800
     * @tc.name      : Deleting the listen to  State of the Ability's Window Stage by promise
     * @tc.desc      : Delete the window stage destruction status listening (Promise) of Ability
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800', 3, async function (done) {

      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_14800';
      try {
        let count = 0
        function onWindowStageDestroy() {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onWindowStageDestroy ..`);
          count++
        }
        let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
          abilityName: 'AssistantAbilityOne',
          onWindowStageDestroy: onWindowStageDestroy
        };
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.addAbilityMonitor(monitor).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} addAbilityMonitor promise ..`);
        });

        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName
        executeShellCmd(cmd, abilityDelegator)
        await sleep(2000)
        abilityDelegator.removeAbilityMonitor(monitor).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} removeAbilityMonitor promise ..`)
        });
        executeShellCmd(cmd, abilityDelegator)
        await sleep(1000)
        expect(count).assertEqual(1)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300
     * @tc.name      : Invalid timeout parameter for shell command execution (AsyncCallback)
     * @tc.desc      : Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = -1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16300';
      try {
        var cmd = 'aa help'
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(isEmpty(data.stdResult)).assertFalse()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400
     * @tc.name      : Invalid timeout parameter for shell command execution (Promise)
     * @tc.desc      : Invalid timeout parameter for executing shell command (Promise)  timeout = -1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16400';
      try {
        var cmd = 'aa help'
        let timeout = -1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

        await abilityDelegator.executeShellCommand(cmd, timeout).then(data => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0)
          expect(isEmpty(data.stdResult)).assertFalse()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500
     * @tc.name      : Shell Command Timeout (AsyncCallback)
     * @tc.desc      : Invalid timeout parameter for executing shell command (AsyncCallback)  timeout = 0
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16500';
      try {
        var cmd = 'aa help'
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(isEmpty(data.stdResult)).assertFalse()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600
     * @tc.name      : Shell command execution timeout (Promise)
     * @tc.desc      : Invalid timeout parameter for executing shell command (Promise)  timeout = 0
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16600';
      try {
        var cmd = 'aa help'
        let timeout = 0;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        await abilityDelegator.executeShellCommand(cmd, timeout).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0);
          expect(isEmpty(data.stdResult)).assertFalse()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700
     * @tc.name      : Execute a non-existent shell command (AsyncCallback)
     * @tc.desc      : for executing shell command (AsyncCallback)  with un-exist shell parameter  shell命令参数：ppwd -L  timeout = 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16700';
      try {
        var cmd = 'ppwd -L'
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertFalse()
          expect(isEmpty(data.stdResult)).assertTrue()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800
     * @tc.name      : Execute a non-existent shell command (Promise)
     * @tc.desc      : for executing shell command (Promise)  with un-exist shell parameter ppwd -L  timeout = 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16800';
      try {
        var cmd = 'ppwd -L'
        let timeout = 1;
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        await abilityDelegator.executeShellCommand(cmd, timeout).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertFalse()
          expect(isEmpty(data.stdResult)).assertTrue()
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900
     * @tc.name      : Execute a shell command without a timeout parameter (AsyncCallback)
     * @tc.desc      : for executing shell command (AsyncCallback)  without timeout parameter ,aa help
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_16900';
      try {
        var cmd = 'aa help'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertTrue()
          expect(data.stdResult).assertContain('aa')
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000
     * @tc.name      : Execute a Shell Command (Promise) with No Timeout Parameter
     * @tc.desc      : for executing shell command (Promise)  without timeout parameter, aa help
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17000';
      try {
        let cmd = 'aa help'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        await abilityDelegator.executeShellCommand(cmd).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`);
          expect(data.exitCode === 0).assertTrue()
          expect(data.stdResult).assertContain('aa')
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100
     * @tc.name      : Execute an Abnormal Shell Command (AsyncCallback) with No Timeout Parameter
     * @tc.desc      : for executing exception shell command (AsyncCallback),xx - help
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17100';
      try {
        var cmd = 'xx - help'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200
     * @tc.name      : Execute Unexpected Shell Commands (Promises) with No Timeout Parameters
     * @tc.desc      : for executing exception shell command (Promise) ,xx - help
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200', 3, async function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17200';
      try {
        let cmd = 'xx - help'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        await abilityDelegator.executeShellCommand(cmd).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`)
          expect(data.exitCode).assertEqual(-1)
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300
     * @tc.name      : Execute a shell command with a timeout parameter (AsyncCallback)
     * @tc.desc      : for executing shell command (AsyncCallback) with timeout parameter
     *                 shell command：aa start [-d <device>] -a <ability-name> -b <bundle-name> timeout 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17300'
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName
        let timeout = 1
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(0)
          expect(data.stdResult).assertContain('start ability successfully')
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400
     * @tc.name      : Execute a shell command with a timeout parameter (Promise)
     * @tc.desc      : for executing shell command (Promise) with timeout parameter
     *                 shell command ：aa start [-d <device>] -a <ability-name> -b <bundle-name> timeout 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17400'
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        let cmd = 'aa start -d 0 -a AssistantAbilityOne' + ' -b ' + abilityDelegatorArguments.bundleName
        let timeout = 1
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`)
          expect(data.exitCode).assertEqual(0)
          expect(data.stdResult).assertContain('start ability successfully')
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500
     * @tc.name      : Execute an Abnormal Shell Command (AsyncCallback) with a Timeout Parameter
     * @tc.desc      : for executing exception shell command (AsyncCallback) with timeout parameter
     *                 shell command：xx start  timeout 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17500'
      try {
        let cmd = 'xx start'
        let timeout = 1
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600
     * @tc.name      : The shell command parameter is null(AsyncCallback)
     * @tc.desc      : for executing exception shell command (AsyncCallback)
     *                 shell parameter：null  timeout = 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17600'
      try {
        let cmd = 'null'
        let timeout = 1
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(data.exitCode).assertEqual(-1)
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700
     * @tc.name      : The shell command parameter is null(Promise)
     * @tc.desc      : for executing exception shell command (Promise)
     *                 shell command：null timeout = 1
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17700'
      try {
        let cmd = 'null'
        let timeout = 1
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} data ${JSON.stringify(data)}`)
          expect(data.exitCode).assertEqual(-1)
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800
     * @tc.name      : The timeout parameter is null(AsyncCallback)
     * @tc.desc      : for executing  shell command (AsyncCallback) with timeout parameter is null
     *                 shell command：aa help
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800', 3, function (done) {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_17800'
      try {
        let cmd = 'aa help'
        let timeout = null
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand(cmd, timeout, (err, data) => {

          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err} , data= ${JSON.stringify(data)}`);
          expect(err).assertContain('Incorrect parameters')
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : end`);
          done()
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err = ${err}`)
        expect(err.message).assertContain('Incorrect parameters.')
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700
     * @tc.name      : The -b, -s, -w and other parameters of the test command are valid, and the invalid -z parameter is added
     * @tc.desc      : for testing command -b -s -w are valid but adding an invalid parameter -z
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700'
      try {
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18700 -s timeout 15000 -z test'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

        await abilityDelegator.executeShellCommand(cmd).then(data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
          expect(data.stdResult).assertContain('error: unknown option')
          done()
        }).catch(err => {
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800
     * @tc.name      : The -b argument of the test command is invalid, and the other parameters such as -s and -w are valid
     * @tc.desc      : for testing command -s -w are valid but -b invalid
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800'
      try {
        let cmd = 'aa test -b invalid -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_18800 -s timeout 15000'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

        await abilityDelegator.executeShellCommand(cmd).then(async data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
          let msg = null
          await abilityDelegator.print(msg).then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------`);
            expect().assertFail()
            done()
          })
        }).catch(err => {
          expect(!isEmpty(err)).assertTrue()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300
     * @tc.name      : The parameters of the test command, such as -b, -p, -s, and -w, are valid, and the print API is called in Promise mode,
     *                 and the print information is null
     * @tc.desc      : for testing command -b -s -w are valid  print msg is null
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */

    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19300'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let msg = null
        try {
          await abilityDelegator.print(msg).then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print ------------19300`)
            expect().assertFail()
            done()
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} ,err: ${err}`)
          expect(err.message).assertContain('Incorrect parameters.')
          done()
        }
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400
     * @tc.name      : The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is called in Promise mode,
     *                 and the print information contains Chinese, special characters, etc.
     * @tc.desc      : for testing command -b -s -w are valid and call print by promise
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19400'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let result = -1
        let msg = '!@#$%^&*()_+QWE{}|?><Fafq3146'
        await abilityDelegator.print(msg).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg}`)
          result = 0
        }).catch(err => {
          expect().assertFail()
          done()
        })
        expect(result).assertEqual(0)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
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
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500
     * @tc.name      : The -b, -p, -s, -w and other parameters of the test command are valid, and the print API is called in Promise mode,
     *                 and the print message is 1000 characters in length
     * @tc.desc      : for testing command is valid and call print by promise
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19500'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let result = -1
        let msg = length_1000
        await abilityDelegator.print(msg).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `)
          result = 0
        }).catch(err => {
          expect().assertFail()
          done()
        })
        expect(result).assertEqual(0)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600
     * @tc.name      : The parameters of the test command, such as -b, -p, -s, and -w, are valid, and the print API is called in Promise mode,
     *                 and the length of the print message is greater than 1000 characters
     * @tc.desc      : for testing command is valid and call print by promise
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600', 3, async (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19600'
      try {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let result = -1
        let msg = length_1000 + '-----------///bbb'
        await abilityDelegator.print(msg).then(() => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , msg = ${msg} `)
          result = 0
          console.log(TAG, msg)
        }).catch(err => {
          expect().assertFail()
          done()
        })
        expect(result).assertEqual(0)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700
     * @tc.name      : The -b, -s unittest, -p, -D, -s class, -s level, -s size, -s testType, -s timeout, -s, -w
     *                 and other parameters of the test command <any-key> <any-value>are valid (-s class specifies the correct test set and test case)
     * @tc.desc      : for testing getArguments()
     * @tc.level     : Level 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700', 1, (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_19700'
      try {
        let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        let bundleName = 'com.ohos.abilitydelegatorstagetest'
        let testRunnerClassName = 'OpenHarmonyTestRunner'
        let entryTest = 'entry_test'
        hilog.info(0x000, `${TAG}${TEST_SUITE_NAME}#${TEST_CASE_NAME}`, 'abilityDelegatorArguments is : %{public}s', `${JSON.stringify(abilityDelegatorArguments)}`)
        expect(abilityDelegatorArguments.bundleName).assertEqual(bundleName)
        expect(abilityDelegatorArguments.testRunnerClassName).assertEqual(testRunnerClassName)
        expect(abilityDelegatorArguments.parameters["-m"]).assertEqual(entryTest)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20100
     * @tc.name      : The -s parameter of the test command is invalid, and the other parameters such as -b and -w are valid
     * @tc.desc      : for testing shell command
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */

    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20100', 3, (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20100'
      try {
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_20100 -s timeout invalid'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let result = -1
        try {
          abilityDelegator.executeShellCommand(cmd).then(data => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
            let msg = '11'
            result = 0
            abilityDelegator.print(msg).then(() => {
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print 20100------------`);
              result = 1
            })
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , err: ${err}`);
        }
        expect(result).assertEqual(-1)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200
     * @tc.name      : The -w parameter of the test command is invalid, and the other parameters such as -b and -s are valid
     * @tc.desc      : for testing shell command
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200', 3, (done) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200'
      try {
        const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200'
        let cmd = 'aa test -b com.ohos.abilitydelegatorstagetest -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner ' +
          '-s class ActsAbilityTest#SUB_Ability_AbilityTools_AbilityDelegator_Stage_20200 -s timeout 15000 -w invalid'
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} executeShellCommand : ${cmd}`)
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let result = -1
        abilityDelegator.executeShellCommand(cmd).then(async data => {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , data= ${JSON.stringify(data)}`);
          let msg = '11'
          result = 0
          abilityDelegator.print(msg).then(() => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} , print 20200------------`);
            result = 1
          })
        })
        expect(result).assertEqual(-1)
        done()
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in AsyncCallback mode,
     *                 and the msg parameter is invalid (null) and the code parameter is valid (1)
     * @tc.desc      : for testing finishTest by AsyncCallback
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300', 3, async done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20300'
      try {
        let flag = true
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.finishTest(null, 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `)
          flag = false
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`)
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400
     * @tc.name      : The parameters of the test command are valid, call the finishTest API in AsyncCallback mode,
     *                 and the msg parameter is invalid (Undefined) and the code parameter is valid (1)
     * @tc.desc      : for testing finishTest by AsyncCallback
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400', 3, async done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20400'
      try {
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.finishTest(undefined, 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `)
          expect().assertFail()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err.code}`)
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })

    /**
     * @tc.number    : SUB_Ability_AbilityTools_AbilityDelegator_Stage_20500
     * @tc.name      : The parameters of the test command are valid, call the finishTest interface in AsyncCallback mode,
     *                 the msg parameter is valid (including Chinese and special characters) and the code parameter is invalid (Number.MAX_VALUE+1)
     * @tc.desc      : for testing finishTest by AsyncCallback
     * @tc.level     : Level 3
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityTools_AbilityDelegator_Stage_20500', 3, done => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityTools_AbilityDelegator_Stage_20500'
      try {
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
        abilityDelegator.finishTest(msg, Number.MAX_VALUE + 1, (err, data) => {
          console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --test  end ========> callback `)
          expect(true).assertTrue()
          done()
        })
      } catch (err) {
        console.log(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} --err: ${err}`)
        expect(err.code).assertEqual(CODE_ERROR);
        done();
      }
    })
  })
}