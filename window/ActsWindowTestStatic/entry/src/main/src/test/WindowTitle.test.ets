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
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowTitleTest() {

    describe("WindowTitleTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowTitleTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
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
                expect(true).assertTrue()
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
                if (exception.code == 801 || exception.code == 1300002) {
                    expect(true).assertTrue()
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
                        if(e!.code == 1300002){
                            done();
                        }else if(e!.code == 801){
                            done();
                        }else {
                            expect(false).assertTrue();
                            done();
                        }
                    }
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
                expect(true).assertTrue();
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
                    expect(true).assertTrue();
                    done();
                });
                windowClass.offWindowTitleButtonRectChange();
                expect(true).assertTrue();
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for window title buttons area changes. Cause: ' + JSON.stringify(err));
                if (err!.code == 801) {
                    expect(true).assertTrue()
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
                expect(true).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for window title buttons area changes. Cause: ' + JSON.stringify(error));
                if (error!.code == 1300002) {
                    expect(true).assertTrue()
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
                        if (exception!.code == 801) {
                            hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持getDecorButtonStyle能力.');
                        } else {
                            expect(exception!.code).assertEqual(1300004);
                        }
                        done();
                    }
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
                if (exception!.code == 801) {
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
                if (error.code == 801) {
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
                if (error.code == 801) {
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
                if (err.code == 801) {
                    console.log(msgStr + '此设备不支持');
                    done();
                } else if(err.code == 1300002){
                    expect(true).assertTrue();
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
                if (exception.code == 801) {
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
                    if(err.code == 801){
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
                if (exception.code == 801) {
                    done();
                } else if (exception.code == 1300004) {
                    done()
                } else {
                    expect(false).assertFail();
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
                if (error.code == 801) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        
        




    })

}