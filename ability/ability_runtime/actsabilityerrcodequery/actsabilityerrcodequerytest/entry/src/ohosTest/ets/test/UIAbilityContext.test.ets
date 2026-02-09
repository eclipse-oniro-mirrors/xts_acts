/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { AtomicServiceOptions,
  Caller,
  common, contextConstant,
  OpenLinkOptions,
  StartOptions, startupManager,
  UIAbility, dialogRequest  } from '@kit.AbilityKit';
import { BusinessError ,systemParameterEnhance} from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { image } from '@kit.ImageKit';
import { rpc } from '@kit.IPCKit';
function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}
const DOMAIN = 0xeeee;
const TAG: string = '[openLinkDemo]';
let buffer = new ArrayBuffer(640 * 1024);

const TWO_HUNDRED_KB = 200 * 1024;
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
// 生成一个指定长度的字符串
function generateLargeString(length: number): string {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}
let TestAbilityContext:common.UIAbilityContext;
let mpEnable="";
let timeout = 3000;
let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
  abilityName: "TestAbility",
  onAbilityCreate: onAbilityCreateCallback
};
function onAbilityCreateCallback(data: UIAbility) {
  console.info(`onAbilityCreateCallback, data: ${JSON.stringify(data)}`);
}
export default function UIAbilityContext() {
  describe('UIAbilityContext', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      TestAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      } catch(err) {
        console.info(`MoveAbilityToBackground Get system parameter error: ${JSON.stringify(err)}`);
      }
      console.log(`MoveAbilityToBackground Get system parameter mpEnable is ${mpEnable}`);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -b com.acts.moveabilitytobgtest -a TestAbility");
      abilityDelegator.waitAbilityMonitor(monitor, timeout, (error: BusinessError, data: UIAbility) => {
        if (error && error.code !== 0) {
          console.info(`waitAbilityMonitor fail, error: ${JSON.stringify(error)}`);
        } else {
          console.info(`waitAbilityMonitor success, data: ${JSON.stringify(data)}`);
        }
      });
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100
     * @tc.desc   run parameter error, pass undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100', Level.LEVEL0, async (done: Function) => {
      let startParams = ['StartupTask_001'];
      try {
        startupManager.run(undefined).then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
            + JSON.stringify(startParams));
        })
      } catch (error) {
        let errMsg = JSON.stringify(error);
        let errCode: number = error.code;
        console.log('Startup catch error , errCode= ' + errCode);
        console.log('Startup catch error ,error= ' + errMsg);
        expect(error.code).assertEqual(401)
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0200
     * @tc.desc   run parameter error, pass null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0200', Level.LEVEL0, async (done: Function) => {
      try {
        startupManager.run(null).then(() => {
          console.log('StartupTest startupManager run then with null');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
        })
      } catch (error) {
        let errMsg = JSON.stringify(error);
        let errCode: number = error.code;
        console.log('Startup catch error , errCode= ' + errCode);
        console.log('Startup catch error ,error= ' + errMsg);
        expect(error.code).assertEqual(401)
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0300
     * @tc.desc   run parameter error, pass empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0300', Level.LEVEL0, async (done: Function) => {
      try {
        startupManager.run([]).then(() => {
          console.log('StartupTest startupManager run then with empty array');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
        })
      } catch (error) {
        let errMsg = JSON.stringify(error);
        let errCode: number = error.code;
        console.log('Startup catch error , errCode= ' + errCode);
        console.log('Startup catch error ,error= ' + errMsg);
        expect(error.code).assertEqual(16000050)
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100
     * @tc.desc   getStartupTaskResult parameter error, pass undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const data = startupManager.getStartupTaskResult(undefined)
      } catch (error) {
        console.log(`Error occurred while getStartupTaskResult:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0200
     * @tc.desc   getStartupTaskResult parameter error, pass null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0200', Level.LEVEL0, async (done: Function) => {
      try {
        const data = startupManager.getStartupTaskResult(null)
      } catch (error) {
        console.log(`Error occurred while getStartupTaskResult:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0300
     * @tc.desc   getStartupTaskResult parameter error, pass empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0300', Level.LEVEL0, async (done: Function) => {
      try {
        const data = startupManager.getStartupTaskResult("")
      } catch (error) {
        console.log(`Error occurred while getStartupTaskResult:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100
     * @tc.desc   isStartupTaskInitialized parameter error, pass undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.isStartupTaskInitialized(undefined)
        } catch (error) {
          console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0200
     * @tc.desc   isStartupTaskInitialized parameter error, pass null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.isStartupTaskInitialized(null)
        } catch (error) {
          console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0300
     * @tc.desc   isStartupTaskInitialized parameter error, pass empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0300', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.isStartupTaskInitialized("")
        } catch (error) {
          console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100
     * @tc.desc   removeStartupTaskResult parameter error, pass undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.removeStartupTaskResult(undefined)
        } catch (error) {
          console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0200
     * @tc.desc   removeStartupTaskResult parameter error, pass null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0200', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.removeStartupTaskResult(null)
        } catch (error) {
          console.log(`Error occurred while removeStartupTaskResult:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0300
     * @tc.desc   removeStartupTaskResult parameter error, pass empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0300', Level.LEVEL0,
      async (done: Function) => {
        try {
          const data = startupManager.removeStartupTaskResult("")
        } catch (error) {
          console.log(`Error occurred while removeStartupTaskResult:  ${JSON.stringify(error.code)}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0100
     * @tc.desc   startAbilityByType parameter error, pass undefined Async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0100', Level.LEVEL0, async (done: Function) => {
      let wantParam: Record<string, Object> = {
        'time': '2023-10-23 20:45'
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.log(`code:` + code + `name:` + name + `message:` + message);
        },
        onResult: (abilityResult: common.AbilityResult) => {
          console.log(`resultCode:` + abilityResult.resultCode + `bundleName:` + abilityResult.want?.bundleName);
        }
      };
      try {
        globalThis.context.startAbilityByType(undefined, wantParam, abilityStartCallback).then(() => {
          console.log(`startAbilityByType success`);
        }).catch((err: BusinessError) => {
          console.error(`startAbilityByType fail, err: ${JSON.stringify(err)}`);
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200
     * @tc.desc   startAbilityByType parameter error, pass undefined Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200', Level.LEVEL0, async (done: Function) => {
      let wantParam: Record<string, Object> = {
        'time': '2023-10-23 20:45'
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.log(`code:` + code + `name:` + name + `message:` + message);
        },
        onResult: (abilityResult: common.AbilityResult) => {
          console.log(`resultCode:` + abilityResult.resultCode + `bundleName:` + abilityResult.want?.bundleName);
        }
      };
      try {
        globalThis.context.startAbilityByType(undefined, wantParam, abilityStartCallback, (err: BusinessError) => {
          if (err) {
            console.error(`startAbilityByType fail, err: ${JSON.stringify(err)}`);
          } else {
            console.log(`success`);
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100
     * @tc.desc   openAtomicService parameter error, pass undefined Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100', Level.LEVEL0, async (done: Function) => {
      let appId: string = '6918661953712445909';
      let options: AtomicServiceOptions = {
        displayId: 0
      };
      try {
        globalThis.context.openAtomicService(undefined, options)
          .then((result: common.AbilityResult) => {
            console.info('openAtomicService succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`openAtomicService failed, code is ${err.code}, message is ${err.message}`);
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100
     * @tc.desc   Capability not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      globalThis.context.showAbility().then(() => {
        console.log(`showAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync" + JSON.stringify(info));
            if(info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200
     * @tc.desc   Start options check failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      globalThis.context.showAbility().then(() => {
        console.log(`showAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync" + JSON.stringify(info));
            if (info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.desc   Capability not support.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      globalThis.context.hideAbility().then(() => {
        console.log(`highAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`highAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync" + JSON.stringify(info));
            if(info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200
     * @tc.desc   Start options check failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      globalThis.context.hideAbility().then(() => {
        console.log(`highAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`highAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync" + JSON.stringify(info));
            if(info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400
     * @tc.desc   startAbility set flags=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1',
        flags: -1
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.desc   startAbilityForResult set flags=-1   Async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300', Level.LEVEL0,
      async (done: Function) => {
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility1',
          flags: -1
        };
        try {
          globalThis.context.startAbilityForResult(startWant, (err: BusinessError, result: common.AbilityResult) => {
            if (err.code) {
              console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000010)
              done();
            }
            console.info('startAbilityForResult succeed');
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0800
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0800
     * @tc.desc   startAbilityForResult set flags=-1   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0800', Level.LEVEL0,
      async (done: Function) => {
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility1',
          flags: -1
        };
        let options: StartOptions = {
          displayId: 0
        };
        try {
          globalThis.context.startAbilityForResult(startWant, options)
            .then((result: common.AbilityResult) => {
              console.info('startAbilityForResult succeed');
            })
            .catch((err: BusinessError) => {
              console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(16000010)
              done();
            });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500
     * @tc.desc   The premeters within the Want carry parameters with a size of more than 200k
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500', Level.LEVEL0, async (done: Function) => {
      // 构造一个超过 200KB 的对象
      const largeObject = generateLargeString(TWO_HUNDRED_KB + 100)
      let startWant: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
        abilityName: 'MainAbility1',
        parameters: {
          key: largeObject
        }
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000050)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0100
     * @tc.desc   The onBackground callback is called in the background   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0100', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0100`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('0100 StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("0100 StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("0100 StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        TestAbilityContext.startAbility(startWant,(err: BusinessError) => {
          if (err.code) {
            console.error(`0100 startactsmissiontest failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          }
          console.info('0100 startactsmissiontest succeed');
        });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0600
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0600
     * @tc.desc   The onBackground callback is called in the background
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0600', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0600`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        let options: StartOptions = {
          displayId: 0
        };
        TestAbilityContext.startAbility(startWant,options,(err: BusinessError) => {
          if (err.code) {
            console.error(`startactsmissiontest failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          }
          console.info('startactsmissiontest succeed');
        });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0800
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0800
     * @tc.desc   The onBackground callback is called in the background   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0800', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0800`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        let options: StartOptions = {
          displayId: 0
        };
        TestAbilityContext.startAbility(startWant, options)
          .then(() => {
            console.info('startAbility succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0100
     * @tc.desc   The onBackground callback of openLink is called in the background   Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0100', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0100`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let options: OpenLinkOptions  = {
          parameters: { demo_key: 'demo_value' }
        };
        let link: string = 'https://www.example.com';
        TestAbilityContext.openLink(
          link,
          options,
          (err, result) => {
            hilog.error(DOMAIN, TAG, `openLink callback error.code: ${JSON.stringify(err)}`);
            hilog.info(DOMAIN, TAG, `openLink callback result: ${JSON.stringify(result.resultCode)}`);
            hilog.info(DOMAIN, TAG, `openLink callback result data: ${JSON.stringify(result.want)}`);
          }
        ).then(() => {
          hilog.info(DOMAIN, TAG, `open link success.`);
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG, `open link failed, errCode ${JSON.stringify(err.code)}`);
          expect(err.code).assertEqual(201);
          done();
        });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0100
     * @tc.desc   The onBackground callback of startAbilityForResult is called in the background
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0100', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0100`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        let options: StartOptions = {
          displayId: 0
        };
        TestAbilityContext.startAbilityForResult(startWant, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          }
          console.info('startAbilityForResult succeed');
        });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0400
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0400
     * @tc.desc   The onBackground callback of startAbilityForResult(option) is called in the background
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0400', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0400`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        let options: StartOptions = {
          displayId: 0
        };
        TestAbilityContext.startAbilityForResult(startWant, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          }
          console.info('startAbilityForResult succeed');
        });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0600
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0600
     * @tc.desc   The onBackground callback of startAbilityForResult(option) is called in the background promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0600', Level.LEVEL0, async (done: Function) => {
      let tag:string = `SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0600`;
      if (mpEnable === 'true') {
        await TestAbilityContext.moveAbilityToBackground().then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
          );
        })
        await sleep(2000);
        let startWant: Want = {
          bundleName: 'com.test.actsabilityerrcodequerytest',
          abilityName: 'MainAbility2',
        };
        let options: StartOptions = {
          displayId: 0
        };
        TestAbilityContext.startAbilityForResult(startWant, options)
          .then((result: common.AbilityResult) => {
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(201);
            done();
          });
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0200
     * @tc.desc   The exported value of the target ability is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0200', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility',
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000004)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300
     * @tc.desc   Configure the Capability permission for the target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000005)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700
     * @tc.desc   Configure the Capability permission for the target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbility(startWant, options,(err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000005)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900
     * @tc.desc   Configure the Capability permission for the target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbility(startWant, options).then(() => {
          console.info('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900 startAbility succeed');
        }).catch((error: BusinessError) => {
          if (error.code) {
            console.error(`SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900 startAbility failed, code is ${error.code}, message is ${error.message}`);
            expect(error.code).assertEqual(16000005)
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0900 startAbility catch, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200
     * @tc.desc   Configure the Capability permission for the target startAbilityForResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000005);
            done();
          }
          console.info('startAbilityForResult succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500
     * @tc.desc   Configure the Capability permission for the target startAbilityForResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant, options,(err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000005);
            done();
          }
          console.info('startAbilityForResult succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0700
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResutc.numberlt_0700
     * @tc.desc   Configure the Capability permission for the target startAbilityForResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0700', Level.LEVEL0, async (done: Function) => {
      let startWant: Want = {
        bundleName: 'com.example.actsabilityerrcodequerytestrely',
        abilityName: 'EntryAbility2',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant, options)
          .then((result: common.AbilityResult) => {
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000005);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })
  })
}