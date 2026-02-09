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
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowFocusTest() {

    describe("WindowFocusTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowFocusTest describe start');
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
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0300
         * @tc.name      test_shiftAppWindowPointerEvent_window_destroyed_static
         * @tc.desc      test_shiftAppWindowPointerEvent_window_destroyed_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_shiftAppWindowPointerEvent_window_destroyed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_shiftAppWindowPointerEvent_window_destroyed_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            try{
                let promise1 = windowStage!.createSubWindow('test_shiftAppWindowPointerEvent_window_destroyed_static');
                promise1.then((data:window.Window) => {
                    let subWindowClass:window.Window = data;
                    hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
                    let subWindowId = subWindowClass.getWindowProperties().id;
                    let mainWindowId = mainWindow.getWindowProperties().id;
                    hilog.info(domain, tag,caseName+ ' subWindowId: ' + JSON.stringify(subWindowId) +','+' mainWindowId: ' + JSON.stringify(mainWindowId) );
                    await subWindowClass.destroyWindow();
                    let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,subWindowId);
                    promise2.then(() => {
                        hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
                        if(err.code == 801){
                            done();
                        }else if(err.code == 1300002){
                            expect(true).assertTrue();
                            done();
                        } else{
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 401){
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0400
         * @tc.name      test_shiftAppWindowPointerEvent_Dialog_window_static
         * @tc.desc      test_shiftAppWindowPointerEvent_Dialog_window_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_shiftAppWindowPointerEvent_Dialog_window_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_shiftAppWindowPointerEvent_Dialog_window_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            try{
                let config: window.Configuration = {
                    name: "test",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context!,
                    decorEnabled:true,
                    title:'dialog Window'
                };
                let promise1 = window.createWindow(config);
                promise1.then((data:window.Window) => {
                    let dialogWindowClass:window.Window = data;
                    hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
                    await dialogWindowClass.setUIContent('pages/index2');
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    let dialogWindowId = dialogWindowClass.getWindowProperties().id;
                    let mainWindowId = mainWindow.getWindowProperties().id;
                    hilog.info(domain, tag,caseName+ ' dialogWindowId: ' + JSON.stringify(dialogWindowId) +','+' mainWIndowId: ' + JSON.stringify(mainWindowId) );
                    let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,dialogWindowId);
                    promise2.then(() => {
                        hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
                        await dialogWindowClass.destroyWindow();
                        if(err.code == 801){
                            done();
                        }else if(err.code == 1300004){
                            expect(true).assertTrue();
                            done();
                        } else{
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} :Failed to create the dialogwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 401){
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.name   testTouchOutsideBaseTest_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_2360
         * @tc.desc   Enable listening for click events outside the area of this window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('testTouchOutsideBaseTest_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testTouchOutsideBaseTest_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            let mainWin: window.Window = await windowStage!.getMainWindow();
            let callback = () => {
                console.log('windowTest on/off touchOutside callback success');
            }
            try {
                mainWin!.onTouchOutside(callback);
            } catch (err) {
                console.log(msgStr + 'window on touchOutside failed');
                expect(true).assertFail();
                done();
            }
            await Utils.msSleep(900);
            try {
                mainWin!.offTouchOutside(callback);
                done();
            } catch (err) {
                console.log(msgStr + 'window off touchOutside failed');
                expect(true).assertFail();
                done();
            }
        });
        /**
         * @tc.name   testOnScreenShotAppEventwithDestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_static_0100
         * @tc.desc   验证子窗销毁后监听on_screenshotAppEvent返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOnScreenShotAppEventwithDestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOnScreenShotAppEventwithDestoryedSubWindow_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testOnScreenShotAppEventwithDestoryedSubWindow_static');
            await windowClass.destroyWindow();
            try {
                const callback = (data: window.ScreenshotEventType) => {
                    console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.onScreenshotAppEvent(callback);
                console.info(msgStr + 'Succeeded in calling on screenshotAppEvent.');
                expect(true).assertFail();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.name   testOffScreenShotAppEventwithDestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_static_0200
         * @tc.desc   验证子窗销毁后取消监听off_screenshotAppEvent返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOffScreenShotAppEventwithDestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOffScreenShotAppEventwithDestoryedSubWindow_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testOffScreenShotAppEventwithDestoryedSubWindow_static');
            await windowClass.destroyWindow();
            try {
                const callback = (data: window.ScreenshotEventType) => {
                    console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.offScreenshotAppEvent(callback);
                console.info(msgStr + 'Succeeded in calling off screenshotAppEvent.');
                expect(true).assertFail();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002)
                expect(exception.message!=null).assertTrue();
                done()
            }
        })
        /**
         * @tc.name   testWindowOffDialogTargetTouch_RepeatOff_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_3650
         * @tc.desc   Turns off listening for click events on the target window of the modal window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowOffDialogTargetTouch_RepeatOff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowOffDialogTargetTouch_RepeatOff_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testWindowOffDialogTargetTouch_RepeatOff_static');
            console.log(msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            try {
                (win as window.Window).onDialogTargetTouch(() => {
                    console.info(msgStr + 'touch dialog target');
                });
            } catch (exception) {
                console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offDialogTargetTouch();
            } catch (exception) {
                console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offDialogTargetTouch();
                await (win as window.Window).destroyWindow();
                done();
            } catch (exception) {
                console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
        })
        /**
         * @tc.name   testisSeparationTouchEnabledwithDestoryedWindow_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_isSeparationTouchEnabled_static_0200
         * @tc.desc   验证moveWindowToGlobalDisplay接口窗口状态异常调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testisSeparationTouchEnabledwithDestoryedWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testisSeparationTouchEnabledwithDestoryedWindow_static';
            console.log(caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testisSeparationTouchEnabledwithDestoryedWindow_static')
            await windowClass.destroyWindow();
            try {
                windowClass.isSeparationTouchEnabled();
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




    })

}