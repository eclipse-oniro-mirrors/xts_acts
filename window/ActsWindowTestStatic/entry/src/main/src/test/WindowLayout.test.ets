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
import { ColorMetrics, screenshot } from '@kit.ArkUI';
// import  { LocalStorage }  from '@ohos.LocalStorage';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import settings from '@ohos.settings';
import { Driver,ON,Component, Point } from '@ohos.UiTest';
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
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowLayoutTest() {

    describe("WindowLayoutTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLayoutTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode:boolean = false;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        let isPCStatus: string = '';
        let driver: Driver = Driver.create();
        console.log(`come in Driver create`);
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
            isPCStatus = settings.getValueSync(context!, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isFreeWindowMode == true 自由窗口模式
            //isFreeWindowMode == false 非自由窗口模式
            console.info(`brforeAll isFreeWindowMode: ${isFreeWindowMode}`);
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0100
         * @tc.name        testOnOffWindowStatusChange_OnSubWindow_static_0100
         * @tc.desc        Enable listening for window mode changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnOffWindowStatusChange_OnSubWindow_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testOnOffWindowStatusChange_OnSubWindow_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let subWin:window.Window = await windowStage!.createSubWindow('testOnOffWindowStatusChange_OnSubWindow');
            expect(!!subWin).assertTrue();
            const callback = (data:window.WindowStatusType) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
            }
            try {
                (subWin as window.Window).onWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                (subWin as window.Window).offWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                (subWin as window.Window).offWindowStatusChange();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            await (subWin as window.Window).destroyWindow();
            done();
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0200
         * @tc.name        testOnOffWindowStatusChange_OnMainWindow_static_0200
         * @tc.desc        Enable listening for window mode changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnOffWindowStatusChange_OnMainWindow_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testOnOffWindowStatusChange_OnMainWindow_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let mainWin:window.Window = windowStage!.getMainWindowSync();
            expect(!!mainWin).assertTrue();
            const callback = (data:window.WindowStatusType) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
            }
            try {
                mainWin.onWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                mainWin.offWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                mainWin.offWindowStatusChange();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');;
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            done();
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SHOWWINDOW_JS_API_0100
         * @tc.name        testShowWindow_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        show window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testShowWindow_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testShowWindow_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testShowWindow_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            (win as window.Window).showWindow((err: BusinessError<void>|null):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]','Failed to show the window. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done();
                    return;
                }
                hilog.info(0x0000, '[ANI]','Succeeded in showing the window.');
                expect(false).assertTrue();
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SHOWWINDOW_JS_API_0200
         * @tc.name        testShowWindow_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        show window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testShowWindow_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testShowWindow_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testShowWindow_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let promise = win.showWindow();
            promise.then(() => {
                hilog.info(0x0000, '[ANI]', caseName +' Succeeded in showing the window.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]', caseName +` Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
                expect(err!.code).assertEqual(1300002);
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DESTROYWINDOW_JS_API_0100
         * @tc.name        testDestroyWindow_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        destroy window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDestroyWindow_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testDestroyWindow_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testDestroyWindow_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            (win as window.Window).destroyWindow().then(() => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in destroying the window.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
                expect(err.code).assertEqual(1300002);
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DESTROYWINDOW_JS_API_0200
         * @tc.name        testDestroyWindow_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        destroy window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDestroyWindow_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testDestroyWindow_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testDestroyWindow_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            win.destroyWindow((err: BusinessError<void>|null):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]',`Failed to destroy the window. Cause code: ${err!.code}, message: ${err!.message}`);
                    expect(err!.code).assertEqual(1300002);
                    done();
                    return;
                }
                hilog.info(0x0000, '[ANI]','Succeeded in destroying the window.');
                expect(false).assertTrue();
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_MOVEWINDOWTO_JS_API_0100
         * @tc.name        testMoveWindowTo_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        Move window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMoveWindowTo_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testMoveWindowTo_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).moveWindowTo(300, 300).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in moving the window.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_MOVEWINDOWTO_JS_API_0200
         * @tc.name        testMoveWindowTo_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Move window windowStateAbnormal
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMoveWindowTo_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testMoveWindowTo_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).moveWindowTo(300, 300, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in moving the window.');
                    expect(false).assertTrue();
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RESIZE_JS_API_0100
         * @tc.name        testResize_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        Change the current window size
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResize_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testResize_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testResize_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).resize(500, 1000).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in changing the window size.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RESIZE_JS_API_0200
         * @tc.name        testResize_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Change the current window size
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResize_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testResize_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testResize_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).resize(500, 1000, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done();
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in changing the window size.');
                    expect(false).assertTrue();
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number       testGetGlobalRectErrCode1300002_0100
         * @tc.name         testGetGlobalRectErrCode1300002_static_0100
         * @tc.desc         testGetGlobalRectErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testGetGlobalRectErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testGetGlobalRectErrCode1300002_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testGetGlobalRectErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.getGlobalRect();
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling getGlobalRect.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call getGlobalRect. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DET_GLOBAL_RECT_0100
         * @tc.name        testgetGlobalRect_static_0200
         * @tc.desc        get the global rect.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testgetGlobalRect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testgetGlobalRect_static_0200';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                let rect :window.Rect = windowClass.getGlobalRect();
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in getting global rect: ${JSON.stringify(rect)}`);
                expect(rect.left != null).assertTrue();
                expect(rect.top != null).assertTrue();
                expect(rect.width).assertLarger(0);
                expect(rect.height).assertLarger(0);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName} The current device type does not support to getting the global rect.`);
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception!.code}, message: ${exception!.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number    test_startMoving_ErrorCode_1300002
         * @tc.name      test_startMoving_ErrorCode_1300002_static_0100
         * @tc.desc      test_startMoving_ErrorCode_1300002
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('test_startMoving_ErrorCode_1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let CaseName:string = 'test_startMoving_ErrorCode_1300002_static_0100';
            let subWindow = await windowStage!.createSubWindow('test_startMoving_ErrorCode_1300002_static_0100');
            await Utils.msSleep(200);
            await subWindow.destroyWindow();
            try {
                let promise = subWindow.startMoving(100,50);
                promise.then(()=>{
                    hilog.info(0x0000, '[ANI]',CaseName + ' startMoving success ');
                    expect(false).assertTrue();
                    done();
                }).catch((err:Error):PromiseLike<void>|undefined=>{
                    hilog.error(0x0000, '[ANI]',CaseName + ' startMoving failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                })
            }catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]',CaseName + ' failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_START_MOVING_0100
         * @tc.name       test_startMoving_mainWindow_static_0200
         * @tc.desc       test_startMoving_mainWindow
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_startMoving_mainWindow_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_startMoving_mainWindow_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let mainWindow = windowStage!.getMainWindowSync();
                let promise = mainWindow.startMoving(100, 50)
                promise.then(() => {
                    hilog.info(0x0000, '[ANI]',`${caseName} :Succeeded startMoving ` );
                    expect(true).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',`${caseName} :Failed to startMoving. Cause code: ${err.code}, message: ${err.message}`);
                    if(err!.code == 801){
                        done();
                    }else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]',`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        });
        /**
         * @tc.number      testStartMovingPromiseErrCode1300002_0100
         * @tc.name        testStartMovingPromiseErrCode1300002_static_0300
         * @tc.desc        testStartMovingPromiseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testStartMovingPromiseErrCode1300002_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testStartMovingPromiseErrCode1300002_static_0300";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testStartMovingPromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    await Utils.msSleep(200);
                    try {
                        (subWin! as window.Window).startMoving().then( () => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling startMoving.');
                            expect(false).assertTrue();
                            done()
                        }).catch((err: Error) :PromiseLike<void>|undefined=> {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call startMoving. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                            done()
                        });
                        
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call startMoving. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number       testOnWindowHighlightChangeErrCode1300002_0100
         * @tc.name         testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.desc         testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnWindowHighlightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
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
        it('testOffWindowHighlightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
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
         * @tc.number     testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.name       testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.desc       testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it("testOnRectChangeOptionsMoveErrorCode1300002_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnRectChangeOptionsMoveErrorCode1300002_static_0100" ;
                let subWindowClass : window.Window = await windowStage!.createSubWindow("TestOnRectChangeOptionsMove");
                hilog.info(0x0000, '[ANI]', `${caseName} Succeeded in creating the sub window.`);
            try {
                await subWindowClass.showWindow();
                await Utils.msSleep(1000);
                subWindowClass.onWindowRectChange((data : window.RectChangeOptions) => {
                    hilog.info(0x0000, '[ANI]',`${caseName}: Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    hilog.info(0x0000, '[ANI]',`${caseName}: Succeeded window reason changes. reason: ${JSON.stringify(data.reason)}`);
                    expect(data!.rect.left).assertEqual(300);
                    expect(data!.rect.top).assertEqual(300);
                    subWindowClass.offWindowRectChange();
                    subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.moveWindowTo(300, 300);
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in moving the window.`);
            } catch (error) {
                error = error as BusinessError;
                subWindowClass.destroyWindow();
                if (error!.code == 1300002) {
                    hilog.error(0x0000, '[ANI]',`${caseName} This window state is abnormal`);
                    done();
                } else if (error!.code == 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        
        
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.name        testOnRectChangeOptionsResizeSubWindow_static_0100
         * @tc.desc        Test the function value of testRectChangeOptions
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testOnRectChangeOptionsResizeSubWindow_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "TestOnRectChangeOptionsResizeSubWindow_static_0100";
            try {
                let subWindowClass:window.Window = await windowStage!.createSubWindow("TestOnRectChangeOptionsResizeSubWindow_static_0100");
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.setUIContent('pages/index2');
                await subWindowClass.showWindow();
                await Utils.msSleep(1000);
                subWindowClass.onWindowSizeChange((data:window.Size) => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(500);
                    expect(data.height).assertEqual(500);
                    subWindowClass.offWindowSizeChange();
                    subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.resize(500, 500);
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in changing the sub window size.`);
            } catch (error) {
                hilog.error(0x0000, '[ANI]',`${caseName}: Error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        })
        
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_WINDOWRECTCJANGE_JS_API_0200
         * @tc.name        testRectChangeOptions_on_static_0200
         * @tc.desc        Test the function value of testRectChangeOptions
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testRectChangeOptions_on_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let msgStr:string = "testRectChangeOptions_on_static_0200";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                let windowClass: window.Window = await windowStage!.createSubWindow("testRectChangeOptions_on_static_0200");
                await windowClass.destroyWindow();
                windowClass.onWindowRectChange((data: window.RectChangeOptions) => {
                    hilog.info(0x0000, '[ANI]',`Succeeded window rect changes. Data: ` + JSON.stringify(data));
                });
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded window rect changes');
                expect(false).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                if (error!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${msgStr} The current device type does not support to windowRectChange`);
                    done();
                } else  {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                    expect(error!.code).assertEqual(1300002);
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_WINDOWRECTCJANGE_JS_API_0100
         * @tc.name        testRectChangeOptions_off_static_0100
         * @tc.desc        Test the function value of testRectChangeOptions
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testRectChangeOptions_off_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let msgStr:string = "testRectChangeOptions_off_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                let windowClass: window.Window = await windowStage!.createSubWindow("testRectChangeOptions_off_static_0100");
                await windowClass.destroyWindow();
                windowClass.offWindowRectChange();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded window rect changes');
                expect(false).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                if (error!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${msgStr} The current device type does not support to windowRectChange`);
                    done();
                } else  {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                    expect(error!.code).assertEqual(1300002);
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_static_0200
         * @tc.name       test_setSystemAvoidAreaEnabled_ErrorCode_801_static
         * @tc.desc       setSystemAvoidAreaEnabled接口验证801
         * @tc.size       MediumTestTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_setSystemAvoidAreaEnabled_ErrorCode_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'test_setSystemAvoidAreaEnabled_ErrorCode_801_static!'
            let config: window.Configuration = {
                name: message,
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            }
            try {
                let promise = window.createWindow(config)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let dialogWindowClass:window.Window = data;
                    await data.setUIContent('pages/index2')
                    await Utils.msSleep(1000)
                    await data.showWindow();
                    await Utils.msSleep(1000)
                    try {
                        let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
                        promise1.then(() => {
                            hilog.info(domain, tag,`${message} succeed setSystemAvoidAreaEnabled`);
                            await dialogWindowClass.destroyWindow();
                            await Utils.msSleep(1000);
                            expect(true).assertTrue();
                            done();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(domain, tag,`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                            await dialogWindowClass.destroyWindow();
                            await Utils.msSleep(1000);
                            expect(err.code).assertEqual(801);
                            done();
                        })
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        await dialogWindowClass.destroyWindow();
                        await Utils.msSleep(1000);
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error) :PromiseLike<void>|undefined =>{
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_static_0300
         * @tc.name       test_setSystemAvoidAreaEnabled_ErrorCode_1300002_static
         * @tc.desc       setSystemAvoidAreaEnabled接口验证1300002
         * @tc.size       MediumTestTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_setSystemAvoidAreaEnabled_ErrorCode_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300002_static!'
            let config: window.Configuration = {
                name: message,
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            }
            try {
                let promise = window.createWindow(config)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let dialogWindowClass:window.Window = data;
                    await dialogWindowClass.setUIContent('pages/index2')
                    await Utils.msSleep(1000)
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    await dialogWindowClass.destroyWindow();
                    await Utils.msSleep(1000);
                    try {
                        let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
                        promise1.then(() => {
                            hilog.info(domain, tag,`${message} succeed setSystemAvoidAreaEnabled`);
                            expect(false).assertTrue();
                            done();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(domain, tag,`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                            expect(err.code == 801 || err.code ==1300002).assertTrue();
                            done();
                        })
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_static_0400
         * @tc.name       test_setSystemAvoidAreaEnabled_ErrorCode_1300004_static
         * @tc.desc       setSystemAvoidAreaEnabled接口验证1300004
         * @tc.size       MediumTestTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_setSystemAvoidAreaEnabled_ErrorCode_1300004_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300004_static!'
            try {
                let promise = windowStage!.createSubWindow(message)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let subWindowClass:window.Window = data;
                    await subWindowClass.setUIContent('pages/index2')
                    await Utils.msSleep(1000)
                    await subWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    try {
                        let promise1 = subWindowClass.setSystemAvoidAreaEnabled(true);
                        promise1.then(() => {
                            hilog.info(domain, tag,`${message} succeed setSystemAvoidAreaEnabled`);
                            await subWindowClass.destroyWindow();
                            await Utils.msSleep(1000);
                            expect(false).assertTrue();
                            done();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(domain, tag,`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                            await subWindowClass.destroyWindow();
                            await Utils.msSleep(1000);
                            expect(err.code == 801 || err.code ==1300004).assertTrue();
                            done();
                        })
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        await subWindowClass.destroyWindow();
                        await Utils.msSleep(1000);
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_static_0100
         * @tc.name       test_isSystemAvoidAreaEnabled_801_static
         * @tc.desc       isSystemAvoidAreaEnabled接口验证801
         * @tc.size       MediumTestTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_isSystemAvoidAreaEnabled_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message = 'test_isSystemAvoidAreaEnabled_801_static!'
            let config: window.Configuration = {
                name: message,
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            }
            try {
                let promise = window.createWindow(config)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let dialogWindowClass = data;
                    await dialogWindowClass.setUIContent('pages/index2')
                    await Utils.msSleep(1000)
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    try {
                        expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(false)
                        await dialogWindowClass.destroyWindow();
                        await Utils.msSleep(1000);
                        done();
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        await dialogWindowClass.destroyWindow();
                        await Utils.msSleep(1000);
                        expect(err.code).assertEqual(801);
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number      SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_static_0200
         * @tc.name        test_isSystemAvoidAreaEnabled_1300004_static
         * @tc.desc        isSystemAvoidAreaEnabled接口验证1300004
         * @tc.size        MediumTestTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_isSystemAvoidAreaEnabled_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message = 'test_isSystemAvoidAreaEnabled_1300004_static!'
            try {
                let promise = windowStage!.createSubWindow(message)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let dialogWindowClass = data;
                    await dialogWindowClass.setUIContent('pages/index2')
                    await Utils.msSleep(1000)
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    try {
                        dialogWindowClass.isSystemAvoidAreaEnabled()
                        hilog.info(domain, tag,`${message} succeed assert isSystemAvoidAreaEnabled`);
                        await dialogWindowClass.destroyWindow();
                        await Utils.msSleep(1000);
                        expect(false).assertTrue();
                        done();
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        await dialogWindowClass.destroyWindow();
                        hilog.info(domain, tag,`${message} after destroyWindow`);
                        await Utils.msSleep(1000);
                        expect(err.code == 801 || err.code ==1300004).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number      SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_static_0300
         * @tc.name        test_isSystemAvoidAreaEnabled_1300002_static
         * @tc.desc        isSystemAvoidAreaEnabled接口验证1300002
         * @tc.size        MediumTestTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_isSystemAvoidAreaEnabled_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'test_isSystemAvoidAreaEnabled_1300002_static!'
            let config: window.Configuration = {
                name: message,
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            }
            try {
                let promise = window.createWindow(config)
                promise.then((data:window.Window) => {
                    hilog.info(domain, tag,`${message} succeed createWindow`);
                    let dialogWindowClass = data;
                    await dialogWindowClass.setUIContent("pages/index2")
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000);
                    await dialogWindowClass.destroyWindow();
                    await Utils.msSleep(1000);
                    try {
                        dialogWindowClass.isSystemAvoidAreaEnabled();
                        hilog.info(domain, tag,`${message} succeed assert isSystemAvoidAreaEnabled`);
                        expect(false).assertTrue();
                        done();
                    }catch (err) {
                        err = err as BusinessError;
                        hilog.error(domain, tag,`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                        expect(err.code == 801 || err.code ==1300002).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number      testGetWindowSystemBarPropertiesErrCode1300002_static_0100
         * @tc.name        testGetWindowSystemBarPropertiesErrCode1300002_static_0100
         * @tc.desc        testGetWindowSystemBarPropertiesErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowSystemBarPropertiesErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testGetWindowSystemBarPropertiesErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testGetWindowSystemBarPropertiesErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + data);
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.getWindowSystemBarProperties();
                        hilog.error(domain, tag,msgStr + 'Succeeded in calling getWindowSystemBarProperties.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
                        expect(e.code).assertEqual(1300002);
                        expect(e.message!=null).assertTrue();
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })
        /**
         * @tc.number     SUB_BASIC_WMS_WULTMNDOW_GET_WINDOWSYSTEMBARPROPERTIES_static_0200
         * @tc.name       test_subWindow_GetWindowSystemBarProperties_1300004_static
         * @tc.desc       test_subWindow_GetWindowSystemBarProperties_1300004_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it("test_subWindow_GetWindowSystemBarProperties_1300004_static", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_subWindow_GetWindowSystemBarProperties_1300004_static";
            hilog.info(domain, tag,msgStr + " begin");
            let SubWindowClass: window.Window;
            SubWindowClass = await windowStage!.createSubWindow('test_subWindow_GetWindowSystemBarProperties_1300004')
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            expect(!!SubWindowClass).assertTrue();
            try {
                let systemBarProperty = (SubWindowClass as window.Window).getWindowSystemBarProperties();
                hilog.info(domain, tag,msgStr + 'Success in obtaining system bar properties. Property: ' +
                JSON.stringify(systemBarProperty));
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to get system bar properties. Code: ' + JSON.stringify(err) + err.code);
                expect(err.code).assertEqual(1300004)
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_static_0200
         * @tc.name        test_setStatusBarColor_801_static
         * @tc.desc        setStatusBarColor接口验证801
         * @tc.size        MediumTestTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setStatusBarColor_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'test_setStatusBarColor_801_static!'
            try {
                let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
                let promise = mainWindowClass.setStatusBarColor(ColorMetrics.rgba(1, 1, 1));
                promise.then(() => {
                    hilog.info(domain, tag,`${message} succeed setStatusBarColor`);
                    expect(true).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} promise Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
                    expect(err.code).assertEqual(801);
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${message} Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_static_0300
         * @tc.name        test_setStatusBarColor_1300002_static
         * @tc.desc        test_setStatusBarColor_1300002
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setStatusBarColor_1300002_static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "test_setStatusBarColor_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let config: window.Configuration = {
                name: "systemWindow",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let subWindowClass:window.Window = await window.createWindow(config);
            await subWindowClass.destroyWindow();
            try {
                subWindowClass!.setStatusBarColor(ColorMetrics.numeric(0x112233)).then( () => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setStatusBarColor.');
                    expect(false).assertTrue();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err.code) +',errMessage: '+ err.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_getStatusBarProperty_ErrorCode_static_0100
         * @tc.name        test_getStatusBarProperty_1300002_static
         * @tc.desc        test_getStatusBarProperty_1300002
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_getStatusBarProperty_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "test_getStatusBarProperty_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let config: window.Configuration = {
                name: "systemWindow",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let subWindowClass = await window.createWindow(config);
            await subWindowClass.destroyWindow();
            try {
                subWindowClass!.getStatusBarProperty();
                expect(false).assertTrue();
                hilog.error(domain, tag,msgStr + 'Succeeded in calling getStatusBarProperty.');
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call getStatusBarProperty. Cause:' + JSON.stringify(exception.code) +',errMessage: '+ exception.message);
                if (exception.code == 801){
                    done()
                }else{
                    expect(exception.code).assertEqual(1300002);
                    expect(exception.message!=null).assertTrue();
                    done()
                }

            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_Static_0400
         * @tc.name        testGlobalDisplayToClientwithDestroyedWindow_Static
         * @tc.desc        验证globalDisplayToClient接口窗口异常状态调用
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGlobalDisplayToClientwithDestroyedWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName :string = 'testGlobalDisplayToClientwithDestroyedWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testGlobalDisplayToClientwithDestroyedWindow')
            await windowClass.destroyWindow()
            try {
                let position:window.Position = windowClass.globalDisplayToClient(100, 100);
                hilog.info(domain, tag,caseName + ' position: ' + JSON.stringify(position));
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message!=null).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_GLOBAL_DISPLAY_TO_CLIENT_WITH_INVAILD_PARAMETERS_Static
         * @tc.name        testGlobalDisplayToClientwithOutofRange_Static
         * @tc.desc        验证子窗调用globalDisplayToClient入参超出int值抛1300016错误码
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGlobalDisplayToClientwithOutofRange_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName :string = 'testGlobalDisplayToClientwithOutofRange_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testGlobalDisplayToClientwithOutofRange')
            await Utils.msSleep(200);
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            await Utils.msSleep(200)
            await windowClass.moveWindowTo(-50, -50);
            await Utils.msSleep(200);
            try {
                const maxInt:int = 2147483647;
                windowClass.globalDisplayToClient(maxInt, maxInt);
                await windowClass.destroyWindow()
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if (err.code == 801) {
                    done()
                } else {
                    expect(err.code).assertEqual(1300016)
                    done()
                }
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_Static_0200
         * @tc.name        testClientToGlobalDisplaywithDestoryedWindow_Static
         * @tc.desc        验证clientToGlobalDisplay接口窗口异常状态调用
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testClientToGlobalDisplaywithDestoryedWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName :string = 'testClientToGlobalDisplaywithDestoryedWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testMoveWindowToGlobalDisplaywithDestoryedWindow')
            await windowClass.destroyWindow();
            try {
                let position:window.Position = windowClass.clientToGlobalDisplay(100, 100);
                hilog.info(domain, tag,caseName + ' position: ' + JSON.stringify(position));
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message!=null).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_Static_0300
         * @tc.name        testClientToGlobalDisplaywithPositionOutofRange_Static
         * @tc.desc        验证clientToGlobalDisplay接口入参越界
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testClientToGlobalDisplaywithPositionOutofRange_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName :string = 'testClientToGlobalDisplaywithPositionOutofRange_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testClientToGlobalDisplaywithPositionOutofRange')
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.moveWindowToAsync(50,50);
            await Utils.msSleep(1000);
            try {
                const maxInt:int = 2147483647;
                let position:window.Position = windowClass.clientToGlobalDisplay(maxInt, maxInt);
                hilog.info(domain, tag,caseName + ' position: ' + JSON.stringify(position));
                await windowClass.destroyWindow();
                expect(false).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if (err.code == 801) {
                    done()
                } else {
                    expect(err.code).assertEqual(1300016)
                    done();
                }
            }
        })
        /**
         * @tc.name   testEnumPixelUnit_static
         * @tc.number testEnumPixelUnit_static
         * @tc.desc   testEnumPixelUnit
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEnumPixelUnit_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testEnumPixelUnit_static';
            console.log(caseName + 'begin.');
            try {
                expect(window.PixelUnit.PX).assertEqual(0);
                expect(window.PixelUnit.VP).assertEqual(1);
                done();
            } catch (err) {
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_TEST_WINDOW_LIMIT_VP_static_0400
         * @tc.name       testGetWindowLimitsVPSetWindowLimitsVP_static
         * @tc.desc       testGetWindowLimitsVPSetWindowLimitsVP_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 0
         */
        it('testGetWindowLimitsVPSetWindowLimitsVP_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowLimitsVPSetWindowLimitsVP_static';
            console.log(caseName + 'begin');
            let windowClass: window.Window | undefined;
            let windowStageStart = await startAbility(caseName, context!);

            try {
                windowClass = windowStageStart.getMainWindowSync();
                await windowClass!.setUIContent('pages/index2');
                await windowClass!.showWindow();
                let windowLimits = windowClass?.getWindowLimitsVP();
                console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
                let setWindowLimits: window.WindowLimits = {
                    minWidth: windowLimits?.minWidth as int + 10,
                    minHeight: windowLimits?.minHeight as int + 10,
                    maxWidth: windowLimits?.maxWidth as int - 10,
                    maxHeight: windowLimits?.maxHeight as int - 10,
                    pixelUnit: window.PixelUnit.VP
                }
                await windowClass!.setWindowLimits(setWindowLimits);
                let windowLimits2 = windowClass?.getWindowLimitsVP();
                console.log(`${caseName} windowLimits2: ${JSON.stringify(windowLimits2)}`);

                expect(windowLimits2?.minWidth).assertEqual(setWindowLimits?.minWidth)
                expect(windowLimits2?.minHeight).assertEqual(setWindowLimits?.minHeight)
                expect(windowLimits2?.maxWidth).assertEqual(setWindowLimits?.maxWidth)
                expect(windowLimits2?.maxHeight).assertEqual(setWindowLimits?.maxHeight)
                await terminateAbility(caseName);
                done()
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
                await windowClass!.destroyWindow();
                await terminateAbility(caseName);
                if (err.code === 801) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        });
        /**
         * @tc.name   testClientToGlobalDisplayandGlobalDisplayToClient_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_CLIENT_AND_GLOBAL_DISPLAY_CHANGE_static_0100
         * @tc.desc   验证组件相对主窗和主屏的接口坐标转化场景
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testClientToGlobalDisplayandGlobalDisplayToClient_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testClientToGlobalDisplayandGlobalDisplayToClient_static';
            console.log(caseName + 'begin.');
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testClientToGlobalDisplayandGlobalDisplayToClient_static')
            await Utils.msSleep(200);
            await subWindowClass.setUIContent('pages/index2');
            await subWindowClass.showWindow();
            await Utils.msSleep(300)
            try {
                let globalRect = subWindowClass.getWindowProperties().globalDisplayRect;
                console.log(caseName + ' globalRect: ' + JSON.stringify(globalRect));
                let position:window.Position = subWindowClass.clientToGlobalDisplay(100, 100);
                console.log(caseName + ' position: ' + JSON.stringify(position));
                let position2:window.Position = subWindowClass.globalDisplayToClient(position.x, position.y);
                console.log(caseName + ' position2: ' + JSON.stringify(position2));
                expect(position2.x).assertEqual(100);
                expect(position2.y).assertEqual(100);
                await subWindowClass.destroyWindow()
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                await subWindowClass.destroyWindow()
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        
        /**
         * @tc.name   test_createSubWindowWithOptions_windowRect_801_static
         * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_static_0300
         * @tc.desc   LeftTop为正整数，验证801
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('test_createSubWindowWithOptions_windowRect_801_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                const message = 'test_createSubWindowWithOptions_windowRect_801_static'
                let options: window.SubWindowOptions = {
                    title: 'subwindow0',
                    decorEnabled: false,
                    windowRect: {
                        left: 100,
                        top: 100,
                        width: 300,
                        height: 300
                    }
                };
                let promise = windowStage!.createSubWindowWithOptions('subwindow0', options);
                promise.then(async (data:window.Window) => {
                    console.info('succeed in create the subwindow');
                    let subWindowClass:window.Window = data;
                    await subWindowClass.setUIContent('pages/index2');
                    await subWindowClass.showWindow();
                    await Utils.msSleep(1000);
                    let windowRealRect = subWindowClass.getWindowProperties().windowRect
                    console.info(`options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
                    expect(options.windowRect?.left).assertEqual(windowRealRect.left);
                    expect(options.windowRect?.top).assertEqual(windowRealRect.top);
                    expect(options.windowRect?.width).assertEqual(windowRealRect.width);
                    expect(options.windowRect?.height).assertEqual(windowRealRect.height);
                    done();
                }).catch((err:Error) :PromiseLike<void>|undefined => {
                    console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
                    if (err.code == 801 || err.code == 1300002) {
                        expect(err.message != null).assertTrue();
                        expect(true).assertTrue();
                        console.error(`The device not support createSubWindowWithOptions`);
                        done();

                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (err) {
                console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
                expect(true).assertFail()
                done();
            }
            ;
        });
        /**
         * @tc.name   testEnumOcclusionState_static
         * @tc.number testEnumOcclusionState_static
         * @tc.desc   testEnumOcclusionState
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEnumOcclusionState_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string =  'testEnumOcclusionState_static';
            console.log(caseName + 'begin.');
            try {
                console.log(caseName + ' OcclusionState: ' + window.OcclusionState.NO_OCCLUSION+','+window.OcclusionState.PARTIAL_OCCLUSION+','+window.OcclusionState.FULL_OCCLUSION)
                expect(window.OcclusionState.NO_OCCLUSION).assertEqual(0);
                expect(window.OcclusionState.PARTIAL_OCCLUSION).assertEqual(1);
                expect(window.OcclusionState.FULL_OCCLUSION).assertEqual(2);
                done();
            } catch (err) {
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   test_setWindowLimits_ErrorCode_1300002_static
         * @tc.number test_setWindowLimits_ErrorCode_1300002_static
         * @tc.desc   test_setWindowLimits_ErrorCode_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_setWindowLimits_ErrorCode_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let CaseName:string = 'test_setWindowLimits_ErrorCode_1300002_static';
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 100,
                minHeight: 100
            };
            let subWindow = await windowStage!.createSubWindow('test_setWindowLimits_ErrorCode_1300002');
            await Utils.msSleep(200);
            await subWindow.destroyWindow();
            try {
                let promise = subWindow.setWindowLimits(windowLimits,true);
                promise.then(()=>{
                    console.log(CaseName + ' setWindowLimits success ');
                    expect(false).assertTrue();
                    done();
                }).catch((err:Error):PromiseLike<void>|undefined=>{
                    console.error(CaseName + ' setWindowLimits failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                })
            }catch (err) {
                console.error(CaseName + ' failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                expect(false).assertTrue();
                done();
            }

        })
        /**
         * @tc.name   testsetSeparationTouchEnabled_1300002_static
         * @tc.number SUB_BASIC_WMS_setSeparationTouchEnabled_static_0100
         * @tc.desc   testsetSeparationTouchEnabled_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testsetSeparationTouchEnabled_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testsetSeparationTouchEnabled_1300002_static ';
            console.log(caseName + 'begin');
            try {
                let subWindow:window.Window = await windowStage!.createSubWindow('testsetSeparationTouchEnabled_1300002');
                await Utils.msSleep(200);
                await subWindow.destroyWindow();
                subWindow.setSeparationTouchEnabled(false).then(()=> {
                    console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: Error):PromiseLike<void>|undefined => {
                    console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        expect(true).assertTrue()
                    } else {
                        expect(err.code).assertEqual(1300002)
                    }
                    done();
                });
            } catch (err) {
                console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.name   testSetResizeByDragEnabledTrue_1300002_static_0200
         * @tc.number testSetResizeByDragEnabledTrue_1300002_static_0200
         * @tc.desc   testSetResizeByDragEnabledTrue_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetResizeByDragEnabledTrue_1300002_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetResizeByDragEnabledTrueTest_1300002_static_0200';
            if (isPCStatus != '') {
                try {
                    let options: window.SubWindowOptions = {
                        title: 'subWindow',
                        decorEnabled: true
                    };
                    windowStage!.createSubWindowWithOptions('testSetResizeByDragEnabledTrueTest_1300002_static_0200', options).then(async (subWindowClass:window.Window) => {
                        subWindowClass.setUIContent("pages/index2");
                        await subWindowClass.resizeAsync(1000, 1200)
                        await subWindowClass.moveWindowToAsync(300, 200)
                        await subWindowClass.showWindow()
                        let enabled = true;
                        let promise = subWindowClass.setResizeByDragEnabled(enabled);
                        promise.then(async ()=> {
                            console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
                            let windowPoint:window.Rect = subWindowClass.getWindowProperties().windowRect
                            console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
                            let X:int = (windowPoint!.left + Math.ceil(windowPoint!.width / 2)) as int;
                            let Y:int = windowPoint!.top + 5
                            await driver.mouseMoveTo({x:X,y:Y});
                            await Utils.msSleep(1000)
                            await driver.mouseDrag({ x: (windowPoint!.left + Math.ceil(windowPoint!.width / 2)) as int, y: (windowPoint!.top + 5) as int }, { x: (windowPoint!.left + Math.ceil(windowPoint!.width / 2)) as int, y: (windowPoint!.top + 100) as int }, 2000)
                            await Utils.msSleep(1000)
                            let windowPointDragged = subWindowClass.getWindowProperties().windowRect
                            console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
                            expect(windowPointDragged.width).assertEqual(windowPoint.width)
                            expect(windowPointDragged.height).assertEqual(windowPoint.height - 95)
                            done()
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            if (err.code == 801) {
                                expect(err.message != null).assertTrue();
                                console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
                                expect(true).assertFalse();
                                done();
                            } else {
                                console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
                                expect(false).assertTrue();
                                done();
                            }
                        });
                    })
                } catch (exception) {
                    console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.info(`${message} not support`);
                done()
            }
        })
        /**
         * @tc.name   testsetReceiveDragEventEnabled_1300002_static
         * @tc.number SUB_BASIC_WMS_setReceiveDragEventEnabled_static_0100
         * @tc.desc   testsetReceiveDragEventEnabled_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testsetReceiveDragEventEnabled_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testsetReceiveDragEventEnabled_1300002_static ';
            console.log(caseName + 'begin');
            try {
                let subWindow:window.Window = await windowStage!.createSubWindow('testsetReceiveDragEventEnabled_1300002_static');
                await Utils.msSleep(200);
                await subWindow.destroyWindow();
                subWindow.setReceiveDragEventEnabled(false).then(()=> {
                    console.info(caseName + 'Succeeded in calling setReceiveDragEventEnabled.');
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: Error):PromiseLike<void>|undefined => {
                    console.error(caseName + 'Failed to call setReceiveDragEventEnabled. Cause: ' + JSON.stringify(err));
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        expect(true).assertTrue()
                    } else {
                        expect(err.code).assertEqual(1300002)
                    }
                    done();
                });
            } catch (err) {
                console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.name   test_SetFollowParentWindowLayoutEnabled_1300002_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SetFollowParentWindowLayoutEnabled_static_0200
         * @tc.desc   test_SetFollowParentWindowLayoutEnabled_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("test_SetFollowParentWindowLayoutEnabled_1300002_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_SetFollowParentWindowLayoutEnabled_1300002_static";
            console.log(msgStr + "begin");
            let subWindowClass: window.Window | undefined;
            try {
                let promise = windowStage!.createSubWindow('test_SetFollowParentWindowLayoutEnabled_1300002_static');
                promise.then(async (data: window.Window) => {
                    subWindowClass = data;
                    console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    await subWindowClass!.destroyWindow();
                    let promise2 = subWindowClass!.setFollowParentWindowLayoutEnabled(true);
                    promise2.then(()=> {
                        console.info(msgStr + 'Succeeded in setFollowParentWindowLayoutEnabled ');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(1300002)
                        expect(err.message != null).assertTrue();
                        done();

                    });
                }).catch(async (err: Error):PromiseLike<void>|undefined => {
                    console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    await subWindowClass!.destroyWindow();
                    if (err.code == 801) {
                        expect(err.message != null).assertTrue();
                        console.log(msgStr + '此设备不支持');
                        done();
                    } else {
                        console.log(msgStr + 'Failed to setWindowMask');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (error) {
                console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   test_setFollowParentMultiScreenPolicy_1300002_static
         * @tc.number SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_static_0200
         * @tc.desc   test_setFollowParentMultiScreenPolicy_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_setFollowParentMultiScreenPolicy_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "test_setFollowParentMultiScreenPolicy_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWindow:window.Window = await windowStage!.createSubWindow('test_setFollowParentMultiScreenPolicy_1300002_static');
            await subWindow.setUIContent('pages/index2');
            await subWindow.showWindow();
            try {
                await subWindow.destroyWindow();
                let promise = subWindow.setFollowParentMultiScreenPolicy(true);
                promise.then(() => {
                    console.info(msgStr + 'Succeeded  setFollowParentMultiScreenPolicy.');
                    expect(true).assertFail();
                    done()
                }).catch(async (err: Error) => {
                    console.error(msgStr + `Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        expect(err.message != null).assertTrue();
                        done()
                    } else {
                        expect(err.code).assertEqual(1300002)
                        expect(err.message != null).assertTrue();
                        done()
                    }
                });
            } catch (e) {
                console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
                await subWindow.destroyWindow();
                expect(true).assertFail();
                done()
            }

        })

        /**
         * @tc.name   testSetContentAspectRatio_static_0400
         * @tc.number SUB_BASIC_WMS_SET_CONTENT_ASPECTRATIO_static_0500
         * @tc.desc   setContentAspectRatio错误码校验1300004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetContentAspectRatio_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetContentAspectRatio_static_0400';
            console.log(caseName + 'begin.');
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await windowStage!.createSubWindow('testSetContentAspectRatio_static_0400');
                await Utils.msSleep(200);
                await subWindowClass.setUIContent('pages/index2');
                await subWindowClass.showWindow();
                await subWindowClass.setContentAspectRatio(1.0, false, false);
                console.log(`${caseName} sub window setContentAspectRatio succeed. `);
                await subWindowClass.destroyWindow()
                expect(true).assertFail();
                done()
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                await subWindowClass!.destroyWindow()
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(err.code).assertEqual(1300004);
                    expect(err.message != null).assertTrue();
                }
            }

            let dialogWindowClass: window.Window | undefined;
            let config: window.Configuration = {
                name: "testSetContentAspectRatio_0400_dialog_window",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            try {
                dialogWindowClass = await window.createWindow(config);
                await Utils.msSleep(200);
                await dialogWindowClass.setUIContent('pages/index2');
                await dialogWindowClass.showWindow();
                await dialogWindowClass.setContentAspectRatio(1.0, false);
                console.log(`${caseName} dialog window setContentAspectRatio succeed. `);
                await dialogWindowClass.destroyWindow()
                expect(true).assertFail();
                done()
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed2, err: ${JSON.stringify(err)}`);
                await dialogWindowClass!.destroyWindow()
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(err.code).assertEqual(1300004);
                    expect(err.message != null).assertTrue();
                    done()
                }
            }
        })
        /**
         * @tc.name   testSetAspectRatioCallbackErrCode1300002_static_0100
         * @tc.number testSetAspectRatioCallbackErrCode1300002_static_0100
         * @tc.desc   testSetAspectRatioCallbackErrCode1300002_static_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetAspectRatioCallbackErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetAspectRatioCallbackErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let ratio:int = 1;
            let subWin: window.Window = await windowStage!.createSubWindow('testSetAspectRatioCallbackErrCode1300002_SubWindow_Promise');
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin.setAspectRatio(ratio, (err: BusinessError<void>|null) => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        console.error(msgStr + 'Failed to call setAspectRatio. Cause:' + err!.code+'message：'+err!.message);
                        expect(err!.code).assertEqual(1300002);
                        expect(err!.message!=null).assertTrue();
                        done();
                    }else{
                        console.info(msgStr + 'Succeeded in calling setAspectRatio.');
                        expect(true).assertFail();
                        done();
                    }

                });
            } catch (exception) {
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(true).assertFail();
                done()
            }
        })

        /**
         * @tc.name   testSetAspectRatioPromiseErrCode1300002_static_0100
         * @tc.number testSetAspectRatioPromiseErrCode1300002_static_0100
         * @tc.desc   testSetAspectRatioPromiseErrCode1300002_static_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetAspectRatioPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetAspectRatioPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            subWin = await windowStage!.createSubWindow('testSetAspectRatioPromiseErrCode1300002_SubWindow_Promise');
            await (subWin! as window.Window).destroyWindow();
            try {
                (subWin! as window.Window).setAspectRatio(1).then(async ()=> {
                    console.info(msgStr + 'Succeeded in calling setAspectRatio.');
                    expect(true).assertFail();
                }).catch(async (err: Error) => {
                    console.error(msgStr + 'Failed to call setAspectRatio. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                });
                done()
            } catch (exception) {
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(true).assertFail();
                done()
            }
        })
        /**
         * @tc.name   testResetAspectRatioCallbackErrCode1300002_static_0100
         * @tc.number testResetAspectRatioCallbackErrCode1300002_static_0100
         * @tc.desc   testResetAspectRatioCallbackErrCode1300002_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testResetAspectRatioCallbackErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testResetAspectRatioCallbackErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            subWin = await windowStage!.createSubWindow('testResetAspectRatioCallbackErrCode1300002_SubWindow_Promise')
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin.resetAspectRatio((err: BusinessError<void>|null) => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        console.error(msgStr + 'Failed to call resetAspectRatio. Cause:' + err!.code+'message:'+err!.message);
                        expect(err!.code).assertEqual(1300002);
                        expect(err!.message!=null).assertTrue();
                        done()
                    }else{
                        console.info(msgStr + 'Succeeded in calling resetAspectRatio.');
                        expect(true).assertFail();
                        done();
                    }

                });
            } catch (exception) {
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(true).assertFail();
                done()
            }
        })
        /**
         * @tc.name   testResetAspectRatioPromiseErrCode1300002_static_0100
         * @tc.number testResetAspectRatioPromiseErrCode1300002_static_0100
         * @tc.desc   testResetAspectRatioPromiseErrCode1300002_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testResetAspectRatioPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testResetAspectRatioPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window = await windowStage!.createSubWindow('testResetAspectRatioPromiseErrCode1300002_SubWindow_Promise_static');
            await (subWin! as window.Window).destroyWindow();
            try {
                (subWin! as window.Window).resetAspectRatio().then(async ()=> {
                    console.info(msgStr + 'Succeeded in calling resetAspectRatio.');
                    expect(true).assertFail();
                }).catch(async (err: Error) => {
                    console.error(msgStr + 'Failed to call resetAspectRatio. Cause: ' + err!.code+'message:'+err!.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                });
                done()
            } catch (exception) {
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(true).assertFail();
                done()
            }
        })
        /**
         * @tc.name   testOnandOffRectChangeInGlobalDisplaywithMainWindow_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_ON_GLOBAL_RECT_static_0100
         * @tc.desc   验证主窗on(type: 'rectChangeInGlobalDisplay')接口重复注册多次
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOnandOffRectChangeInGlobalDisplaywithMainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> => {
            const caseName:string = 'testOnandOffRectChangeInGlobalDisplaywithMainWindow_static';
            console.log(caseName + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            let windowClass:window.Window = windowStageStart.getMainWindowSync();
            let timer = 0;
            try {
                const callback = (cb: window.RectChangeOptions) => {
                    console.log(caseName + ' cb: ' + JSON.stringify(cb));
                    timer++;
                };
                windowClass.onRectChangeInGlobalDisplay(callback);
                windowClass.onRectChangeInGlobalDisplay(callback);
                windowClass.onRectChangeInGlobalDisplay(callback);
                windowClass.moveWindowToAsync(50, 50);
                await Utils.msSleep(200);
                console.log(caseName + ' timer: ' + timer);
                if (isFreeWindowMode == true) {
                    expect(timer).assertEqual(1);
                } else {
                    expect(timer).assertEqual(0);
                }
                windowClass.offRectChangeInGlobalDisplay();
                await terminateAbility(caseName);
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                await terminateAbility(caseName);
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    windowClass.offRectChangeInGlobalDisplay();
                    expect(true).assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_static_0100
         * @tc.name       testOnOcclusionStatewithDestoryedSubwindow_static
         * @tc.desc       验证子窗销毁后注册OnOcclusionState返回1300002错误码验证
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testOnOcclusionStatewithDestoryedSubwindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnOcclusionStatewithDestoryedSubwindow_static ';
            console.log(caseName + 'begin');
            let subWindowClass:window.Window = await windowStage!.createSubWindow(caseName);
            await subWindowClass.destroyWindow();
            try {
                const callback = (res: window.OcclusionState) => {
                    console.info(caseName + ' callback res: ' + JSON.stringify(res));
                }
                subWindowClass.onOcclusionStateChanged(callback);
                console.log(caseName + 'success. ');
                expect(true).assertFail()
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code !== 801) {
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect(err.code).assertEqual(801);
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_static_0200
         * @tc.name       testOffOcclusionStatewithDestoryedSubwindow_static
         * @tc.desc       验证子窗销毁后注册OffOcclusionState返回1300002错误码验证
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testOffOcclusionStatewithDestoryedSubwindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffOcclusionStatewithDestoryedSubwindow_static ';
            console.log(caseName + 'begin');
            let subWindowClass:window.Window = await windowStage!.createSubWindow(caseName);
            await subWindowClass.destroyWindow();
            try {
                const callback = (res: window.OcclusionState) => {
                    console.info(caseName + ' callback res: ' + JSON.stringify(res));
                }
                subWindowClass.offOcclusionStateChanged(callback);
                console.log(caseName + 'success. ');
                expect(true).assertFail()
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code!==801) {
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect(err.code).assertEqual(801);
                    done();
                }
            }
        });
        /**
         * @tc.name   test_on_windowRectChange_static
         * @tc.number test_on_windowRectChange_static
         * @tc.desc   test_on_windowRectChange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("test_on_windowRectChange_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_on_windowRectChange_static";
            console.log(msgStr + "begin");
            let windowClass:window.Window = await windowStage!.getMainWindow();
            try {
                windowClass.onWindowRectChange((data: window.RectChangeOptions) => {
                    console.info(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
                    console.info(msgStr + 'Succeeded window rect changes. reason: ' + JSON.stringify(data.reason));
                });
                windowClass.offWindowRectChange();
                console.log(msgStr + 'Succeeded to off the windowRectChange');
                expect(true).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                if (error.code === 801) {
                    console.info(`${msgStr} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                    expect(true).assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testMoveWindowToGlobalDisplaywithDestoryedWindow_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_MOVE_WINDOW_TO_GLOBAL_RECT_static_0200
         * @tc.desc   验证moveWindowToGlobalDisplay接口窗口状态异常调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testMoveWindowToGlobalDisplaywithDestoryedWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testMoveWindowToGlobalDisplaywithDestoryedWindow_static';
            console.log(caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testMoveWindowToGlobalDisplaywithDestoryedWindow_static')
            await windowClass.destroyWindow();
            try {
                await windowClass.moveWindowToGlobalDisplay(30, 30);
                await Utils.msSleep(200);
                expect(true).assertFail();
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300002)
                expect(err.message != null).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   test_moveWindowToGlobal_moveConfiguration_static
         * @tc.number SUB_BASIC_WMS_MOVE_GLOBAL_static_0100
         * @tc.desc   验证moveWindowToGlobal参数MoveConfiguration
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_moveWindowToGlobal_moveConfiguration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'test_moveWindowToGlobal_moveConfiguration_static!'
            let subWindowClass:window.Window;
            let options: window.SubWindowOptions = {
                title: message,
                decorEnabled: true,
            };
            try {
                let promise = windowStage!.createSubWindowWithOptions(message, options)
                promise.then(async (data:window.Window) => {
                    subWindowClass = data;
                    await subWindowClass.setUIContent('pages/index2');
                    await subWindowClass.showWindow();
                    let displayId:Long|undefined = subWindowClass!.getWindowProperties().displayId;
                    let moveConfiguration: window.MoveConfiguration = {
                        displayId: displayId
                    }
                    let promise = subWindowClass.moveWindowToGlobal(300, 300, moveConfiguration);
                    promise.then(async () => {
                        console.info(`${message} succeed in moveWindowToGlobal`);
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        console.error(`${message} promise Failed to moveWindowToGlobal, Cause code ${err!.code}, message ${err!.message} `);
                        expect(err!.code).assertEqual(801);
                        expect(err!.message != null).assertTrue();
                        done();
                    });
                    await Utils.msSleep(1000);
                    let rect = subWindowClass.getWindowProperties().windowRect;
                    console.info(`${message} after moving windowRect:${JSON.stringify(rect)}`);
                    expect(rect.left).assertEqual(300);
                    expect(rect.top).assertEqual(300);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined  => {
                    console.error(`${message} promise Failed to test MoveConfiguration, Cause code ${err.code}, message ${err.message} `);
                    if (err.code == 1300002 || err.code == 801) {
                        expect(true).assertTrue();
                    } else {
                        expect(true).assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.log(`${message} Failed to test MoveConfiguration.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
                expect(true).assertFail();
                done();
            }

        });
        /**
         * @tc.name   testGetWindowLimits_MainWindow_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_static_0110
         * @tc.desc   Gets the size limit for the current application window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowLimits_MainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
            let caseName:string= 'testGetWindowLimits_MainWindow_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let mainWin :window.Window= windowStage!.getMainWindowSync();
            expect(!!mainWin).assertTrue();
            try {
                let windowLimits: window.WindowLimits = mainWin.getWindowLimits();
                console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(windowLimits));
                expect(!!windowLimits).assertTrue();
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception.code != 801) {
                    console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(true).assertFail();
                } else {
                    console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    console.log(msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                    expect(exception.message != null).assertTrue();
                }
            }
        })
        /**
         * @tc.name   testWindowEnableDragTruewithFullScreenMainWindow_static
         * @tc.number SUB_BASIC_WMS_SYSTEMAPI_ENABLEDRAG_static_0700
         * @tc.desc   验证全屏主窗调用enabledrag抛1300004错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowEnableDragTruewithFullScreenMainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName = 'testWindowEnableDragTruewithFullScreenMainWindow_static';
            console.log(caseName + 'begin.');
            try {
                let windowClass :window.Window= windowStage!.getMainWindowSync();
                let windowStatusType:window.WindowStatusType = windowClass.getWindowStatus();
                console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));

                await windowClass.enableDrag(true);
                await Utils.msSleep(200);
                if (windowStatusType != window.WindowStatusType.FULL_SCREEN) {
                    done();
                }

            } catch (err){
                err = err as BusinessError;
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done();
                } else {
                    expect(err.code).assertEqual(1300004);
                    expect(err.message != null).assertTrue();
                    done();
                }
            }
        })


    })

}