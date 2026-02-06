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
export default function WindowPCTest() {

    describe("WindowPCTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPCTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isPCStatus: string = '';
        let isFreeWindowMode = false;
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
                    expect(true).assertTrue()
                    done();
                }).catch((err: Error):Promise<void> => {
                    if (err!.code == 801 || err!.code == 1300001) {
                        hilog.info(0x0000, '[ANI]',msgStr + ' The current device type does not support calling recover or recover not support ')
                        expect(true).assertTrue()
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
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.minimize((err: BusinessError<void>|null) :void => {
                            const errCode: number = err!.code;
                            if (errCode) {
                                if(errCode == 801){
                                    done();
                                }else if (errCode == 1300002){
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
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling maximize.');
                    await (win! as window.Window).destroyWindow();
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300004);
                    await (win! as window.Window).destroyWindow();
                    done()
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
                    if (err.code == 801) {
                        done();
                    } else {
                        expect(false).assertFalse();
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
                    if (err.code == 801) {
                        done();
                    } else {

                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
                if (exception.code == 801) {
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
                    if (err.code == 801) {
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
                if(e.code == 801){
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
                hilog.error(domain, tag,`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 801){
                    done();
                }else{
                    expect(1300004).assertEqual(err.code);
                    await subWindowClass.destroyWindow();
                    done();
                }

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
                if(err.code == 801){
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
                    if(err.code == 801){
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
                        subWindowClass = data;
                        await subWindowClass!.setRelativePositionToParentWindowEnabled(true);
                        hilog.info(domain, tag,caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
                        await subWindowClass!.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
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
                    }).catch((err: Error) :PromiseLike<void>|undefined=> {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
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
                if(err.code == 801){
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                expect(true).assertTrue();
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
                    if (err.code == 801) {
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
                    expect(true).assertTrue()
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        expect(err.message!=null).assertTrue();
                        expect(true).assertTrue()
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
                    hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                    await windowClass.destroyWindow()
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    await windowClass.destroyWindow()
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        expect(true).assertTrue()
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        done();
                    }
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
                    await subWindowClass.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    console.error(msgStr+'shiftAppWindowTouchEvent : ' + err.code + ',message:' + err.message)
                    await subWindowClass.destroyWindow();
                    if (err.code == 801) {
                        done();
                    } else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }
                })
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
                await subWindowClass.destroyWindow();
                if (err.code == 801) {
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
                    expect(true).assertTrue();
                    done();
                }).catch((error: Error):PromiseLike<void>|undefined => {
                    console.log(msgStr + 'Failed to shift app window focus1. Cause:' + JSON.stringify(error));
                    if (error.code == 801 || error.code == 1300002) {
                        expect(true).assertTrue()
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
                    expect(true).assertTrue();
                    await terminateAbility(message);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
                    await terminateAbility(message);
                    if (err.code == 801) {
                        expect(err.message != null).assertTrue();
                        console.error(`The device not support setSupportedWindowModes`);
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

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
                    if (err.code == 801) {
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


    })

}