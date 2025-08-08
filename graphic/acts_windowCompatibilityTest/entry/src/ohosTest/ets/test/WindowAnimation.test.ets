/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { StartOptions, bundleManager } from '@kit.AbilityKit';
import Want from '@ohos.app.ability.Want';


async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}
async function terminateAbility(msgStr: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${msgStr} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${msgStr} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(900);
}
export default function windowAnimationTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_animation_test', () => {
    console.log('describe window_animation_test start!!!')
    let subWin: window.Window | void;
    beforeAll(() => {
      console.info('window_animation_test beforeAll begin');
      console.info(`window_animation_test beforeAll end`);
    })
    beforeEach(async ()=>{
      let msg = 'window_orientation_test';
      console.log(msg + ' beforeEach start!!!');
      if(subWin !== null && subWin !== undefined){
        await (subWin as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      console.log(msg + ' beforeEach end!!!');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0090
     * @tc.name      : testGetWindowTransitionAnimationNotSet
     * @tc.desc      : Obtain the configuration of window transition animations in specific scenarios.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowTransitionAnimationNotSet', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowTransitionAnimationNotSet';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      console.info(msgStr + 'Succeeded getMainWindowSync.');
      try {
        let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
        console.error(msgStr + `success obtain the window transition animation.`);
        expect(transitionAnimationResult).assertEqual(undefined);
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0010
     * @tc.name      : testSetWindowTransitionAnimationNormal
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testSetWindowTransitionAnimationNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      let caseName = 'testSetWindowTransitionAnimationNormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0120
     * @tc.name      : testSetWindowTransitionAnimationNormal2
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testSetWindowTransitionAnimationNormal2', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      let caseName = 'testSetWindowTransitionAnimationNormal2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0130
     * @tc.name      : testSetWindowTransitionAnimationCurveSpring
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationCurveSpring', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationCurveSpring';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0140
     * @tc.name      : testSetWindowTransitionAnimationCurveBezier
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationCurveBezier', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationCurveBezier';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0170
     * @tc.name      : testSetWindowTransitionAnimationCurveBezierAbnormal
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationCurveBezierAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationCurveBezierAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300016);
        } else {
          console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0020
     * @tc.name      : testSetWindowTransitionAnimationWindowStateAbnormal
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationWindowStateAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationWindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testsetWindowTransitionAnimationWindowStateAbnormal')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
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
        await (subWin as window.Window).setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
          } else {
            console.log(msgStr + ' innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err));
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0030
     * @tc.name      : testSetWindowTransitionAnimationSubWindow
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testsetWindowTransitionAnimationSubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
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
        await (subWin as window.Window).setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300004);
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err));
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        } else {
          console.log(msgStr + 'out catch  当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err));
          expect(err.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0040
     * @tc.name      : testSetWindowTransitionAnimationUndefined
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationUndefined';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      console.info(msgStr + 'Succeeded getMainWindowSync.');
      const animationConfig: window.WindowAnimationConfig = {
        duration: 1000,
        curve: window.WindowAnimationCurve.LINEAR,
      };
      try {
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, undefined).then((data) => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0050
     * @tc.name      : testGetWindowTransitionAnimationNormal
     * @tc.desc      : Obtain the configuration of window transition animations in specific scenarios.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testGetWindowTransitionAnimationNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      let caseName = 'testGetWindowTransitionAnimationNormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
          try {
            let transitionAnimationResult = mainWin.getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
            console.error(msgStr + `success obtain the window transition animation.`);
            expect(!!transitionAnimationResult).assertTrue();
          } catch (err) {
            if (err.code != 801) {
              console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
          }
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'setWindowTransitionAnimation inner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
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
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0060
     * @tc.name      : testGetWindowTransitionAnimationWindowStateAbnormal
     * @tc.desc      : Obtain the configuration of window transition animations in specific scenarios.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowTransitionAnimationWindowStateAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowTransitionAnimationWindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetWindowTransitionAnimationWindowStateAbnormal')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      console.info(msgStr + 'Succeeded createSubWindow.');
      await (subWin as window.Window).destroyWindow();
      try {
        let transitionAnimationResult = (subWin as window.Window).getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
        console.error(msgStr + `success obtain the window transition animation.`);
        expect().assertFail();
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0070
     * @tc.name      : testGetWindowTransitionAnimationSubWindow
     * @tc.desc      : Obtain the configuration of window transition animations in specific scenarios.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowTransitionAnimationSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowTransitionAnimationSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetWindowTransitionAnimationSubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      console.info(msgStr + 'Succeeded createSubWindow.');
      try {
        let transitionAnimationResult = (subWin as window.Window).getWindowTransitionAnimation(window.WindowTransitionType.DESTROY);
        console.error(msgStr + `success obtain the window transition animation.`);
        expect().assertFail();
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0080
     * @tc.name      : testGetWindowTransitionAnimationParameterError
     * @tc.desc      : Obtain the configuration of window transition animations in specific scenarios.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowTransitionAnimationParameterError', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowTransitionAnimationParameterError';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then(() => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:');
          try {
            let transitionAnimationResult = mainWin.getWindowTransitionAnimation(undefined);
            console.error(msgStr + `success obtain the window transition animation.`);
            expect().assertFail();
          } catch (err) {
            if (err.code != 801) {
              console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(401);
            }
          }
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + 'setWindowTransitionAnimation inner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `1 Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + 'setWindowTransitionAnimation out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0100
     * @tc.name      : testSetWindowTransitionAnimationDurationError
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationDurationError', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationDurationError';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then((data) => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300016);
        } else {
          console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0110
     * @tc.name      : testSetWindowTransitionAnimationOpacityError
     * @tc.desc      : Add transition animations to the Windows in specific scenes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTransitionAnimationOpacityError', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowTransitionAnimationOpacityError';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
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
        await mainWin.setWindowTransitionAnimation(window.WindowTransitionType.DESTROY, transitionAnimation).then((data) => {
          console.info(msgStr + 'Succeeded in setting window transition animation. Cause:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300016);
          } else {
            console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300016);
        } else {
          console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0150
     * @tc.name      : testStartAbilityAnimationNormal
     * @tc.desc      : Test the application by pulling up the fade-in and fade-out animation effects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testStartAbilityAnimationNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async () => {
      let caseName = 'testStartAbilityAnimationNormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wantInfo: Want = {
        bundleName: 'com.example.myapplication',
        abilityName: 'StartTestAbility',
        parameters: {
          info:'来自StartTestAbility页面'
        }
      };
      let animation_param: window.StartAnimationParams = {
        type: window.AnimationType.FADE_IN_OUT
      };
      let windowParam: window.WindowCreateParams = {
        animationParams: animation_param
      };
      let options: StartOptions = {
        windowCreateParams : windowParam
      };
      try {
        await context.startAbility(wantInfo, options).then( async() => {
          console.info(`${msgStr} Succeeded in starting ability.`);
          await sleep(900);
          await sleep(900);
          await terminateAbility(msgStr);
          console.info(`${msgStr} terminateSelf end.`);
        }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        });
      } catch (err) {
          console.error(msgStr + `Failed to starting ability. outcatch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_0160
     * @tc.name      : testStartAbilityAnimationDefaultValue
     * @tc.desc      : Test the application by pulling up the fade-in and fade-out animation effects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testStartAbilityAnimationDefaultValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async () => {
      let caseName = 'testStartAbilityAnimationDefaultValue';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wantInfo: Want = {
        bundleName: 'com.example.myapplication',
        abilityName: 'StartTestAbility',
        parameters: {
          info:'来自StartTestAbility页面'
        }
      };
      let windowParam: window.WindowCreateParams = {};
      let options: StartOptions = {
        windowCreateParams : windowParam
      };
      try {
        await context.startAbility(wantInfo, options).then( async() => {
          console.info(`${msgStr} Succeeded in starting ability.`);
          await sleep(900);
          await sleep(900);
          await terminateAbility(msgStr);
          console.info(`${msgStr} terminateSelf end.`);
        }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        });
      } catch (err) {
          console.error(msgStr + `Failed to starting ability. outcatch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
      }
    })
  })
}
