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
import { BusinessError } from '@ohos.base';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowKeyBoardTest() {

    describe("WindowKeyBoardTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowKeyBoardTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        let isFreeWindowMode:boolean = false;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            let mainWindowClass:window.Window = windowStage.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isFreeWindowMode == true 自由窗口模式
            //isFreeWindowMode == false 非自由窗口模式
            console.info(`brforeAll isFreeWindowMode: ${isFreeWindowMode}`);

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
        })
        

        /**
         * @tc.number       testOnKeyboardDidShowErrCode1300002_0100
         * @tc.name         testOnKeyboardDidShowErrCode1300002_static_0100
         * @tc.desc         testOnKeyboardDidShowErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnKeyboardDidShowErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnKeyboardDidShowErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOnKeyboardDidShowErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onKeyboardDidShow((keyboardInfo: window.KeyboardInfo) => {
                    hilog.info(domain, tag,msgStr +  'keyboard show animation completion. keyboardInfo beginRect: ' + JSON.stringify(keyboardInfo.beginRect));
                    hilog.info(domain, tag,msgStr +  'keyboard show animation completion. keyboardInfo beginRect: ' + JSON.stringify(keyboardInfo.endRect));
                });
                hilog.info(domain, tag,msgStr + 'window.isWindowShowing success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testOffKeyboardDidShowErrCode1300002_0100
         * @tc.name         testOffKeyboardDidShowErrCode1300002_static_0100
         * @tc.desc         testOffKeyboardDidShowErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffKeyboardDidShowErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffKeyboardDidShowErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOffKeyboardDidShowErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offKeyboardDidShow((keyboardInfo: window.KeyboardInfo) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
                });
                hilog.info(domain, tag,msgStr + 'window.off_keyboardDidShow success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })


        /**
         * @tc.number       testOnKeyboardDidHideErrCode1300002_0100
         * @tc.name         testOnKeyboardDidHideErrCode1300002_static_0100
         * @tc.desc         testOnKeyboardDidHideErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnKeyboardDidHideErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnKeyboardDidHideErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOnKeyboardDidHideErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onKeyboardDidHide((keyboardInfo: window.KeyboardInfo) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testOffKeyboardDidHideErrCode1300002_0100
         * @tc.name         testOffKeyboardDidHideErrCode1300002_static_0100
         * @tc.desc         testOffKeyboardDidHideErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffKeyboardDidHideErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffKeyboardDidShowErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOffKeyboardDidHideErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offKeyboardDidHide((keyboardInfo: window.KeyboardInfo) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testOnKeyboardHeightChangeErrCode1300002_0100
         * @tc.name         testOnKeyboardHeightChangeErrCode1300002_static_0100
         * @tc.desc         testOnKeyboardHeightChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnKeyboardHeightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnKeyboardHeightChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOnKeyboardHeightChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onKeyboardHeightChange((data) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(data));
                });
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.on_keyboardHeightChange success');
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })

        /**
         * @tc.number       testOffKeyboardHeightChangeErrCode1300002_0100
         * @tc.name         testOffKeyboardHeightChangeErrCode1300002_static_0100
         * @tc.desc         testOffKeyboardHeightChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffKeyboardHeightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffKeyboardHeightChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOffKeyboardHeightChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offKeyboardHeightChange((data) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(data));
                });
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.on_keyboardHeightChange success');
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      testKeepKeyboardOnFocusErrCode1300002_0100
         * @tc.name        testKeepKeyboardOnFocusErrCode1300002_0100
         * @tc.desc        testKeepKeyboardOnFocusErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testKeepKeyboardOnFocusErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testKeepKeyboardOnFocusErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage.createSubWindow('testKeepKeyboardOnFocusErrCode1300002_SubWindow_Promise')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                err = err as BusinessError;
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.keepKeyboardOnFocus(true);
                console.error(msgStr + 'Succeeded in calling keepKeyboardOnFocus.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call keepKeyboardOnFocus. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })

        /**
         * @tc.name   testWindowAnimationCurveEnum_static
         * @tc.number testWindowAnimationCurve_static_0100
         * @tc.desc   Test the function value of WindowAnimationCurve
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testWindowAnimationCurveEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string =  'testWindowAnimationCurveEnum_static';
            console.log(caseName + 'begin.');
            console.log(caseName + 'window.WindowAnimationCurve.LINEAR: ' + window.WindowAnimationCurve.LINEAR);
            console.log(caseName + 'window.WindowAnimationCurve.INTERPOLATION_SPRING: ' + window.WindowAnimationCurve.INTERPOLATION_SPRING);
            expect(window.WindowAnimationCurve.LINEAR).assertEqual(0);
            expect(window.WindowAnimationCurve.INTERPOLATION_SPRING).assertEqual(1);
            expect(window.WindowAnimationCurve.CUBIC_BEZIER).assertEqual(2);
            done();
        })

        /**
         * @tc.name   testRotationInfoTypeEnum_static
         * @tc.number SUB_BASIC_WMS_XTS_RotationInfoType_static_0100
         * @tc.desc   验证RotationInfoType枚举值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testRotationInfoTypeEnum_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string =  "testRotationInfoTypeEnum_static";
            console.log(caseName + " begin");
            try {
                console.log(caseName + " window.testRotationInfoTypeEnum: " +window.RotationInfoType.WINDOW_ORIENTATION+','
                    +window.RotationInfoType.DISPLAY_ORIENTATION+','+window.RotationInfoType.DISPLAY_ROTATION);
                expect(window.RotationInfoType.WINDOW_ORIENTATION).assertEqual(0);
                expect(window.RotationInfoType.DISPLAY_ORIENTATION).assertEqual(1);
                expect(window.RotationInfoType.DISPLAY_ROTATION).assertEqual(2);
                done();
            } catch (error: BusinessError) {
                console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.name   testAnimationType_static
         * @tc.number SUB_BASIC_WMS_XTS_AnimationType_static_0100
         * @tc.desc   验证AnimationType枚举值
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testAnimationType_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string =  "testAnimationType_static";
            console.log(caseName + " begin");
            try {
                console.log(caseName + " window.testAnimationTypeEnum: " + window.AnimationType.FADE_IN_OUT);
                expect(window.AnimationType.FADE_IN_OUT).assertEqual(0);
                done();
            } catch (error: BusinessError) {
                console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   testSetWindowTransitionAnimationNormal_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_static_0010
         * @tc.desc   Add transition animations to the Windows in specific scenes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSetWindowTransitionAnimationNormal_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string =  'testSetWindowTransitionAnimationNormal_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let mainWin :window.Window= windowStage.getMainWindowSync();
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
                    expect(true).assertTrue();
                    done();
                }).catch((err:Error) :PromiseLike<void>|undefined => {
                    if (err.code != 801) {
                        console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.log(msgStr + 'innner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                        console.log(msgStr + JSON.stringify(err))
                        expect(err.code).assertEqual(801);
                        expect(err.message!=null).assertTrue();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                if (err.code != 801) {
                    console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    console.log(msgStr + JSON.stringify(err))
                    expect(err.code).assertEqual(801);
                    expect(err.message!=null).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   testSubWindowDestroy_onKeyboradWillShow_static
         * @tc.number SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_static_0400
         * @tc.desc   子窗销毁后监听onKeyboardWillShow返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowDestroy_onKeyboradWillShow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testSubWindowDestroy_onKeyboradWillShow_static ';
            console.log(caseName + 'begin');
            const subWindowClass:window.Window = await windowStage.createSubWindow('testSubWindowDestroy_onKeyboradWillShow_static');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await Utils.msSleep(200);
            await subWindowClass.showWindow();
            await Utils.msSleep(200);
            try {
                if (isFreeWindowMode == true) {
                    await subWindowClass.destroyWindow()
                    done();
                }
                await subWindowClass.destroyWindow()
                const callback = (keyboardInfo: window.KeyboardInfo) => {
                    console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
                }
                subWindowClass.onKeyboardWillShow(callback);
                done();
            } catch (err: BusinessError) {
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message != null).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   testSubWindowDestroy_offKeyboradWillShow_static
         * @tc.number SUB_BASIC_WMS_ONKEYBOARDWILLSHOW_static_0500
         * @tc.desc   子窗销毁后取消监听offKeyboardWillShow返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowDestroy_offKeyboradWillShow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testSubWindowDestroy_offKeyboradWillShow_static ';
            console.log(caseName + 'begin');
            const subWindowClass = await windowStage.createSubWindow('testSubWindowDestroy_offKeyboradWillShow_static');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await Utils.msSleep(200);
            await subWindowClass.showWindow();
            await Utils.msSleep(200);
            try {
                if (isFreeWindowMode == true) {
                    await subWindowClass.destroyWindow()
                    done();
                }
                await subWindowClass.destroyWindow()
                const callback = (keyboardInfo: window.KeyboardInfo) => {
                    console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
                }
                subWindowClass.offKeyboardWillShow(callback);
                done();
            } catch (err: BusinessError) {
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message != null).assertTrue();
                done();
            }
        });
        /**
         * @tc.name   testSubWindowDestroy_onkeyboardWillHide_static
         * @tc.number SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_static_0400
         * @tc.desc   子窗销毁后监听onKeyboardWillHide返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowDestroy_onkeyboardWillHide_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testSubWindowDestroy_onkeyboardWillHide_static ';
            console.log(caseName + 'begin');
            const subWindowClass:window.Window = await windowStage.createSubWindow('testSubWindowDestroy_onkeyboardWillHide_static');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await Utils.msSleep(200);
            await subWindowClass.showWindow();
            await Utils.msSleep(200);
            try {
                if (isFreeWindowMode == true) {
                    await subWindowClass.destroyWindow()
                    done();
                }
                await subWindowClass.destroyWindow()
                const callback = (keyboardInfo: window.KeyboardInfo) => {
                    console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
                }
                subWindowClass.onKeyboardWillHide(callback);
                done();
            } catch (err: BusinessError) {
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message != null).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   testSubWindowDestroy_offkeyboardWillHide_static
         * @tc.number SUB_BASIC_WMS_ONKEYBOARDWILLHIDE_static_0500
         * @tc.desc   子窗销毁后取消监听offKeyboardWillHide返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowDestroy_offkeyboardWillHide_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testSubWindowDestroy_offkeyboardWillHide_static ';
            console.log(caseName + 'begin');
            const subWindowClass:window.Window = await windowStage.createSubWindow('testSubWindowDestroy_offkeyboardWillHide_static');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await Utils.msSleep(200);
            await subWindowClass.showWindow();
            await Utils.msSleep(200);
            try {
                if (isFreeWindowMode == true) {
                    await subWindowClass.destroyWindow()
                    done();
                }
                await subWindowClass.destroyWindow()
                const callback = (keyboardInfo: window.KeyboardInfo) => {
                    console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
                }
                subWindowClass.offKeyboardWillHide(callback);
                done();
            } catch (err: BusinessError) {
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message != null).assertTrue();
                done();
            }
        });
        /**
         * @tc.name   testGetWindowTransitionAnimationNormal_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_static_0050
         * @tc.desc   Obtain the configuration of window transition animations in specific scenarios.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetWindowTransitionAnimationNormal_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
            let caseName:string= 'testGetWindowTransitionAnimationNormal_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let mainWin :window.Window= windowStage.getMainWindowSync();
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
                        console.error(msgStr + `success obtain the window transition animation.`);
                        expect(!!transitionAnimationResult).assertTrue();
                    } catch (err: BusinessError){
                        if (err.code != 801) {
                            console.error(msgStr + `Failed to obtain the window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                            expect(true).assertFail();
                        } else {
                            console.log(msgStr + 'getWindowTransitionAnimation 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                            console.log(msgStr + JSON.stringify(err))
                            expect(err.code).assertEqual(801);
                            expect(err.message!=null).assertTrue();
                        }
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    if (err.code != 801) {
                        console.error(msgStr + `Failed to set window transition animation. Cause code: ${err.code}, message: ${err.message}`);
                        expect(true).assertFail();
                    } else {
                        console.log(msgStr + 'setWindowTransitionAnimation inner catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                        console.log(msgStr + JSON.stringify(err))
                        expect(err.code).assertEqual(801);
                        expect(err.message!=null).assertTrue();
                    }
                });
            } catch (err: BusinessError){
                if (err.code != 801) {
                    console.error(msgStr + `Failed to obtain the window status of window. Cause code: ${err.code}, message: ${err.message}`);
                    expect(true).assertFail();
                } else {
                    console.log(msgStr + 'out catch 当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    console.log(msgStr + JSON.stringify(err))
                    expect(err.code).assertEqual(801);
                    expect(err.message!=null).assertTrue();
                }
            }
        })
        /**
         * @tc.name   testMainWindow_onKeyboradWillShow_static
         * @tc.number SUB_BASIC_WMS_ONKEYBOARDWILLSHOW__static0100
         * @tc.desc   主窗监听onKeyboardWillShow后拉起固定态输入法键盘触发回调
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testMainWindow_onKeyboradWillShow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMainWindow_onKeyboradWillShow_static ';
            console.log(caseName + 'begin');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            try {
                if (isFreeWindowMode == true) {
                    done();
                } else {
                    const callback = (keyboardInfo: window.KeyboardInfo) => {
                        console.info(`${caseName} KeyboardInfo: ${JSON.stringify(keyboardInfo)}`);
                        let displayInfo = display.getDefaultDisplaySync();
                        console.info(`${caseName} dispalyInfo: ${JSON.stringify(displayInfo)}`);
                        expect(keyboardInfo.beginRect.left).assertEqual(0);
                        expect(keyboardInfo.beginRect.top).assertEqual(displayInfo.height);
                        expect(keyboardInfo.beginRect.width).assertEqual(displayInfo.width);
                        expect(keyboardInfo.beginRect.height).assertLarger(0);
                        expect(keyboardInfo.endRect.left).assertEqual(0);
                        expect(keyboardInfo.endRect.top + keyboardInfo.endRect.height).assertEqual(displayInfo.height);
                        expect(keyboardInfo.endRect.width).assertEqual(displayInfo.width);
                        expect(keyboardInfo.endRect.height).assertLarger(0);
                        expect(keyboardInfo.animated).assertEqual(true);
                        expect(keyboardInfo.config?.curve).assertEqual(1);
                        expect(keyboardInfo.config?.duration).assertLarger(0);
                        if (keyboardInfo.config?.param != null) {
                            expect(true).assertTrue();
                        } else {
                            expect(true).assertFalse();
                        }
                        mainWindow.offKeyboardWillShow();
                        done();
                    }
                    mainWindow.onKeyboardWillShow(callback);
                    mainWindow.offKeyboardWillShow();
                    done();
                }
            } catch (err: BusinessError) {
                console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
                mainWindow.offKeyboardWillShow();
                if (err.code === 801) {
                    expect(err.message != null).assertTrue();
                    done();
                } else {
                    expect(true).assertFail()
                    done();
                }
            }
        });



    })

}