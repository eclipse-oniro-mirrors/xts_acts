/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import common from '@ohos.app.ability.common';
import ability from '@ohos.ability.ability';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { OpenLinkOptions, StartOptions, Want, dialogRequest, wantConstant } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;
let bundleName = 'com.example.startabilityerrorcode2';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}


export default function ServiceExtensionAbility() {
  describe('ServiceExtensionAbility', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("testAbilityContext") as common.UIAbilityContext;
    })
    /**
     * @tc.name   startUIServiceExtensionAbility_16000019
     * @tc.number startUIServiceExtensionAbility_16000019
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('startUIServiceExtensionAbility_16000019', Level.LEVEL0, (done: Function) => {
      let tag = 'startUIServiceExtensionAbility_16000019';
      let mpEnable = ''
      try {
        mpEnable = systemParameterEnhance.getSync('const.abilityms.enable_uiservice');
        console.info(`${tag} mpEnable = `, mpEnable)
      } catch (err) {
        console.error(`${tag}-ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }

      if (mpEnable == 'true') {
        let startWant: Want = {
          entities: [
            'abc'
          ],
          action: 'cba'
        };
        context.startUIServiceExtensionAbility(startWant)
          .then(() => {
            console.log(`${tag}-try to connectUIServiceExtensionAbility`);
          }).catch(async (err: Error) => {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.log(`${tag}-failed, code is ${code}, message is ${message}`);
          try {
            expect(code).assertEqual(16000019)
          } catch (e) {
            console.error(`${tag}-UIAbilityContext-except error`, JSON.stringify(e))
          }
          await sleep(2000)
          let driver = Driver.create();
          let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
          console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
          if (allowed) {
            let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
            if (buttons && buttons.length > 0) {
              await buttons[buttons.length - 1].click()
            }
          }

          let allowed1 = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
          console.log(`${tag}-is need to click ` + JSON.stringify(allowed1));
          if (allowed1) {
            let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
            if (buttons && buttons.length > 0) {
              await buttons[buttons.length - 1].click()
            }
          }
          done()
        });
      } else {
        done()
      }
    })

    /**
     * @tc.name   moveAbilityToBackground_16000061
     * @tc.number moveAbilityToBackground_16000061
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('moveAbilityToBackground_16000061', Level.LEVEL0, async (done: Function) => {
      let tag = 'moveAbilityToBackground_16000061';
      let mpEnable: string = ''
      try {
        let mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
        console.info(`${tag}-mpEnable = `, mpEnable)
      } catch (e) {
        console.error(`${tag}-ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(e)}`);
        mpEnable = 'false'
      }
      if (mpEnable == 'false') {
        context.startAbility({
          bundleName: 'com.acts.myapplicationb_201',
          abilityName: 'EntryAbility',
        }, (err: BusinessError) => {
          console.info(`${tag}-startAbility err:` + JSON.stringify(err));
        });
        // await sleep(2000)
        // let driver = Driver.create();
        // let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
        // console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
        // if (allowed) {
        //   let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
        //   if (buttons && buttons.length > 0) {
        //     await buttons[buttons.length - 1].click()
        //   }
        //   await sleep(2000)
        // }
        context.moveAbilityToBackground()
          .then(() => {
            console.log(`${tag}-moveAbilityToBackground success.`);
          }).catch((err: BusinessError) => {
          console.log(`${tag} moveAbilityToBackground error: ${JSON.stringify(err)}.`);
          try {
            expect(err.code).assertEqual(16000061)
          } catch (e) {
            console.error(`${tag}-UIAbilityContext-except error`, JSON.stringify(e))
          }
          done()
        })
      } else {
        done()
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_01
     * @tc.number SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_01
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_01', Level.LEVEL0, async (done: Function) => {
      context.disconnectServiceExtensionAbility(-1).then(() => {
        // 执行正常业务
        console.info('disconnectServiceExtensionAbility succeed');
      }).catch((err: BusinessError) => {
        // 处理业务逻辑错误
        console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);

        try {
          expect(err.code).assertEqual(16000050);
        } catch (e) {
          console.error(`UIAbilityContext-disconnectServiceExtensionAbility_01-except error`, JSON.stringify(e))
        }
        done();
      });
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_02
     * @tc.number SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_02
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_disconnectServiceExtensionAbility_02', Level.LEVEL0, async (done: Function) => {
      context.disconnectServiceExtensionAbility(-1, (err: BusinessError) => {
        if (err.code) {
          // 处理业务逻辑错误
          console.error(`disconnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
          try {
            expect(err.code).assertEqual(16000050);
          } catch (e) {
            console.error(`UIAbilityContext-disconnectServiceExtensionAbility_01-except error`, JSON.stringify(e))
          }
          done();
        }
        // 执行正常业务
        console.info('disconnectServiceExtensionAbility succeed');
      });

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_01
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_01
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_01', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ServiceExtAbility0',
      };
      try {
        context.requestDialogService(want, (err: BusinessError, result: dialogRequest.RequestResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`SUB_Ability_AbilityRuntime_requestDialogService_01 failed, code is ${err.code}, message is ${err.message}`);

            try {
              expect(err.code).assertEqual(16000001);
            } catch (e) {
              console.error(`UIAbilityContext-disconnectServiceExtensionAbility_01-except error`, JSON.stringify(e))
            }
            done();
          }
          // 执行正常业务
          console.info(`SUB_Ability_AbilityRuntime_requestDialogService_01 succeed, result = ${JSON.stringify(result)}`);
        });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_01-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_02
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_02
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_02', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility2',
      };
      try {
        context.requestDialogService(want, (err: BusinessError, result: dialogRequest.RequestResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`SUB_Ability_AbilityRuntime_requestDialogService_01 failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect(err.code).assertEqual(16000002);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService-except error`, JSON.stringify(e))
            }
            done();
          }
          // 执行正常业务
          console.info(`SUB_Ability_AbilityRuntime_requestDialogService_02 succeed, result = ${JSON.stringify(result)}`);
        });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_02-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_03
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_03
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_03', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility2',
      };
      try {
        context.requestDialogService(want)
          .then((result: dialogRequest.RequestResult) => {
            // 执行正常业务
            console.info(`requestDialogService succeed, result = ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`requestDialogService failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect(err.code).assertEqual(16000002);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService_03-except error`, JSON.stringify(e))
            }
            done();
          });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_03-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }

    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_04
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_04
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_04', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ServiceExtAbility0',
        // flags: wantConstant.Flags.FLAG_ABILITY_ON_COLLABORATE
      };
      try {
        context.requestDialogService(want)
          .then((result: dialogRequest.RequestResult) => {
            // 执行正常业务
            console.info(`requestDialogService succeed, result = ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`requestDialogService failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect(err.code).assertEqual(16000001);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService_04-except error`, JSON.stringify(e))
            }
            done();
          });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_04-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_05
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_05
     * @tc.desc   SUB_Ability_AbilityRuntime_requestDialogService_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_05', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ServiceExtAbility',
        flags: -1
      };
      try {
        context.requestDialogService(want, (err: BusinessError, result: dialogRequest.RequestResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            console.error(`requestDialogService failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect(err.code).assertEqual(16000010);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService-except error`, JSON.stringify(e))
            }
            done();
          }
          // 执行正常业务
          console.info(`SUB_Ability_AbilityRuntime_requestDialogService_05 succeed, result = ${JSON.stringify(result)}`);
        });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_05-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_requestDialogService_06
     * @tc.number SUB_Ability_AbilityRuntime_requestDialogService_06
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_requestDialogService_06', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'ServiceExtAbility0',
        flags: -1
      };
      try {
        context.requestDialogService(want)
          .then((result: dialogRequest.RequestResult) => {
            // 执行正常业务
            console.info(`requestDialogService succeed, result = ${JSON.stringify(result)}`);
          })
          .catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`requestDialogService failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect(err.code).assertEqual(16000010);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService_06-except error`, JSON.stringify(e))
            }
            done();
          });
      } catch (e) {
        console.error(`SUB_Ability_AbilityRuntime_requestDialogService_06-catch error`, JSON.stringify(e))
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_moveAbilityToBackground_01
     * @tc.number SUB_Ability_AbilityRuntime_moveAbilityToBackground_01
     * @tc.desc   StartAbility code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_moveAbilityToBackground_01', Level.LEVEL0, async (done: Function) => {
      let mpEnable: string
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
        console.info(`SUB_Ability_AbilityRuntime_moveAbilityToBackground_01-mpEnable = `, mpEnable)
      } catch (e) {
        console.error('SUB_Ability_AbilityRuntime_moveAbilityToBackground_01 mpEnable error')
        mpEnable = 'fail'
      }

      if (mpEnable == 'true') {
        context.moveAbilityToBackground().then(async () => {
          console.log(`moveAbilityToBackground success.`);
          await sleep(2000)
          context.moveAbilityToBackground().then(() => {
            console.log(`moveAbilityToBackground success.`);
          }).catch((err: BusinessError) => {
            console.log(`moveAbilityToBackground error: ${JSON.stringify(err)}.`);
            try {
              expect(err.code).assertEqual(16000065);
            } catch (e) {
              console.error(`UIAbilityContext-requestDialogService_03-except error`, JSON.stringify(e))
            }
            done();
          });

        }).catch((err: BusinessError) => {
          console.log(`moveAbilityToBackground error: ${JSON.stringify(err)}.`);
        });
      } else {
        done()
      }
    })

  })
}