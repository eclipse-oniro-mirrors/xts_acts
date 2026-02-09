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
        await Utils.msSleep(1000)
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
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        let windowclassArr:Array<window.Window>;
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

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            try{
                windowclassArr = await windowStage.getSubWindow();
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
            let mainWindow:window.Window =  windowStage.getMainWindowSync();
            hilog.info(domain, tag,msgStr + ' ' + 'getMainWindow success: ' + mainWindow);
            try {
                mainWindow.raiseToAppTop((err:  BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to raise the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 1300009){
                            expect(true).assertTrue();
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
                let subWindow:window.Window = await windowStage.createSubWindow("test_raiseToAppTop_subWindowDestroy");
                await subWindow.destroyWindow();
                let promise1 = subWindow.raiseToAppTop();
                promise1.then(async () => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in raising the window to app top.');
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
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
            let subWindow:window.Window = await windowStage.createSubWindow("test_raiseToAppTop_1300002_static");
            await subWindow.destroyWindow();
            try {
                subWindow.raiseToAppTop((err:  BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr+` Failed to raise the window to app top. Cause code: ${err!.code}, message: ${err!.message}`);
                        if(errCode == 1300002){
                            expect(true).assertTrue();
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
            let mainWindow: window.Window =  windowStage.getMainWindowSync();
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
            let windowClass:window.Window = windowStage.getMainWindowSync();
            try {
                let promise = windowStage.createSubWindow("test1_raiseToAppTop_Two_subWindow_normal");
                promise.then((data:window.Window) => {
                    if (data == null) {
                        hilog.error(domain, tag,msgStr + "Failed to create the subWindow1. Cause: The data is empty");
                        expect(false).assertTrue();
                        done();
                    }
                    let subWindow1 = data;
                    subWindow1.resize(800, 1000);
                    await subWindow1.setUIContent('pages/index2');
                    await subWindow1.showWindow();
                    hilog.info(domain, tag,msgStr + 'windowStage.show SubWindow1 success');
                    let options : window.SubWindowOptions = {
                        title: 'title',
                        decorEnabled: true,
                        isModal: false
                    };
                    let promise2 = windowStage.createSubWindow("test2_raiseToAppTop_Two_subWindow_normal");
                    promise2.then((data:window.Window) => {
                        if (data == null) {
                            hilog.error(domain, tag,msgStr + "Failed to create the subWindow. Cause: The data is empty");
                            expect(false).assertTrue();
                            done();
                        }
                        let subWindow2 = data;
                        subWindow2.resize(1000, 1000);
                        await subWindow2.setUIContent('pages/index2');
                        await subWindow2.showWindow();
                        hilog.info(domain, tag,msgStr + 'windowStage.show SubWindow2 success');
                        await Utils.msSleep(100);
                        let promise4 = subWindow1.raiseToAppTop();
                        promise4.then(() => {
                            hilog.info(domain, tag,msgStr + 'Succeeded in raising the window to app top.');
                            let lastWindowClass = await window.getLastWindow(context);
                            let properties = lastWindowClass.getWindowProperties();
                            hilog.info(domain, tag,msgStr + 'properties:'+JSON.stringify(properties)+'name:'+properties.name);
                            expect(properties.windowRect.height).assertEqual(1000);
                            expect(properties.windowRect.width).assertEqual(800);
                            await subWindow1.destroyWindow();
                            await subWindow2.destroyWindow();
                            done();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(domain, tag,msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                            await subWindow1.destroyWindow();
                            await subWindow2.destroyWindow();
                            if(err.code == 801){
                                done()
                            }else {
                                expect(false).assertTrue();
                                done();
                            }

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
            let mainWindow:window.Window = await windowStage.getMainWindow();
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
            let mainWindow: window.Window = windowStage.getMainWindowSync();
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
                let subWindow:window.Window = await windowStage.createSubWindow("test_setRaiseByClickEnabled_subWindowDestroy");
                await subWindow.destroyWindow();
                let promise = subWindow.setRaiseByClickEnabled(false);
                promise.then(async () => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
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
            let subWindow:window.Window = await windowStage.createSubWindow("test_setRaiseByClickEnabled_1300002_static");
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
            let windowClass:window.Window = windowStage.getMainWindowSync();
            let subWindowClass:window.Window = await windowStage.createSubWindow('testSetWindowTopmostInSubWindow_static');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            await Utils.msSleep(300);
            try {
                windowClass.setWindowTopmost(true).then(async () => {
                    hilog.info(domain, tag,`${caseName} Succeeded in setting the window to be top most.`);
                    expect(true).assertTrue();
                    await windowClass.setWindowTopmost(false)
                    await subWindowClass.destroyWindow();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed to set the window to be top most. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        await subWindowClass.destroyWindow();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
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
            let subWindowClass = await windowStage.createSubWindow('subWindow');
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
            let subWin: window.Window = await windowStage.createSubWindow('testSetWindowTopmostPromiseErrCode1300002_static0100');
            hilog.info(domain, tag,msgStr + 'Succeeded in createSubWindow.');
            await subWin.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWin.showWindow();
            await Utils.msSleep(300);
            await subWin.destroyWindow();
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
                let windowClass:window.Window = await windowStage.createSubWindow('subwindow');
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
                let mainWindow:window.Window = windowStage.getMainWindowSync();
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
                ctx: context
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
            let windowClass:window.Window = await windowStage.createSubWindow('test_SubWindowZLevel_static_0300');
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
            let windowClass:window.Window = await windowStage.createSubWindow('test_SubWindowZLevel_0500');
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

            let windowClass2:window.Window = await windowStage.createSubWindow('test_SubWindowZLevel_0500');
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
            let windowClass:window.Window = await windowStage.createSubWindow('test_SubWindowZLevel_0600');
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
            let windowClass:window.Window = await windowStage.createSubWindow('test_SubWindowZLevel_0700');
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
                let windowClass:window.Window = windowStage.getMainWindowSync();
                windowClass.getSubWindowZLevel()
                hilog.error(domain, tag,`${caseName} : mainwindow succeed getSubWindowZLevel`);
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
                expect(err.code == 1300004 || err.code == 801).assertTrue();
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
            let windowClass = await windowStage.createSubWindow('test_SetWindowDelayRaiseOnDrag_1300002');
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




    })

}