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

import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import { Driver,ON,Component, Point } from '@ohos.UiTest';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
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
        e = e as BusinessError;
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowPCTest() {

    describe("WindowPCTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPCTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isPCStatus: string = '';
        let isFreeWindowMode = false;
        let driver: Driver = Driver.create();
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                win = windowStage!.getMainWindowSync();
                isPCStatus = settings.getValueSync(context!, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
                //isPCStatus == '' 非PC设备
                //isPCStatus == '1' PC设备状态栏dock未融合
                //isPCStatus == '0' PC设备状态栏dock融合
                hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
                isFreeWindowMode = win!.isInFreeWindowMode();
                //isFreeWindowMode == true 自由窗口模式
                //isFreeWindowMode == false 非自由窗口模式
                hilog.info(domain, tag,`isFreeWindowMode: ${isFreeWindowMode}`);
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
        })

        /**
         * @tc.number     SUB_WMS_START_MOVING_REPEAT_0100
         * @tc.name       teststartMovingStaticRepeated
         * @tc.desc       teststartMovingStaticRepeated
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 1
         */
        it('teststartMovingStaticRepeated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'teststartMovingStaticRepeated';
            console.log(caseName + 'begin');
            let windowClass = windowStage!.getMainWindowSync()
            let isFreeMode = windowClass.isInFreeWindowMode();
            console.log(`${caseName} isFreeMode: ${isFreeMode}`);
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await windowStage!.createSubWindow('teststartMovingRepeated');
                AppStorage.setOrCreate('windowClass1', subWindowClass);
                let windowLimits = subWindowClass!.getWindowLimits();
                console.info(`${caseName} windowLimits = ${JSON.stringify(windowLimits)}`);
                let width = windowLimits.minWidth;
                let height = windowLimits.minHeight;
                await subWindowClass.resize(width!+200, height!+1000);
                await Utils.msSleep(200)
                await subWindowClass.setUIContent("pages/StartMoving8");
                await Utils.msSleep(200)
                await subWindowClass.showWindow();
                await Utils.msSleep(200)
                let windowPoint = subWindowClass.getWindowProperties().windowRect;
                console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`);
                await Utils.msSleep(1000)
                let blank = await driver.findComponent(ON.id('startMoving'))
                await Utils.msSleep(1000)
                console.info(`${caseName} blank = ${JSON.stringify(blank)}`);
                let point = await blank!.getBoundsCenter();
                console.info(`${caseName} point = ${JSON.stringify(point)}`);
                await driver.drag(point!.x, point!.y, point!.x + 500, point!.y + 500, 200);
                await Utils.msSleep(1000)
                let text = await driver.findComponent(ON.id('startMovingText'));
                await Utils.msSleep(1000)
                console.info(`${caseName} text = ${JSON.stringify(text)}`);
                let textDragged = await text!.getText();
                await Utils.msSleep(5000)
                console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                if (textDragged == 'startMoving success') {
                    expect().assertFail();
                } else if (textDragged == 'startMoving 801') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else if (textDragged == 'startMoving 1300001') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else {
                    console.error(`${caseName} Error.`);
                    expect(true).assertFalse()
                }
                await subWindowClass.destroyWindow();
                done();
            } catch (err) {
                console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass!.destroyWindow()
                if (err.code === 801) {
                    done();
                } else {
                    expect().assertFail();
                    done()
                }
            }
        });

        /**
         * @tc.number     SUB_WMS_START_MOVING_WITH_OFFSETX_OFFSETY_REPEAT_0100
         * @tc.name       teststartMovingParamStaticRepeated
         * @tc.desc       teststartMovingParamStaticRepeated
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 1
         */
        it('teststartMovingParamStaticRepeated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'teststartMovingParamStaticRepeated';
            console.log(caseName + 'begin');
            let windowClass = windowStage!.getMainWindowSync()
            let isFreeMode = windowClass.isInFreeWindowMode();
            console.log(`${caseName} isFreeMode: ${isFreeMode}`);
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await windowStage!.createSubWindow('teststartMovingwithOffsetXandOffsetYRepeated');
                AppStorage.setOrCreate('windowClass2', subWindowClass);
                let windowLimits = subWindowClass.getWindowLimits();
                console.info(`${caseName} windowLimits = ${JSON.stringify(windowLimits)}`);
                let width = windowLimits.minWidth;
                let height = windowLimits.minHeight;
                await subWindowClass!.resize(width!+200, height!+1000);
                await Utils.msSleep(200)
                await subWindowClass.setUIContent("pages/StartMoving9");
                await Utils.msSleep(200)
                await subWindowClass.showWindow();
                await Utils.msSleep(200)
                let windowPoint = subWindowClass.getWindowProperties().windowRect;
                console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`);
                await Utils.msSleep(1000)
                let blank = await driver.findComponent(ON.id('startMoving'))
                await Utils.msSleep(1000)
                console.info(`${caseName} blank = ${JSON.stringify(blank)}`);
                let point = await blank!.getBoundsCenter();
                console.info(`${caseName} point = ${JSON.stringify(point)}`);
                await driver.drag(point.x, point.y, point.x + 500, point.y + 500, 200);
                await Utils.msSleep(1000)
                let text = await driver.findComponent(ON.id('startMovingText'));
                await Utils.msSleep(1000)
                console.info(`${caseName} text = ${JSON.stringify(text)}`);
                let textDragged = await text!.getText();
                await Utils.msSleep(5000)
                console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                if (textDragged == 'startMoving success') {
                    expect().assertFail();
                } else if (textDragged == 'startMoving 801') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else if (textDragged == 'startMoving 1300001') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else {
                    console.error(`${caseName} Error.`);
                    expect(true).assertFalse()
                }
                await subWindowClass.destroyWindow();
                done();
            } catch (err) {
                console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass!.destroyWindow()
                if (err.code === 801) {
                    done()
                } else {
                    expect().assertFail();
                    done()
                }
            }
        });

        /**
         * @tc.number       testRecoverPromiseErrCode1300002_0100
         * @tc.name         testRecoverPromiseErrCode1300002_static_0100
         * @tc.desc         testRecoverPromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testRecoverPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testRecoverPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testRecoverPromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).recover().then(async () => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling recover.');
                            expect(false).assertTrue();
                        }).catch((err: Error):Promise<void>  => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call recover. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                        });
                        done()
                    } catch (exception) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call recover. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error):Promise<void> => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
         * @tc.name        testRecover_static_0100
         * @tc.desc        test the function of Recover
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testRecover_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let msgStr:string = 'testRecover_static_0100';
            hilog.info(0x0000, '[ANI]',msgStr + ' begin');
            try {
                let wnd = await windowStage!.getMainWindow();
                hilog.info(0x0000, '[ANI]',msgStr + ' window.getMainWindow wnd: ' + wnd);
                let promise = wnd.recover();
                promise.then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in recovering the window.');
                    done();
                }).catch((err: Error):Promise<void> => {
                    if (err!.code === 801 || err!.code === 1300001) {
                        hilog.info(0x0000, '[ANI]',msgStr + ' The current device type does not support calling recover or recover not support ')
                        done();
                    } else {
                        hilog.error(0x0000, '[ANI]',msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to testRecover. 04Cause: ' + JSON.stringify(err))
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number     testMinimizeCallbackErrCode1300002_0100
         * @tc.name       testMinimizeCallbackErrCode1300002_static_0100
         * @tc.desc       testMinimizeCallbackErrCode1300002_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testMinimizeCallbackErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testMinimizeCallbackErrCode1300002_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let subWin: window.Window;
            windowStage!.createSubWindow('testMinimizeCallbackErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.minimize((err: BusinessError<void>|null) :void => {
                            const errCode: number = err!.code;
                            if (errCode) {
                                if(errCode === 801){
                                    done();
                                }else if (errCode === 1300002){
                                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause:' + JSON.stringify(err));
                                    expect(err!.code).assertEqual(1300002);
                                    done()
                                    return;
                                }
                                else{
                                    expect(false).assertTrue();
                                    done();
                                }
                            }
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling minimize.');
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
        
        })
        /**
         * @tc.number     testMinimizePromiseErrCode1300002_0100
         * @tc.name       testMinimizePromiseErrCode1300002_static_0100
         * @tc.desc       testMinimizePromiseErrCode1300002_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testMinimizePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMinimizePromiseErrCode1300002_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testMinimizePromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).minimize().then(() => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling minimize.');
                            expect(false).assertTrue();
                        }).catch((err: Error) :PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                        });
                        done()
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call minimize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
        
        })

        /**
         * @tc.number      testMaximizePromiseErrCode1300002_static_0200
         * @tc.name        testMaximizePromiseErrCode1300002_static_0200
         * @tc.desc        testMaximizePromiseErrCode1300002_static_0200
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMaximizePromiseErrCode1300002_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMaximizePromiseErrCode1300002_static_0200";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testMaximizePromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER).then(() => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling maximize.');
                            expect(false).assertTrue();
                            done()
                        }).catch((err: Error) :PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                            done()
                        });
                        
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call maximize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })
        /**
         * @tc.number      testMaximizePromiseErrCode1300004_0100
         * @tc.name        testMaximizePromiseErrCode1300004_static_0100
         * @tc.desc        testMaximizePromiseErrCode1300004_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMaximizePromiseErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMaximizePromiseErrCode1300004_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testMaximizePromiseErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let win: window.Window | undefined;
            try {
                win = await window.createWindow(windowConfig);
                expect(!!win).assertTrue();
                await win!.setUIContent('pages/index2');
                await win!.showWindow();
                await Utils.msSleep(300);
                win!.maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(() => {
                    (async () => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling maximize.');
                        await (win! as window.Window).destroyWindow();
                        expect(false).assertTrue();
                        done()
                    })().awaitSync()
                }).catch((err: Error) :PromiseLike<void>|undefined => {
                    (async () => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300004);
                    await (win! as window.Window).destroyWindow();
                    done()
                    })().awaitSync()
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(0x0000, '[ANI]',msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                await (win! as window.Window).destroyWindow();
                expect(false).assertTrue();
                done()
            }

        })

        /**
         * @tc.number     testisWindowRectAutoSave_static_0100
         * @tc.name       testisWindowRectAutoSave_static
         * @tc.desc       Test the function value of setWindowTitleMoveEnabled
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testisWindowRectAutoSave_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let message:string = 'testisWindowRectAutoSave_static';
            try {
                await windowStage!.setWindowRectAutoSave(true);
                await Utils.msSleep(1000);
                windowStage!.isWindowRectAutoSave().then((result:boolean) => {
                    hilog.info(domain, tag,`${message} isWindowRectAutoSave = ${result}, expect true.`)
                    if(isFreeWindowMode){
                        expect(result).assertEqual(true);
                        done();
                    }else{
                        expect(result).assertEqual(false);
                        done();
                    }
                    
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
                await windowStage!.setWindowRectAutoSave(false);
                await Utils.msSleep(1000);
                windowStage!.isWindowRectAutoSave().then((result:boolean) => {
                    hilog.info(domain, tag,`${message} isWindowRectAutoSave = ${result}, expect false.`)
                    expect(result).assertFalse();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        done();
                    } else {
                        done();
                    }
                })
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
                if (exception.code === 801) {
                    done();
                } else {

                    expect(false).assertTrue();
                    done();
                }
            }

        })
        /**
         * @tc.number     testIsWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.name       testIsWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.desc       testIsWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testIsWindowRectAutoSavePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testIsWindowRectAutoSavePromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                windowStageStart.isWindowRectAutoSave().then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling isWindowRectAutoSave.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call isWindowRectAutoSave. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done()
                });

            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })
/**
         * @tc.number      testSetWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.name        testSetWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.desc        testSetWindowRectAutoSavePromiseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowRectAutoSavePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowRectAutoSavePromiseErrCode1300002_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                 windowStageStart.setWindowRectAutoSave(true).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowRectAutoSave.');
                    expect(false).assertTrue();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_static_0300
         * @tc.name       test_setWindowRectAutoSave_1300002_static
         * @tc.desc       test_setWindowRectAutoSave_1300002_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_setWindowRectAutoSave_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setWindowRectAutoSave_1300002_static';
            hilog.info(domain, tag,caseName + 'begin');
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            let windowStageStart :window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                windowStageStart.setWindowRectAutoSave(true,true).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowRectAutoSave.');
                    expect(false).assertTrue();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
                    if (err.code === 801) {
                        hilog.info(domain, tag,caseName + 'this deviceType does not support the Capability.');
                        done()
                    } else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        });
        /**
         * @tc.number      testOnWindowStageCloseErrCode1300002_0100
         * @tc.name        testOnWindowStageCloseErrCode1300002_0100
         * @tc.desc        testOnWindowStageCloseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOnWindowStageCloseErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testOnWindowStageCloseErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowStageStart = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = () => {
                    return false;
                };
                windowStageStart.onWindowStageClose(callback);
                console.error(msgStr + 'Succeeded in calling on windowStageClose.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call on windowStageClose. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })


        /**
         * @tc.number      testOffWindowStageCloseErrCode1300002_0100
         * @tc.name        testOffWindowStageCloseErrCode1300002_0100
         * @tc.desc        testOffWindowStageCloseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOffWindowStageCloseErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testOffWindowStageCloseErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowStageStart = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = () => {
                    return true;
                };
                windowStageStart.offWindowStageClose(callback);
                console.error(msgStr + 'Succeeded in calling on windowStageClose.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call on windowStageClose. Cause:' + JSON.stringify(e));
                if(e.code === 801){
                    done()
                }else{
                    expect(e.code).assertEqual(1300002);
                    done()
                }
                
            }
        })

        /**
         * @tc.number      testRestorePromiseErrCode1300002_static_0100
         * @tc.name        testRestorePromiseErrCode1300002_static_0100
         * @tc.desc        testRestorePromiseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testRestorePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testRestorePromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window = await windowStage!.createSubWindow('testRestorePromiseErrCode1300002_SubWindow_Promise')
            hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + subWin);
            await (subWin! as window.Window).destroyWindow();
            try {
                 (subWin! as window.Window).restore().then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling restore.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined  => {
                    hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done()
                });

            } catch (exception) {
                hilog.error(domain, tag,msgStr + 'Failed to set the call restore. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_1800
         * @tc.name       testRestoreBySubWindow_static
         * @tc.desc       After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testRestoreBySubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testRestoreBySubWindow_static';
            let subWindowClass = await windowStage!.createSubWindow('TestRestoreBySubWindow');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            subWindowClass.restore().then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in restoring the window.`);
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                (async () => {
                hilog.error(domain, tag,`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                if(err.code === 801){
                    done();
                }else{
                    expect(1300004).assertEqual(err.code);
                    await subWindowClass.destroyWindow();
                    done();
                }
                })().awaitSync()
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0100
         * @tc.name       testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static
         * @tc.desc       验证子窗销毁后调用接口报1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow');
            hilog.info(domain, tag,caseName + 'Succeed in createSubWindow');
            await windowClass.destroyWindow();
            hilog.info(domain, tag,caseName + 'windowClass destroyWindow');
            try {
                if( isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(1300002);
                        expect(err.message!=null).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                if(err.code === 801){
                    expect(err.message!=null).assertTrue();
                    done();
                } else{
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                }
            }
        })


        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0200
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static
         * @tc.desc      验证主窗/dialog窗/float/接口报1300004
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level2
         */
        it('testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            if (isFreeWindowMode == true) {
                // 主窗
                try {
                    let mainWindow:window.Window = windowStage!.getMainWindowSync();
                    await mainWindow.setRelativePositionToParentWindowEnabled(true);
                    hilog.info(domain, tag,caseName + 'main window succeed in calling setRelativePositionToParentWindowEnabled');
                    expect(false).assertTrue();
                    done();
                } catch (err) {
                    err = err as BusinessError;
                    hilog.error(domain, tag,`${caseName} failed main window, err: ${JSON.stringify(err)}`);
                    if (err.code === 801) {
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        expect(err.message!=null).assertTrue();
                    }
                }
                // dilog窗
                let config: window.Configuration = {
                    name: "dialogWindow",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context!
                };
                let windowClass2:window.Window = await window.createWindow(config);
                try {
                    await windowClass2.setRelativePositionToParentWindowEnabled(true);
                    hilog.info(domain, tag,caseName + 'dialog window succeed in calling setRelativePositionToParentWindowEnabled');
                    expect(false).assertTrue();
                    await windowClass2.destroyWindow();
                    done();
                } catch (err) {
                    err = err as BusinessError;
                    hilog.error(domain, tag,`${caseName} failed dialog window, err: ${JSON.stringify(err)}`);
                    await windowClass2.destroyWindow();
                    if(err.code === 801){
                        expect(err.message!=null).assertTrue();
                        done();
                    } else{
                        expect(err.code).assertEqual(1300004);
                        expect(err.message!=null).assertTrue();
                    }
                }

                // 悬浮窗
                let config2: window.Configuration = {
                    name: "floatWindow",
                    windowType: window.WindowType.TYPE_FLOAT,
                    ctx: context!
                };
                let subWindowClass: window.Window | undefined;
                hilog.info(domain, tag,`${caseName} Succeeded in creating the float window.`);
                try {
                    window.createWindow(config2).then((data:window.Window) => {
                        (async () => {
                        subWindowClass = data;
                        await subWindowClass!.setRelativePositionToParentWindowEnabled(true);
                        hilog.info(domain, tag,caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
                        await subWindowClass!.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,`${caseName} Failed float window. Cause code: ${err.code}, message: ${err.message}`);
                        await subWindowClass!.destroyWindow();
                        if (err.code === 801) {
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            expect(err.code).assertEqual(1300004);
                            expect(err.message!=null).assertTrue();
                            done();
                        }
                        })().awaitSync()
                    });
                } catch (e) {
                    hilog.error(domain, tag,`${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
                    await subWindowClass!.destroyWindow();
                    expect(false).assertTrue();
                    done()
                }
            } else {
                done()
            }
        })


        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0400
         * @tc.name      testSetRelativePositionToParentWindowEnabled_Static
         * @tc.desc      验证子窗设置enable=true，子窗和主窗左上角重合
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabled_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabled_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabled');
            hilog.info(domain, tag,caseName + 'Succeed in createSubWindow');
            await windowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,caseName + 'Succeed in setUIContent');
            await windowClass.showWindow();
            hilog.info(domain, tag,caseName + 'Succeed in showWindow');
            windowClass.resizeAsync(1000,1000)
            hilog.info(domain, tag,caseName + 'Succeed in resizeAsync');
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs(mainTop-subTop)).assertLessOrEqual(1);
                        expect(Math.abs(mainLeft-subLeft)).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error) :PromiseLike<void>|undefined=> {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0500
         * @tc.name      testSetRelativePositionToParentWindowUnEnabled_Static
         * @tc.desc      验证子窗设置enable=false，子窗和主窗左上角不重合
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowUnEnabled_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowUnEnabled_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowUnEnabled');
            hilog.info(domain, tag,caseName + 'Succeed in createSubWindow');
            await windowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,caseName + 'Succeed in setUIContent');
            await windowClass.showWindow();
            hilog.info(domain, tag,caseName + 'Succeed in showWindow');
            windowClass.resizeAsync(1000,1000)
            hilog.info(domain, tag,caseName + 'Succeed in resizeAsync');
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(false).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainWindowProperties.windowRect.left},mainTop:${mainWindowProperties.windowRect.top}`);
                        hilog.info(domain, tag,`${caseName} subLeft: ${subWindowProperties.windowRect.left},subTop:${subWindowProperties.windowRect.top}`);
                        expect(Math.abs(mainWindowProperties.windowRect.left-subWindowProperties.windowRect.left)).assertLarger(0);
                        expect(Math.abs(mainWindowProperties.windowRect.top-subWindowProperties.windowRect.top)).assertLarger(0);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number  SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0600
         * @tc.name    testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static
         * @tc.desc    验证子窗设置enable=true，anchor=TOP_START，子窗位于主窗左上角
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs(mainTop-subTop)).assertLessOrEqual(1);
                        expect(Math.abs(mainLeft-subLeft)).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0700
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static
         * @tc.desc     验证子窗设置enable=true，anchor=TOP，子窗位于主窗上边界横向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTop');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs(mainTop-subTop)).assertLessOrEqual(1);
                        expect(Math.abs(mainLeft - subLeft)).assertEqual(Math.abs((mainWidth + mainLeft)-(subWidth + subLeft)));
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0800
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static
         * @tc.desc     验证子窗设置enable=true，anchor=TOP_END，子窗位于主窗右上角
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_END).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs(mainTop-subTop)).assertLessOrEqual(1);
                        expect(Math.abs((mainLeft + mainWidth)-(subLeft + subWidth))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0900
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static
         * @tc.desc     验证子窗设置enable=true，anchor=START，子窗位于主窗左边界纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.START).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs(mainLeft-subLeft)).assertLessOrEqual(1);
                        expect(Math.abs((subTop+subHeight/2)-(mainTop+mainHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1000
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static
         * @tc.desc     验证子窗设置enable=true，anchor=CENTER，子窗位于主窗窗口横向和纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorCenter');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.CENTER).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs((mainLeft + mainWidth/2))-(subLeft+subWidth/2)).assertLessOrEqual(1)
                        expect(Math.abs((subTop+subHeight/2)-(mainTop+mainHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1100
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static
         * @tc.desc     验证子窗设置enable=true，anchor=END，子窗位于主窗右边界纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.END).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs((mainLeft + mainWidth)-(subLeft + subWidth))).assertLessOrEqual(1);
                        expect(Math.abs((mainTop + mainHeight/2)-(subTop+subHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1200
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static
         * @tc.desc     验证子窗设置enable=true，anchor=BOTTOM_START，子窗位于主窗左下角
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_START).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(mainLeft).assertEqual(subLeft);
                        expect( Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1300
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static
         * @tc.desc     验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottom');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs((mainLeft + mainWidth/2)-(subLeft+subWidth/2))).assertLessOrEqual(1);
                        expect(Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1400
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static
         * @tc.desc      验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向右顶点
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_END).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(Math.abs((mainWidth + mainLeft)-(subWidth + subLeft))).assertLessOrEqual(1);
                        expect(Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1500
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static
         * @tc.desc      验证offsetX为正，offsetY为正可以设置成功
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, 100).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(subLeft).assertEqual(mainLeft + 100);
                        expect(subTop).assertEqual(mainTop + 100);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1600
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static
         * @tc.desc     验证offsetX为正，offsetY为负可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, -100).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(subLeft).assertEqual(mainLeft + 100);
                        expect(subTop).assertEqual(Math.abs(mainTop - 100));
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1700
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static
         * @tc.desc     验证offsetX为负，offsetY为正可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, 100).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
                        expect(subTop).assertEqual(mainTop + 100);
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1800
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static
         * @tc.desc     验证offsetX为负，offsetY为负可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, -100).then(() => {
                        (async () => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} mainLeft: ${mainLeft},mainTop:${mainTop},mainWidth:${mainWidth},mainHeight:${mainHeight}`);
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        hilog.info(domain, tag,`${caseName} subLeft: ${subLeft},subTop:${subTop},subWidth:${subWidth},subHeight:${subHeight}`);
                        expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
                        expect(subTop).assertEqual(Math.abs(mainTop - 100));
                        await windowClass.destroyWindow();
                        done();
                        })().awaitSync()
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                        })().awaitSync()
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code === 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0100
         * @tc.name        testSetDragKeyFramePolicy_EnableWithDefaultValue_Static
         * @tc.desc        Test the function when enable with default value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_EnableWithDefaultValue_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_EnableWithDefaultValue_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0200
         * @tc.name        testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static
         * @tc.desc        Test the function when enable with not default value_Static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: 200,
                distance: 2000,
                animationDuration: 200,
                animationDelay: 200
            };
            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    hilog.info(domain, tag,`${message} Succeeded in setting key enable: ${ret.enable}`);
                    hilog.info(domain, tag,`${message} Succeeded in setting key interval: ${ret.interval}`);
                    hilog.info(domain, tag,`${message} Succeeded in setting key distance: ${ret.distance}`);
                    hilog.info(domain, tag,`${message} Succeeded in setting key animationDuration: ${ret.animationDuration}`);
                    hilog.info(domain, tag,`${message} Succeeded in setting key animationDelay: ${ret.animationDelay}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    expect(ret.interval).assertEqual(keyFramePolicy.interval);
                    expect(ret.distance).assertEqual(keyFramePolicy.distance);
                    expect(ret.animationDuration).assertEqual(keyFramePolicy.animationDuration);
                    expect(ret.animationDelay).assertEqual(keyFramePolicy.animationDelay);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0400
         * @tc.name        testSetDragKeyFramePolicy_NegativeValueFail_Static
         * @tc.desc        Test the function when failed with negative value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_NegativeValueFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_NegativeValueFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: -200,
                distance: -2000,
                animationDuration: -200,
                animationDelay: -200
            };
            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                        expect(err.code).assertEqual(1300016);
                        expect(err.message!=null).assertTrue();
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0500
         * @tc.name        testSetDragKeyFramePolicy_ZeroValueFail_Static
         * @tc.desc        Test the function when failed with zero value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_ZeroValueFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_ZeroValueFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: 0,
                distance: 0,
                animationDuration: 0,
                animationDelay: 0
            };
            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        hilog.error(domain, tag,`${message} Failed in Promise with error: ${JSON.stringify(err)}`);
                        expect(err.code).assertEqual(1300016);
                        expect(err.message!=null).assertTrue();
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed sync with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0600
         * @tc.name        testSetDragKeyFramePolicy_SubWindowFail_Static
         * @tc.desc        Test the function when failed with subWindow
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_SubWindowFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_SubWindowFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            let subWindowClass: window.Window | undefined = await windowStage!.createSubWindow(message);
            if (subWindowClass === undefined) {
                hilog.error(domain, tag,`${message} Fail to createSubWindow`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            } finally {
                await Utils.msSleep(1000);
                await subWindowClass.destroyWindow();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0700
         * @tc.name        testSetDragKeyFramePolicy_1300002_Static
         * @tc.desc        Test the function when failed with 1300002
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_1300002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_1300002_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            let subWindowClass: window.Window | undefined = await windowStage!.createSubWindow(message);
            if (subWindowClass === undefined) {
                hilog.error(domain, tag,`${message} Fail to createSubWindow`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                await subWindowClass.destroyWindow();
                await Utils.msSleep(500);
                subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0800
         * @tc.name        testSetDragKeyFramePolicy_Disable_Static
         * @tc.desc        Test the function when disable
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       LEVEL0
         */
        it('testSetDragKeyFramePolicy_Disable_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_Disable_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: false
            };
            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SET_WINDOW_SHADOW_ENABLED_WITH_DESTROYED_SUBWINDOW_Static
         * @tc.name        testSetWindowShadowEnabledwithDestroyedSubwindow_Static
         * @tc.desc        验证setWindowShadowEnabled接口抛1300002错误码
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testSetWindowShadowEnabledwithDestroyedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let CaseName:string = 'testSetWindowShadowEnabledwithDestroyedSubwindow_Static';
            let subWindow:window.Window = await windowStage!.createSubWindow('testSetWindowShadowEnabledwithDestroyedSubwindow');
            await Utils.msSleep(200);
            await subWindow.destroyWindow();
            try {
                let promise = subWindow.setWindowShadowEnabled(false);
                promise.then(()=>{
                    hilog.info(domain, tag,CaseName + ' setWindowShadowEnabled success ');
                    expect(false).assertTrue();
                    done();
                }).catch((err:Error):PromiseLike<void>|undefined=>{
                    hilog.error(domain, tag,CaseName + ' failed,caused: err.code '+err.code +' ,err.message: '+err.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                })
            }catch (err) {
                hilog.error(domain, tag,CaseName + ' failed, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number       SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_Static_0100
         * @tc.name         testSetWindowShadowEnabledwithPermission_Static
         * @tc.desc         验证非2in1设备调用接口报801，2in1设备调用成功
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('testSetWindowShadowEnabledwithPermission_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowShadowEnabledwithPermission_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowShadowEnabled(true).then(() => {
                    hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number       SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_Static_0300
         * @tc.name         testSetWindowShadowEnabledwithUnsupportedSubwindow_Static
         * @tc.desc         验证子窗调用接口报1300004
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('testSetWindowShadowEnabledwithUnsupportedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowShadowEnabledwithUnsupportedSubwindow_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testSetWindowShadowEnabledwithUnsupportedSubwindow');
            try {
                windowClass.setWindowShadowEnabled(true).then(() => {
                    (async () => {
                        hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                        await windowClass.destroyWindow()
                        expect(false).assertTrue();
                        done()
                    })().awaitSync()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    (async () => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    await windowClass.destroyWindow()
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        done();
                    }
                    })().awaitSync()
                });
            } catch (exception) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                await windowClass.destroyWindow()
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testShiftAppWindowTouchEvent_1300002_static
         * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_static_0300
         * @tc.desc   testShiftAppWindowTouchEvent_1300002_static
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testShiftAppWindowTouchEvent_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testShiftAppWindowTouchEvent_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testShiftAppWindowTouchEvent_1300002_static');
            await Utils.msSleep(200);
            await subWindowClass.resize(1000, 1000);
            await Utils.msSleep(300);
            await subWindowClass.setUIContent("pages/index2");
            await Utils.msSleep(200);
            await subWindowClass.showWindow();
            await Utils.msSleep(1000);
            let subWindowId:int = subWindowClass.getWindowProperties().id;
            console.log(`${caseName} subWindowId: ${JSON.stringify(subWindowId)}`);
            try {
                window.shiftAppWindowTouchEvent(subWindowId, 20000, 123).then(() => {
                    (async () => {
                        await subWindowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })().awaitSync()
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    (async () => {
                    console.error(msgStr+'shiftAppWindowTouchEvent : ' + err.code + ',message:' + err.message)
                    await subWindowClass.destroyWindow();
                    if (err.code === 801) {
                        done();
                    } else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }
                    })().awaitSync()
                })
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
                await subWindowClass.destroyWindow();
                if (err.code === 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        })
        /**
         * @tc.name   testShiftAppWindowFocus_Function_Promise_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_0100
         * @tc.desc   Test the function value of shiftAppWindowFocus
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testShiftAppWindowFocus_Function_Promise_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testShiftAppWindowFocus_Function_Promise_static';
            console.log(msgStr + 'begin');
            try {
                console.log(msgStr + 'try begin')
                let sourceWindowId = 40;
                let targetWindowId = 41;
                let promise = window.shiftAppWindowFocus(sourceWindowId, targetWindowId);
                promise.then(() => {
                    console.log(msgStr + 'Succeeded in shifting app window focus');
                    done();
                }).catch((error: Error):PromiseLike<void>|undefined => {
                    console.log(msgStr + 'Failed to shift app window focus1. Cause:' + JSON.stringify(error));
                    if (error.code === 801 || error.code === 1300002) {
                        done()
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.log(msgStr + 'Failed to shift app window focus2. Cause:' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   test_setSupportedWindowModes_threeElement_static
         * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_static_0100
         * @tc.desc   传参三个元素
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('test_setSupportedWindowModes_threeElement_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                const message:string = 'test_setSupportedWindowModes_threeElement_static'
                let windowStageStart:window.WindowStage = await startAbility(message, context!)
                let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
                    bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING]);
                promise.then(async() => {
                    console.info('Succeed in setting window support modes');
                    await terminateAbility(message);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    (async () => {
                    console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
                    await terminateAbility(message);
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        console.error(`The device not support setSupportedWindowModes`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                    })().awaitSync()
                });
            } catch (err) {
                console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
                expect(false).assertTrue();
                done();
            }
            ;
        });
        /**
         * @tc.name   testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen_static
         * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_static_0200
         * @tc.desc   验证setSupportedWindowModes接口传入错误入参抛1300016错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen_static";
            console.log(caseName + "begin");
            let options: StartOptions = {
                supportWindowModes: [
                    bundleManager.SupportWindowMode.SPLIT,
                    bundleManager.SupportWindowMode.FULL_SCREEN,
                    bundleManager.SupportWindowMode.FLOATING
                ]
            };
            try {
                let windowStage = await startAbility(caseName, context!, options);
                await Utils.msSleep(200);
                let promise = windowStage!.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING,
                    bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FULL_SCREEN,], true);
                promise.then(() => {
                    console.info(caseName + ' Succeeded in setting window support modes');
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: Error):PromiseLike<void>|undefined => {
                    console.error(caseName + `Failed to set window support modes. Cause code: ${err.code}, message: ${err.message}`);
                    await terminateAbility(caseName);
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        done();
                    } else {
                        expect(err.code).assertEqual(1300016)
                        expect(err.message != null).assertTrue();
                        done();
                    }

                });
            } catch (error) {
                console.error(caseName + ' Failed. Cause:' + JSON.stringify(error));
                await terminateAbility(caseName);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_FUNCTION_FREEWINDOWMODE_static_0300
         * @tc.name       testOnOffFreeWindowModeChangewithdestoryedSubwindow_static
         * @tc.desc       验证子窗口销毁后onFreeWindowModeChange和offFreeWindowModeChange监听接口抛1300002错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testOnOffFreeWindowModeChangewithdestoryedSubwindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnOffFreeWindowModeChangewithdestoryedSubwindow_static ';
            let subWindowClass: window.Window;
            let subWindowClass2: window.Window;
            subWindowClass = await windowStage!.createSubWindow('testOnOffFreeWindowModeChangewithdestoryedSubwindow1');
            subWindowClass2 = await windowStage!.createSubWindow('testOnOffFreeWindowModeChangewithdestoryedSubwindow2');
            await subWindowClass.destroyWindow();
            await subWindowClass2.destroyWindow();
            try {
                const callback = (res: boolean) => {
                    console.log(caseName + ' callback result: ' + res);
                }
                subWindowClass.onFreeWindowModeChange(callback)
                expect(true).assertFail()
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
            }
            try {
                const callback = (res: boolean) => {
                    console.log(caseName + ' callback result: ' + res);
                }
                subWindowClass.offFreeWindowModeChange(callback)
                expect(true).assertFail()
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002)
                done();
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWTITLEBUTTONVISIBLE_001
         * @tc.name      testSetWindowTitleButtonVisible001
         * @tc.desc      Test setWindowTitleButtonVisible function with three parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTitleButtonVisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testSetWindowTitleButtonVisible001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowTitleButtonVisible(false, false, false);
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible false success');
                windowClass.setWindowTitleButtonVisible(true, true, true);
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible true success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWTITLEBUTTONVISIBLE_002
         * @tc.name      testSetWindowTitleButtonVisible002
         * @tc.desc      Test setWindowTitleButtonVisible with error code 1300004.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTitleButtonVisible002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowTitleButtonVisible002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            let windowConfig: window.Configuration = {
                name: "testSetWindowTitleButtonVisible002",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let tempWnd: window.Window | undefined;

            try {
                tempWnd = await window.createWindow(windowConfig);
                expect(!!tempWnd).assertTrue();
                hilog.info(domain, tag, msgStr + 'create window success');
                await tempWnd!.setUIContent("pages/index2");
                await tempWnd!.showWindow();

                tempWnd!.setWindowTitleButtonVisible(true, true, true);
                hilog.error(domain, tag, msgStr + 'setWindowTitleButtonVisible should throw error');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                if (exception.code === 801) {
                    hilog.info(domain, tag, msgStr + '此设备不支持setWindowTitleButtonVisible能力.');
                    if (tempWnd) {
                        await tempWnd!.destroyWindow();
                    }
                    done();
                } else {
                    expect(exception.code).assertEqual(1300004);
                    if (tempWnd) {
                        await tempWnd!.destroyWindow();
                    }
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_001
         * @tc.name      testStartMoving001
         * @tc.desc      Test startMoving function without parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMoving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMoving001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving();
                hilog.info(domain, tag, msgStr + 'startMoving success');
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else if(error.code === 1300004){
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_003
         * @tc.name      testStartMovingErrCode1300002
         * @tc.desc      Test startMoving with error code 1300002.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMovingErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStartMovingErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.startMoving();
                hilog.error(domain, tag, msgStr + 'startMoving should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else if(e.code === 1300002) {
                    done();
                } else{
                    expect(false).assertTrue();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_002
         * @tc.name      testStartMoving002
         * @tc.desc      Test startMoving function with offset parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMoving002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMoving002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving(100, 50);
                hilog.info(domain, tag, msgStr + 'startMoving with offset success');
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else if(error.code === 1300004){
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

         /**
          * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_007
          * @tc.name      testStartMovingWithOffsetErrCode1300002
          * @tc.desc      Test startMoving(offsetX, offsetY) with error code 1300002 (abnormal window state).
          * @tc.size      MediumTest
          * @tc.type      Function
          * @tc.level     Level3
          */
        it('testStartMovingWithOffsetErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingWithOffsetErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStartMovingWithOffsetErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.startMoving(100, 50);
                hilog.error(domain, tag, msgStr + 'startMoving with offset should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_009
         * @tc.name      testStartMovingWithOffsetErrCode401
         * @tc.desc      Test startMoving(offsetX, offsetY) with error code 401 (invalid parameter < 0).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMovingWithOffsetErrCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingWithOffsetErrCode401';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving(-1, 50);
                hilog.error(domain, tag, msgStr + 'startMoving with offset should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(401);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STOPMOVING_001
         * @tc.name      testStopMoving001
         * @tc.desc      Test stopMoving function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStopMoving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStopMoving001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STOPMOVING_002
         * @tc.name      testStopMovingErrCode1300002
         * @tc.desc      Test stopMoving with error code 1300002.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStopMovingErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStopMovingErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStopMovingErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.stopMoving();
                hilog.error(domain, tag, msgStr + 'stopMoving should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONWINDOWTITLEBUTTONRECTCHANGE_001
         * @tc.name      testOnWindowTitleButtonRectChange001
         * @tc.desc      Test onWindowTitleButtonRectChange function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnWindowTitleButtonRectChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): void => {
            let caseName: string = 'testOnWindowTitleButtonRectChange001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                let callbackInvoked: boolean = false;

                let callback: Callback<window.TitleButtonRect> = (titleButtonRect: window.TitleButtonRect) => {
                    callbackInvoked = true;
                    expect(titleButtonRect.right === 0).assertTrue()
                    expect(titleButtonRect.top === 0).assertTrue()
                    expect(titleButtonRect.width !== 0).assertTrue()
                    expect(titleButtonRect.height !== 0).assertTrue()
                    hilog.info(domain, tag, msgStr + 'onWindowTitleButtonRectChange callback invoked: ' + JSON.stringify(titleButtonRect));
                };

                windowClass.onWindowTitleButtonRectChange(callback);
                hilog.info(domain, tag, msgStr + 'onWindowTitleButtonRectChange registered success');

                await Utils.msSleep(500)
                windowClass.setWindowTitleButtonVisible(false, true, true)
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible success');
                await Utils.msSleep(500)

                windowClass.offWindowTitleButtonRectChange(callback);
                hilog.info(domain, tag, msgStr + 'offWindowTitleButtonRectChange success');

                windowClass.setWindowTitleButtonVisible(true, true, true)
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETPARENTWINDOW_002
         * @tc.name      testSetParentWindowErrCode1300004
         * @tc.desc      Test setParentWindow with error code 1300004 (main window cannot set parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetParentWindowErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetParentWindowErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindowId: int = mainWindow.getWindowProperties().id;
                await mainWindow.setParentWindow(parentWindowId);
                hilog.error(domain, tag, msgStr + 'setParentWindow should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETPARENTWINDOW_003
         * @tc.name      testSetParentWindowErrCode1300009
         * @tc.desc      Test setParentWindow with error code 1300009 (sub window cannot set main window as parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetParentWindowErrCode1300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetParentWindowErrCode1300009';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            let subWin: window.Window | undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetParentWindowErrCode1300009');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let mainWindowId: int = mainWindow.getWindowProperties().id;

                await subWin.setParentWindow(mainWindowId);
                hilog.error(domain, tag, msgStr + 'setParentWindow should throw error');
                expect(false).assertTrue();
                await subWin.destroyWindow();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (subWin) {
                    await subWin.destroyWindow();
                }
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300009);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_GETPARENTWINDOW_001
         * @tc.name      testGetParentWindow001
         * @tc.desc      Test getParentWindow function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetParentWindow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetParentWindow001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testGetParentWindow001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindowId: int = mainWindow.getWindowProperties().id;

                let parentWindow: window.Window = subWin.getParentWindow();
                hilog.info(domain, tag, msgStr + 'getParentWindow success, parentWindowId: ' + parentWindow.getWindowProperties().id);

                expect(parentWindow.getWindowProperties().id).assertEqual(parentWindowId);

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_GETPARENTWINDOW_002
         * @tc.name      testGetParentWindowErrCode1300004
         * @tc.desc      Test getParentWindow with error code 1300004 (main window cannot get parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetParentWindowErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testGetParentWindowErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindow: window.Window = mainWindow.getParentWindow();
                hilog.error(domain, tag, msgStr + 'getParentWindow should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETTITLEANDDOCKHOVERSHOWN_001
         * @tc.name      testSetTitleAndDockHoverShown001
         * @tc.desc      Test setTitleAndDockHoverShown function with two parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetTitleAndDockHoverShown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetTitleAndDockHoverShown001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.setTitleAndDockHoverShown(false, false);
                hilog.info(domain, tag, msgStr + 'setTitleAndDockHoverShown success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWDELAYRAISEONDRAG_001
         * @tc.name      testSetWindowDelayRaiseOnDrag001
         * @tc.desc      Test setWindowDelayRaiseOnDrag function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowDelayRaiseOnDrag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testSetWindowDelayRaiseOnDrag001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowDelayRaiseOnDrag(false);
                hilog.info(domain, tag, msgStr + 'setWindowDelayRaiseOnDrag success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ISINFREEWINDOWMODE_002
         * @tc.name      testIsInFreeWindowModeErrCode1300002
         * @tc.desc      Test isInFreeWindowMode with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testIsInFreeWindowModeErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsInFreeWindowModeErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testIsInFreeWindowModeErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                let isFreeMode: boolean = subWin.isInFreeWindowMode();
                hilog.error(domain, tag, msgStr + 'isInFreeWindowMode should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFFREEWINDOWMODECHANGE_001
         * @tc.name      testOffFreeWindowModeChange001
         * @tc.desc      Test offFreeWindowModeChange function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffFreeWindowModeChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffFreeWindowModeChange001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                let callback1: Callback<boolean> = (isInFreeWindowMode: boolean) => {
                    hilog.info(domain, tag, msgStr + 'callback1 invoked, isInFreeWindowMode: ' + isInFreeWindowMode);
                };

                let callback2: Callback<boolean> = (isInFreeWindowMode: boolean) => {
                    hilog.info(domain, tag, msgStr + 'callback2 invoked, isInFreeWindowMode: ' + isInFreeWindowMode);
                };

                windowClass.onFreeWindowModeChange(callback1);
                windowClass.onFreeWindowModeChange(callback2);
                hilog.info(domain, tag, msgStr + 'onFreeWindowModeChange registered 2 callbacks');

                windowClass.offFreeWindowModeChange(callback1);
                hilog.info(domain, tag, msgStr + 'offFreeWindowModeChange with callback1 success');

                windowClass.offFreeWindowModeChange(callback2);
                hilog.info(domain, tag, msgStr + 'offFreeWindowModeChange with callback2 success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });


        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_001
         * @tc.name      testSetSupportedWindowModes001
         * @tc.desc      Test setSupportedWindowModes function with one parameter.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [

                ];
                await windowStage!.setSupportedWindowModes(modes);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(401);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_002
         * @tc.name      testSetSupportedWindowModes002
         * @tc.desc      Test setSupportedWindowModes function with two parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [

                ];
                await windowStage!.setSupportedWindowModes(modes, true);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes with grayOutMaximizeButton success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(1300016);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_004
         * @tc.name      testSetSupportedWindowModes003
         * @tc.desc      Test setSupportedWindowModes function with grayOutMaximizeButton false.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes003';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [
                    bundleManager.SupportWindowMode.FULL_SCREEN,
                    bundleManager.SupportWindowMode.SPLIT,
                    bundleManager.SupportWindowMode.FLOATING
                ];
                await windowStage!.setSupportedWindowModes(modes, false);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes with grayOutMaximizeButton false success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_001
         * @tc.name      testOnSubWindowClose001
         * @tc.desc      Test onSubWindowClose function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSubWindowClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOnSubWindowClose001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered success');

                subWin.offSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_002
         * @tc.name      testOnSubWindowCloseErrCode1300002
         * @tc.desc      Test onSubWindowClose with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowCloseErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSubWindowCloseErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOnSubWindowCloseErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'onSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_003
         * @tc.name      testOnSubWindowCloseErrCode1300004
         * @tc.desc      Test onSubWindowClose with error code 1300004 (main window unauthorized).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowCloseErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOnSubWindowCloseErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                mainWindow.onSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'onSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_001
         * @tc.name      testOffSubWindowClose001
         * @tc.desc      Test offSubWindowClose function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowClose001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback1: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback1 invoked');
                };

                let callback2: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback2 invoked');
                };

                subWin.onSubWindowClose(callback1);
                subWin.onSubWindowClose(callback2);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered 2 callbacks');

                subWin.offSubWindowClose(callback1);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose with callback1 success');

                subWin.offSubWindowClose(callback2);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose with callback2 success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_002
         * @tc.name      testOffSubWindowClose002
         * @tc.desc      Test offSubWindowClose function without callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowClose002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowClose002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered success');

                subWin.offSubWindowClose();
                hilog.info(domain, tag, msgStr + 'offSubWindowClose without callback success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_003
         * @tc.name      testOffSubWindowCloseErrCode1300002
         * @tc.desc      Test offSubWindowClose with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowCloseErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowCloseErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowCloseErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback invoked');
                };

                subWin.offSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'offSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFWINDOWWILLCLOSE_001
         * @tc.name      testOffWindowWillClose001
         * @tc.desc      Test offWindowWillClose function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffWindowWillClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffWindowWillClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                const callback1 = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = true;
                        resolve(result);
                    });
                }

                const callback2 = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = false;
                        resolve(result);
                    });
                }

                windowClass.onWindowWillClose(callback1);
                windowClass.onWindowWillClose(callback2);
                hilog.info(domain, tag, msgStr + 'onWindowWillClose registered 2 callbacks');

                windowClass.offWindowWillClose(callback1);
                hilog.info(domain, tag, msgStr + 'offWindowWillClose with callback1 success');

                windowClass.offWindowWillClose(callback2);
                hilog.info(domain, tag, msgStr + 'offWindowWillClose with callback2 success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFWINDOWWILLCLOSE_002
         * @tc.name      testOffWindowWillClose002
         * @tc.desc      Test offWindowWillClose function without callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffWindowWillClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffWindowWillClose002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                const callback = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = false;
                        resolve(result);
                    });
                }

                windowClass.onWindowWillClose(callback);
                hilog.info(domain, tag, msgStr + 'onWindowWillClose registered success');

                windowClass.offWindowWillClose();
                hilog.info(domain, tag, msgStr + 'offWindowWillClose without callback success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
     * @tc.number    SUB_WINDOW_SETWINDOWDECORVISIBLE_FALSE_0100
     * @tc.name      testSetWindowDecorVisibleFalse_static
     * @tc.desc      test setWindowDecorVisible with false parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowDecorVisibleFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowDecorVisibleFalse_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(false);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible with false success');

          await Utils.msSleep(100);

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETWINDOWDECORVISIBLE_ERRCODE_1300002
     * @tc.name      testSetWindowDecorVisibleErrCode1300002_static
     * @tc.desc      test setWindowDecorVisible with error code 1300002.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowDecorVisibleErrCode1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowDecorVisibleErrCode1300002_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window =
            await windowStage!.createSubWindow('testSetWindowDecorVisibleErrCode1300002_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          expect(!!subWin).assertTrue();

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          subWin.setWindowDecorVisible(true);
          hilog.error(domain, tag, caseName + ' Succeeded in calling setWindowDecorVisible');
          expect(false).assertTrue();
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.info(domain, tag, msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
          if (e.code === 1300002) {
            hilog.info(domain, tag, caseName + ' window state abnormal, code: ' + e.code);
            done();
          } else if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORVISIBLE_RETURN_TRUE_0100
     * @tc.name      testGetWindowDecorVisibleReturnTrue_static
     * @tc.desc      test getWindowDecorVisible return value true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorVisibleReturnTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorVisibleReturnTrue_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(true);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible to true');

          await Utils.msSleep(100);

          let isVisible: boolean = win!.getWindowDecorVisible();
          hilog.info(domain, tag, caseName + ' getWindowDecorVisible result: ' + isVisible);

          if (isFreeWindowMode) {
            expect(isVisible).assertTrue();
          }

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORVISIBLE_RETURN_FALSE_0100
     * @tc.name      testGetWindowDecorVisibleReturnFalse_static
     * @tc.desc      test getWindowDecorVisible return value false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorVisibleReturnFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorVisibleReturnFalse_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(false);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible to false');

          await Utils.msSleep(100);

          let isVisible: boolean = win!.getWindowDecorVisible();
          hilog.info(domain, tag, caseName + ' getWindowDecorVisible result: ' + isVisible);

          if (isFreeWindowMode) {
            expect(isVisible).assertFalse();
          }
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

      /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORHEIGHT_RETURN_0100
     * @tc.name      testGetWindowDecorHeightReturn_static
     * @tc.desc      test getWindowDecorHeight return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorHeightReturn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorHeightReturn_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let setHeight: int = 50;
          win!.setWindowDecorHeight(setHeight);
          hilog.info(domain, tag, caseName + ' setWindowDecorHeight with height: ' + setHeight);

          await Utils.msSleep(100);

          let getHeight: int = win!.getWindowDecorHeight();
          hilog.info(domain, tag, caseName + ' getWindowDecorHeight result: ' + getHeight);

          if (isFreeWindowMode) {
            expect(Math.abs(setHeight-getHeight)).assertLessOrEqual(1);
          }

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_LIGHT_0100
     * @tc.name      testSetDecorButtonStyleLight_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_LIGHT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleLight_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleLight_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetSetDecorButtonStyleLight_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_LIGHT');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_DARK_0100
     * @tc.name      testSetDecorButtonStyleDark_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_DARK.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleDark_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleDark_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetDecorButtonStyleDark_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_DARK');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_NOTSET_0100
     * @tc.name      testSetDecorButtonStyleNotSet_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_NOT_SET.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleNotSet_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleNotSet_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetDecorButtonStyleNotSet_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_NOT_SET');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_ERRCODE_1300002
     * @tc.name      testSetDecorButtonStyleErrCode1300002_static
     * @tc.desc      test setDecorButtonStyle with error code 1300002.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleErrCode1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        (async () => {
        let caseName: string = 'testSetDecorButtonStyleErrCode1300002_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window =
            await windowStage!.createSubWindow('testSetDecorButtonStyleErrCode1300002_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.error(domain, tag, caseName + ' Succeeded in calling setDecorButtonStyle');
          expect(false).assertTrue();
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.info(domain, tag, msgStr + 'Failed to call setDecorButtonStyle. Cause:' + JSON.stringify(e));
          if (e.code === 1300002) {
            hilog.info(domain, tag, caseName + ' window state abnormal, code: ' + e.code);
            done();
          } else if (e.code === 801) {
            hilog.error(domain, tag, ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        })().awaitSync()
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_ERRCODE_1300004
     * @tc.name      testSetDecorButtonStyleErrCode1300004_static
     * @tc.desc      test setDecorButtonStyle with error code 1300004.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleErrCode1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleErrCode1300004_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        let config: window.Configuration = {
          name: "testSetDecorButtonStyleErrCode1300004_static",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context!
        };
        let subWindowClass: window.Window | undefined;
        hilog.info(domain, tag, `${caseName} Succeeded in creating the float window.`);
        try {
          window.createWindow(config).then((data: window.Window) => {
            (async () => {
            subWindowClass = data;
            hilog.info(domain, tag,
              caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
            await subWindowClass!.setUIContent('pages/index2');
            hilog.info(domain, tag, caseName + ' setUIContent success');
            await subWindowClass!.showWindow();
            hilog.info(domain, tag, caseName + ' showWindow success');
            let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
            let style: window.DecorButtonStyle = {
              colorMode: colorMode,
              buttonBackgroundSize: 28,
              spacingBetweenButtons: 12,
              closeButtonRightMargin: 20,
              buttonIconSize: 20,
              buttonBackgroundCornerRadius: 4
            };
            subWindowClass!.setDecorButtonStyle(style);
            expect(false).assertTrue();
            done();
            })().awaitSync()
          }).catch((err: Error): PromiseLike<void> | undefined => {
            hilog.error(domain, tag,
              `${caseName} Failed float window. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(err.code).assertEqual(1300004);
              expect(err.message != null).assertTrue();
              done();
            }
          });
        } catch (e) {
          hilog.error(domain, tag, `${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
          await subWindowClass!.destroyWindow();
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETDECORBUTTONSTYLE_RETURN_0100
     * @tc.name      testGetDecorButtonStyleReturn_static
     * @tc.desc      test getDecorButtonStyle return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetDecorButtonStyleReturn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetDecorButtonStyleReturn_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testGetDecorButtonStyleReturn_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let setStyle: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(setStyle);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success');

          await Utils.msSleep(100);

          let getStyle: window.DecorButtonStyle = subWin.getDecorButtonStyle();
          hilog.info(domain, tag, caseName + ' getDecorButtonStyle result: ' + JSON.stringify(getStyle));

          expect(getStyle.colorMode).assertEqual(1);
          expect(getStyle.buttonBackgroundSize).assertEqual(setStyle.buttonBackgroundSize);
          expect(getStyle.spacingBetweenButtons).assertEqual(setStyle.spacingBetweenButtons);
          expect(getStyle.closeButtonRightMargin).assertEqual(setStyle.closeButtonRightMargin);
          expect(getStyle.buttonIconSize).assertEqual(setStyle.buttonIconSize);
          expect(getStyle.buttonBackgroundCornerRadius).assertEqual(setStyle.buttonBackgroundCornerRadius);

          let colorMode1: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
          let setStyle1: window.DecorButtonStyle = {
              colorMode: colorMode1
          };
          subWin.setDecorButtonStyle(setStyle1);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success');

          await Utils.msSleep(100);

          let getStyle1: window.DecorButtonStyle = subWin.getDecorButtonStyle();
          hilog.info(domain, tag, caseName + ' getDecorButtonStyle result: ' + JSON.stringify(getStyle1));

          expect(getStyle1.colorMode).assertEqual(-1);

          let colorMode2: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          let setStyle2: window.DecorButtonStyle = {
              colorMode: colorMode2
          };
          subWin.setDecorButtonStyle(setStyle2);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success');

          await Utils.msSleep(100);

          let getStyle2: window.DecorButtonStyle = subWin.getDecorButtonStyle();
          hilog.info(domain, tag, caseName + ' getDecorButtonStyle result: ' + JSON.stringify(getStyle2));

          expect(getStyle2.colorMode).assertEqual(0);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

      /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_GETWINDOW_DECORHEIGHT_JS_API_0100
         * @tc.name        testGetWindowDecorHeight_static_0100
         * @tc.desc        test the function of GetWindowDecorHeight
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testGetWindowDecorHeight_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowDecorHeight_static_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let load3 = await windowStage!.loadContent('pages/index2');
            expect(!Boolean(load3)).assertTrue();
            try {
                let tempWnd: window.Window  = await windowStage!.getMainWindow();
                (tempWnd as window.Window).getWindowDecorHeight()
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage!.getMainWindow, tempWnd: ' + tempWnd);
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
                if (exception.code === 801 || exception.code === 1300002) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
/**
         * @tc.number       testSetWindowDecorVisibleErrCode1300002_0100
         * @tc.name         testSetWindowDecorVisibleErrCode1300002_static_0100
         * @tc.desc         testSetWindowDecorVisibleErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowDecorVisibleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowDecorVisibleErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testSetWindowDecorVisibleErrCode1300002_static_0100')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setWindowDecorVisible(true);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowDecorVisible.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
                        if(e!.code === 1300002){
                            done();
                        }else if(e!.code === 801){
                            done();
                        }else {
                            expect(false).assertTrue();
                            done();
                        }
                    }
                    })().awaitSync()
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number       testSetWindowDecorHeightErrCode1300002_0100
         * @tc.name         testSetWindowDecorHeightErrCode1300002_static_0100
         * @tc.desc         testSetWindowDecorHeightErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowDecorHeightErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowDecorHeightErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testSetWindowDecorHeightErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setWindowDecorHeight(1);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowDecorHeight.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowDecorHeight. Cause:' + JSON.stringify(e));
                        expect(e.code).assertEqual(1300002);
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3200
         * @tc.name        test_setWindowDecorHeight_setDecorButtonStyle_static_0100
         * @tc.desc        test_setWindowDecorHeight_setDecorButtonStyle_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowDecorHeight_setDecorButtonStyle_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setWindowDecorHeight_setDecorButtonStyle_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowClass: window.Window = await windowStage!.getMainWindow();
            try {
                windowClass.setWindowDecorHeight(50);
                hilog.info(0x0000, '[ANI]',msgStr+ `Succeeded in setting the height of window decor`);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
                if(exception.code = 801){
                    done();
                }else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0100
         * @tc.name       testWindowTitleButtonRectChange_on_Function_Callback_static_0100
         * @tc.desc       Test the function of windowTitleButtonRectChange
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testWindowTitleButtonRectChange_on_Function_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testWindowTitleButtonRectChange_on_Function_Callback_static_0100';
            hilog.info(0x0000, '[ANI]',msgStr + "begin on")
            try {
                let windowClass: window.Window = await windowStage!.getMainWindow();
                windowClass.onWindowTitleButtonRectChange((titleButtonRect:window.TitleButtonRect) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window title buttons area changes. Data: ' + JSON.stringify(titleButtonRect));
                    hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: right' + JSON.stringify(titleButtonRect.right));
                    hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: top' + JSON.stringify(titleButtonRect.top));
                    hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: width' + JSON.stringify(titleButtonRect.width));
                    hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: height' + JSON.stringify(titleButtonRect.height));
                    done();
                });
                windowClass.offWindowTitleButtonRectChange();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for window title buttons area changes. Cause: ' + JSON.stringify(err));
                if (err!.code === 801) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });


        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0200
         * @tc.name       testWindowTitleButtonRectChange_off_Function_Callback_static_0200
         * @tc.desc       Test the function of windowTitleButtonRectChange
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testWindowTitleButtonRectChange_off_Function_Callback_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testWindowTitleButtonRectChange_off_Function_Callback_static_0200';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin off');
            try {
                let windowClass: window.Window = await windowStage!.getMainWindow();
                windowClass.offWindowTitleButtonRectChange();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window title buttons area changes');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for window title buttons area changes. Cause: ' + JSON.stringify(error));
                if (error!.code === 1300002) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0300
         * @tc.name        testOnWindowTitleButtonRectChangeErrCode1300002_static_0300
         * @tc.desc        testOnWindowTitleButtonRectChangeErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOnWindowTitleButtonRectChangeErrCode1300002_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnWindowTitleButtonRectChangeErrCode1300002_static_0300";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testOnWindowTitleButtonRectChangeErrCode1300002_static_0300')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onWindowTitleButtonRectChange((res: window.TitleButtonRect) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowTitleButtonRectChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call on windowTitleButtonRectChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        

        /**
         * @tc.number      testSetWindowTitleButtonVisibleErrCode1300004_static_0100
         * @tc.name        testSetWindowTitleButtonVisibleErrCode1300004_static_0100
         * @tc.desc        testSetWindowTitleButtonVisibleErrCode1300004_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowTitleButtonVisibleErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetWindowTitleButtonVisibleErrCode1300004_static_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300004_SubWindow_Promise')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    expect(!!subWin).assertTrue();
                    await (subWin! as window.Window).setUIContent("pages/index2");
                    await (subWin! as window.Window).showWindow();
                    try {
                        (subWin! as window.Window).setWindowTitleButtonVisible(true, true, true);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
                        expect(false).assertTrue();
                        await (subWin!! as window.Window).destroyWindow();
                        done();
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowTitleButtonVisible. Cause:' +
                        JSON.stringify(exception));
                        await (subWin!! as window.Window).destroyWindow();
                        if (exception!.code === 801) {
                            hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持getDecorButtonStyle能力.');
                        } else {
                            expect(exception!.code).assertEqual(1300004);
                        }
                        done();
                    }
                    })().awaitSync()
                })
                .catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number     testSetDecorButtonStyleErrCode1300002_0100
         * @tc.name       testSetDecorButtonStyleErrCode1300002_static_0100
         * @tc.desc       testSetDecorButtonStyleErrCode1300002_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetDecorButtonStyleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetDecorButtonStyleErrCode1300002_static_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testSetDecorButtonStyleErrCode1300002_static_0100')
                .then((data: window.Window) => {
                    (async () => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        let param: window.DecorButtonStyle = {
                            buttonBackgroundSize: 1
                        }
                        subWin!.setDecorButtonStyle(param);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setDecorButtonStyle.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setDecorButtonStyle. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                    })().awaitSync()
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
        
        })

        /**
         * @tc.number      testSetDecorButtonStyleErrCode1300004_static_0100
         * @tc.name        testSetDecorButtonStyleErrCode1300004_static_0100
         * @tc.desc        testSetDecorButtonStyleErrCode1300004_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetDecorButtonStyleErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetDecorButtonStyleErrCode1300004_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let style: window.DecorButtonStyle = {
                colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT,
                buttonBackgroundSize: 28,
                spacingBetweenButtons: 12,
                closeButtonRightMargin: 20,
                buttonIconSize: 20,
                buttonBackgroundCornerRadius: 4
            };
            let windowConfig: window.Configuration = {
                name: "testSetDecorButtonStyleErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let tempWnd: window.Window | undefined;
            tempWnd = await window.createWindow(windowConfig);
            expect(!!tempWnd).assertTrue();
            await (tempWnd! as window.Window).setUIContent("pages/index2");
            await (tempWnd! as window.Window).showWindow();
            try {
                // let param: window.DecorButtonStyle = {}
                (tempWnd as window.Window).setDecorButtonStyle(style);
                hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setDecorButtonStyle.');
                await (tempWnd! as window.Window).destroyWindow();
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setDecorButtonStyle. Cause:' + JSON.stringify(exception));
                await (tempWnd! as window.Window).destroyWindow();
                if (exception!.code === 801) {
                    hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持setDecorButtonStyle能力.');
                } else {
                    expect(exception!.code).assertEqual(1300004);
                }
                done();
            }
        })

        /**
         * @tc.number     SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_static_3500
         * @tc.name       testSetDecorButtonStyle_buttonIconSize_static_0100
         * @tc.desc       testSetDecorButtonStyle_buttonIconSize_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it("testSetDecorButtonStyle_buttonIconSize_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testSetDecorButtonStyle_buttonIconSize_static_0100";
            hilog.info(domain, tag,msgStr + "begin");
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                let param: window.DecorButtonStyle = {
                    buttonIconSize: 15
                }
                windowClass.setDecorButtonStyle(param);
                hilog.info(domain, tag,`${msgStr} setDecorButtonStyle success.`);
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag,msgStr + ' Failed. Cause:'+JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(401);
                    let result = windowClass.getDecorButtonStyle();
                    hilog.info(domain, tag,`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
                    expect(result.buttonIconSize).assertEqual(20);
                    done();
                       
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_static_3900
         * @tc.name       testSetDecorButtonStyle_buttonBackgroundCornerRadius_static_0100
         * @tc.desc       testSetDecorButtonStyle_buttonBackgroundCornerRadius_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it("testSetDecorButtonStyle_buttonBackgroundCornerRadius_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr = "testSetDecorButtonStyle_buttonBackgroundCornerRadius_static_0100";
            hilog.info(domain, tag,msgStr + "begin");
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                let param: window.DecorButtonStyle = {
                    buttonBackgroundCornerRadius: 3
                }
                windowClass.setDecorButtonStyle(param);
                hilog.error(domain, tag,`${msgStr} setDecorButtonStyle success.`);
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag,msgStr + ' Failed. Cause:'+JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(401);
                    let result = windowClass.getDecorButtonStyle();
                    hilog.info(domain, tag,`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
                    expect(result.buttonBackgroundCornerRadius).assertEqual(4);
                    done();
                    
                }
            }
        })

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_getWindowDecorVisible_0100
         * @tc.name       test_getWindowDecorVisible_1300002
         * @tc.desc       test_getWindowDecorVisible_1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it("test_getWindowDecorVisible_1300002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr = "test_getWindowDecorVisible_1300002";
            console.log(msgStr + "begin");
            let subWindowClass: window.Window;
            try {
                subWindowClass = await windowStage!.createSubWindow('test_getWindowDecorVisible_1300002');
                expect(!!subWindowClass).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWindowClass));
                await subWindowClass.destroyWindow();
                subWindowClass.getWindowDecorVisible();
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(msgStr + `Failed to getWindowDecorVisible. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code === 801) {
                    console.log(msgStr + '此设备不支持');
                    done();
                } else if(err.code === 1300002){
                    done();
                }else {
                    console.log(msgStr + 'Failed to setWindowMask');
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      testSetWindowTitleMoveEnabledErrCode1300002_0100
         * @tc.name        testSetWindowTitleMoveEnabledErrCode1300002_0100
         * @tc.desc        testSetWindowTitleMoveEnabledErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowTitleMoveEnabledErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowTitleMoveEnabledErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetWindowTitleMoveEnabledErrCode1300002_SubWindow_Promise')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.setWindowTitleMoveEnabled(true);
                console.error(msgStr + 'Succeeded in calling setWindowTitleMoveEnabled.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call setWindowTitleMoveEnabled. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })


        /**
         * @tc.number     testSetWindowTitleMoveEnabledErrCode1300004_0100
         * @tc.name       testSetWindowTitleMoveEnabledErrCode1300004_0100
         * @tc.desc       testSetWindowTitleMoveEnabledErrCode1300004_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowTitleMoveEnabledErrCode1300004_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowTitleMoveEnabledErrCode1300004_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testSetWindowTitleMoveEnabledErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let tempWnd: window.Window | undefined;
            try {
                tempWnd = await window.createWindow(windowConfig);
                expect(!!tempWnd).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(tempWnd));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await tempWnd!.setUIContent("pages/Index");
            await tempWnd!.showWindow();
            try {
                (tempWnd! as window.Window).setWindowTitleMoveEnabled(true);
                console.error(msgStr + 'Succeeded in calling setWindowTitleMoveEnabled.');
                expect(false).assertTrue();
                await (tempWnd! as window.Window).destroyWindow();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call setWindowTitleMoveEnabled. Cause:' +
                JSON.stringify(exception));
                await (tempWnd! as window.Window).destroyWindow();
                if (exception.code === 801) {
                    console.info(msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
                } else {
                    expect(exception.code).assertEqual(1300004);
                }
                done();
            }
        })


        /**
         * @tc.number      testSetWindowTitlePromiseErrCode1300002_0100
         * @tc.name        testSetWindowTitlePromiseErrCode1300002_0100
         * @tc.desc        testSetWindowTitlePromiseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowTitlePromiseErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowTitlePromiseErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;

            try {
                subWin = await windowStage!.createSubWindow('testSetWindowTitlePromiseErrCode1300002_SubWindow_Promise')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                await (subWin! as window.Window).setWindowTitle("titleName").then(async () => {
                    console.info(msgStr + 'Succeeded in calling setWindowTitle.');
                    expect(false).assertTrue();
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call setWindowTitle. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                });
                done()
            } catch (exception) {
                console.error(msgStr + 'Failed to set the call setWindowTitle. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })


        /**
         * @tc.number      testSetWindowTitlePromiseErrCode801_0100
         * @tc.name        testSetWindowTitlePromiseErrCode801_0100
         * @tc.desc        testSetWindowTitlePromiseErrCode801_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowTitlePromiseErrCode801_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowTitlePromiseErrCode801_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;

            try {
                subWin = await windowStage!.createSubWindow('testSetWindowTitlePromiseErrCode801_0100')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            try {
                await (subWin! as window.Window).setWindowTitle("titleName").then(async () => {
                    console.info(msgStr + 'Succeeded in calling setWindowTitle.');
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call setWindowTitle. Cause: ' + JSON.stringify(err));
                    if(err.code === 801){
                        done();
                    }else{
                        expect(err.code).assertEqual(1300002);
                    }
                    
                });
                done()
            } catch (exception) {
                console.error(msgStr + 'Failed to set the call setWindowTitle. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })

        


        /**
         * @tc.number     testGetDecorButtonStyleErrCode1300002_0100
         * @tc.name       testGetDecorButtonStyleErrCode1300002_0100
         * @tc.desc       testGetDecorButtonStyleErrCode1300002_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testGetDecorButtonStyleErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetDecorButtonStyleErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetDecorButtonStyleErrCode1300002_SubWindow_Promise')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.getDecorButtonStyle();
                console.error(msgStr + 'Succeeded in calling getDecorButtonStyle.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call getDecorButtonStyle. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })


        /**
         * @tc.number      testGetDecorButtonStyleErrCode1300004_0100
         * @tc.name        testGetDecorButtonStyleErrCode1300004_0100
         * @tc.desc        testGetDecorButtonStyleErrCode1300004_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetDecorButtonStyleErrCode1300004_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetDecorButtonStyleErrCode1300004_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let config: window.Configuration = {
                name: "test1",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let tempWnd: window.Window | undefined;
            try {
                tempWnd = await window.createWindow(config)
                expect(!!tempWnd).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(tempWnd));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            tempWnd!.setUIContent("pages/Index");
            tempWnd!.showWindow();
            try {
                (tempWnd! as window.Window).getDecorButtonStyle();
                console.error(msgStr + 'Succeeded in calling getDecorButtonStyle.');
                await tempWnd!.destroyWindow();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call getDecorButtonStyle. Cause:' + JSON.stringify(exception.code));
                await tempWnd!.destroyWindow();
                if (exception.code === 801) {
                    done();
                } else if (exception.code === 1300004) {
                    done()
                } else {
                    done()
                }
            }
        })


        /**
         * @tc.number      testGetTitleButtonRectErrCode1300002_0100
         * @tc.name        testGetTitleButtonRectErrCode1300002_0100
         * @tc.desc        testGetTitleButtonRectErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetTitleButtonRectErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetTitleButtonRectErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testGetTitleButtonRectErrCode1300002_SubWindow_Promise');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                let res: window.TitleButtonRect = subWin!.getTitleButtonRect();
                console.error(msgStr + 'Succeeded in calling getTitleButtonRect.' + JSON.stringify(res));
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call getTitleButtonRect. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })


        /**
         * @tc.number      testSetWindowTitleButtonVisibleErrCode1300002_static_0100
         * @tc.name        testSetWindowTitleButtonVisibleErrCode1300002_static_0100
         * @tc.desc        testSetWindowTitleButtonVisibleErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowTitleButtonVisibleErrCode1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowTitleButtonVisibleErrCode1300002_static_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300002_SubWindow_Promise');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.setWindowTitleButtonVisible(true, true, true);
                console.error(msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call setWindowTitleButtonVisible. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })


        
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_WINDOWTITLEBUTTONRE_CHANGE_0200
         * @tc.name      testWindowTitleButtonRectChange_on_Function_Callback
         * @tc.desc      testWindowTitleButtonRectChange_on_Function_Callback
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testWindowTitleButtonRectChange_on_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowTitleButtonRectChange_on_Function_Callback';
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('test_startMoving_ErrorCode_1300002');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.onWindowTitleButtonRectChange((titleButtonRect) => {
                    console.log(msgStr + 'Succeeded in enabling the listener for window title buttons area changes. Data: ' + JSON.stringify(titleButtonRect));
                    expect(false).assertTrue();
                    done();
                })
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call startMoving. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        });

        /**
         * @tc.number    testWindowTitleButtonRectChange_Off_Errcode1300002_0100
         * @tc.name      testWindowTitleButtonRectChange_Off_Errcode1300002_0100
         * @tc.desc      testWindowTitleButtonRectChange_Off_Function_Callback
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testWindowTitleButtonRectChange_Off_Errcode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowTitleButtonRectChange_Off_Errcode1300002_0100';
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testWindowTitleButtonRectChange_Off_Errcode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.offWindowTitleButtonRectChange((titleButtonRect) => {
                    console.log(msgStr + 'Succeeded in enabling the listener for window title buttons area changes. Data: ' + JSON.stringify(titleButtonRect));
                    expect(false).assertTrue();
                    done();
                })
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call startMoving. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        });
        /**
         * @tc.number     testGetTitleButtonRect_static_0100
         * @tc.name       testGetTitleButtonRect_static
         * @tc.desc       Test the function of getTitleButtonRect
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testGetTitleButtonRect_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testGetTitleButtonRect_static';
            hilog.info(domain, tag,msgStr + 'begin');
            let windowClass: window.Window = windowStage!.getMainWindowSync();
            try {
                let TitleButtonRect = windowClass.getTitleButtonRect();
                hilog.info(domain, tag,msgStr + 'Succeeded in obtaining the area of title buttons. Data: ' + JSON.stringify(TitleButtonRect));
                expect(TitleButtonRect.right !== null).assertTrue();
                expect(TitleButtonRect.top !== null).assertTrue();
                expect(TitleButtonRect.height !== null).assertTrue();
                expect(TitleButtonRect.width !== null).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag,msgStr + 'Failed to get the area of title buttons. Cause: ' + JSON.stringify(error));
                if (error.code === 801) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_1300004
         * @tc.name      testOffSubWindowClose001_1300004
         * @tc.desc      Test onSubWindowClose 1300004
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowClose001_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowClose001_1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let windowClass: window.Window = windowStage!.getMainWindowSync();

            try {
                windowClass.offSubWindowClose();
                hilog.info(domain, tag, msgStr + 'offSubWindowClose success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                }else if(error.code === 1300004){
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });


    })

}