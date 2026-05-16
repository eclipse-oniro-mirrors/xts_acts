/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage ,LocalStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions'
import deviceInfo from '@ohos.deviceInfo';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    
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
        await Utils.msSleep(1000)
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        return windowStageStart;
    
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
export default function NoParentSubWindowLifeCycleStatic(): void {

    describe("NoParentSubWindowLifeCycleStatic", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLifeCycleTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode:boolean = false;
        let deviceType: string = deviceInfo.deviceType;
        console.info(`deviceType: ${deviceType}`);
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(0x0000, '[ANI]','windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            hilog.info(domain, tag, '%{public}s', 'getANI context = ' + JSON.stringify(context));
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            hilog.info(0x0000, '[ANI]',`beforeAll isFreeWindowMode: `+ isFreeWindowMode);
        })
        
    /**
     @tc.number  SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.name    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.desc    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_Undefined_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: undefined
        };
        try {
          windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_Static_0100',
            subWindowOptions)
            .then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
            console.error(msgStr +
              `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_Undefined_Static_0200',
          decorEnabled: true,
          zLevelAboveParentLoosened: undefined
        };
        try {
          let mainWindow: window.Window = windowStage!.getMainWindowSync();
          if (isFreeWindowMode) {
            let promise =
              mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_Static_0200',
                subWindowOptions)
            promise.then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
              console.error(msgStr +
                `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          } else {
            done();
          }
        } catch (exception) {
          console.error(msgStr +
            `Failed to create the subwindow2. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.name    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.desc    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_false_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: false
        };
        try {
          windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_Static_0100',
            subWindowOptions)
            .then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
            console.error(msgStr +
              `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_false_Static_0200',
          decorEnabled: true,
          zLevelAboveParentLoosened: false
        };
        try {
          let mainWindow: window.Window = windowStage!.getMainWindowSync();
          if (isFreeWindowMode) {
            let promise =
              mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_false_Static_0200', subWindowOptions)
            promise.then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
              console.error(msgStr +
                `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          } else {
            done();
          }
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_Static_0100
     @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_Static_0100
     @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let mainWindow = windowStage!.getMainWindowSync();
        let windowId = mainWindow.getWindowProperties().id;
        console.info(msgStr + 'windowId :' + windowId);
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_true_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        try {
          if (isFreeWindowMode) {
            let promise =
              mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_true_Static_0100', subWindowOptions)
            promise.then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              let parentClass = data.getParentWindow();
              let parentId = parentClass.getWindowProperties().id;
              console.info(msgStr + 'parentId :' + parentId)
              expect(parentId).assertEqual(windowId);
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
              console.error(msgStr +
                `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          } else {
            done();
          }
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_Static_0100
     @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_Static_0100
     @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_true_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        let subWindowClass: window.Window =
          await windowStage!.createSubWindow('SUB_WINDOW_NoParentSubWindow_true_Static_0100');
        try {
          if (isFreeWindowMode) {
            let promise =
              subWindowClass.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_1300004_Static_0100',
                subWindowOptions);
            promise.then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.destroyWindow();
              await subWindowClass.destroyWindow();
              done();
            }).catch(async (err: Error) => {
              console.error(msgStr +
                `Failed to create the subwindow1. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300004);
              expect(err.message !== '').assertTrue();
              await subWindowClass.destroyWindow();
              done();
            });
          } else {
            await subWindowClass.destroyWindow();
            done();
          }
        } catch (exception) {
          console.error(msgStr +
            `Failed to create the window2. Cause: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          await subWindowClass.destroyWindow();
          done();
        }
        ;
      })
    
    /**
     @tc.number  SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100
     @tc.name    SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100
     @tc.desc    SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL1
     */
    it('SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_isWindowShowing_Static_0100',
          subWindowOptions)
          .then(async (data: window.Window) => {
            let subWindow: window.Window = data;
            console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            let isWindowShowing: boolean = subWindow.isWindowShowing();
            console.log(msgStr + 'isWindowShowing:' + isWindowShowing);
            expect(!!subWindow).assertTrue();
            expect(isWindowShowing).assertFalse();
            subWindow.showWindow().then(async () => {
              let isWindowShowing2 = subWindow.isWindowShowing();
              console.log(msgStr + 'isWindowShowing2:' + isWindowShowing2);
              expect(isWindowShowing2).assertTrue();
              await subWindow.destroyWindow();
              done();
            }).catch(async (err: Error) => {
              console.error('Failed to show window1. Cause:' + JSON.stringify(err));
              expect(true).assertFail();
              await subWindow.destroyWindow();
              done();
            });
          }).catch((err: Error) => {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      }
    )
    
    /**
     @tc.number  SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100
     @tc.name    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100
     @tc.desc    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL0
     */
    it('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowEventChangeArray: window.WindowEventType[] = [];
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        try {
          let windowClass: window.Window =
            await windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0100',
              subWindowOptions);
          console.info(caseName + ' createSubWindow success ' + JSON.stringify(windowClass));
          windowClass.onWindowEvent((data: window.WindowEventType) => {
            console.info(caseName + ' Window event happened. Event:' + JSON.stringify(data));
            windowEventChangeArray.push(data);
            console.info(caseName + ' windowEventChangeArray:' + JSON.stringify(windowEventChangeArray));
          });
          await windowClass.setUIContent('pages/index2')
          let focusOnshowOptions: window.ShowWindowOptions = {
            focusOnShow: true
          }
          await windowClass.showWindow(focusOnshowOptions);
          console.info(caseName + ' windowClass showWindow success ');
          await Utils.msSleep(300)
          await windowClass.minimize();
          console.info(caseName + ' windowClass minimize success ');
          await Utils.msSleep(300)
          await windowClass.destroyWindow();
          console.info(caseName + ' windowClass destroyWindow success ');
          await Utils.msSleep(300)
          expect(windowEventChangeArray[0]).assertEqual(window.WindowEventType.WINDOW_SHOWN);
          expect(windowEventChangeArray[1]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
          expect(windowEventChangeArray[2]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
          expect(windowEventChangeArray[3]).assertEqual(window.WindowEventType.WINDOW_HIDDEN);
          expect(windowEventChangeArray[4]).assertEqual(window.WindowEventType.WINDOW_DESTROYED);
          done();
        } catch (err) {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    );
    
    /**
     @tc.name    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_Static_0100
     @tc.number  SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_Static_0100
     @tc.desc    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_Static_0100
     @tc.type    FUNCTION
     @tc.size    MEDIUMTEST
     @tc.level   LEVEL3
     */
    it('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindow: window.Window;
        let num = 0;
        const callback1 = (windowEventType: window.WindowEventType) => {
          num++;
          console.log(msgStr + 'callback1 is called,num: ' + num);
        };
        const callback2 = (windowEventType: window.WindowEventType) => {
          num++;
          console.log(msgStr + 'callback2 is called,num: ' + num);
        };
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0200',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        await windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Static_0200',
          subWindowOptions).then(async (data: window.Window) => {
          subWindow = data;
          console.log(msgStr + 'windowStage!.createSubWindow success');
          expect(!!subWindow).assertTrue();
          try {
            subWindow.onWindowEvent(callback1);
            subWindow.onWindowEvent(callback2);
            await subWindow.showWindow();
            await Utils.msSleep(500);
            subWindow.offWindowEvent(callback1);
            await subWindow.minimize();
            await Utils.msSleep(500);
            expect(num).assertEqual(6);
            await subWindow.destroyWindow();
            done();
          } catch (exception) {
            console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
            await subWindow.destroyWindow();
            expect(true).assertFail();
            done();
          }
        }).catch((err: Error) => {
          console.log(msgStr + 'windowStage!.createSubWindow failed error: ' + JSON.stringify(err));
          expect(true).assertFail();
          done();
        });
      });
    
    /**
     @tc.name   SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100
     @tc.number SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100
     @tc.desc   SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100
     @tc.type   FUNCTION
     @tc.size   MEDIUMTEST
     @tc.level  LEVEL0
     */
    it('SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let message = "SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100";
        let msgStr = 'jsunittest ' + message + ' ';
        console.log(msgStr + 'begin.');
        let windowStageStart = await startAbility(message, context!);
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowId = mainWindow.getWindowProperties().id;
        console.info(msgStr + 'windowId :' + windowId);
        try {
          let subWindowOptions: window.SubWindowOptions = {
            title: 'SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100',
            decorEnabled: true,
            zLevelAboveParentLoosened: true
          };
          let subWindowClass: window.Window =
            await windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_Static_0100',
              subWindowOptions);
          subWindowClass.setParentWindow(windowId).then(async () => {
            console.info(msgStr + 'Succeeded in setParentWindow window.')
            let parentClass = subWindowClass.getParentWindow();
            let parentId = parentClass.getWindowProperties().id;
            console.info(msgStr + 'parentId :' + parentId)
            expect(parentId).assertEqual(windowId);
            await subWindowClass.destroyWindow();
            await terminateAbility(message)
            done()
          }).catch(async (e: Error) => {
            console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
            if (!isFreeWindowMode) {
              expect(e.code).assertEqual(801);
              expect(e.message !== '').assertTrue();
            } else {
              expect(true).assertFail();
            }
            await terminateAbility(message);
            done();
          });
        } catch (e) {
          console.error(msgStr + `Failed to setParentWindow. Cause: ${e.code}, message: ${e.message}`);
          await terminateAbility(message)
          expect(true).assertFail();
          done();
        }
      })
    
    /**
     @tc.name   SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100
     @tc.number SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100
     @tc.desc   SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100
     @tc.type   FUNCTION
     @tc.size   MEDIUMTEST
     @tc.level  LEVEL0
     */
    it('SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let message = "SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100";
        let msgStr = 'jsunittest ' + message + ' ';
        console.log(msgStr + 'begin.');
        let windowClass: window.Window =
          await windowStage!.createSubWindow('SUB_WINDOW_NoParentSubWindow_setParentWindow_Static_parentWindow');
        let windowId = windowClass.getWindowProperties().id;
        console.info(msgStr + 'windowId :' + windowId);
        try {
          let subWindowOptions: window.SubWindowOptions = {
            title: 'SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100',
            decorEnabled: true,
            zLevelAboveParentLoosened: true
          };
          let subWindowClass: window.Window =
            await windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_Static_0100',
              subWindowOptions);
          subWindowClass.setParentWindow(windowId).then(async () => {
            console.info(msgStr + 'Succeeded in setParentWindow window.')
            await subWindowClass.destroyWindow();
            await windowClass.destroyWindow();
            done()
          }).catch(async (e: Error) => {
            console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
            if (isFreeWindowMode) {
              expect(e.code).assertEqual(1300009);
              expect(e.message !== '').assertTrue();
            } else {
              expect(e.code).assertEqual(801);
              expect(e.message !== '').assertTrue()
            }
            await subWindowClass.destroyWindow();
            await windowClass.destroyWindow();
            done();
          });
        } catch (e) {
          console.error(msgStr + `Failed to setParentWindow. Cause: ${e.code}, message: ${e.message}`);
          await windowClass.destroyWindow();
          expect(true).assertFail();
          done();
        }
      })
    
    /**
     @tc.name   SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100
     @tc.number SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100
     @tc.desc   SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100
     @tc.type   FUNCTION
     @tc.size   MEDIUMTEST
     @tc.level  LEVEL0
     */
    it('SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let message = "SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100";
        let msgStr = 'jsunittest ' + message + ' ';
        console.log(msgStr + 'begin.');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        try {
          windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100',
            subWindowOptions)
            .then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              let subWindowClass: window.Window =
                window.findWindow("SUB_WINDOW_NoParentSubWindow_findWindow_normal_Static_0100");
              console.info(msgStr + 'Succeeded in creating the subwindow. subWindowClass: ' +
                JSON.stringify(subWindowClass));
              expect(!!subWindowClass).assertTrue();
              let windowId1 = data.getWindowProperties().id;
              let windowId2 = subWindowClass.getWindowProperties().id;
              console.info(`${msgStr},data.windowId：${windowId1},subWindowClass.windowId:${windowId2}`);
              expect(windowId1).assertEqual(windowId2)
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
            console.error(msgStr +
              `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })

    /**
     @tc.name    SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_Static_0100
     @tc.number  SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_Static_0100
     @tc.desc    SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_Static_0100
     @tc.type    FUNCTION
     @tc.size    MEDIUMTEST
     @tc.level   LEVEL2
     */
    it('SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_GetUIContext_Static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        let storage: LocalStorage = new LocalStorage();
        try {
          windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_GetUIContext_Static_0100',
            subWindowOptions)
            .then(async (data: window.Window) => {
              console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
              expect(!!data).assertTrue();
              await data.loadContent('pages/index2', storage);
              let uiContext: UIContext = data.getUIContext();
              expect(uiContext !== null).assertTrue();
              let UiContextWindowId = uiContext.getWindowId();
              let UiContextWindowName = uiContext.getWindowName();
              let windowId = data.getWindowProperties().id;
              let windowName = data.getWindowProperties().name;
              console.info(`${msgStr} Succeeded in gettting UiContext,UiContextWindowId: ${UiContextWindowId},UiContextWindowName: ${UiContextWindowName},windowId: ${windowId},windowName: ${windowName}`);
              expect(windowId).assertEqual(UiContextWindowId);
              expect(windowName).assertEqual(UiContextWindowName);
              await data.destroyWindow();
              done();
            }).catch((err: Error) => {
            console.error(msgStr +
              `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        ;
      })
    
    })

}