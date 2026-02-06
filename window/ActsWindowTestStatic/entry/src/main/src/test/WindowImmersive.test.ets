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
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
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
export default function WindowImmersiveTest() {

    describe("WindowImmersiveTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowImmersiveTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode:boolean = false;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //console.log('windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isFreeWindowMode == true 自由窗口模式
            //isFreeWindowMode == false 非自由窗口模式
            console.info(`brforeAll isFreeWindowMode: ${isFreeWindowMode}`);
            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //console.info(`beforeAll isPCStatus: `+ isPCStatus);
        })


        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
         * @tc.name        testGetWindowAvoidArea_1300002_static_0300
         * @tc.desc        testGetWindowAvoidArea_1300002_static_0300
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowAvoidArea_1300002_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowAvoidArea_1300002_static_0300';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testGetWindowAvoidArea_1300002_static_0200');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            try {
                let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM;
                let avoidArea:window.AvoidArea = win.getWindowAvoidArea(type);
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to getWindowAvoidArea. Cause: '+exception.code+'  ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0660
         * @tc.name        testGetWindowAvoidArea_Type_System_static_0400
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowAvoidArea_Type_System_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowAvoidArea_Type_System_static_0400';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            try {
                let tempWnd: window.Window = windowStage!.getMainWindowSync();
                expect(!!tempWnd).assertTrue();
                try {
                    let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM;
                    let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
                    hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect != null).assertTrue();
                    expect(avoidArea.rightRect != null).assertTrue();
                    expect(avoidArea.bottomRect != null).assertTrue();
                    expect(avoidArea.leftRect != null).assertTrue();
                    done();
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
                    expect(false).assertTrue();
                    done();
                }
                ;
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0640
         * @tc.name        testGetWindowAvoidArea_Type_CutOut_static_0500
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowAvoidArea_Type_CutOut_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowAvoidArea_Type_CutOut_static_0500';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            try {
                let tempWnd: window.Window = windowStage!.getMainWindowSync();
                expect(tempWnd != null).assertTrue();
                try {
                    let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_CUTOUT;
                    let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
                    hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
                    expect(!avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect != null).assertTrue();
                    expect(avoidArea.rightRect != null).assertTrue();
                    expect(avoidArea.bottomRect != null).assertTrue();
                    expect(avoidArea.leftRect != null).assertTrue();
                    done();
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
                    expect(false).assertTrue();
                    done();
                }
                ;
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0670
         * @tc.name        testGetWindowAvoidArea_Type_System_Gesture_static_0600
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowAvoidArea_Type_System_Gesture_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowAvoidArea_Type_System_Gesture_static_0600';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            try {
                let tempWnd: window.Window = windowStage!.getMainWindowSync();
                expect(!!tempWnd).assertTrue();
                try {
                    let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM_GESTURE;
                    let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
                    hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect != null).assertTrue();
                    expect(avoidArea.rightRect != null).assertTrue();
                    expect(avoidArea.bottomRect != null).assertTrue();
                    expect(avoidArea.leftRect != null).assertTrue();
                    done();
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
                    expect(false).assertTrue();
                    done();
                }
                ;
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0650
         * @tc.name        testGetWindowAvoidArea_Type_Keyboard_static_0700
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowAvoidArea_Type_Keyboard_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetWindowAvoidArea_Type_Keyboard_static_0700';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            try {
                let tempWnd: window.Window = windowStage!.getMainWindowSync();
                expect(!!tempWnd).assertTrue();
                try {
                    let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_KEYBOARD;
                    let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
                    hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect != null).assertTrue();
                    expect(avoidArea.rightRect != null).assertTrue();
                    expect(avoidArea.bottomRect != null).assertTrue();
                    expect(avoidArea.leftRect != null).assertTrue();
                    done();
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
                    expect(false).assertTrue();
                    done();
                }
                ;
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
         * @tc.name        testGetWindowAvoidAreaTypeNavigationIndicator_static_0800
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeNavigationIndicator_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeNavigationIndicator_static_0800';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
                hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                expect(avoidArea.visible).assertTrue();
                expect(avoidArea.topRect !== null).assertTrue();
                expect(avoidArea.rightRect !== null).assertTrue();
                expect(avoidArea.bottomRect !== null).assertTrue();
                expect(avoidArea.leftRect !== null).assertTrue();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
         * @tc.name        testGetWindowAvoidAreaTypeSystemInLandScape_static_0900
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeSystemInLandScape_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeSystemInLandScape_static_0900';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE, () => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in setting window orientation`);
                    let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
                    hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect !== null).assertTrue();
                    expect(avoidArea.rightRect !== null).assertTrue();
                    expect(avoidArea.bottomRect !== null).assertTrue();
                    expect(avoidArea.leftRect !== null).assertTrue();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
         * @tc.name        testGetWindowAvoidAreaTypeSystemInPortraitInverted_static_1000
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeSystemInPortraitInverted_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeSystemInPortraitInverted_static_1000';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in setting window orientation`);
                    let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
                    hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect !== null).assertTrue();
                    expect(avoidArea.rightRect !== null).assertTrue();
                    expect(avoidArea.bottomRect !== null).assertTrue();
                    expect(avoidArea.leftRect !== null).assertTrue();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
         * @tc.name        testGetWindowAvoidAreaTypeCutOutInPortraitInverted_static_1100
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeCutOutInPortraitInverted_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeCutOutInPortraitInverted_static_1100';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in setting window orientation`);
                    let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
                    hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                    expect(avoidArea.visible).assertFalse();
                    expect(avoidArea.topRect !== null).assertTrue();
                    expect(avoidArea.rightRect !== null).assertTrue();
                    expect(avoidArea.bottomRect !== null).assertTrue();
                    expect(avoidArea.leftRect !== null).assertTrue();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
         * @tc.name        testGetWindowAvoidAreaTypeSystemInLandScapeInverted_static_1200
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeSystemInLandScapeInverted_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeSystemInLandScapeInverted_static_1200';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in setting window orientation`);
                    let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
                    hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                    expect(avoidArea.visible).assertTrue();
                    expect(avoidArea.topRect !== null).assertTrue();
                    expect(avoidArea.rightRect !== null).assertTrue();
                    expect(avoidArea.bottomRect !== null).assertTrue();
                    expect(avoidArea.leftRect !== null).assertTrue();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
         * @tc.name        testGetWindowAvoidAreaTypeCutOutInLandScapeInverted_static_1300
         * @tc.desc        Obtain the area that the window content avoids
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetWindowAvoidAreaTypeCutOutInLandScapeInverted_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetWindowAvoidAreaTypeCutOutInLandScapeInverted_static_1300';
            try {
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in setting window orientation`);
                    let avoidArea:window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
                    hilog.info(0x0000, '[ANI]',`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
                    expect(avoidArea.visible).assertFalse();
                    expect(avoidArea.topRect !== null).assertTrue();
                    expect(avoidArea.rightRect !== null).assertTrue();
                    expect(avoidArea.bottomRect !== null).assertTrue();
                    expect(avoidArea.leftRect !== null).assertTrue();
                    windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_MAXIMIZE_JS_API_0100
         * @tc.name        testMaximizePresentation_enum_static_0100
         * @tc.desc        Test the function value of RectChangeReason
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it("testMaximizePresentation_enum_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr:string = "testMaximizePresentation_enum_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                expect(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).assertEqual(0);
                expect(window.MaximizePresentation.EXIT_IMMERSIVE).assertEqual(1);
                expect(window.MaximizePresentation.ENTER_IMMERSIVE).assertEqual(2);
                // expect(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER).assertEqual(3);
                done();
            } catch (error) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to MaximizePresentation' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SET_WINDOW_LAYOUT_FULLSCREEN_API_0100
         * @tc.name        test_setWindowLayoutFullScreen_ErrorCode_1300002_static_0100
         * @tc.desc        test_setWindowLayoutFullScreen_ErrorCode_1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('test_setWindowLayoutFullScreen_ErrorCode_1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let CaseName:string = 'test_setWindowLayoutFullScreen_ErrorCode_1300002_static_0100';
            let subWindow:window.Window = await windowStage!.createSubWindow('test_setWindowLayoutFullScreen_ErrorCode_1300002_static_0100');
            await subWindow.destroyWindow();
            await Utils.msSleep(300);
            let promise = subWindow.setWindowLayoutFullScreen(true);
            promise.then(()=>{
                hilog.info(0x0000, '[ANI]',CaseName + ' setWindowLayoutFullScreen success ');
                expect(false).assertTrue();
                done();
            }).catch((err:Error):PromiseLike<void>|undefined=>{
                hilog.error(0x0000, '[ANI]',CaseName + ' setWindowLayoutFullScreen failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                expect(err.code).assertEqual(1300002);
                done();
            })
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SET_WINDOW_SYSTEMBAR_ENABLE_API_0100
         * @tc.name        test_setWindowSystemBarEnable_ErrorCode_1300002_static_0100
         * @tc.desc        test_setWindowSystemBarEnable_ErrorCode_1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('test_setWindowSystemBarEnable_ErrorCode_1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let CaseName:string = 'test_setWindowSystemBarEnable_ErrorCode_1300002_static_0100';
            let names: Array<'status' | 'navigation'> = [];
            let subWindow:window.Window = await windowStage!.createSubWindow('test_setWindowSystemBarEnable_ErrorCode_1300002_static_0100');
            await subWindow.destroyWindow();
            await Utils.msSleep(300);
            let promise = subWindow.setWindowSystemBarEnable(names);
            promise.then(()=>{
                hilog.info(0x0000, '[ANI]',CaseName + ' setWindowSystemBarEnable success ');
                expect(false).assertTrue();
                done();
            }).catch((err:Error):PromiseLike<void>|undefined=>{
                hilog.error(0x0000, '[ANI]',CaseName + ' setWindowSystemBarEnable failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                expect(err.code).assertEqual(1300002);
                done();
            })
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SET_WINDOW_SYSTEMBAR_PROPERTIES_API_0100
         * @tc.name        testSetWindowSystemBarProperties_WinAbnormal_Promise_static_0100
         * @tc.desc        Set the properties of the navigation bar and status bar in the window in full screen mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowSystemBarProperties_WinAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowSystemBarProperties_WinAbnormal_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testSetWindowSystemBarProperties_WinAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            await Utils.msSleep(300);
            let SystemBarProperties: window.SystemBarProperties = {
                statusBarColor: '#ff00ff',
                navigationBarColor: '#00ff00',
                statusBarContentColor: '#ffffff',
                navigationBarContentColor: '#00ffff',
                enableStatusBarAnimation:false,
                enableNavigationBarAnimation:false
            };
            try {
                (win as window.Window).setWindowSystemBarProperties(SystemBarProperties).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the system bar properties.');
                    expect(false).assertTrue();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002)
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SET_WINDOW_SYSTEMBAR_PROPERTIES_API_0200
         * @tc.name        testSetWindowSystemBarProperties_Callback_static_0100
         * @tc.desc        Verify the scene where the colors of the status bar and navigation bar are set in RGB
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testSetWindowSystemBarProperties_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowSystemBarProperties_Callback_static_0100';
            let msgStr:string = 'jsUnittest ' + caseName + ' ';
            let commonRGBColorArr: Array<string> = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
            let mainWsync: window.Window = windowStage!.getMainWindowSync();
            expect(mainWsync != null).assertTrue();
            await mainWsync.showWindow();
            await Utils.msSleep(300);
            await mainWsync.setWindowSystemBarEnable(['status', 'navigation']);
            for (let i = 0; i < commonRGBColorArr.length; i++) {
                hilog.info(0x0000, '[ANI]','setWindowSystemBarPropertiesTest1 begin step:' + i);
                let tempColor: string = commonRGBColorArr[i];
                let systemBarProperties: window.SystemBarProperties = {
                    statusBarColor: tempColor,
                    isStatusBarLightIcon: true,
                    statusBarContentColor: tempColor,
                    navigationBarColor: tempColor,
                    isNavigationBarLightIcon: false,
                    navigationBarContentColor: tempColor,
                };
                await mainWsync.setWindowSystemBarProperties(systemBarProperties).then(() => {
                    hilog.info(0x0000, '[ANI]','setWindowSystemBarPropertiesTest1 success step:' + i);
                    expect(true).assertTrue();
                    if (i == commonRGBColorArr.length - 1) {
                        hilog.info(0x0000, '[ANI]','setWindowSystemBarPropertiesTest1 finished step:' + i);
                        done()
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]','setWindowSystemBarPropertiesTest1  error : ' + JSON.stringify(err));
                    if (err.code == 801) {
                        expect(true).assertTrue();
                    } else {
                        expect().assertFail()
                    }
                    done();
                })
            }
        })
/**
         * @tc.number       testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100
         * @tc.name         testSetSpecificSystemBarEnabledPromiseErrCode1300002_static_0100
         * @tc.desc         testSetSpecificSystemBarEnabledPromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetSpecificSystemBarEnabledPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetSpecificSystemBarEnabledPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testSetSpecificSystemBarEnabledPromiseErrCode1300002_SubWindow_Promise').then((data:window.Window) => {
                subWin = data;
                expect(!!subWin).assertTrue();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                await (subWin! as window.Window).destroyWindow();
                try {
                    (subWin! as window.Window).setSpecificSystemBarEnabled('status', true, true).then(() => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setSpecificSystemBarEnabled.');
                        expect(false).assertTrue();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setSpecificSystemBarEnabled. Cause: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(1300002);
                    });
                    done()
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setSpecificSystemBarEnabled. Cause:' +
                    JSON.stringify(exception));
                    expect(false).assertTrue();
                    done()
                }
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            });
            
        })
/**
         * @tc.number       testSetImmersiveModeEnabledStateErrCode1300002_static_0100
         * @tc.name         testSetImmersiveModeEnabledStateErrCode1300002_static_0100
         * @tc.desc         testSetImmersiveModeEnabledStateErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetImmersiveModeEnabledStateErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetImmersiveModeEnabledStateErrCode1300002_static_0100";
            let msgStr : string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window ;
            windowStage!.createSubWindow('testSetImmersiveModeEnabledStateErrCode1300002_SubWindow_Promise')
                .then((data : window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setImmersiveModeEnabledState(true);
                        hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling setImmersiveModeEnabledState.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.error(0x0000, '[ANI]', msgStr + 'Failed to call setImmersiveModeEnabledState. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]', msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })


        /**
         * @tc.number       testSetImmersiveModeEnabledStateErrCode1300004_static_0100
         * @tc.name         testSetImmersiveModeEnabledStateErrCode1300004_static_0100
         * @tc.desc         testSetImmersiveModeEnabledStateErrCode1300004_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetImmersiveModeEnabledStateErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetImmersiveModeEnabledStateErrCode1300004_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testSetImmersiveModeEnabledStateErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let win: window.Window  | undefined;
            try {
                win = await window.createWindow(windowConfig);
                expect(!!win).assertTrue();
            } catch (err) {
                hilog.error(0x0000, '[ANI]', msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            try {
                (win as window.Window).setImmersiveModeEnabledState(true);
                hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling setImmersiveModeEnabledState.');
                expect(false).assertTrue();
                await (win! as window.Window).destroyWindow();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr + 'Failed to set the call setImmersiveModeEnabledState. Cause:' +
                JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300004);
                await (win! as window.Window).destroyWindow();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3570
         * @tc.name        testWindowOffAvoidAreaChange_RepeatOff_static_0100
         * @tc.desc        Disable listening for system circumvention zone changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffAvoidAreaChange_RepeatOff_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowOffAvoidAreaChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window | undefined;
            win = await windowStage!.createSubWindow('testWindowOffAvoidAreaChange_RepeatOff');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            try {
                (win as window.Window).onAvoidAreaChange((data:window.AvoidAreaOptions) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for system avoid area changes. type:' +
                    JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();

            }
            try {
                (win as window.Window).offAvoidAreaChange();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
            }
            try {
                (win as window.Window).offAvoidAreaChange();
                await (win as window.Window).destroyWindow();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(false).assertTrue();
            }
            done();
        })
        /**
         * @tc.number      testMaximizePromiseErrCode1300002_static_0100
         * @tc.name        testMaximizePromiseErrCode1300002_static_0100
         * @tc.desc        testMaximizePromiseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMaximizePromiseErrCode1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testMaximizePromiseErrCode1300002_static_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;

            try {
                subWin = await windowStage!.createSubWindow('testMaximizePromiseErrCode1300002_SubWindow_Promise')
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch(exception) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }

            await (subWin! as window.Window).destroyWindow();
            try {
                await (subWin! as window.Window).maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(async () => {
                    console.info(msgStr + 'Succeeded in calling maximize.');
                    expect(false).assertTrue();
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call maximize. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })

        
/**
         * @tc.number      testGetImmersiveModeEnabledStateErrCode1300002_0100
         * @tc.name        testGetImmersiveModeEnabledStateErrCode1300002_0100
         * @tc.desc        testGetImmersiveModeEnabledStateErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetImmersiveModeEnabledStateErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetImmersiveModeEnabledStateErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testGetImmersiveModeEnabledStateErrCode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                subWin!.getImmersiveModeEnabledState();
                console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                console.log(msgStr + 'Failed to call getImmersiveModeEnabledState. Cause:' + JSON.stringify(e));
                expect(e.code).assertEqual(1300002);
                done()
            }
        })

        /**
         * @tc.number      testGetImmersiveModeEnabledStateErrCode1300004_0100
         * @tc.name        testGetImmersiveModeEnabledStateErrCode1300004_0100
         * @tc.desc        testGetImmersiveModeEnabledStateErrCode1300004_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetImmersiveModeEnabledStateErrCode1300004_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetImmersiveModeEnabledStateErrCode1300004_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testGetImmersiveModeEnabledStateErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let win: window.Window | undefined = undefined;
            try {
                win = await window.createWindow(windowConfig);
                expect(!!win).assertTrue();
            } catch (err) {
                console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            try {
                (win as window.Window).getImmersiveModeEnabledState();
                console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
                expect(false).assertTrue();
                await (win! as window.Window).destroyWindow();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call getImmersiveModeEnabledState. Cause:' +
                JSON.stringify(exception));
                expect(exception.code).assertEqual(1300004);
                await (win! as window.Window).destroyWindow();
                done();
            }
        })

        /**
         * @tc.number      testGetWindowStatusErrCode1300004_0100
         * @tc.name        testGetWindowStatusErrCode1300004_0100
         * @tc.desc        testGetWindowStatusErrCode1300004_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowStatusErrCode1300004_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testGetWindowStatusErrCode1300004_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testGetWindowStatusErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let win: window.Window | undefined = undefined;
            try {
                win = await window.createWindow(windowConfig);
                expect(!!win).assertTrue();
            } catch (err) {
                console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (win! as window.Window).destroyWindow();
            try {
                (win as window.Window).getWindowStatus();
                console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed to set the call getImmersiveModeEnabledState. Cause:' +
                JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
/**
         * @tc.number      testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
         * @tc.name        testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
         * @tc.desc        testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetTitleAndDockHoverShownPromiseErrCode1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetTitleAndDockHoverShownPromiseErrCode1300002_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetTitleAndDockHoverShownPromiseErrCode1300002_0100');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            await (subWin! as window.Window).destroyWindow();
            try {
                (subWin! as window.Window).setTitleAndDockHoverShown(true, true).then(async () => {
                    console.info(msgStr + 'Succeeded in calling setTitleAndDockHoverShown.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call setTitleAndDockHoverShown. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });
            } catch (exception) {
                console.error(msgStr + 'Failed to set the call setTitleAndDockHoverShown. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })


        /**
         * @tc.number      testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
         * @tc.name        testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
         * @tc.desc        testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetTitleAndDockHoverShownPromiseErrCode1300004_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = "testSetTitleAndDockHoverShownPromiseErrCode1300004_0100";
            let msgStr = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let subWin: window.Window | undefined = undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetTitleAndDockHoverShownPromiseErrCode1300004_SubWindow_Promise');
                expect(!!subWin).assertTrue();
                console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
            } catch (err) {
                console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            expect(!!subWin).assertTrue();
            await (subWin! as window.Window).setUIContent("pages/Index");
            await (subWin! as window.Window).showWindow();
            try {
                await (subWin! as window.Window).setTitleAndDockHoverShown(true, true).then(async () => {
                    console.info(msgStr + 'Succeeded in calling setTitleAndDockHoverShown.');
                    expect(false).assertTrue();
                    await (subWin! as window.Window).destroyWindow();
                    done()
                }).catch((err: Error) => {
                    console.error(msgStr + 'Failed to call setTitleAndDockHoverShown. Cause: ' + JSON.stringify(err));
                    await (subWin! as window.Window).destroyWindow();
                    if (err.code == 801) {
                        console.info(msgStr + '此设备不支持setTitleAndDockHoverShown能力.');
                    } else {
                        expect(err.code).assertEqual(1300004);
                    }
                    done()
                });
            } catch (exception) {
                console.error(msgStr + 'Failed to set the call setTitleAndDockHoverShown. Cause:' +
                JSON.stringify(exception));
                await (subWin! as window.Window).destroyWindow();
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.name   testIsImmersiveLayoutwithMainwindowDefaultState_static
         * @tc.number SUB_BASIC_WMS_WINDOW_ISIMMERSIVELAYOUT_static_0100
         * @tc.desc   验证主窗创建后默认为非沉浸式状态
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testIsImmersiveLayoutwithMainwindowDefaultState_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string= 'testIsImmersiveLayoutwithMainwindowDefaultState_static';
            let windowClass :window.Window = windowStage!.getMainWindowSync();
            try {
                await windowClass.setSpecificSystemBarEnabled('status', true);
                await Utils.msSleep(2000);
                let res:boolean = windowClass.isImmersiveLayout();
                console.log(`${caseName} isImmersiveLayout: ${res}.`);
                expect(res).assertEqual(false);
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    expect(exception.message != null).assertTrue();
                    done();
                } else {
                    expect(true).assertFail();
                    done();
                }
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_GET_WINDOW_AVOID_AREA_IGNORING_VISIBILITY_static_0100
         * @tc.name       testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility_static
         * @tc.desc       横验证在自由多窗模式下全屏窗口调用getWindowAvoidAreaIgnoringVisibility接口
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level0
         */
        it('testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string= 'testFreeMultWindowFullScreenGetWindowAvoidAreaIgnoringVisibility_static';
            let windowStageStart :window.WindowStage= await startAbility(caseName, context!);
            let windowClass :window.Window= windowStageStart.getMainWindowSync();
            let isInFreeWindowMode:boolean = windowClass.isInFreeWindowMode();
            console.info(caseName + ' isInFreeWindowMode: ' + isInFreeWindowMode);
            try {
                if (isInFreeWindowMode) {
                    await windowClass.maximize();
                    const mainWindowProperties:window.WindowProperties = windowClass.getWindowProperties();
                    const mainWindowRect:window.Rect = mainWindowProperties.windowRect;
                    console.info(caseName + ' Main window rect: ' + JSON.stringify(mainWindowRect));
                    let subWindow:window.Window = await windowStageStart.createSubWindow(caseName);
                    await subWindow.resize(mainWindowRect.width, mainWindowRect.height);
                    await subWindow.moveWindowTo(mainWindowRect.left, mainWindowRect.top);
                    console.info(caseName + ' Sub window resized and moved to match main window');
                    await subWindow.setUIContent("pages/index2");
                    await subWindow.showWindow();
                    let avoidArea:window.AvoidArea = subWindow.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_SYSTEM);
                    console.info(caseName + ' avoidArea: ' + JSON.stringify(avoidArea));
                    console.info(caseName + ' avoidArea.leftRect.width: ' + avoidArea.leftRect.width);
                    console.info(caseName + ' avoidArea.leftRect.height: ' + avoidArea.leftRect.height);
                    console.info(caseName + ' avoidArea.rightRect.width: ' + avoidArea.rightRect.width);
                    console.info(caseName + ' avoidArea.rightRect.height: ' + avoidArea.rightRect.height);
                    console.info(caseName + ' avoidArea.topRect.width: ' + avoidArea.topRect.width);
                    console.info(caseName + ' avoidArea.topRect.height: ' + avoidArea.topRect.height);
                    console.info(caseName + ' avoidArea.bottomRect.width: ' + avoidArea.bottomRect.width);
                    console.info(caseName + ' avoidArea.bottomRect.height: ' + avoidArea.bottomRect.height);
                    expect(avoidArea.leftRect.width).assertEqual(0);
                    expect(avoidArea.leftRect.height).assertEqual(0);
                    expect(avoidArea.rightRect.width).assertEqual(0);
                    expect(avoidArea.rightRect.height).assertEqual(0);
                    expect(avoidArea.topRect.width).assertEqual(0);
                    expect(avoidArea.topRect.height).assertEqual(0);
                    expect(avoidArea.bottomRect.width).assertEqual(0);
                    expect(avoidArea.bottomRect.height).assertEqual(0);
                    await subWindow.destroyWindow();
                    await terminateAbility(caseName);
                    done()
                } else {
                    await terminateAbility(caseName);
                    done();
                }
            } catch (err){
                console.error(caseName + ' failed, err: ' + JSON.stringify(err));
                await terminateAbility(caseName);
                expect(true).assertFail();
                done();
            }
        });


    })

}