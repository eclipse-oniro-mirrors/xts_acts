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
        e = e as BusinessError;
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowZindexTest() {

    describe("WindowZindexTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowZindexTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let tempWnd: window.Window | undefined;
        let subWin: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let windowclassArr:Array<window.Window>;
        let windowClass: window.Window | undefined;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
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
         * @tc.number    SUB_BASIC_WMS_RAISETOAPPTOP_static_0100
         * @tc.name      test_raiseToAppTop_mainWindow_static
         * @tc.desc      test_raiseToAppTop_mainWindow_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_raiseToAppTop_mainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_raiseToAppTop_mainWindow_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window =  windowStage!.getMainWindowSync();
            hilog.info(domain, tag,msgStr + ' ' + 'getMainWindow success: ' + mainWindow);
            try {
                mainWindow.raiseToAppTop((err:  BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to raise the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 1300009){
                            done();
                        }else if(errCode == 801){
                            done();
                        }
                        else {
                            expect(false).assertTrue();
                            done();
                        }
                    }else {
                        hilog.info(domain, tag,msgStr+'Succeeded in raising the window to app top.');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr+ 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_RAISETOAPPTOP_static_0200
         * @tc.name      test_raiseToAppTop_subWindowDestroy_static
         * @tc.desc      test_raiseToAppTop_subWindowDestroy_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_raiseToAppTop_subWindowDestroy_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_raiseToAppTop_subWindowDestroy_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                let subWindow:window.Window = await windowStage!.createSubWindow("test_raiseToAppTop_subWindowDestroy");
                await subWindow.destroyWindow();
                let promise1 = subWindow.raiseToAppTop();
                promise1.then(() => {
                    (async () => {
                        hilog.info(domain, tag,msgStr + 'Succeeded in raising the window to app top.');
                        await subWindow.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })().awaitSync()
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code = 801){
                        done();
                    }else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + ' Failed   Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_RAISETOAPPTOP_static_0300
         * @tc.name      test_raiseToAppTop_1300002_static
         * @tc.desc      test_raiseToAppTop_1300002_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_raiseToAppTop_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_raiseToAppTop_1300002_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let subWindow:window.Window = await windowStage!.createSubWindow("test_raiseToAppTop_1300002_static");
            await subWindow.destroyWindow();
            try {
                subWindow.raiseToAppTop((err:  BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to raise the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 1300002){
                            done();
                        }else if(errCode == 801){
                            done();
                        }
                        else {
                            expect(false).assertTrue();
                            done();
                        }
                    }else {
                        hilog.info(domain, tag,msgStr+'Succeeded in raising the window to app top.');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr+ 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number     testRaiseToAppTopPromiseErrCode1300009_static_0100
         * @tc.name       testRaiseToAppTopPromiseErrCode1300009_static_0100
         * @tc.desc       testRaiseToAppTopPromiseErrCode1300009_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testRaiseToAppTopPromiseErrCode1300009_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testRaiseToAppTopPromiseErrCode1300009_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let mainWindow: window.Window =  windowStage!.getMainWindowSync();
            hilog.info(domain, tag,caseName + ' ' + 'Succeeded in obtaining the main window. Data: '+mainWindow);
            expect(!!mainWindow).assertTrue();
            try {
                mainWindow!.raiseToAppTop().then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling raiseToAppTop.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
                    expect(err.code).assertEqual(1300009);
                    expect(err.message!=null).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call raiseToAppTop. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }


        })

        /**
         * @tc.number    SUB_BASIC_WMS_RAISETOAPPTOP_static_0400
         * @tc.name      test_raiseToAppTop_Two_subWindow_normal_static
         * @tc.desc      test_raiseToAppTop_Two_subWindow_normal_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_raiseToAppTop_Two_subWindow_normal_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_raiseToAppTop_Two_subWindow_normal_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                let promise = windowStage!.createSubWindow("test1_raiseToAppTop_Two_subWindow_normal");
                promise.then((data:window.Window) => {
                    if (data == null) {
                        hilog.error(domain, tag,msgStr + "Failed to create the subWindow1. Cause: The data is empty");
                        expect(false).assertTrue();
                        done();
                    }
                    let subWindow1 = data;
                    subWindow1.resize(800, 1000);
                    subWindow1.setUIContent('pages/index2').awaitSync()
                    subWindow1.showWindow().awaitSync()
                    hilog.info(domain, tag,msgStr + 'windowStage!.show SubWindow1 success');
                    let options : window.SubWindowOptions = {
                        title: 'title',
                        decorEnabled: true,
                        isModal: false
                    };
                    let promise2 = windowStage!.createSubWindow("test2_raiseToAppTop_Two_subWindow_normal");
                    promise2.then((data:window.Window) => {
                        if (data == null) {
                            hilog.error(domain, tag,msgStr + "Failed to create the subWindow. Cause: The data is empty");
                            expect(false).assertTrue();
                            done();
                        }
                        let subWindow2 = data;
                        subWindow2.resize(1000, 1000);
                        subWindow2.setUIContent('pages/index2').awaitSync()
                        subWindow2.showWindow().awaitSync()
                        hilog.info(domain, tag,msgStr + 'windowStage!.show SubWindow2 success');
                        Utils.msSleep(100).awaitSync()
                        let promise4 = subWindow1.raiseToAppTop();
                        promise4.then(() => {
                            (async () => {
                                hilog.info(domain, tag,msgStr + 'Succeeded in raising the window to app top.');
                                let lastWindowClass = await window.getLastWindow(context!);
                                let properties = lastWindowClass.getWindowProperties();
                                hilog.info(domain, tag,msgStr + 'properties:'+JSON.stringify(properties)+'name:'+properties.name);
                                expect(properties.windowRect.height).assertEqual(1000);
                                expect(properties.windowRect.width).assertEqual(800);
                                await subWindow1.destroyWindow();
                                await subWindow2.destroyWindow();
                                done();
                            })().awaitSync()
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            (async () => {
                            hilog.error(domain, tag,msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                            await subWindow1.destroyWindow();
                            await subWindow2.destroyWindow();
                            if(err.code == 801){
                                done()
                            }else {
                                expect(false).assertTrue();
                                done();
                            }
                            })().awaitSync()
                        });
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,msgStr +` Failed to create the subwindow2. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr +` Failed to create the subwindow1. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                });;
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + ' Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });


        /**
         * @tc.number    SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_static_0100
         * @tc.name      test_setRaiseByClickEnabled_mainWindow_static
         * @tc.desc      test_setRaiseByClickEnabled_mainWindow_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_setRaiseByClickEnabled_mainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setRaiseByClickEnabled_mainWindow_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window = await windowStage!.getMainWindow();
            try {
                mainWindow.setRaiseByClickEnabled(true,(err: BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to setRaiseByClickEnabled the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 801){
                            done();
                        }else if(errCode == 1300009){
                            done();
                        }
                        else {
                            expect(false).assertTrue();
                            done();
                        }
                    }else {
                        hilog.info(domain, tag,msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number     testSetRaiseByClickEnabledPromiseErrCode1300009_static_0100
         * @tc.name       testSetRaiseByClickEnabledPromiseErrCode1300009_static_0100
         * @tc.desc       testSetRaiseByClickEnabledPromiseErrCode1300009_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetRaiseByClickEnabledPromiseErrCode1300009_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetRaiseByClickEnabledPromiseErrCode1300009_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            hilog.info(domain, tag,caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + mainWindow);
            expect(!!mainWindow).assertTrue();
            try {
                mainWindow!.setRaiseByClickEnabled(true).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setRaiseByClickEnabled.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
                    if (err.code == 801) {
                        hilog.info(domain, tag,msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
                    } else {
                        expect(err.code).assertEqual(1300009);
                        expect(err.message!=null).assertTrue();
                    }
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setRaiseByClickEnabled. Cause:' + JSON.stringify(exception));
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
                } else {
                    expect(false).assertTrue();
                }
                done()
            }


        })
        /**
         * @tc.number     SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_static_0200
         * @tc.name       test_setRaiseByClickEnabled_subWindowDestroy_static
         * @tc.desc       test_setRaiseByClickEnabled_subWindowDestroy_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_setRaiseByClickEnabled_subWindowDestroy_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setRaiseByClickEnabled_subWindowDestroy_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                let subWindow:window.Window = await windowStage!.createSubWindow("test_setRaiseByClickEnabled_subWindowDestroy");
                await subWindow.destroyWindow();
                let promise = subWindow.setRaiseByClickEnabled(false);
                promise.then(() => {
                    (async () => {
                        hilog.info(domain, tag,msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
                        await subWindow.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })().awaitSync()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + `Failed to setRaiseByClickEnabled the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code = 801){
                        done();
                    }else if(err.code = 1300002){
                        done();
                    }else {
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed . Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_static_0300
         * @tc.name      test_setRaiseByClickEnabled_1300002_static
         * @tc.desc      test_setRaiseByClickEnabled_1300002_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_setRaiseByClickEnabled_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setRaiseByClickEnabled_1300002_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let subWindow:window.Window = await windowStage!.createSubWindow("test_setRaiseByClickEnabled_1300002_static");
            await subWindow.destroyWindow();
            try {
                subWindow.setRaiseByClickEnabled(true,(err: BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to setRaiseByClickEnabled the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 801){
                            done();
                        }else if(errCode == 1300002){
                            done();
                        }
                        else {
                            expect(false).assertTrue();
                            done();
                        }
                    }else {
                        hilog.info(domain, tag,msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        });

/**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
         * @tc.name      testSetWindowTopmostInSubWindow_static
         * @tc.desc      Set the window to be top most.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTopmostInSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'TestSetWindowTopmostInSubWindow_static';
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testSetWindowTopmostInSubWindow_static');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            await Utils.msSleep(300);
            try {
                windowClass.setWindowTopmost(true).then(() => {
                    (async () => {
                        hilog.info(domain, tag,`${caseName} Succeeded in setting the window to be top most.`);
                        await windowClass.setWindowTopmost(false)
                        await subWindowClass.destroyWindow();
                        done();
                    })().awaitSync()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    (async () => {
                    hilog.error(domain, tag,`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        await subWindowClass.destroyWindow();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                    })().awaitSync()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed to set the window to be top most. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();

            }
        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
         * @tc.name      testSetWindowTopmostUnauthorized_static
         * @tc.desc      Set the window to be top most.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTopmostUnauthorized_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'TestSetWindowTopmostUnauthorized_static';
            let subWindowClass = await windowStage!.createSubWindow('subWindow');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            await Utils.msSleep(300);
            try {
                subWindowClass.setWindowTopmost(false).then(() => {
                    hilog.info(domain, tag,`${caseName} Succeeded in setting the window to be top most.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        subWindowClass.destroyWindow();
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        subWindowClass.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${caseName} Unauthorized operation.. Cause code: ${exception.code}, message: ${exception.message}`);
                await subWindowClass.destroyWindow();
                expect(false).assertTrue();
                done();

            }
        })


        /**
         * @tc.number     testSetWindowTopmostPromiseErrCode1300002_static_0100
         * @tc.name       testSetWindowTopmostPromiseErrCode1300002_static_0100
         * @tc.desc       testSetWindowTopmostPromiseErrCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowTopmostPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowTopmostPromiseErrCode1300002_static_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window = await windowStage!.createSubWindow('testSetWindowTopmostPromiseErrCode1300002_static0100');
            hilog.info(domain, tag,msgStr + 'Succeeded in createSubWindow.');
            await subWin.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWin.showWindow();
            await Utils.msSleep(300);
            await subWin.destroyWindow();
            await Utils.msSleep(300);
            try {
                subWin.setWindowTopmost(true).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowTopmost.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowTopmost. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(false).assertTrue();
                done()
            }
        
        
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_7700
         * @tc.name      testGetDestroyedSubWindowFocused_static
         * @tc.desc      get the sub window focused of current window
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetDestroyedSubWindowFocused_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetDestroyedSubWindowFocused_static';
            try {
                let windowClass:window.Window = await windowStage!.createSubWindow('subwindow');
                hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
                await windowClass.setUIContent("pages/index2");
                await windowClass.destroyWindow();
                hilog.info(domain, tag,`${caseName} Succeeded in destroying the sub window.`);
                await Utils.msSleep(1000);
                let isFocused = windowClass.isFocused();
                hilog.info(domain, tag,`${caseName} isFocused is: ${isFocused}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SubWindowZLevel_static_0200
         * @tc.name      test_SubWindowZLevel_static_0200
         * @tc.desc      test_SubWindowZLevel_static_0200
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_SubWindowZLevel_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SubWindowZLevel_static_0200';
            hilog.info(domain, tag,caseName + 'begin');
            try{
                let mainWindow:window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setSubWindowZLevel(1);
                hilog.info(domain, tag,`${caseName} :main window setSubWindowZLevel success`);
                expect(false).assertTrue();
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :test_SubWindowZLevel_0200 fail1:`+err.code);
                expect(err.code).assertEqual(1300004);
            }

            let config: window.Configuration = {
                name: "test_SubWindowZLevel_0200",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let dialogWindow:window.Window = await window.createWindow(config);
            try{
                await dialogWindow.setSubWindowZLevel(1);
                hilog.info(domain, tag,`${caseName} :dialog window setSubWindowZLevel success`);
                expect(false).assertTrue();
                await dialogWindow.destroyWindow();
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :test_SubWindowZLevel_0200 fail2:`+err.code);
                expect(err.code).assertEqual(1300004);
                await dialogWindow.destroyWindow();
                done();
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_SubWindowZLevel_static_0300
         * @tc.name      test_SubWindowZLevel_static_0300
         * @tc.desc      test_SubWindowZLevel_static_0300
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_SubWindowZLevel_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SubWindowZLevel_static_0300 ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass:window.Window = await windowStage!.createSubWindow('test_SubWindowZLevel_static_0300');
            hilog.info(domain, tag,caseName + 'Succeeded in createSubWindow.');
            await windowClass.destroyWindow();
            try {
                windowClass.setSubWindowZLevel(1).then(() => {
                    hilog.info(domain, tag,caseName + 'Succeeded in calling setSubWindowZLevel.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,caseName + 'Failed to call setSubWindowZLevel. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,caseName + 'Failed. Cause:' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SubWindowZLevel_static_0500
         * @tc.name      test_SubWindowZLevel_static_0500
         * @tc.desc      test_SubWindowZLevel_static_0500
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
         */
        it('test_SubWindowZLevel_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SubWindowZLevel_static_0500';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass:window.Window = await windowStage!.createSubWindow('test_SubWindowZLevel_0500');
            try{
                await windowClass.setSubWindowZLevel(10);
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel test1 success`);
                let res = windowClass.getSubWindowZLevel();
                expect(res).assertEqual(10);
                await windowClass.destroyWindow();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
                await windowClass.destroyWindow();
                if (err.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }

            let windowClass2:window.Window = await windowStage!.createSubWindow('test_SubWindowZLevel_0500');
            try{
                await windowClass2.setSubWindowZLevel(-10);
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel test2 success`);
                let res = windowClass2.getSubWindowZLevel();
                expect(res).assertEqual(-10);
                await windowClass2.destroyWindow();
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel fail2:`+err.code);
                await windowClass2.destroyWindow();
                if (err.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_SubWindowZLevel_static_0600
         * @tc.name      test_SubWindowZLevel_static_0600
         * @tc.desc      test_SubWindowZLevel_static_0600
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
         */
        it('test_SubWindowZLevel_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SubWindowZLevel_static_0600';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass:window.Window = await windowStage!.createSubWindow('test_SubWindowZLevel_0600');
            try{
                await windowClass.setSubWindowZLevel(10);
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel test1 success`);
                let res = windowClass.getSubWindowZLevel();
                expect(res).assertEqual(10);
                await windowClass.setSubWindowZLevel(-10);
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel test2 success`);
                res = windowClass.getSubWindowZLevel();
                expect(res).assertEqual(-10);
                await windowClass.destroyWindow();
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
                await windowClass.destroyWindow();
                if (err.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_SubWindowZLevel_static_0700
         * @tc.name      test_SubWindowZLevel_static_0700
         * @tc.desc      test_SubWindowZLevel_static_0700
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_SubWindowZLevel_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SubWindowZLevel_static_0700 ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass:window.Window = await windowStage!.createSubWindow('test_SubWindowZLevel_0700');
            await windowClass.destroyWindow();
            try {
                windowClass.getSubWindowZLevel();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,caseName + 'Failed. Cause:' + JSON.stringify(err));
                expect(err.code).assertEqual(1300002);
                done()
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SubWindowZLevel_static_0800
         * @tc.name       test_getSubWindowZLevel_1300004_static
         * @tc.desc       验证getSubWindowZLevel的1300004错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_getSubWindowZLevel_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getSubWindowZLevel_1300004_static';
            hilog.info(domain, tag,caseName + 'begin');
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.getSubWindowZLevel()
                hilog.error(domain, tag,`${caseName} : mainwindow succeed getSubWindowZLevel`);
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
                if (err.code === 1300004) {
                    expect(err.code).assertEqual(1300004);
                } else {
                    expect(err.code).assertEqual(801);
                }
                done();
            }
        });

/**
         * @tc.number     SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0200
         * @tc.name       test_SetWindowDelayRaiseOnDrag_1300002
         * @tc.desc       test_SetWindowDelayRaiseOnDrag_1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_SetWindowDelayRaiseOnDrag_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'jsunittest test_SetWindowDelayRaiseOnDrag_1300002';
            console.log(caseName + 'begin');
            let windowClass = await windowStage!.createSubWindow('test_SetWindowDelayRaiseOnDrag_1300002');
            try{
                await windowClass.destroyWindow();
                windowClass.setWindowDelayRaiseOnDrag(true);
                console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
                expect(false).assertTrue();
                done();
            }catch(err) {
                err = err as BusinessError;
                console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
                if(err.code == 801){
                    done();
                }else{
                    expect(err.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETLASTWINDOW_API_0100
         * @tc.name        testGetLastWindow_Promise_static_0100
         * @tc.desc        Get the final show window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetLastWindow_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetLastWindow_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let lastWindow: window.Window;
            try {
                window.getLastWindow(context!).then((data:window.Window) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'window.getLastWindow data: ' + JSON.stringify(data));
                    lastWindow = data;
                    expect(lastWindow != null).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]','Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                })
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETLASTWINDOW_API_0200
         * @tc.name        testGetLastWindow_Callback_static_0200
         * @tc.desc        Get the final show window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetLastWindow_Callback_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetLastWindow_Callback_static_0200';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                window.getLastWindow(context!, (err: BusinessError<void> | null, data: window.Window | undefined):void => {
                    if (err?.code) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                        try {
                            expect(false).assertTrue();
                        } catch (error) {
                            hilog.info(0x0000, '[ANI]',msgStr + `window.getLastWindow  catch error: ${JSON.stringify(error)}`)
                        }
                        done();
                        return;
                    }
                    expect(data != null).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                    done();
                })
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })


        /**
     * @tc.name   testShiftAppWindowFocus_DialogWindow_SourceWinFocus
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0010
     * @tc.desc   Verify the scenario of creating the application type window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowFocus_DialogWindow_SourceWinFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_DialogWindow_SourceWinFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowConfig: window.Configuration = {
          name: "testShiftAppWindowFocus_DialogWindow_SourceWinFocus",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context,
        };

        try {
            tempWnd = await window.createWindow(windowConfig)
        }catch(err){
            console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
            expect().assertFail();
        };

        await Utils.msSleep(500)
        expect(!!tempWnd).assertTrue();
        await (tempWnd as window.Window).resize(500, 500);
        await (tempWnd as window.Window).setUIContent("pages/index2");
        await (tempWnd as window.Window).showWindow();
        await Utils.msSleep(500)
        await Utils.msSleep(500)
        await Utils.msSleep(500)
        let mainWin = windowStage!.getMainWindowSync();
        let mainWinId = mainWin.getWindowProperties().id;
        let dialogWinId = (tempWnd as window.Window).getWindowProperties().id;
        try {
          window.shiftAppWindowFocus(dialogWinId, mainWinId).then(() => {
            console.info(msgStr + 'Succeeded in shifting app window focus');
            expect().assertFail();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300004);
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
          });
          await Utils.msSleep(500)
          done();
        } catch (err) {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
          done();
        }
        await (tempWnd as window.Window).destroyWindow();
      })
      /**
       * @tc.name   testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0020
       * @tc.desc   Verify the scenario of creating the application type window
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowConfig: window.Configuration = {
          name: "testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context,
        };

        try {
            tempWnd = await window.createWindow(windowConfig)
        }catch(err){
            console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
            expect().assertFail();
        };

        await Utils.msSleep(500);
        expect(!!tempWnd).assertTrue();
        await (tempWnd as window.Window).resize(500, 500);
        await (tempWnd as window.Window).setUIContent("pages/index2");
        await (tempWnd as window.Window).showWindow();
        await Utils.msSleep(500)
        await Utils.msSleep(500)
        await Utils.msSleep(500)
        let mainWin = windowStage!.getMainWindowSync();
        let mainWinId = mainWin.getWindowProperties().id;
        let dialogWinId = (tempWnd as window.Window).getWindowProperties().id;
        try {
          window.shiftAppWindowFocus(mainWinId, dialogWinId).then(() => {
            console.info(msgStr + 'Succeeded in shifting app window focus');
            expect().assertFail();
          }).catch((err: Error) => {
            if (err.code != 801) {
              console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300002);
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
          });
          await Utils.msSleep(500)
        } catch (err) {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        }
        await (tempWnd as window.Window).destroyWindow();
        done();
      })
      /**
       * @tc.name   testShiftAppWindowFocus_SubWindow_SourceWinFocus
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0030
       * @tc.desc   Verify the scenario of creating the application type window
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testShiftAppWindowFocus_SubWindow_SourceWinFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_SubWindow_SourceWinFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            subWin = await windowStage!.createSubWindow('testShiftAppWindowFocus_SubWindow_SourceWinFocus')
            await Utils.msSleep(500)
            expect(!!subWin).assertTrue();
            await (subWin as window.Window).resize(500, 500);
            await (subWin as window.Window).setUIContent("pages/index2");
            await (subWin as window.Window).showWindow();
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            let mainWin = windowStage!.getMainWindowSync();
            let mainWinId = mainWin.getWindowProperties().id;
            let subWinId = (subWin as window.Window).getWindowProperties().id;
            try {
            window.shiftAppWindowFocus(subWinId, mainWinId).then(() => {
                console.info(msgStr + 'Succeeded in shifting app window focus');
                done();
            }).catch((err: Error) => {
                if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
                }
                done();
            });
            await Utils.msSleep(500)
            } catch (err) {
            if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
            }
            done()
            }
            await (subWin as window.Window).destroyWindow();
        } catch(err){
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        };
      })
      /**
       * @tc.name   testShiftAppWindowFocus_SubWindow_SourceWinNotFocus
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0040
       * @tc.desc   Verify the scenario of creating the application type window
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testShiftAppWindowFocus_SubWindow_SourceWinNotFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_SubWindow_SourceWinNotFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            let subWin: window.Window = await windowStage!.createSubWindow('testShiftAppWindowFocus_SubWindow_SourceWinNotFocus')
            await Utils.msSleep(500);
            expect(!!subWin).assertTrue();
            await (subWin as window.Window).resize(500, 500);
            await (subWin as window.Window).setUIContent("pages/index2");
            await (subWin as window.Window).showWindow();
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            let mainWin = windowStage!.getMainWindowSync();
            let mainWinId = mainWin.getWindowProperties().id;
            let subWinId = (subWin as window.Window).getWindowProperties().id;
            try {
              window.shiftAppWindowFocus(mainWinId, subWinId).then(() => {
                console.info(msgStr + 'Succeeded in shifting app window focus');
                expect().assertFail();
                done();
              }).catch((err: Error) => {
                if (err.code != 801) {
                  console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                  expect(err.code).assertEqual(1300002);
                } else {
                  console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                  console.log(msgStr + JSON.stringify(err))
                  expect(err.code).assertEqual(801);
                }
                done();
              });
              await Utils.msSleep(500)
            } catch (err) {
              if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              done();
            }
            await (subWin as window.Window).destroyWindow();
        } catch(err) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        };
        
      })


      /**
     * @tc.name   testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0110
     * @tc.desc   Verify the scenario of creating the application type window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let options: window.SubWindowOptions = {
          title: 'SetPreOrie_SubWinOpt',
          decorEnabled: true
        };
        windowStage!.createSubWindowWithOptions('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus', options)
          .then(async (data: window.Window) => {
            subWin = data;
            expect(!!subWin).assertTrue();
            await (subWin as window.Window).resize(500, 500);
            await (subWin as window.Window).setUIContent("pages/index2");
            await (subWin as window.Window).showWindow();
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            let mainWin = windowStage!.getMainWindowSync();
            let mainWinId = mainWin.getWindowProperties().id;
            let subWinId = (subWin as window.Window).getWindowProperties().id;
            try {
              window.shiftAppWindowFocus(subWinId, mainWinId).then(() => {
                (async () => {
                console.info(msgStr + 'Succeeded in shifting app window focus');
                await (subWin as window.Window).destroyWindow();
                done();
                })().awaitSync()
              }).catch((err: Error) => {
                (async () => {
                if (err.code != 801) {
                  console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                  expect().assertFail();
                } else {
                  console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                  console.log(msgStr + JSON.stringify(err))
                  expect(err.code).assertEqual(801);
                }
                await (subWin as window.Window).destroyWindow();
                done();
                })().awaitSync()
              });
            } catch (err) {
              if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              await (subWin as window.Window).destroyWindow();
              done();
            }
            await Utils.msSleep(500);
          })
          .catch((err: Error) => {
            if (err.code != 1300002) {
              console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(1300002);
              done();
            }
          });
          await Utils.msSleep(2500);
      })
      /**
       * @tc.name   testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWFOCUS_JS_API_0120
       * @tc.desc   Verify the scenario of creating the application type window
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = 'testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let options: window.SubWindowOptions = {
          title: 'SetPreOrie_SubWinOptTwo',
          decorEnabled: true
        };
        windowStage!.createSubWindowWithOptions('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus', options)
          .then(async (data: window.Window) => {
            subWin = data;
            expect(!!subWin).assertTrue();
            await (subWin as window.Window).resize(500, 500);
            await (subWin as window.Window).setUIContent("pages/index2");
            await (subWin as window.Window).showWindow();
            await Utils.msSleep(500)
            await Utils.msSleep(500)
            let mainWin = windowStage!.getMainWindowSync();
            let mainWinId = mainWin.getWindowProperties().id;
            let subWinId = (subWin as window.Window).getWindowProperties().id;
            try {
              window.shiftAppWindowFocus(mainWinId, subWinId).then(() => {
                console.info(msgStr + 'Succeeded in shifting app window focus');
                expect().assertFail();
                done();
              }).catch((err: Error) => {
                if (err.code != 801) {
                  console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                  expect(err.code).assertEqual(1300002);
                } else {
                  console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                  console.log(msgStr + JSON.stringify(err))
                  expect(err.code).assertEqual(801);
                }
                done();
              });
              await Utils.msSleep(500)
              done()
            } catch (err) {
              if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
              done()
            }
            await (subWin as window.Window).destroyWindow();
          })
          .catch((err: Error) => {
            if (err.code != 1300002) {
              console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(1300002);
            }
            done();
          });
          await Utils.msSleep(2500);
      })

      /**
         * @tc.number       testOnWindowHighlightChangeErrCode1300002_0100
         * @tc.name         testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.desc         testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
    it('testOnWindowHighlightChangeErrCode1300002_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = "testOnWindowHighlightChangeErrCode1300002_static_0100";
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
        try {
            let tempWnd: window.Window = await windowStage!.createSubWindow('testOnWindowHighlightChangeErrCode1300002_static_0100')
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            await Utils.msSleep(300);
            expect(!!tempWnd).assertTrue();
            await tempWnd.destroyWindow();
            hilog.info(domain, tag,msgStr + 'window.destroy success');
            tempWnd.onWindowHighlightChange((data) => {
                console.info(msgStr +  'on windowHighlightChange callback' + JSON.stringify(data));
            });
            hilog.info(domain, tag,msgStr + 'window.on_windowHighlightChange success');
            expect(false).assertTrue();
            done()
        } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
            if (exception.code != 801) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to on_windowHighlightChange. Cause code:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
            } else {
                hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                expect(exception.code).assertEqual(801);
            }
            done()
        }
    })
    /**
     * @tc.number      testOffWindowHighlightChangeErrCode1300002_0100
     * @tc.name        testOffWindowHighlightChangeErrCode1300002_static_0100
     * @tc.desc        testOffWindowHighlightChangeErrCode1300002_static_0100
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testOffWindowHighlightChangeErrCode1300002_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = "testOffWindowHighlightChangeErrCode1300002_static_0100";
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
        try {
            let tempWnd: window.Window = await windowStage!.createSubWindow('testOffWindowHighlightChangeErrCode1300002_static_0100')
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            await Utils.msSleep(300);
            expect(!!tempWnd).assertTrue();
            await tempWnd.destroyWindow();
            hilog.info(domain, tag,msgStr + 'window.destroy success');
            tempWnd.offWindowHighlightChange((data) => {
                console.info(msgStr +  'on windowHighlightChange callback' + JSON.stringify(data));
            });
            hilog.info(domain, tag,msgStr + 'window.on_windowHighlightChange success');
        } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
            if (exception.code != 801) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to on_windowHighlightChange. Cause code:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            } else {
                hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                expect(exception.code).assertEqual(801);
                done()
            }
            
        }
    })


    /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0100
       * @tc.number test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0100
       * @tc.desc   开启/关闭窗口获焦能力后，主窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
    it('test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage!.getMainWindowSync();
          let promise = windowClass.setWindowFocusable(false);
          promise.then(() => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass.setWindowFocusable(true);
            promise2.then(() => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              done();
            }).catch((err: Error) => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: Error) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0200
       * @tc.number test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0200
       * @tc.desc   开启/关闭窗口获焦能力后，子窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0200 ';
        console.info(msgStr + ' begin ');
        const windowClass = await windowStage!.createSubWindow('test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0200');
        try {
          let promise = windowClass.setWindowFocusable(false);
          promise.then(() => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass.setWindowFocusable(true);
            promise2.then(() => {
            (async () => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            })().awaitSync()
            }).catch(async (err: Error) => {
            (async () => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            })().awaitSync()
            });
          }).catch(async (err: Error) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FOCUSABLE_0300
       * @tc.desc   开启/关闭窗口获焦能力后，dialog窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {
          let promise = windowClass.setWindowFocusable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass!.setWindowFocusable(true);
            promise2.then(() => {
            (async () => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass!.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            })().awaitSync()
            }).catch((err: Error) => {
            (async () => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            })().awaitSync()
            });
          }).catch(async (err: Error) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })


      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0400
       * @tc.number test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0400
       * @tc.desc   开启/关闭窗口获焦能力后，dialog窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0400 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "test_GETWINDOWPROPERTIES_FOCUSABLE_STATIC_0400",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {

          windowClass.setWindowFocusable(false, (err: Error | null) => {
            (async () => {
            hilog.info(domain, tag,msgStr + 'window setWindowFocusable callback err ：' + JSON.stringify(err));
            if (err?.code !== 0) {
                expect().assertFail();
                done();
            }
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            await windowClass.destroyWindow();
            done();
            })().awaitSync()
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })


      /**
         * @tc.number     testsetExclusivelyHighlightedFalse_1300002_static
         * @tc.name       testsetExclusivelyHighlightedFalse_1300002_static
         * @tc.desc       testsetExclusivelyHighlighted_False_1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
      it('testsetExclusivelyHighlightedFalse_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName:string = "testsetExclusivelyHighlightedFalse_1300002_static";
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag,msgStr + 'begin.');
        let config: window.Configuration = {
            name: "test",
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: context!
        };
        let windowClass:window.Window = await window.createWindow(config);
        await Utils.msSleep(300);
        try {
            await windowClass.destroyWindow();
            let promise = windowClass.setExclusivelyHighlighted(false);
            promise.then(() => {
                hilog.info(domain, tag,'Succeeded in setting the window to be exclusively highlight.');
                expect(false).assertTrue();
                done()
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(domain, tag,`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
                if(err.code === 801){
                    done();
                }else{
                    expect(err.code).assertEqual(1300002);
                    done()
                }
            });

        } catch (e) {
            e = e as BusinessError;
            hilog.info(domain, tag,msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
            expect(false).assertTrue();
            done()
        }

    })

    /**
         * @tc.number     SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_static_0300
         * @tc.name       test_ISWINDOWHIGHLIGHTED_static_0300
         * @tc.desc       test_ISWINDOWHIGHLIGHTED_static_0300
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
    it('test_ISWINDOWHIGHLIGHTED_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'test_ISWINDOWHIGHLIGHTED_static_0300';
        hilog.info(domain, tag,caseName + 'begin');

        let subWin = await windowStage!.createSubWindow('test_ISWINDOWHIGHLIGHTED_static_0300');
        try{
            subWin.setExclusivelyHighlighted(true);
            subWin.resize(800, 1000);
            await subWin.setUIContent('pages/index2');
            await subWin.showWindow();
            await Utils.msSleep(300);

            let highlight = subWin.isWindowHighlighted();
            hilog.info(domain, tag,`${caseName} :subWin window isWindowHighlighted1 `+ highlight);
            expect(highlight).assertEqual(true);
            
            let highlight1 = windowClass!.isWindowHighlighted();
            hilog.info(domain, tag,`${caseName} :mainWindow window isWindowHighlighted1 `+ highlight1);
            expect(highlight1).assertEqual(false);

            await subWin.destroyWindow();
            
            done();
        } catch(err) {
            err = err as BusinessError;
            hilog.info(domain, tag,`${caseName} :sub window setExclusivelyHighlighted fail1:`+err.code);
            expect(err.code).assertEqual(801);
            done()
        }
    });


    /**
         * @tc.name   testOffuiExtensionLimitChange_DestoryedSubWindow_static_0300
         * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_static_0300
         * @tc.desc   testOffuiExtensionLimitChange_DestoryedSubWindow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
    it('testOffuiExtensionLimitChange_DestoryedSubWindow_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName:string = 'testOffuiExtensionLimitChange_DestoryedSubWindow_static_0300';
        let subWindowClass:window.Window = await windowStage!.createSubWindow('testOffuiExtensionLimitChange_DestoryedSubWindow_static_0300');
        await subWindowClass.destroyWindow();
        try {
            subWindowClass.offUiExtensionSecureLimitChange();
            expect(true).assertFail();
            done()
        } catch (error) {
            error = error as BusinessError;
            console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
            if (error.code === 801) {
                expect(error.message !== null).assertTrue();
                done();
            } else {
                expect(error.code).assertEqual(1300002);
                expect(error.message !== null).assertTrue();
                done();
            }
        }
    })

    /**
         * @tc.number     SUB_BASIC_WMS_ISWINDOWFOCUSED_static_0100
         * @tc.name       test_ISWINDOWFOCUSED_static_0100
         * @tc.desc       test_ISWINDOWFOCUSED_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
    it('test_ISWINDOWFOCUSED_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'test_ISWINDOWFOCUSED_static_0100';
        hilog.info(domain, tag,caseName + 'begin');

        let subWin = await windowStage!.createSubWindow('test_ISWINDOWFOCUSED_static_0100');
        try{
            subWin.resize(800, 1000);
            await subWin.setUIContent('pages/index2');
            await subWin.showWindow();
            await Utils.msSleep(300);

            let isFocused = subWin.isFocused();
            hilog.info(domain, tag,`${caseName} :subWin window isWindowisFocused `+ isFocused);
            expect(isFocused).assertEqual(true);
            
            let isFocused1 = windowClass!.isFocused();
            hilog.info(domain, tag,`${caseName} :mainWindow window isWindowisFocused1 `+ isFocused1);
            expect(isFocused1).assertEqual(false);

            await subWin.destroyWindow();
            
            done();
        } catch(err) {
            err = err as BusinessError;
            hilog.info(domain, tag,`${caseName} :sub window isFocused fail1:`+err.code);
            expect(err.code).assertEqual(801);
            done()
        }
    });


    /**
         * @tc.number     testSetWindowModalPromiseTrue_static_0100
         * @tc.name       testSetWindowModalPromiseTrue_static_0100
         * @tc.desc       testSetWindowModalPromiseTrue_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
    it('testSetWindowModalPromiseTrue_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName:string = "testSetWindowModalPromiseTrue_static_0100";
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag,msgStr + 'begin.');
        let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
        try {
            windowStageStart.setWindowModal(true).then(() => {
                (async () => {
                    (async () => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling removeStartingWindow.');
                    await terminateAbility(caseName);
                    done()
                    })().awaitSync()
                })().awaitSync()
            }).catch((err: Error):PromiseLike<void>|undefined => {
                (async () => {
                hilog.error(domain, tag,msgStr + 'Failed to call setWindowModal. Cause: ' + err.message + err.code);
                expect(err.code).assertEqual(801);
                expect(err.message!==null).assertTrue();
                await terminateAbility(caseName);
                done()
                })().awaitSync()
            });

        } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
            expect(exception.code).assertEqual(1300002);
            expect(exception.message!==null).assertTrue();
            done()
        }
    })


    /**
     * @tc.name   test_OH_OnWindowHighlightChange_One_Static
     * @tc.number SUB_BASIC_ONWINDOWHIGHLIGHTCHANGE_STATIC_0100
     * @tc.desc   test_OH_OnWindowHighlightChange_One_Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_OnWindowHighlightChange_One_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let msg = 'test_OH_OnWindowHighlightChange_One_Static ';
        let flag: boolean = false;
        let cb1 = (isBool: boolean) => {
          console.log(msg + 'windowHighlightChange, isBool = ' + isBool)
          flag = isBool
        }
        try {
          windowClass!.onWindowHighlightChange(cb1)
          windowClass!.onWindowHighlightChange(cb1)
  
          let win1 = await windowStage!.createSubWindow('win1');
          await win1.setUIContent('pages/index2');
          console.log(msg + 'getWindowLimits, minWidth = ' + win1.getWindowLimits().minWidth+' , minHeight:'+win1.getWindowLimits().minHeight);
          await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)
  
          await win1.showWindow()
          await Utils.msSleep(300);
          console.log(msg + '1 flag = ' + flag);
          expect(flag).assertFalse()
  
          await win1.destroyWindow()
          await Utils.msSleep(300);
          console.log(msg + '2 flag = ' + flag);
          expect(flag).assertTrue()
  
          windowClass!.offWindowHighlightChange()
          done()
        }catch (exception) {
          console.error(msg + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
          if (exception.code == 801) {
            done()
          }
        }
  
      })


      
    })

}