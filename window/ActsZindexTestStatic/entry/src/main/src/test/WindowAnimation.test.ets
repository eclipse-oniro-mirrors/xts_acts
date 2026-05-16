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
import { describe, it, expect, TestType, Size, Level, beforeAll,beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import display from '@ohos.display';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        let want: Want = {
            bundleName: "com.example.actswindowtest.static",
            abilityName: 'StartAbility'
        };
        if (options) {
            context.startAbility(want, options).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        } else {
            context.startAbility(want).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        }
        Utils.msSleep(1000).awaitSync()
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        resolve(windowStageStart);
    })
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            console.log(`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            console.log(`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowAnimationTest() {

    describe("WindowAnimationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowZindexTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let tempWnd: window.Window | undefined;
        let subWin: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let windowclassArr:Array<window.Window>;
        let windowClass: window.Window | undefined;
        let isFreeWindowMode:boolean = false;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
                isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                windowClass = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage!.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            try{
                windowclassArr = await windowStage!.getSubWindow();
                hilog.info(domain, tag,`brforeAll getSubWindow success. Cause: ${JSON.stringify(windowclassArr)}`);
                if(windowclassArr.length!=0){
                    for(let i = 0;i<windowclassArr.length;i++){
                        await windowclassArr[i].destroyWindow();
                        hilog.info(domain, tag,`brforeAll destroyWindow windowclassArr ${i} success`);
                    }
                }
            }catch (err) {
                hilog.error(domain, tag,`brforeAll destroyWindow failed`+ err);
            }
        })
        
        /**
     * @tc.name   testGetWindowTransitionAnimationNotSet
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0090
     * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowTransitionAnimationNotSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowTransitionAnimationNotSet';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        try {
          let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
          console.error(msgStr + `success obtain the window transition animation.`);
          expect(transitionAnimationResult).assertEqual(undefined);
          done();
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationNormal
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0010
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testSetWindowTransitionAnimationNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationNormal';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
              done();
            }
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
            done();
          }
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationNormal2
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0120
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testSetWindowTransitionAnimationNormal2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationNormal2';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.INTERPOLATION_SPRING,
          param: [100, 10, 20, 5]
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
              done();
            }
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
            done();
          }
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationCurveSpring
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0130
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationCurveSpring', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationCurveSpring';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 4000,
          curve: window.WindowAnimationCurve.INTERPOLATION_SPRING,
          param: [100, 10, 20, 5]
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            try {
              let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
              console.error(msgStr + `success obtain the window transition animation.`+JSON.stringify(transitionAnimationResult));
              expect(!!transitionAnimationResult).assertTrue();
              expect(transitionAnimationResult!.opacity).assertLargerOrEqual(0);
              expect(transitionAnimationResult!.config.curve).assertEqual(window.WindowAnimationCurve.INTERPOLATION_SPRING);
              expect(transitionAnimationResult!.config.param!=null).assertTrue();
              done();
            } catch (err) {
              if (isFreeWindowMode) {
                console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              done();
            }
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationCurveBezier
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0140
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationCurveBezier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationCurveBezier';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.CUBIC_BEZIER,
          param: [100, 10, 20, 5]
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            try {
              let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
              console.error(msgStr + `success obtain the window transition animation.`+JSON.stringify(transitionAnimationResult));
              expect(!!transitionAnimationResult).assertTrue();
              expect(transitionAnimationResult!.opacity).assertLargerOrEqual(0);
              expect(transitionAnimationResult!.config.curve).assertEqual(window.WindowAnimationCurve.CUBIC_BEZIER);
              expect(transitionAnimationResult!.config.param!=null).assertTrue();
              expect(transitionAnimationResult!.config.duration).assertLargerOrEqual(0);
              done();
            } catch (err) {
              if (isFreeWindowMode) {
                console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              done();
            }
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationCurveBezierAbnormal
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0170
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationCurveBezierAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationCurveBezierAbnormal';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 4000,
          curve: window.WindowAnimationCurve.CUBIC_BEZIER,
          param: [100, 10, 20, 5]
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300016);
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationWindowStateAbnormal
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0020
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationWindowStateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationWindowStateAbnormal';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        subWin = await windowStage!.createSubWindow('testsetWindowTransitionAnimationWindowStateAbnormal')
        expect(!!subWin).assertTrue();
        console.info(msgStr + 'Succeeded createSubWindow.');
        await (subWin as window.Window).destroyWindow();
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          (subWin as window.Window).setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            expect().assertFail();
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300002);
            } else {
              console.log(msgStr + ' innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err));
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (err.code != 801) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err));
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationSubWindow
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0030
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationSubWindow';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        subWin = await windowStage!.createSubWindow('testsetWindowTransitionAnimationSubWindow')
        expect(!!subWin).assertTrue();
        console.info(msgStr + 'Succeeded createSubWindow.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          (subWin as window.Window).setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            (async () => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            expect().assertFail();
            await (subWin as window.Window).destroyWindow();
            done();
            })().awaitSync()
          }).catch((err: Error) => {
            (async () => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300004);
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err));
              expect(err.code).assertEqual(801);
            }
            await (subWin as window.Window).destroyWindow();
            done();
            })().awaitSync()
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300004);
          } else {
            console.log(msgStr + 'out catch  当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err));
            expect(err.code).assertEqual(801);
          }
          await (subWin as window.Window).destroyWindow();
          done();
        }
      })
      /**
       * @tc.name   testGetWindowTransitionAnimationNormal
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0050
       * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetWindowTransitionAnimationNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowTransitionAnimationNormal';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
            try {
              let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
              console.error(msgStr + `success obtain the window transition animation.`+JSON.stringify(transitionAnimationResult));
              expect(!!transitionAnimationResult).assertTrue();
              expect(transitionAnimationResult!.opacity).assertLargerOrEqual(0);
              expect(transitionAnimationResult!.config.curve).assertEqual(window.WindowAnimationCurve.LINEAR);
              expect(transitionAnimationResult!.config.duration).assertLargerOrEqual(0);
              done();
            } catch (err) {
              if (isFreeWindowMode) {
                console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              done();
            }
          }).catch((err: Error) => {
            if (isFreeWindowMode) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + 'setWindowTransitionAnimation inner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (err.code != 801) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testGetWindowTransitionAnimationWindowStateAbnormal
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0060
       * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetWindowTransitionAnimationWindowStateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowTransitionAnimationWindowStateAbnormal';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        subWin = await windowStage!.createSubWindow('testGetWindowTransitionAnimationWindowStateAbnormal')
        expect(!!subWin).assertTrue();
        console.info(msgStr + 'Succeeded createSubWindow.');
        await (subWin as window.Window).destroyWindow();
        try {
          let transitionAnimationResult = (subWin as window.Window).getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
          console.error(msgStr + `success obtain the window transition animation.`);
          expect().assertFail();
          done();
        } catch (err) {
          if (err.code != 801) {
            console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testGetWindowTransitionAnimationSubWindow
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0070
       * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetWindowTransitionAnimationSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testGetWindowTransitionAnimationSubWindow';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        subWin = await windowStage!.createSubWindow('testGetWindowTransitionAnimationSubWindow')
        expect(!!subWin).assertTrue();
        console.info(msgStr + 'Succeeded createSubWindow.');
        try {
          let transitionAnimationResult = (subWin as window.Window).getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
          console.error(msgStr + `success obtain the window transition animation.`);
          expect().assertFail();
          await (subWin as window.Window).destroyWindow();
          done();
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300004);
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          await (subWin as window.Window).destroyWindow();
          done();
        }
      })
      
      /**
       * @tc.name   testSetWindowTransitionAnimationDurationError
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0100
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationDurationError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationDurationError';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 4000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 0.5,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then((data) => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300016);
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      /**
       * @tc.name   testSetWindowTransitionAnimationOpacityError
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0110
       * @tc.desc   Add transition animations to the Windows in specific scenes.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWindowTransitionAnimationOpacityError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testSetWindowTransitionAnimationOpacityError';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWin = windowStage!.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.info(msgStr + 'Succeeded getMainWindowSync.');
        const animationConfig: window.WindowAnimationConfig = {
          duration: 1000,
          curve: window.WindowAnimationCurve.LINEAR,
        };
        const transitionAnimation: window.TransitionAnimation = {
          opacity: 2,
          config: animationConfig
        };
        try {
          mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then((data) => {
            console.info(msgStr + 'Succeeded in setting window transition animation. Cause:' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300016);
            } else {
              console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
            done();
          });
        } catch (err) {
          if (isFreeWindowMode) {
            console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
      })
      
    })

}