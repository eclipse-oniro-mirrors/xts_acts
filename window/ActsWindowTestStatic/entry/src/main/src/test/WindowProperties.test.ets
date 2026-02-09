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
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import { image } from '@kit.ImageKit';
import settings from '@ohos.settings';
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
        hilog.info(domain, tag, `${caseName}  get windowStageStart start .`);
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        hilog.info(domain, tag, `${caseName} Succeeded in get windowStageStart.`+windowStageStart);
        resolve(windowStageStart);
    })
}
async function terminateAbility(caseName: string) {
    hilog.info(domain, tag,`${caseName} terminateSelf start..`);
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    hilog.info(domain, tag,`${caseName} pageContext :${pageContext}`);
    try {
        if (pageContext !== null && pageContext !== undefined) {
            hilog.info(domain, tag,`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            hilog.info(domain, tag,`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            hilog.error(domain, tag,`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        hilog.error(domain, tag,`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowPropertiesTest() {

    describe("WindowPropertiesTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPropertiesTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        let isPCStatus: string = '';
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
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_static_0300
         * @tc.name       test_testSetCustomDensity_1300002_static
         * @tc.desc       test_testSetCustomDensity_1300002_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_testSetCustomDensity_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensity_1300002_static';
            hilog.info(domain, tag,caseName + 'begin');
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            hilog.info(domain, tag,msgStr + 'startAbility success... ' );
            await Utils.msSleep(300);
            await terminateAbility(caseName);
            hilog.info(domain, tag,msgStr + 'terminateAbility success... ' );
            try {
                windowStageStart.setCustomDensity(-1);
                hilog.info(domain, tag,msgStr + 'setWindowRectAutoSave success. ' );
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_DESTROYED_MAINWINDOW_Static
         * @tc.name       testSetWindowContainerColorwithDestroyedMainWindow_Static
         * @tc.desc       验证销毁后的主窗调用setwindowcontainercolor接口抛1300002错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetWindowContainerColorwithDestroyedMainWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowContainerColorwithDestroyedMainWindow_Static ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await Utils.msSleep(200)
            let windowClass:window.Window = windowStageStart.getMainWindowSync();
            await terminateAbility(caseName)
            try {
                windowClass.setWindowContainerColor("#0099FF","#00000000");
                hilog.info(domain, tag,caseName + 'success. ');
                expect(false).assertTrue()
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message!=null).assertTrue();
                done();
            }
        });
        /**
         * @tc.number      testSetDefaultDensityEnabledErrCode1300002_0100
         * @tc.name        testSetDefaultDensityEnabledErrCode1300002_0100
         * @tc.desc        testSetDefaultDensityEnabledErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetDefaultDensityEnabledErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetDefaultDensityEnabledErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowStageStart = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = () => {
                };
                windowStageStart.setDefaultDensityEnabled(true);
                console.error(msgStr + 'Succeeded in calling on setDefaultDensityEnabled.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call on setDefaultDensityEnabled. Cause:' + JSON.stringify(e));
                if (e.code == 801) {
                    expect(e.code).assertEqual(801);
                } else if (e.code == 1300002) {
                    expect(e.code).assertEqual(1300002);
                } else {
                    expect(false).assertTrue();
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowPrivacyModePromiseErrCode1300002_0100
         * @tc.name         testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowPrivacyModePromiseErrCode1300002_static_0100', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModePromiseErrCode1300002_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = await windowStage!.createSubWindow('testSetWindowPrivacyModePromiseErrCode1300002_static_0100');
            await win.destroyWindow();
            try {
                win!.setWindowPrivacyMode(true).then(async () => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });

            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number       testSetWindowPrivacyModeCallbackErrCode1300002_0100
         * @tc.name         testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.desc         testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModeCallbackErrCode1300002_static_0200";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = await windowStage!.createSubWindow('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200');
            await win.destroyWindow();
            try {
                win!.setWindowPrivacyMode(false,(err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(err));
                        expect(errCode).assertEqual(1300002);
                        done()
                    }else{
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2910
         * @tc.name        testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Check whether the current window supports the wide color gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).isWindowSupportWideGamut((err: BusinessError<void>|null, data:Boolean|undefined):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in checking whether the window support WideGamut Data: ' + JSON.stringify(data));
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2920
         * @tc.name        testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        Check whether the current window supports the wide color gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                await (win as window.Window).isWindowSupportWideGamut().then((data:boolean) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in checking whether the window support WideGamut. Data: ' + JSON.stringify(data));
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002)
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2940
         * @tc.name        testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Set the current window to wide gamut mode or default gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setWindowColorSpace(window.ColorSpace.WIDE_GAMUT, (err: BusinessError<void>|null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window colorspace.');
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2950
         * @tc.name        testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200
         * @tc.desc        Set the current window to wide gamut mode or default gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Promise');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                await (win as window.Window).setWindowColorSpace(window.ColorSpace.DEFAULT).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window colorspace.');
                    expect(false).assertTrue();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002)
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2960
         * @tc.name        testSetWindowBackgroundColor_WindowStateAbnormal_static_0100
         * @tc.desc        Set the background color of the window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowBackgroundColor_WindowStateAbnormal_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowBackgroundColor_WindowStateAbnormal_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetWindowBackgroundColor_WindowStateAbnormal');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let color: string = '#00ff33';
            try {
                (win as window.Window).setWindowBackgroundColor(color);
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3010
         * @tc.name        testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Set whether the screen is steady on
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setWindowKeepScreenOn(true, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the screen to be always on');
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1740
         * @tc.name        testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200
         * @tc.desc        Set whether the screen is steady on
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowClass: window.Window;
            windowClass = await windowStage!.createSubWindow('testSetWindowKeepScreenOn_Window_State_Abnorma');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!windowClass).assertTrue();
            await (windowClass as window.Window).destroyWindow();
            try {
                (windowClass as window.Window).setWindowKeepScreenOn(true).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the screen to be always on.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. catch Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })
/**
         * @tc.number      SUB_BASIC_WMS_GET_WINDOW_PROPERTIES_0100
         * @tc.name        test_getWindowProperties_mainWindow_static_0100
         * @tc.desc        test_getWindowProperties_mainWindow_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_getWindowProperties_mainWindow_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getWindowProperties_mainWindow_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let mainWindow : window.Window= windowStage!.getMainWindowSync();
                await Utils.msSleep(300);
                let properties:window.WindowProperties = mainWindow.getWindowProperties();
                hilog.info(0x0000, '[ANI]',`${caseName} :Succeeded in ogetWindowProperties info. Data: ` + JSON.stringify(properties));
                expect(properties.windowRect.left).assertLargerOrEqual(0);
                expect(properties.windowRect.top).assertLargerOrEqual(0);
                expect(properties.windowRect.width).assertLarger(0);
                expect(properties.windowRect.height).assertLarger(0);
                expect(properties.drawableRect.left).assertLargerOrEqual(0);
                expect(properties.drawableRect.top).assertLargerOrEqual(0);
                expect(properties.drawableRect.width).assertLarger(0);
                expect(properties.drawableRect.height).assertLarger(0);
                expect(properties.isLayoutFullScreen).assertEqual(false);
                expect(properties.focusable).assertEqual(true);
                expect(properties.touchable).assertEqual(true);
                expect(properties.brightness).assertEqual(-1);
                expect(properties.isKeepScreenOn).assertEqual(false);
                expect(properties.isPrivacyMode).assertEqual(false);
                expect(properties.isTransparent).assertEqual(false);
                expect(properties.isFullScreen).assertEqual(false);
                expect(properties.id).assertLarger(0);
                expect(properties.displayId).assertLargerOrEqual(0);
                expect(properties.name != null ).assertTrue();
                // expect(properties.dimBehindValue != null ).assertTrue();
                // expect(properties.isRoundCorner != null ).assertTrue();
                expect(properties.type != null ).assertTrue();
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]',`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        });

        /**
         * @tc.number      SUB_BASIC_WMS_GET_WINDOW_PROPERTIES_0200
         * @tc.name        test_getWindowProperties_mainWindow_static_0200
         * @tc.desc        test_getWindowProperties_mainWindow_static_0200
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('test_getWindowProperties_mainWindow_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getWindowProperties_mainWindow_static_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let tempWnd: window.Window = await windowStage!.createSubWindow('testLoadContent_Callback_static_0200');
            await tempWnd.destroyWindow();
            try {
                tempWnd.getWindowProperties();
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.getWindowProperties: ' + tempWnd);
                expect(false).assertTrue()
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
                if (exception.code == 1300002) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number       testOnDisplayIdChangeErrCode1300002_0100
         * @tc.name         testOnDisplayIdChangeErrCode1300002_static_0100
         * @tc.desc         testOnDisplayIdChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnDisplayIdChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnKeyboardDidHideErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testOnDisplayIdChangeErrCode1300002_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onDisplayIdChange((id) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(id));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
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
         * @tc.number       testOffDisplayIdChangeErrCode1300002_0100
         * @tc.name         testOffDisplayIdChangeErrCode1300002_static_0100
         * @tc.desc         testOffDisplayIdChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffDisplayIdChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffDisplayIdChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testOffDisplayIdChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offDisplayIdChange((id) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(id));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
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
         * @tc.number       testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.name         testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.desc         testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnWindowVisibilityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnWindowVisibilityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            await windowStage!.createSubWindow('testOnWindowVisibilityChangeErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onWindowVisibilityChange((res: boolean) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowVisibilityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on windowVisibilityChange. Cause:' + JSON.stringify(e));
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
         * @tc.number       testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.name         testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.desc         testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffWindowVisibilityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOffWindowVisibilityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOnWindowVisibilityChangeErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.offWindowVisibilityChange((res: boolean) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowVisibilityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on windowVisibilityChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done()
                });

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0100
         * @tc.name        testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100
         * @tc.desc        Enable this window to listen for status change events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done: () => void): Promise<void> => {
                let caseName: string = 'testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100';
                let msgStr: string = 'jsUnittest ' + caseName + ' ';
                hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
                let win: window.Window
                windowStage!.createSubWindow('testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100')
                    .then((data:window.Window)=>{
                        win = data;
                        expect(!!win).assertTrue();
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                        try {
                            (win as window.Window).offWindowVisibilityChange();
                            await (win as window.Window).destroyWindow();
                            expect(true).assertTrue();
                            done();
                        } catch (exception) {
                            await (win as window.Window).destroyWindow();
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' +
                            JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        }
                    })
                    .catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.info(0x0000, '[ANI]',
                            msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    });
                
            });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0200
         * @tc.name        testWindowOffWindowVisibilityChange_RepeatOff_static_0200
         * @tc.desc        Enable this window to listen for status change events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffWindowVisibilityChange_RepeatOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testWindowOffWindowVisibilityChange_RepeatOff_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let win: window.Window
            windowStage!.createSubWindow('testWindowOffWindowVisibilityChange_RepeatOff_static_0200')
                .then((data:window.Window)=>{
                    win = data;
                    expect(!!win).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    try {
                        (win as window.Window).onWindowVisibilityChange((flag:boolean) => {
                            hilog.info(0x0000, '[ANI]', msgStr + 'Window visibility changed, isVisible=' + flag);
                        });
                    } catch (exception) {
                        exception = exception as BusinessError;
                        if (exception!.code != 801) {
                            hilog.error(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        } else {
                            hilog.info(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(exception));
                            hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                            expect(exception.code).assertEqual(801);
                            // done();
                        }
                    }
                    try {
                        (win as window.Window).offWindowVisibilityChange();
                    } catch (exception) {
                        exception = exception as BusinessError;
                        if (exception!.code != 801) {
                            hilog.error(0x0000, '[ANI]','Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        } else {
                            hilog.info(0x0000, '[ANI]','Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                            hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                            expect(exception!.code).assertEqual(801);
                            // done();
                        }
                    }
                    try {
                        (win as window.Window).offWindowVisibilityChange();
                        await (win as window.Window).destroyWindow();
                        done();
                    } catch (exception) {
                        exception = exception as BusinessError;
                        await (win as window.Window).destroyWindow();
                        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done();
                    }
                })
                .catch((err:Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',
                        msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                });
            
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0300
         * @tc.name        testWindowVisibilityChange_on_Function_Callback_static_0100
         * @tc.desc        window type windowVisibilityChange
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testWindowVisibilityChange_on_Function_Callback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testWindowVisibilityChange_on_Function_Callback_static_0100";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try {
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass:window.Window = await windowStage!.getMainWindow();
                windowClass.onWindowVisibilityChange((flag:boolean) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Window visibility changed, isVisible=' + flag);
                });
                expect(true).assertTrue();
                windowClass.offWindowVisibilityChange();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.error(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(error));
                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0400
         * @tc.name        testWindowVisibilityChange_off_Function_Callback_static_0200
         * @tc.desc        window type windowVisibilityChange
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testWindowVisibilityChange_off_Function_Callback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testWindowVisibilityChange_off_Function_Callback_static_0200";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try {
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass:window.Window = await windowStage!.getMainWindow();
                windowClass.offWindowVisibilityChange();
                hilog.info(0x0000, '[ANI]', msgStr + 'Window visibility changed');
                expect(true).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.error(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]','Failed to unreegister callback. Cause: ' + JSON.stringify(error));
                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        });
        /**
         * @tc.number       testOnSystemDensityChangeErrCode1300002_0100
         * @tc.name         testOnSystemDensityChangeErrCode1300002_static_0100
         * @tc.desc         testOnSystemDensityChangeErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnSystemDensityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnSystemDensityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOnSystemDensityChangeErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onSystemDensityChange((res: number) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr +'Succeeded in calling on systemDensityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr +'Failed to call on systemDensityChange. Cause:' + JSON.stringify(e));
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
         * @tc.number       testOffSystemDensityChangeErrCode1300002_0100
         * @tc.name         testOffSystemDensityChangeErrCode1300002_static_0100
         * @tc.desc         testOffSystemDensityChangeErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffSystemDensityChangeErrCode1300002_static_0100', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOffSystemDensityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOffSystemDensityChangeErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.offSystemDensityChange((res: number) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr +'Succeeded in calling off systemDensityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr +'Failed to call off systemDensityChange. Cause:' + JSON.stringify(e));
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
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1200
         * @tc.name        testOnSetCustomDensity1_static_0100
         * @tc.desc        off systemDensityChange event
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnSetCustomDensity1_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSetCustomDensity1_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let g_flag: number = 0
            let windowClass:window.Window = await windowStage!.getMainWindow();
            const callback1 = (density: Double) => {
                hilog.info(0x0000, '[ANI]','System density changed, density=' + JSON.stringify(density));
                g_flag += 1
                expect(density).assertEqual(2);
            }
            const callback2 = (density: Double) => {
                hilog.info(0x0000, '[ANI]','System density changed, density=' + JSON.stringify(density));
                g_flag += 1
                expect(density).assertEqual(2);
            }
            try {
                windowClass.onSystemDensityChange(callback1);
                windowClass.onSystemDensityChange(callback2);
                hilog.info(0x0000, '[ANI]', msgStr +`Succeeded on systemDensityChange twice.`);
                windowClass.offSystemDensityChange();
                hilog.info(0x0000, '[ANI]', msgStr + `off all systemDensityChange success`);
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr +`Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception!.code == 801) {
                    hilog.info(0x0000, '[ANI]', msgStr +`Current device not support API:setCustomDensity`);
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
            done();
        });
        

        /**
         * @tc.number       testSetWindowFocusableErrCode1300002_0100
         * @tc.name         testSetWindowFocusableErrCode1300002_static_0100
         * @tc.desc         testSetWindowFocusableErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowFocusableErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowFocusableErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSetWindowFocusableErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.setWindowFocusable(true, (err: BusinessError | null) => {
                    hilog.info(domain, tag,msgStr + 'window setWindowFocusable callback err ：' + JSON.stringify(err));
                    expect(err?.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowFocusable. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowFocusablePromiseErrCode1300002_0100
         * @tc.name         testSetWindowFocusablePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowFocusablePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowFocusablePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowFocusablePromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSetWindowFocusablePromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.setWindowFocusable(true);
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowFocusable promise. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowTouchableErrCode1300002_0100
         * @tc.name         testSetWindowTouchableErrCode1300002_static_0100
         * @tc.desc         testSetWindowTouchableErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowTouchableErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowTouchableErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSetWindowTouchableErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.setWindowTouchable(true, (err: BusinessError | null) => {
                    hilog.info(domain, tag,msgStr + 'window setWindowFocusable callback err ：' + JSON.stringify(err));
                    expect(err?.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowTouchable. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowTouchablePromiseErrCode1300002_0100
         * @tc.name         testSetWindowTouchablePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowTouchablePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowTouchablePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowTouchablePromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSetWindowTouchablePromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.setWindowTouchable(true);
                expect(false).assertTrue();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowTouchable promise. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSnapshotErrCode1300002_0100
         * @tc.name         testSnapshotErrCode1300002_static_0100
         * @tc.desc         testSnapshotErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSnapshotErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSnapshotErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSnapshotErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.snapshot((err: BusinessError | null, data) => {
                    if(err?.code){
                        hilog.info(domain, tag,msgStr + 'window snapshot callback err ：' + JSON.stringify(err));
                        expect(err?.code).assertEqual(1300002);
                        done();
                    }else{
                        hilog.info(domain, tag,msgStr + 'window after snapshot');
                        expect(false).assertTrue();
                        done();
                    }

                });

            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to snapshot. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })


        /**
         * @tc.number       testSnapshotPromiseErrCode1300002_0100
         * @tc.name         testSnapshotPromiseErrCode1300002_static_0100
         * @tc.desc         testSnapshotPromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSnapshotPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSnapshotPromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testSnapshotPromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.snapshot();
                hilog.info(domain, tag,msgStr + 'window after snapshot ');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to snapshot. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_STATUS_BAR_CONTENT_COLOR_0100
         * @tc.name        testStatusBarContentColor_static_0100
         * @tc.desc        test_statusBarContentColor_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testStatusBarContentColor_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_statusBarContentColor_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let a: window.SystemBarStyle = {
                    statusBarContentColor: '#ffffff'
                }
                hilog.info(0x0000, '[ANI]',msgStr + 'a:'+ JSON.stringify(a));
                expect(true).assertTrue();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr +
                    `Failed to call statusBarContentColor. Cause code: ${exception!.code}, message: ${exception!.message}`);
                expect(false).assertTrue();
                done()
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_SetStatusBarColor_static_0300
         * @tc.name       test_setStatusBarColor_normal1_static
         * @tc.desc       验证设置正常状态栏颜色
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_setStatusBarColor_normal1_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "test_setStatusBarColor_normal1_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                 windowClass!.setStatusBarColor(ColorMetrics.numeric(0x112233)).then(async () => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setStatusBarColor.');
                    let res: window.StatusBarProperty = windowClass.getStatusBarProperty();
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling getStatusBarProperty, color: ' + res.contentColor);
                    expect(res.contentColor).assertEqual("#FF112233")
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })

        /**
         * @tc.number     SUB_BASIC_WMS_setExclusivelyHighlighted_1300004_static_0200
         * @tc.name       testsetExclusivelyHighlighted_1300004_static
         * @tc.desc       testsetExclusivelyHighlighted_1300004
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testsetExclusivelyHighlighted_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testsetExclusivelyHighlighted_1300004_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                let promise = windowClass.setExclusivelyHighlighted(true);
                promise.then(() => {
                    hilog.info(domain, tag,msgStr +'Succeeded in setting the window to be exclusively highlight.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr +`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code == 801){
                        done();
                    }else{
                        expect(err.code).assertEqual(1300004);
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
         * @tc.number     SUB_BASIC_WMS_setExclusivelyHighlighted_1300002_static_0300
         * @tc.name       testsetExclusivelyHighlighted_1300002_static
         * @tc.desc       testsetExclusivelyHighlighted_1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testsetExclusivelyHighlighted_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testsetExclusivelyHighlighted_1300002_static";
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
                let promise = windowClass.setExclusivelyHighlighted(true);
                promise.then(() => {
                    hilog.info(domain, tag,'Succeeded in setting the window to be exclusively highlight.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code == 801){
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
         * @tc.number    SUB_BASIC_WMS_GET_VISIBLEWINDOWINFO_static_0200
         * @tc.name      test_GET_VISIBLEWINDOWINFO_static_0200
         * @tc.desc      test_GET_VISIBLEWINDOWINFO_static_0200
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
         */
        it('test_GET_VISIBLEWINDOWINFO_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_GET_VISIBLEWINDOWINFO_static_0200 ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            try {
                let windowClass2:window.Window = windowStageStart.getMainWindowSync();
                let res = windowClass2.getWindowProperties()
                window.getVisibleWindowInfo().then((infos: Array<window.WindowInfo>) => {
                    hilog.info(domain, tag,caseName + 'Succeeded in calling getVisibleWindowInfo.');
                    expect(false).assertTrue();
                    await terminateAbility(caseName);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,caseName + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
                    expect(err.code == 201 || err.code == 801).assertTrue();
                    await terminateAbility(caseName);
                    done()
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,caseName + 'Failed2 to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
                await terminateAbility(caseName);
                if(err.code == 801 || err.code == 201){
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    testGetWindowsByCoordinateWithSystemWindow_static_0100
         * @tc.name      testGetWindowsByCoordinateWithSystemWindow_static
         * @tc.desc      Get windows by coordinate.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetWindowsByCoordinateWithSystemWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = 'TestGetWindowsByCoordinateWithSystemWindow_static';
            let subWindowClass: window.Window;
            let displayId:Long = display.getDefaultDisplaySync().id;
            let config: window.Configuration = {
                name: "test",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
                decorEnabled:true,
                title:'dialog Window'
            };
            try{
                subWindowClass = await window.createWindow(config);
                hilog.info(domain, tag,`${caseName} Succeeded in creating the system sub window.`);
                await subWindowClass.setUIContent('pages/index2');
                hilog.info(domain, tag,`${caseName} Succeeded in loading the system sub window content.`);
                await subWindowClass.showWindow();
                hilog.info(domain, tag,`${caseName} Succeeded in showing the system sub window.`);
                await subWindowClass.resize(200, 200);
                await subWindowClass.moveWindowTo(0, 300);
                hilog.info(domain, tag,`${caseName} Succeeded in resizing the system sub window.`);
                await Utils.msSleep(1000);
                window.getWindowsByCoordinate(displayId).then((data:Array<window.Window>) => {
                    await subWindowClass.destroyWindow();
                    hilog.info(domain, tag,`${caseName} The window displayId is: ` + displayId);
                    hilog.info(domain, tag,`${caseName} Succeeded in getting window from point. Data: ` + JSON.stringify(data));
                    expect(data.length).assertEqual(2);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    await subWindowClass.destroyWindow();
                    hilog.error(domain, tag,`${caseName} Failed to get window from point. Cause code: ${err.code}, message: ${err.message}`);

                    if (err.code === 801) {
                        hilog.error(domain, tag,`${caseName} The current device type does not support to resize.`);
                        done();
                    } else {
                        hilog.error(domain, tag,`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                if (err.code === 801) {
                    hilog.error(domain, tag,`${caseName} The current device type does not support to resize.`);
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} Error. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_GET_ALL_WINDOW_LAYOUT_INFO_static_0200
         * @tc.name      test_getAllWindowLayoutInfo_mainWindow_static
         * @tc.desc      test_getAllWindowLayoutInfo_mainWindow_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_getAllWindowLayoutInfo_mainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getAllWindowLayoutInfo_mainWindow_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                let mainWindow:window.Window = windowStage!.getMainWindowSync();
                let displayId:Long  = display.getDefaultDisplaySync().id;
                let promise = window.getAllWindowLayoutInfo(displayId)
                promise.then((data:Array<window.WindowLayoutInfo>) => {
                    hilog.info(domain, tag,`${caseName} :Succeeded in obtaining all window layout info. Data: ` + JSON.stringify(data));
                    hilog.info(domain, tag,`${caseName} :Succeeded in obtaining all window layout info. Data windowRect: ` + JSON.stringify(data[0].windowRect));
                    expect(data.length).assertLargerOrEqual(1);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} :Failed to obtain all window layout info. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code == 801){
                        expect(err.message!=null).assertTrue();
                        done();
                    }else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        });

        /**
         * @tc.number     testGetWindowDensityInfoErrCode1300002_static_0100
         * @tc.name       testGetWindowDensityInfoErrCode1300002_0100_static
         * @tc.desc       testGetWindowDensityInfoErrCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testGetWindowDensityInfoErrCode1300002_0100_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetWindowDensityInfoErrCode1300002_0100_static";
            let msgStr = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            windowStage!.createSubWindow('testGetWindowDensityInfoErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.getWindowDensityInfo();
                        hilog.error(domain, tag,msgStr + 'Succeeded in calling getWindowDensityInfo.');
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
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_static_0100
         * @tc.name       testGetWindowDensityInfo_static
         * @tc.desc       getWindowDensityInfo
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testGetWindowDensityInfo_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testGetWindowDensityInfo_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let windowClass:window.Window =  windowStage!.getMainWindowSync();
            try {
                let densityInfo: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
                hilog.info(domain, tag,msgStr +`getWindowDensityInfo densityInfo: `, JSON.stringify(densityInfo));
                hilog.info(domain, tag,msgStr +`getWindowDensityInfo defaultDensity: `, JSON.stringify(densityInfo.defaultDensity));
                expect(densityInfo.systemDensity).assertEqual(densityInfo.customDensity);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:getWindowDensityInfo`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
/**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8100
         * @tc.name       testSetGestureBackEnabledFalse_static
         * @tc.desc       Set whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetGestureBackEnabledFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetGestureBackEnabledFalse_static';
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            windowClass.setGestureBackEnabled(false).then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in setting gesture back enabled false.`);
                const isGestureBackEnabled:boolean = windowClass.isGestureBackEnabled();
                hilog.info(domain, tag,`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertFalse();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setGestureBackEnabled`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8200
         * @tc.name       testSetGestureBackEnabledInSubWindow_static
         * @tc.desc       Set whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testSetGestureBackEnabledInSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetGestureBackEnabledInSubWindow_static';
            let subWindowClass:window.Window = await windowStage!.createSubWindow('subWindow');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            hilog.info(domain, tag,`${caseName} Succeeded in showing the sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch((err: Error) :PromiseLike<void>|undefined=> {
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    expect(err.message!=null).assertTrue();
                    await subWindowClass.destroyWindow();
                    done();
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8300
         * @tc.name       testSetGestureBackEnabledInSysSubWindow_static
         * @tc.desc       Set whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testSetGestureBackEnabledInSysSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetGestureBackEnabledInSysSubWindow_static';
            let config: window.Configuration = {
                name: "systemWindow",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let subWindowClass:window.Window = await window.createWindow(config);
            hilog.info(domain, tag,`${caseName} Succeeded in creating the system sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the system sub window content.`);
            await subWindowClass.showWindow();
            hilog.info(domain, tag,`${caseName} Succeeded in showing the system sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8400
         * @tc.name       testSetGestureBackEnabledInDestroyWindow_static
         * @tc.desc       Set whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testSetGestureBackEnabledInDestroyWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetGestureBackEnabledInDestroyWindow_static';
            let subWindowClass = await windowStage!.createSubWindow('subWindow');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            hilog.info(domain, tag,`${caseName} Succeeded in showing the sub window.`);
            await subWindowClass.destroyWindow();
            subWindowClass.setGestureBackEnabled(true).then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} This window state is abnormal.`);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8500
         * @tc.name       testGetGestureBackEnabledInSubWindow_static
         * @tc.desc       get whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testGetGestureBackEnabledInSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestGetGestureBackEnabledInSubWindow_static';
            let subWindowClass:window.Window = await windowStage!.createSubWindow('subWindow');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            try {
                await subWindowClass.setUIContent('pages/index2');
                hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
                await subWindowClass.showWindow();
                hilog.info(domain, tag,`${caseName} Succeeded in showing the sub window.`);
                subWindowClass.isGestureBackEnabled();
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to getGestureBackEnabled.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} Unauthorized operation.`);
                    expect(exception.code).assertEqual(1300004);
                    expect(exception.message!=null).assertTrue();
                    await subWindowClass.destroyWindow();
                    done();
                }
            }
        })
        /**
         * @tc.number      testIsGestureBackEnabledErrCode1300002_static_0100
         * @tc.name        testIsGestureBackEnabledErrCode1300002_static_0100
         * @tc.desc        testIsGestureBackEnabledErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testIsGestureBackEnabledErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= "testIsGestureBackEnabledErrCode1300002_static_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testIsGestureBackEnabledErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + data);
                    await subWin.destroyWindow();
                    try {
                        subWin!.isGestureBackEnabled();
                        hilog.error(domain, tag,msgStr + 'Succeeded in calling isGestureBackEnabled.');
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
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_8000
         * @tc.name       testSetGestureBackEnabledTrue_static
         * @tc.desc       Set whether to disable the gesture back function.
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetGestureBackEnabledTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetGestureBackEnabledTrue_static';
            let windowClass = windowStage!.getMainWindowSync();
            windowClass.setGestureBackEnabled(true).then(() => {
                hilog.info(domain, tag,`${caseName} Succeeded in setting gesture back enabled true.`);
                const isGestureBackEnabled:boolean = windowClass.isGestureBackEnabled();
                hilog.info(domain, tag,`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(domain, tag,`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setGestureBackEnabled`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_4540
         * @tc.name       testSetDialogBackGestureEnabled_Dialog_WindowAbnormal_static
         * @tc.desc       Sets whether the modal window responds to gesture return events
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetDialogBackGestureEnabled_Dialog_WindowAbnormal_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetDialogBackGestureEnabled_Dialog_WindowAbnormal_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let windowConfig: window.Configuration = {
                name: "testSetDialogBackGestureEnabled_Dialog_WindowAbnormal",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let tempWnd: window.Window;;
            window.createWindow(windowConfig).then((data:window.Window) => {
                tempWnd = data;
                expect(!!tempWnd).assertTrue();
                hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                let enabled = true;
                await tempWnd!.destroyWindow();
                tempWnd!.setDialogBackGestureEnabled(enabled).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    if (err.code != 801) {
                        hilog.error(domain, tag,msgStr +
                            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(1300002);
                        done();
                    } else {
                        hilog.info(domain, tag,msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                        hilog.info(domain, tag,msgStr + JSON.stringify(err))
                        expect(err.code).assertEqual(801);
                        done();
                    }
                });
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag,msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            });

        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_4550
         * @tc.name       testSetDialogBackGestureEnabled_MainWindow_static
         * @tc.desc       Sets whether the modal window responds to gesture return events
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetDialogBackGestureEnabled_MainWindow_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetDialogBackGestureEnabled_MainWindow_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWin: window.Window = windowStage!.getMainWindowSync();
            expect(!!mainWin).assertTrue();
            let enabled = false;
            mainWin.setDialogBackGestureEnabled(enabled).then(() => {
                hilog.info(domain, tag,msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                if (err.code != 801) {
                    hilog.error(domain, tag,msgStr +
                        `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(1300004);
                    done()
                } else {
                    hilog.info(domain, tag,msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(domain, tag,msgStr + JSON.stringify(err))
                    expect(err.code).assertEqual(801);
                    done()
                }
            });
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2930
         * @tc.name       testGetWindowColorSpace_WindowStateAbnormal_static
         * @tc.desc       Gets the current window gamut mode
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testGetWindowColorSpace_WindowStateAbnormal_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowColorSpace_WindowStateAbnormal_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testGetWindowColorSpace_WindowStateAbnormal');
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            try {
                let colorSpace = win.getWindowColorSpace();
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2970
         * @tc.name       testSetWindowBrightness_WindowStateAbnormal_Callback_static
         * @tc.desc       Set the screen brightness value Window State Abnormal
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowBrightness_WindowStateAbnormal_Callback_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowBrightness_WindowStateAbnormal_Callback_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testSetWindowBrightness_WindowStateAbnormal_Callback');
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            let brightness: number = 1.0;
            try {
                win.setWindowBrightness(brightness, (err:  BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done()
                        return;
                    }else{
                        hilog.info(domain, tag,msgStr + 'Succeeded in setting the brightness.');
                        expect(false).assertTrue();
                        done()
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_2980
         * @tc.name       testSetWindowBrightness_WindowStateAbnormal_Promise_static
         * @tc.desc       Set the screen brightness value Window State Abnormal
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowBrightness_WindowStateAbnormal_Promise_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowBrightness_WindowStateAbnormal_Promise_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testSetWindowBrightness_WindowStateAbnormal_Promise');
            hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            let brightness: number = 1.0;
            try {
                win.setWindowBrightness(brightness).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting the brightness.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_static_0100
         * @tc.name       test_ISWINDOWHIGHLIGHTED_static_0100
         * @tc.desc       test_ISWINDOWHIGHLIGHTED_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_ISWINDOWHIGHLIGHTED_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_ISWINDOWHIGHLIGHTED_static_0100';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass = await windowStage!.createSubWindow('test_ISWINDOWHIGHLIGHTED_static_0100');
            try{
                windowClass.isWindowHighlighted();
                await windowClass.destroyWindow();
                expect(true).assertTrue()
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
                await windowClass.destroyWindow();
                if (err.code === 801) {
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_static_0200
         * @tc.name       test_ISWINDOWHIGHLIGHTED_static_0200
         * @tc.desc       test_ISWINDOWHIGHLIGHTED_static_0200
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_ISWINDOWHIGHLIGHTED_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_ISWINDOWHIGHLIGHTED_static_0200';
            hilog.info(domain, tag,caseName + 'begin');
            let windowClass = await windowStage!.createSubWindow('test_ISWINDOWHIGHLIGHTED_static_0200');
            await windowClass.destroyWindow();
            try{
                windowClass.isWindowHighlighted();
                expect(false).assertTrue();
                done();
            } catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag,`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
                expect(err.code).assertEqual(1300002);
                done()
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_snapshotIgnorePrivacy_static_0100
         * @tc.name       test_snapshotIgnorePrivacy_1300002_static
         * @tc.desc       test_snapshotIgnorePrivacy_1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it("test_snapshotIgnorePrivacy_1300002_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_snapshotIgnorePrivacy_1300002_static";
            hilog.info(domain, tag,msgStr + "begin");
            let subWindowClass: window.Window | undefined;
            try {
                let promise = windowStage!.createSubWindow('test_snapshotIgnorePrivacy_1300002');
                promise.then((data:window.Window) => {
                    subWindowClass = data;
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    await subWindowClass!.destroyWindow();
                    let promise2 = subWindowClass!.snapshotIgnorePrivacy();
                    promise2.then((pixelMap:image.PixelMap) => {
                        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                        hilog.info(domain, tag,`${msgStr} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                        await subWindowClass!.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.message!=null).assertTrue();
                        if (err.code == 801) {
                            hilog.info(domain, tag,msgStr + '此设备不支持');
                            expect(err.message!=null).assertTrue();
                            done();
                        } else if(err.code == 1300002){
                            expect(true).assertTrue();
                            expect(err.message!=null).assertTrue();
                            done();
                        }else {
                            hilog.info(domain, tag,msgStr + 'Failed to setWindowMask');
                            expect(false).assertTrue();
                            done();
                        }

                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.message!=null).assertTrue();
                    await subWindowClass!.destroyWindow();
                    if (err.code == 801) {
                        hilog.info(domain, tag,msgStr + '此设备不支持');
                        done();
                    } else {
                        hilog.info(domain, tag,msgStr + 'Failed to setWindowMask');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag,msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_static_0200
         * @tc.name        test_setWindowShadowRadius_1300002_static
         * @tc.desc        test_setWindowShadowRadius_1300002
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowShadowRadius_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowShadowRadius_1300002_static";
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
                subWindowClass.setWindowShadowRadius(4.0)
                expect(false).assertTrue();
                hilog.error(domain, tag,msgStr + 'Succeeded in calling setWindowShadowRadius.');
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002)
                expect(exception.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_static_0300
         * @tc.name        test_setWindowShadowRadius_1300004_static
         * @tc.desc        test_setWindowShadowRadius_1300004_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowShadowRadius_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowShadowRadius_1300004_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                windowClass.setWindowShadowRadius(4.0)
                expect(false).assertTrue();
                hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowShadowRadius.');
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300004);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_setWindowShadowRadius_static_0200
         * @tc.name        test_setWindowShadowRadius_static_0200
         * @tc.desc        验证子窗设置阴影为4
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowShadowRadius_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowShadowRadius_static_0200";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWindowClass = await windowStage!.createSubWindow('test_setWindowShadowRadius_0200');
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            hilog.info(domain, tag,`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            await Utils.msSleep(1000);
            hilog.info(domain, tag,`${caseName} Succeeded in showing the sub window.`);

            try {
                subWindowClass.setWindowShadowRadius(4)
                expect(true).assertTrue();
                hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowShadowRadius.');
                await subWindowClass.destroyWindow();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                await subWindowClass.destroyWindow();
                if (exception.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setWindowShadowRadius`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_static_0300
         * @tc.name        test_setWindowCornerRadius_1300002_static
         * @tc.desc        test_setWindowCornerRadius_1300002_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowCornerRadius_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowCornerRadius_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWindowClass:window.Window = await windowStage!.createSubWindow("test_setWindowCornerRadius_1300002");
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await subWindowClass.showWindow();
            await Utils.msSleep(1000);
            await subWindowClass.destroyWindow();
            try {
                subWindowClass.setWindowCornerRadius(1).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowCornerRadius.');
                    expect(false).assertTrue();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_static_0400
         * @tc.name        test_setWindowCornerRadius_1300004_static
         * @tc.desc        test_setWindowCornerRadius_1300004_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowCornerRadius_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowCornerRadius_1300004_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            await Utils.msSleep(1000);
            try {
                windowClass!.setWindowCornerRadius(1).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowCornerRadius.');
                    expect(false).assertTrue();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${caseName} The current device type does not support to setWindowCornerRadius`);
                        expect(err.message!=null).assertTrue();
                    } else {
                        expect(err.code).assertEqual(1300004)
                        expect(err.message!=null).assertTrue();
                    }
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                if (exception.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setWindowCornerRadius`);
                    expect(exception.message!=null).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_static_0100
         * @tc.name        test_getWindowCornerRadius_1300002_static
         * @tc.desc        test_getWindowCornerRadius_1300002_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_getWindowCornerRadius_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_getWindowCornerRadius_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWindowClass = await windowStage!.createSubWindow("test_setWindowCornerRadius_1300002");
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await subWindowClass.showWindow();
            await Utils.msSleep(1000);
            await subWindowClass.destroyWindow();
            try {
                subWindowClass.getWindowCornerRadius()
                expect(false).assertTrue();
                hilog.error(domain, tag,msgStr + 'Succeeded in calling setWindowCornerRadius.');
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_static_0200
         * @tc.name        test_getWindowCornerRadius_1300004_static
         * @tc.desc        test_getWindowCornerRadius_1300004_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_getWindowCornerRadius_1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_getWindowCornerRadius_1300004_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            await Utils.msSleep(1000);
            try {
                windowClass!.getWindowCornerRadius()
                expect(false).assertTrue();
                hilog.info(domain, tag,msgStr + 'Succeeded in calling getWindowCornerRadius.');
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed2 to set the call getWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300004);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setWindowCornerRadius_static_0100
         * @tc.name        test_setWindowCornerRadius_static_0100
         * @tc.desc        验证子窗圆角值为0
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_setWindowCornerRadius_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "test_setWindowCornerRadius_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWindowClass:window.Window = await windowStage!.createSubWindow("test_setWindowCornerRadius_0100");
            hilog.info(domain, tag,`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('pages/index2');
            await subWindowClass.showWindow();
            await Utils.msSleep(1000);
            try {
                subWindowClass.setWindowCornerRadius(0).then(async () => {
                    let result = subWindowClass.getWindowCornerRadius()
                    expect(result).assertEqual(0)
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowCornerRadius.');
                    await subWindowClass!.destroyWindow();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
                    await subWindowClass!.destroyWindow();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${caseName} The current device type does not support to setWindowCornerRadius`);
                        expect(err.message!=null).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                await subWindowClass!.destroyWindow();
                if (exception.code == 801) {
                    hilog.info(domain, tag,`${caseName} The current device type does not support to setWindowCornerRadius`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })

/**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_static_0200
         * @tc.name       testSetCustomDensityParamCheck_static
         * @tc.desc       getWindowDensityInfo, DPI-1 getWindowDensityInfo
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testSetCustomDensityParamCheck_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            try {
                let densityInfo1: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
                hilog.info(domain, tag,msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
                windowStage!.setCustomDensity(-1);
                hilog.info(domain, tag,msgStr + `setCustomDensity -1 success`);
                let densityInfo2: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
                hilog.info(domain, tag,msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
                expect(densityInfo2.systemDensity).assertEqual(densityInfo2.customDensity)
                expect(densityInfo1.customDensity).assertEqual(densityInfo2.customDensity)
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        
        /**
         * @tc.number     test_mainWindow_setWindowMask_ErrorCode1300002_0100
         * @tc.name       test_mainWindow_setWindowMask_ErrorCode1300002_0100
         * @tc.desc       test_mainWindow_setWindowMask_ErrorCode1300002_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it("test_mainWindow_setWindowMask_ErrorCode1300002_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr = "test_mainWindow_setWindowMask_ErrorCode1300002_0100";
            console.log(msgStr + "begin");
            let windowMask: Array<Array<Long>> = new Array < Array < Long >> ();
            for (let i = 0; i < 500; i++) {
                let arr: Array<Long> = new Array < Long > (500);
                for (let j = 0; j < 500; j++) {
                    if (i + j < 500) {
                        arr[j] = 0;
                    } else {
                        arr[j] = 1;
                    }
                }
                windowMask.push(arr);
            }
            console.log(msgStr + " windowMask OK ");
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('test_mainWindow_setWindowMask_ErrorCode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                let promise = subWin!.setWindowMask(windowMask);
                promise.then(() => {
                    console.log(msgStr + 'Succeeded in setting the window mask.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) => {
                    console.error(msgStr + `Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.log(msgStr + 'Failed to setWindowMask' + JSON.stringify(error.code) + error.message);
                if (error.code == 801) {
                    console.log(msgStr + '此设备不支持 setWindowMask');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.log(msgStr + 'Failed to setWindowMask');
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number     test_mainWindow_setWindowMask_ErrorCode1300004_0100
         * @tc.name       test_mainWindow_setWindowMask_ErrorCode1300004_0100
         * @tc.desc       test_mainWindow_setWindowMask_ErrorCode1300004_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it("test_mainWindow_setWindowMask_ErrorCode1300004_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr = "test_mainWindow_setWindowMask_ErrorCode1300004_0100";
            console.log(msgStr + "begin");
            let windowMask: Array<Array<Long>> = new Array < Array < Long >> ();
            for (let i = 0; i < 500; i++) {
                let arr: Array<Long> = new Array < Long > (500);
                for (let j = 0; j < 500; j++) {
                    if (i + j < 500) {
                        arr[j] = 0;
                    } else {
                        arr[j] = 1;
                    }
                }
                windowMask.push(arr);
            }
            console.log(msgStr + " windowMask OK ");
            let windowClass = await windowStage!.getMainWindow();
            try {
                let promise = windowClass.setWindowMask(windowMask);
                promise.then(() => {
                    console.log(msgStr + 'Succeeded in setting the window mask.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) => {
                    console.error(msgStr + `Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(1300004);
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.log(msgStr + 'Failed to setWindowMask' + JSON.stringify(error.code) + error.message);
                if (error.code == 801) {
                    console.log(msgStr + '此设备不支持 setWindowMask');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.log(msgStr + 'Failed to setWindowMask');
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        /**
         * @tc.number      testSetWindowGrayScalePromiseErrCode1300002_0100
         * @tc.name        testSetWindowGrayScalePromiseErrCode1300002_0100
         * @tc.desc        testSetWindowGrayScalePromiseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowGrayScalePromiseErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowGrayScalePromiseErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('test_mainWindow_setWindowMask_ErrorCode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                 (subWin! as window.Window).setWindowGrayScale(1).then(() => {
                    console.info(msgStr + 'Succeeded in calling setWindowGrayScale.');
                    expect(false).assertTrue();
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call setWindowGrayScale. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                });
                done()
            } catch (exception) {
                console.error(msgStr + 'Failed to set the call setWindowGrayScale. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      testSetWindowGrayScalePromiseErrCode801_0100
         * @tc.name        testSetWindowGrayScalePromiseErrCode801_0100
         * @tc.desc        testSetWindowGrayScalePromiseErrCode801_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowGrayScalePromiseErrCode801_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetWindowGrayScalePromiseErrCode801_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('test_mainWindow_setWindowMask_ErrorCode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();
                await Utils.msSleep(300);
                (subWin! as window.Window).setWindowGrayScale(0).then(() => {
                    console.info(msgStr + 'Succeeded in calling setWindowGrayScale.');
                    subWin.destroyWindow();
                    expect(true).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined  => {
                    console.error(msgStr + 'Failed to call setWindowGrayScale. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                    await subWin!.destroyWindow();
                    done();
                });
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }

        })

        /**
         * @tc.number      testSetCustomDensityErrCode401_Static_0100
         * @tc.name        testSetCustomDensityErrCode401_Static_0100
         * @tc.desc        testSetCustomDensityErrCode401_Static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetCustomDensityErrCode401_Static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetCustomDensityErrCode401_Static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                windowStage!.setCustomDensity(10.0)
                hilog.info(domain, tag,msgStr + 'Succeeded in calling setCustomDensity.');
                expect(false).assertTrue();
                hilog.info(domain, tag,msgStr + 'end.');
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
                expect(e.message!=null).assertTrue();
                if(e.code == 801){
                    done();
                }else{
                    expect(e.code).assertEqual(401);
                    hilog.info(domain, tag,msgStr + 'end.');
                    done()
                }

            }
        })


        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0300
         * @tc.name       testSetCustomDensityParamCheck1_Static
         * @tc.desc       有效左边界校验
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      LEVEL0
         */
        it('testSetCustomDensityParamCheck1_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck1_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage!.setCustomDensity(0.5);
                hilog.info(domain, tag,msgStr + `setCustomDensity 0.5 success`);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0400
         * @tc.name       testSetCustomDensityParamCheck2_Static
         * @tc.desc       effective right boundary
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      LEVEL0
         */
        it('testSetCustomDensityParamCheck2_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck2_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage!.setCustomDensity(4.0);
                hilog.info(domain, tag,msgStr + `setCustomDensity 4.0 success`);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0500
         * @tc.name       testSetCustomDensityParamCheck5_Static
         * @tc.desc       testGetWindowDensityInfo with aruguments null
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetCustomDensityParamCheck5_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck5_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage!.setCustomDensity(-2);
                hilog.info(domain, tag,msgStr + `setCustomDensity null`);
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(exception.code).assertEqual(401);
                    expect(exception.message!=null).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_Static_6300
         * @tc.name       testSetDefaultDensityEnabledTrue_Static
         * @tc.desc       set window ui context
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetDefaultDensityEnabledTrue_Static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetDefaultDensityEnabledTrue_Static';
            try {
                windowStage!.setDefaultDensityEnabled(true);
                hilog.info(domain, tag,`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    hilog.info(domain, tag,`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_Static_6400
         * @tc.name       testSetDefaultDensityEnabledFalse_Static
         * @tc.desc       set window ui context
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetDefaultDensityEnabledFalse_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetDefaultDensityEnabledFalse_Static';
            try {
                windowStage!.setDefaultDensityEnabled(false);
                hilog.info(domain, tag,`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    hilog.info(domain, tag,`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_SUBWINDOW_Static
         * @tc.name       testSetWindowContainerColorwithUnsupportedSubwindow_Static
         * @tc.desc       验证不支持的子窗调用setwindowcontainercolor接口抛1300004错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetWindowContainerColorwithUnsupportedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowContainerColorwithUnsupportedSubwindow_Static ';
            hilog.info(domain, tag,caseName + 'begin');
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testSetWindowContainerColorwithUnsupportedSubwindow');
            await Utils.msSleep(200)
            try {
                subWindowClass.setWindowContainerColor("#0099FF","#00000000");
                hilog.info(domain, tag,caseName + 'success. ');
                await subWindowClass.destroyWindow()
                expect(false).assertTrue()
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if (err.code == 801) {
                    done()
                } else {
                    expect(err.code).assertEqual(1300004);
                    done();
                }
            }
        });
        /**
         * @tc.name   testOnFrameMetricsMeasuredwithSetBackgroundColor_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_static_0600
         * @tc.desc   testOnFrameMetricsMeasuredwithSetBackgroundColor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOnFrameMetricsMeasuredwithSetBackgroundColor_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string =  'testOnFrameMetricsMeasuredwithSetBackgroundColor_static';
            let windowClass:window.Window = windowStage!.getMainWindowSync()
            try {
                let callbackIndex = 0;
                const callback1 = (res: window.FrameMetrics) => {
                    console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
                    callbackIndex = callbackIndex + 1;
                    console.log(`${caseName} callback1 callbackIndex: ${JSON.stringify(callbackIndex)}`);
                    expect(res.firstDrawFrame).assertEqual(false);
                    expect(res.vsyncTimestamp).assertLarger(0);
                    expect(res.inputHandlingDuration).assertLarger(0);
                    expect(res.layoutMeasureDuration).assertLarger(0);

                }
                windowClass.onFrameMetricsMeasured(callback1);
                windowStage!.setCustomDensity(2.0);
                await Utils.msSleep(3000);
                console.log(`${caseName}  callbackIndex 2: ${JSON.stringify(callbackIndex)}`);
                expect(callbackIndex).assertLarger(0)
                callbackIndex = 0;
                windowClass?.offFrameMetricsMeasured();
                await Utils.msSleep(1000);
                windowStage!.setCustomDensity(-1.0);
                await Utils.msSleep(1000);
                console.log(`${caseName}  callbackIndex 4: ${JSON.stringify(callbackIndex)}`);
                expect(callbackIndex).assertEqual(0)
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(`${caseName} Error. Cause code: ${exception?.code}, message: ${exception?.message}`);
                if(exception.code == 801){
                    expect(exception.code).assertEqual(801)
                }else {
                    expect(false).assertTrue();
                }
                done();
            }

        })
        /**
         * @tc.name   testGlobalWindowModeEnum_static
         * @tc.number SUB_BASIC_WMS_GLOBALWINDOWMODE_ENUM_static_0100
         * @tc.desc   testGlobalWindowModeEnum
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobalWindowModeEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName:string =  'testGlobalWindowModeEnum_static';
            try {
                console.log(`${caseName} Failed. Cause: ${window.GlobalWindowMode.FULLSCREEN}`);
                expect(window.GlobalWindowMode.FULLSCREEN).assertEqual(1);
                expect(window.GlobalWindowMode.SPLIT).assertEqual(2);
                expect(window.GlobalWindowMode.FLOAT).assertEqual(4);
                expect(window.GlobalWindowMode.PIP).assertEqual(8);
                done()
            } catch (error) {
                error = error as BusinessError;
                console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   testSnapShotSync_mainWindow_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_static_0400
         * @tc.desc   snapshot mainWIndow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSnapShotSync_mainWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSnapShotSync_mainWindow_static';
            let mainWindow:window.Window =  windowStage!.getMainWindowSync();
            console.info(`${caseName} Succeeded in creating the mainWindow. Data: ` + JSON.stringify(mainWindow));
            await Utils.msSleep(300);
            try {
                let pixelMap:image.PixelMap =  mainWindow.snapshotSync();
                let widthBefore: number = mainWindow.getWindowProperties().windowRect.width;
                let heightBefore: number = mainWindow.getWindowProperties().windowRect.height;
                console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
                let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
                expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
                pixelMap.release();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if(exception.code == 801){
                    expect(exception.message!=null).assertTrue();
                    done()
                }else {
                    expect(false).assertTrue();
                    done();
                }

            }
        })
        /**
         * @tc.name   testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize_static
         * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_static_0100
         * @tc.desc   验证设置进程水印入参pixelmap大小超过屏幕大小时抛出错误码1300016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize_static';
            const rawFile: Uint8Array = await context!.resourceManager.getRawFileContent("test2.jpg");
            let ops: image.SourceOptions = {
                sourceDensity: 98,
            }
            let imageSource: image.ImageSource|undefined;
            imageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
            try{
                let  pixelMap :image.PixelMap|undefined = await imageSource!.createPixelMap();
                console.info(caseName + " Succeeded in creating pixelmap.");
                try {
                    let promise = window.setWatermarkImageForAppWindows(pixelMap);
                    promise.then(() => {
                        console.info(caseName + " Succeeded in setting watermark image.");
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        console.error(`${caseName} Failed to set watermark image. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.message!=null).assertTrue();
                        if (err.code == 801) {
                            done()
                        } else {
                            expect(err.code).assertEqual(1300016);
                            done();
                        }
                    });
                } catch (exception) {
                    console.error(`${caseName} Failed to set watermark image. Exception code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }catch(err){
                console.error(`${caseName} Failed to create PixelMap. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        })
        /**
         * @tc.name   testSetStartWindowBackgroundColor_1300003_static
         * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_static_0300
         * @tc.desc   testSetStartWindowBackgroundColor_1300003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetStartWindowBackgroundColor_1300003_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetStartWindowBackgroundColor_1300003_static ';
            console.log(caseName + 'begin');
            try {
                window.setStartWindowBackgroundColor('moduleName', 'abilityName', ColorMetrics.numeric(0x112233)).then(async () => {
                    console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: Error):PromiseLike<void>|undefined => {
                    console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        expect(true).assertTrue()
                    } else {
                        expect(err.code).assertEqual(1300003)
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
         * @tc.name   testsetParentWindow1300002_static
         * @tc.number SUB_BASIC_WMS_setParentWindow_1300002_static_0200
         * @tc.desc   testsetParentWindow1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testsetParentWindow1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testsetParentWindow1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowId:int = mainWindow.getWindowProperties().id;
            console.info(msgStr + 'windowId :' + windowId)
            try {
                let windowClass:window.Window = await windowStage!.createSubWindow('testsetParentWindow1300002_static');
                await windowClass.destroyWindow();
                windowClass.setParentWindow(windowId).then(() => {
                    console.info(msgStr + 'Succeeded in  setParentWindow window.')
                    expect(false).assertFail();
                    done();
                }).catch((e: Error):PromiseLike<void>|undefined => {
                    console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);

                    if (e.code == 801) {
                        expect(e.message != null).assertTrue();
                        done();
                    } else {
                        expect(e.code).assertEqual(1300002);
                        expect(e.message != null).assertTrue();
                        done()
                    }
                });
            } catch (e) {
                console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
                expect(false).assertFail();
                done();
            }

        })
        /**
         * @tc.name   testWindowOffScreenshot_RepeatOff_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_3630
         * @tc.desc   Disable the monitoring of screenshot events
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowOffScreenshot_RepeatOff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowOffScreenshot_RepeatOff_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let win: window.Window  = await windowStage!.createSubWindow('testWindowOffScreenshot_RepeatOff_static');
            console.log(msgStr + 'windowStage!.createSubWindow success');
            expect(!!win).assertTrue();
            try {
                (win as window.Window).onScreenshot(() => {
                    console.info(msgStr + 'screenshot happened.');
                });
            } catch (exception) {
                console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offScreenshot();
            } catch (exception) {
                console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offScreenshot();
                await (win as window.Window).destroyWindow();
                done();
            } catch (exception) {
                console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
        })
        /**
         * @tc.name   testgetParentWindow1300002_static
         * @tc.number SUB_BASIC_WMS_getParentWindow_1300002_static_0100
         * @tc.desc   testgetParentWindow1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testgetParentWindow1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string= "testgetParentWindow1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            let windowId:int = mainWindow.getWindowProperties().id;
            console.info(msgStr + 'windowId :' + windowId)
            try {
                let windowClass :window.Window= await windowStage!.createSubWindow('testgetParentWindow1300002_static');
                await windowClass.destroyWindow();
                windowClass.getParentWindow();
                console.info(msgStr + 'Succeeded in  getParentWindow window.')
                expect(false).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
                if (e.code == 801) {
                    expect(e.message != null).assertTrue();
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    expect(e.message != null).assertTrue();
                    done()
                }
            }

        })
        
        /**
         * @tc.name   testGetGlobalWindowMode_NegativeId_1300016_static
         * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_static_0200
         * @tc.desc   testGetGlobalWindowMode_NegativeId_1300016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetGlobalWindowMode_NegativeId_1300016_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string= 'testGetGlobalWindowMode_NegativeId_1300016_static';
            try {
                window.getGlobalWindowMode(-1).then(async () => {
                    console.error(`${caseName} Succeeded in calling getGlobalWindowMode.`);
                    done()
                }).catch(async (err: Error) => {
                    console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err)}`);
                    expect(err.code).assertEqual(1300016)
                    expect(err.message!=null).assertTrue();
                    done()
                });
            } catch (error) {
                console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)},message: ${JSON.stringify(error.message)}`);
                expect(true).assertFail();
                done();
            }
        })
		
		/**
         * @tc.number    SUB_BASIC_WMS_GETWINDOWSBYCOORDINATE_static_errcode_0100
         * @tc.name      testGetWindowsByCoordinate_static_errcode_0100
         * @tc.desc      Test getWindowsByCoordinate with 401 error code when x and y exceed int range
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetWindowsByCoordinate_static_errcode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowsByCoordinate_static_errcode_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let properties: window.WindowProperties = mainWindow.getWindowProperties();
                let displayId: long = properties.displayId!;
                hilog.info(domain, tag, msgStr + 'displayId: ' + displayId);

                let xValue: Long = 2147483648;
                let yValue: Long = 2147483648;

                window.getWindowsByCoordinate(-1, 2, xValue as int, yValue as int).then((data: Array<window.Window>) => {
                    hilog.error(domain, tag, msgStr + 'Succeeded in getting windows. Data: ' + JSON.stringify(data));
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    hilog.error(domain, tag, msgStr + 'Failed to get window from point. Cause code: ' + err.code + ', message: ' + err.message);
                    if (err.code === 401) {
                        expect(err.code).assertEqual(401);
                        expect(err.message != null).assertTrue();
                        done();
                    } else if (err.code === 801) {
                        hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause code: ' + err.code + ', message: ' + err.message);
                if (err.code === 401) {
                    expect(err.code).assertEqual(401);
                    expect(err.message != null).assertTrue();
                    done();
                } else if (err.code === 801) {
                    hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_GETWINDOWSBYCOORDINATE_static_parameter_0100
         * @tc.name      testGetWindowsByCoordinate_static_parameter_0100
         * @tc.desc      Test getWindowsByCoordinate with all 4 parameters
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetWindowsByCoordinate_static_parameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowsByCoordinate_static_parameter_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let properties: window.WindowProperties = mainWindow.getWindowProperties();
                let displayId: long = properties.displayId!;
                let windowRect: window.Rect = properties.windowRect;
                hilog.info(domain, tag, msgStr + 'displayId: ' + displayId);
                hilog.info(domain, tag, msgStr + 'windowRect: ' + JSON.stringify(windowRect));

                let x: int = Math.floor(windowRect.width / 2) as int;
                let y: int = Math.floor(windowRect.height / 2) as int;
                let windowNumber: int = 2;

                window.getWindowsByCoordinate(displayId, windowNumber, x, y).then((data: Array<window.Window>) => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in getting windows. Data: ' + JSON.stringify(data));
                    expect(data.length).assertEqual(1);
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    hilog.error(domain, tag, msgStr + 'Failed to get window from point. Cause code: ' + err.code + ', message: ' + err.message);
                    if (err.code === 801) {
                        hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause code: ' + err.code + ', message: ' + err.message);
                if (err.code === 801) {
                    hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_GETWINDOWSBYCOORDINATE_static_parameter_0200
         * @tc.name      testGetWindowsByCoordinate_static_parameter_0200
         * @tc.desc      Test getWindowsByCoordinate with negative int parameters
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetWindowsByCoordinate_static_parameter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowsByCoordinate_static_parameter_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let properties: window.WindowProperties = mainWindow.getWindowProperties();
                let displayId: Long = properties.displayId!;
                hilog.info(domain, tag, msgStr + 'displayId: ' + displayId);

                let windowNumber: int = -1;
                let x: int = -1;
                let y: int = -1;

                window.getWindowsByCoordinate(displayId, windowNumber, x, y).then((data: Array<window.Window>) => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in getting windows. Data: ' + JSON.stringify(data));
                    expect(data.length).assertEqual(1);
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    hilog.error(domain, tag, msgStr + 'Failed to get window from point. Cause code: ' + err.code + ', message: ' + err.message);
                    if (err.code === 801) {
                        hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause code: ' + err.code + ', message: ' + err.message);
                if (err.code === 801) {
                    hilog.error(domain, tag, msgStr + 'The current device type does not support this function.');
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Unexpected error code: ' + err.code);
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        


    })

}