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
import { AppStorage ,LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver,ON,Component, Point } from '@ohos.UiTest';
import settings from '@ohos.settings';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function getPermision(): Promise<void> {
    let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let context : common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    let permissions: Array<Permissions> =
        ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
    try {
        atManager.requestPermissionsFromUser(context, permissions,(err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
            hilog.info(domain, tag, 'requestPermission StdProcess.tid():' + StdProcess.tid());
        });
    } catch (err) {
        console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    }
}

async function clickButtonDriver(){
    console.error(`come in permissionClick`);
    let driver: Driver = Driver.create();
    console.error(`come in Driver create`);
    let buttonOne = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 10000);
    console.error(`buttonOne is ${JSON.stringify(buttonOne)}`);
    if(buttonOne!=null){
       await buttonOne.click();
    }

}
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
export default function WindowLifeCycleTest() {

    describe("WindowLifeCycleTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLifeCycleTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        let isPCStatus: string = '';
        let windowclassArr:Array<window.Window>;
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(0x0000, '[ANI]','windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            hilog.info(domain, tag, '%{public}s', 'getANI context = ' + JSON.stringify(context));
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
            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(0x0000, '[ANI]',`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            isPCStatus = settings.getValueSync(context!, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            hilog.info(0x0000, '[ANI]',`beforeAll isPCStatus: `+ isPCStatus);
            await getPermision();
            hilog.info(domain, tag, 'jsUnittest clickButtonDriver before');
            await Utils.msSleep(500);
            await clickButtonDriver();
            hilog.info(domain, tag, 'jsUnittest clickButtonDriver after');
            await Utils.msSleep(500);
        })
        /**
         * @tc.number     SUB_BASIC_WMS_FUNCTION_GETSUBWINDOW_static_0100
         * @tc.name       testgetSubWindow0_promise_static
         * @tc.desc       Test the function value of getSubWindow
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testgetSubWindow0_promise_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testgetSubWindow0_promise_static';
            try {
                let windowclass:Array<window.Window> = await windowStage!.getSubWindow();
                console.log(`${caseName} getSubWindow success. Cause: ${JSON.stringify(windowclass)}`);
                expect(windowclass.length).assertEqual(0)
                done();
            } catch (e) {
                console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number     SUB_BASIC_WMS_FUNCTION_GETSUBWINDOW_static_0200
         * @tc.name       testgetSubWindow0_callback_static
         * @tc.desc       Test the function value of getSubWindow
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testgetSubWindow0_callback_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testgetSubWindow0_callback_static';
            let windowclass:Array<window.Window>|undefined;
            try {
                windowStage!.getSubWindow((err: BusinessError<void>|null, data: Array<window.Window>|undefined) => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        console.error(caseName + ` Failed to obtain the subwindow. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }else{
                        windowclass = data;
                        console.log(`${caseName} getSubWindow success. Cause: ${JSON.stringify(windowclass)}`);
                        expect(windowclass!.length).assertEqual(0)
                        done();
                    }
                });
            } catch (e) {
                console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
                expect(false).assertTrue();
                done();
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
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                    done();
                })
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0100
         * @tc.name        testLoadContent_Callback_static_0100
         * @tc.desc        The page does not exist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testLoadContent_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testLoadContent_Callback_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            let storage: LocalStorage = new LocalStorage();
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let mainWIndow: window.Window  = windowStage!.getMainWindowSync();

            mainWIndow.loadContent('pages/page2/page3', storage, (err: BusinessError<void>|null):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err!.code}, message: ${err!.message}`);
                    expect(err!.code).assertEqual(401);
                    done();
                }else{
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                    expect(false).assertTrue();
                    done();
                }

            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0200
         * @tc.name        testLoadContent_Callback_static_0200
         * @tc.desc        The window is destroy
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testLoadContent_Callback_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testLoadContent_Callback_static_0200';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            let storage: LocalStorage = new LocalStorage();
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testLoadContent_Callback_static_0200');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage!.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            try {
                win.loadContent('pages/index2', storage, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(err!.code).assertEqual(1300002);
                        done();
                    }else{
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to testLoadContent_Callback_static_0200. Cause: ' + JSON.stringify(exception));
                // expect(exception.code).assertEqual(1300002)
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0300
         * @tc.name        testLoadContent_Promise_static_0100
         * @tc.desc        The page does not exist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testLoadContent_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testLoadContent_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let storage: LocalStorage = new LocalStorage();
            let mainWIndow: window.Window  = windowStage!.getMainWindowSync();
            mainWIndow.loadContent('pages/page2/page3',storage).then(() => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0400
         * @tc.name        testLoadContent_Promise_static_0200
         * @tc.desc        The window is destroy
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testLoadContent_Promise_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testLoadContent_Promise_static_0200';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let storage: LocalStorage = new LocalStorage();
            let win: window.Window = await windowStage!.createSubWindow('testLoadContent_NotExistPage_Callback_static_0200');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage!.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            try {
                win.loadContent('pages/index2',storage).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to testLoadContent_Promise_static_0200. Cause: ' + JSON.stringify(exception));
                // expect(exception.code).assertEqual(1300002)
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0500
         * @tc.name        testWindowStage_LoadContent_Callback_static_0100
         * @tc.desc        The page does not exist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowStage_LoadContent_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowStage_LoadContent_Callback_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            let storage: LocalStorage = new LocalStorage();
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            windowStage!.loadContent('pages/page2/page3', storage, (err: BusinessError<void>|null):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err!.code}, message: ${err!.message}`);
                    expect(err!.code).assertEqual(401);
                    done();
                }else{
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                    expect(false).assertTrue();
                    done();
                }

            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0600
         * @tc.name        testWindowStage_LoadContent_Promise_static_0100
         * @tc.desc        The page does not exist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowStage_LoadContent_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowStage_LoadContent_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let storage: LocalStorage = new LocalStorage();
            windowStage!.loadContent('pages/page2/page3',storage).then(() => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_LOADCONTENT_API_0700
         * @tc.name        testWindowStage_LoadContent_Promise_static_0200
         * @tc.desc        The page does not exist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowStage_LoadContent_Promise_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowStage_LoadContent_Promise_static_0200';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let storage: LocalStorage = new LocalStorage();
            windowStage!.loadContent('pages/Index').then(() => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                expect(true).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            });
        })


        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETUICONTEXT_API_0100
         * @tc.name        testGetUIContext_Instances_static_0100
         * @tc.desc        Get the UIContext instance.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testGetUIContext_Instances_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetUIContext_Instances_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try{
                let mainWindow: window.Window = await windowStage!.getMainWindow();
                hilog.info(0x0000, '[ANI]',msgStr + 'get mainWindow success: ' + JSON.stringify(mainWindow));
                // 获取UIContext实例。
                let uiContext: UIContext = mainWindow.getUIContext();
                // hilog.info(0x0000, '[ANI]',msgStr + 'after uiContext: ' + JSON.stringify(uiContext));
                expect(uiContext!=null).assertTrue();
                done();
            }catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to getUIContext. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETUICONTEXT_API_0200
         * @tc.name        testGetUIContext_WindowStateAbnormal_static_0200
         * @tc.desc        Get the UIContext instance
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetUIContext_WindowStateAbnormal_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testGetUIContext_WindowStateAbnormal_static_0200';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testGetUIContext_WindowStateAbnormal_static_0200');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage!.createSubWindow success');
            expect(!!win).assertTrue();
            await win.destroyWindow();
            try {
                let uiContext: UIContext = win.getUIContext();
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to getUIContext. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0100
         * @tc.name        testWindowOffWindowEvent_RepeatOff_static_0100
         * @tc.desc        Disable the monitoring of window life cycle changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffWindowEvent_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowOffWindowEvent_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win:window.Window;
             windowStage!.createSubWindow('testWindowOffWindowEvent_RepeatOff').then(async (data:window.Window)=>{
                win = data;
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
                expect(!!win).assertTrue();
                try {
                    win.onWindowEvent((data:window.WindowEventType) => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Window event happened. Event:' + JSON.stringify(data));
                    });
                } catch (exception) {
                    exception = exception as BusinessError;
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                    await win.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                try {
                    win.offWindowEvent();
                    expect(true).assertTrue();
                } catch (exception) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                    await win.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                try {
                    win.offWindowEvent();
                    await win.destroyWindow();
                    expect(true).assertTrue();
                    done();
                } catch (exception) {
                    exception = exception as BusinessError;
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                    await win.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
            }).catch((err:Error):PromiseLike<void>|undefined => {
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            });

        });

        /**
         * @tc.number      SUB_BASIC_WMS_WINDOW_EVENT_TYPE_0100
         * @tc.name        test_WindowEventType_enum_static_0100
         * @tc.desc        test_WindowEventType_enum_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it("test_WindowEventType_enum_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr : string = "test_WindowEventType_enum_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                expect(window.WindowEventType.WINDOW_SHOWN).assertEqual(1);
                expect(window.WindowEventType.WINDOW_ACTIVE).assertEqual(2);
                expect(window.WindowEventType.WINDOW_INACTIVE).assertEqual(3);
                expect(window.WindowEventType.WINDOW_HIDDEN).assertEqual(4);
                expect(window.WindowEventType.WINDOW_DESTROYED).assertEqual(7);
                hilog.info(0x0000, '[ANI]','Succeeded in test_WindowEventType_enum.');
                done();
            } catch (error) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to test_WindowEventType_enum. Cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_WINDOW_STATUS_TYPE_0100
         * @tc.name        test_WindowStatusType_enum_static_0100
         * @tc.desc        test_WindowStatusType_enum_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it("test_WindowStatusType_enum_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr : string = "test_WindowStatusType_enum_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                expect(window.WindowStatusType.UNDEFINED).assertEqual(0);
                expect(window.WindowStatusType.FULL_SCREEN).assertEqual(1);
                expect(window.WindowStatusType.MAXIMIZE).assertEqual(2);
                expect(window.WindowStatusType.MINIMIZE).assertEqual(3);
                expect(window.WindowStatusType.FLOATING).assertEqual(4);
                expect(window.WindowStatusType.SPLIT_SCREEN).assertEqual(5);
                hilog.info(0x0000, '[ANI]','Succeeded in test_WindowStatusType_enum_static_0100.');
                done();
            } catch (error) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to test_WindowStatusType_enum_static_0100. Cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOWTYPE_API_0100
         * @tc.name        testEnumWindow_windowType_static_0100
         * @tc.desc        window type enumeration
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testEnumWindow_windowType_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            hilog.info(0x0000, '[ANI]','testEnumWindow_windowType_static_0100 test the enum value of windowType begin');
            hilog.info(0x0000, '[ANI]','testEnumWindow_windowType_static_0100' + JSON.stringify(window.WindowType.TYPE_FLOAT));
            try {
                // expect(1).assertEqual(window.WindowType.TYPE_SYSTEM_ALERT);
                expect(8).assertEqual(window.WindowType.TYPE_FLOAT);
                expect(16).assertEqual(window.WindowType.TYPE_DIALOG);
                // expect(32).assertEqual(window.WindowType.TYPE_MAIN);
                done();
            } catch (error) {
                hilog.info(0x0000, '[ANI]','test Enum value of windowType error ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
         * @tc.name        testEnumWindowStageEventTypeReName_static_0100
         * @tc.desc        To test the enum value of WindowStageEventType.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testEnumWindowStageEventTypeReName_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>  {
            hilog.info(0x0000, '[ANI]','test the enum value of WindowStageEventType begin');
            try {
                expect(1).assertEqual(window.WindowStageEventType.SHOWN);
                expect(2).assertEqual(window.WindowStageEventType.ACTIVE);
                expect(3).assertEqual(window.WindowStageEventType.INACTIVE);
                expect(4).assertEqual(window.WindowStageEventType.HIDDEN);
                expect(5).assertEqual(window.WindowStageEventType.RESUMED);
                expect(6).assertEqual(window.WindowStageEventType.PAUSED);
                done();
            } catch (err) {
                hilog.info(0x0000, '[ANI]','test enum value of windowStageEventType error ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETMAINWINDOW_API_0100
         * @tc.name        testWindowStage_GetMainWIndow_Callback_static_0100
         * @tc.desc        testWindowStage_GetMainWIndow_Callback_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testWindowStage_GetMainWIndow_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowStage_GetMainWIndow_Callback_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            windowStage!.getMainWindow((err: BusinessError<void>|null, data:window.Window|undefined):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]',msgStr+` Failed to obtain the main window. Cause code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                    done();
                }
                hilog.info(0x0000, '[ANI]',msgStr+' Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            });
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETMAINWINDOW_API_0200
         * @tc.name        testWindowStage_GetMainWIndow_Promise_static_0100
         * @tc.desc        testWindowStage_GetMainWIndow_Promise_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testWindowStage_GetMainWIndow_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowStage_GetMainWIndow_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let promise = windowStage!.getMainWindow();
            promise.then((data:window.Window) => {
                hilog.info(0x0000, '[ANI]',msgStr +' Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr +` Failed to obtain the main window. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            });
        })
/**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SETUICONTENT_JS_API_0100
         * @tc.name        testSetUIContent_WindowStateAbnormal_static_0100
         * @tc.desc        Load the specific page content for the current window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetUIContent_WindowStateAbnormal_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string  = 'testSetUIContent_WindowStateAbnormal_static_0100';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetUIContent_WindowStateAbnormal');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setUIContent('pages/page2/page2').then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined  => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002)
                    done();
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SETUICONTENT_JS_API_0200
         * @tc.name        testSetUIContent_WindowStateAbnormal_static_0200
         * @tc.desc        Load the specific page content for the current window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetUIContent_WindowStateAbnormal_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string  = 'testSetUIContent_WindowStateAbnormal_static_0200';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage!.createSubWindow('testSetUIContent_WindowStateAbnormal2');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setUIContent('pages/second/second', (err: BusinessError<void>|null):void => {
                    if (err!.code) {
                        hilog.error(0x0000, '[ANI]',msgStr + ' Failed to load the content callback. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done();
                    } else {
                        hilog.info(0x0000, '[ANI]',msgStr +  ' Succeeded in loading the content.');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SETUICONTENT_JS_API_0300
         * @tc.name        testSetUIContent_Not_Existent_Parameter_static_0300
         * @tc.desc        Verify the scene of loading the page with illegal values
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testSetUIContent_Not_Existent_Parameter_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let msgStr:string  = 'testSetUIContent_Not_Existent_Parameter_static_0300'
            let win: window.Window;
            try {
                win = await windowStage!.createSubWindow('testSetUIContent_Not_Existent_Parameter');
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
                expect(win != null).assertTrue();
                // 设置setUIContent
                (win as window.Window).setUIContent('pages/second/he').then(() => {
                    hilog.info(0x0000, '[ANI]','setUIContent3 . Cause: success');
                    expect(false).assertTrue();
                    await (win as window.Window).destroyWindow();
                    done();
                }).catch((err: Error) => {
                    hilog.error(0x0000, '[ANI]','Failed to setUIContent3 . Cause:' + JSON.stringify(err));
                    expect(err!.code).assertEqual(401);
                    await (win as window.Window).destroyWindow();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]','Failed to create the window3. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SETUICONTENT_JS_API_0400
         * @tc.name        testSetUIContentTestCallback1_static_0400
         * @tc.desc        Verify the scenario of loading an existing page
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testSetUIContentTestCallback1_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let msgStr:string  = 'testSetUIContentTestCallback1_static_0400'
            let winData: window.Window;
            winData = await windowStage!.createSubWindow('testSetUIContentTestCallback1_static_03400');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!winData).assertTrue();
            try {
                (winData as window.Window).setUIContent('pages/second/second',  (err: BusinessError<void>|null):void => {
                    try {
                        if (err!.code) {
                            hilog.error(0x0000, '[ANI]','Failed to load the content callback. Cause:' + JSON.stringify(err));
                            await (winData as window.Window).destroyWindow();
                            expect(err!.code).assertEqual(401);
                            done();
                        } else {
                            hilog.info(0x0000, '[ANI]','Succeeded in loading the content.');
                            await (winData as window.Window).destroyWindow();
                            expect(false).assertTrue();
                            done();
                        }
                    } catch (err) {
                        hilog.info(0x0000, '[ANI]','setUIContentTestCallBack1 assert result catch' + JSON.stringify(err));
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]','Failed callback to load the content. Cause:' + JSON.stringify(exception));
                (winData as window.Window).destroyWindow();
                expect(exception!.code).assertEqual(401);
                done();
            }
            ;
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0200
         * @tc.name        test_findWindow_notExist_static_0100
         * @tc.desc        test_findWindow_notExist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('test_findWindow_notExist_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'test_findWindow_notExist_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let tempWnd : window.Window;
            try {
                tempWnd = window.findWindow('aa');
                hilog.info(0x0000, '[ANI]',msgStr + 'findWindow success');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            };
        });
        /**
         * @tc.number       testIsWindowShowingErrCode1300006_0100
         * @tc.name         testIsWindowShowingErrCode1300002_static_0100
         * @tc.desc         testIsWindowShowingErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testIsWindowShowingErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testIsWindowShowingErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testIsWindowShowingErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                let data = tempWnd.isWindowShowing();
                hilog.info(domain, tag,msgStr + 'window.isWindowShowing success');
                expect(false).assertTrue();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number       testOnNoInteractionDetectedErrCode1300002_0100
         * @tc.name         testOnNoInteractionDetectedErrCode1300002_static_0100
         * @tc.desc         testOnNoInteractionDetectedErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnNoInteractionDetectedErrCode1300002_static_0100', Level.LEVEL3,async (done: () => void): Promise<void>   => {
            let caseName:string = "testOnNoInteractionDetectedErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOnNoInteractionDetectedErrCode1300002_static_0100')
                .then((data:window.Window)=>{
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onNoInteractionDetected(1, () => {
                        });
                        hilog.error(0x0000, '[ANI]', msgStr + 'Succeeded in calling on noInteractionDetected.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]', msgStr +' Failed to call on noInteractionDetected. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr +  `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });

        })
        /**
         * @tc.number       testOffNoInteractionDetectedErrCode1300002_0100
         * @tc.name         testOffNoInteractionDetectedErrCode1300002_static_0200
         * @tc.desc         testOffNoInteractionDetectedErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffNoInteractionDetectedErrCode1300002_static_0200', Level.LEVEL3, async (done: () => void): Promise<void>   => {
            let caseName:string = "testOffNoInteractionDetectedErrCode1300002_static_0200";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOffNoInteractionDetectedErrCode1300002_static_0200')
                .then((data:window.Window)=>{
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.offNoInteractionDetected();
                        hilog.error(0x0000, '[ANI]', msgStr + 'Succeeded in calling on noInteractionDetected.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]', msgStr +' Failed to call on noInteractionDetected. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr +  `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });

        })

        
/**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0090
         * @tc.name        testNoInteractionDetected_OnMainWindow_static_0100
         * @tc.desc        Enables this window to not listen for interactive events within a specified timeout period
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testNoInteractionDetected_OnMainWindow_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testNoInteractionDetected_OnMainWindow_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let mainWin:window.Window = windowStage!.getMainWindowSync();
            expect(!!mainWin).assertTrue();
            try {
                mainWin.onNoInteractionDetected(1, () => {
                    hilog.info(0x0000, '[ANI]', msgStr + 'no interaction in 10s');
                    mainWin.offNoInteractionDetected();
                    done();
                });
                hilog.info(0x0000, '[ANI]', msgStr +  ' register noInteractionDetected successed');
            } catch (exception) {
                exception = exception as BusinessError;
                if (exception!.code != 801) {
                    hilog.error(0x0000, '[ANI]', msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]', msgStr + JSON.stringify(exception));
                    hilog.info(0x0000, '[ANI]', msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
                    expect(exception!.code).assertEqual(801);
                    done();
                }
            }
            await  Utils.msSleep(800)
            await  Utils.msSleep(800)
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3980
         * @tc.name        testNoInteractionDetected_on_Function_Callback_static_0300
         * @tc.desc        window type noInteractionDetected
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testNoInteractionDetected_on_Function_Callback_static_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void>  =>{
            let msgStr:string = "testNoInteractionDetected_on_Function_Callback_static_0300";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try{
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass: window.Window = await window.getLastWindow(context!);
                windowClass.onNoInteractionDetected(60, () => {
                    hilog.info(0x0000, '[ANI]', msgStr +  'no interaction in 60s');
                });
                expect(true).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(0x0000, '[ANI]', msgStr +  'Failed to register callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.info(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]', msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3990
         * @tc.name        tetestNoInteractionDetected_off_Function_Callback_static_0400
         * @tc.desc        window type noInteractionDetected
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("tetestNoInteractionDetected_off_Function_Callback_static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void>  =>{
            let msgStr:string = "tetestNoInteractionDetected_off_Function_Callback_static_0400";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try{
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass: window.Window = await window.getLastWindow(context!);
                windowClass.offNoInteractionDetected();
                expect(true).assertTrue();
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(0x0000, '[ANI]', msgStr +  'Failed to unregister callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.info(0x0000, '[ANI]', msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]', msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        })
        




        /**
         * @tc.number       testOnSubWindowCloseErrCode1300002_0100
         * @tc.name         testOnSubWindowCloseErrCode1300002_static_0100
         * @tc.desc         testOnSubWindowCloseErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnSubWindowCloseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnSubWindowCloseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOnSubWindowCloseErrCode1300002_SubWindow_Promise')
                .then((data:window.Window)=>{
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onSubWindowClose(() => {
                        });
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling on subWindowClose.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on subWindowClose. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr +  `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });
            
        })
        /**
         * @tc.number       testOffSubWindowCloseErrCode1300002_0100
         * @tc.name         testOffSubWindowCloseErrCode1300002_static_0200
         * @tc.desc         testOffSubWindowCloseErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffSubWindowCloseErrCode1300002_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOffSubWindowCloseErrCode1300002_static_0200";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            windowStage!.createSubWindow('testOffSubWindowCloseErrCode1300002_static_0200')
                .then((data:window.Window)=>{
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.offSubWindowClose(() => {
                        });
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling on subWindowClose.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on subWindowClose. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr +  `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });
            
        })

        /**
         * @tc.number       testOnSubWindowCloseErrCode1300004_0100
         * @tc.name         testOnSubWindowCloseErrCode1300004_static_0300
         * @tc.desc         testOnSubWindowCloseErrCode1300004_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnSubWindowCloseErrCode1300004_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnSubWindowCloseErrCode1300004_static_0300";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let mainWindow: window.Window
            windowStage!.getMainWindow().then((data:window.Window) => {
                mainWindow = data;
                hilog.info(0x0000, '[ANI]',msgStr + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
                expect(!!mainWindow).assertTrue();
                try {
                    mainWindow!.onSubWindowClose(() => {
                    });
                    hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on_subWindowClose.');
                    expect(false).assertTrue();
                    done();
                } catch (exception) {
                    exception = exception as BusinessError;
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call on_subWindowClose. Cause:' + JSON.stringify(exception));
                    if (exception!.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持on_subWindowClose能力.');
                    } else {
                        expect(exception!.code).assertEqual(1300004);
                    }
                    done();
                }
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr+ ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
                done()
            });

        })
        /**
         * @tc.number      testOnWindowWillCloseErrCode1300002_0100
         * @tc.name        testOnWindowWillCloseErrCode1300002_static_0100
         * @tc.desc        testOnWindowWillCloseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOnWindowWillCloseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnWindowWillCloseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testOnWindowWillCloseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onWindowWillClose (() => {
                    console.info(msgStr +  'on windowWillClose callback');
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = true;
                        resolve(result);
                    });
                });
                hilog.info(domain, tag,msgStr + 'window.on_windowWillClose success');
                expect(false).assertTrue();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to on_windowWillClose. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number      testOffWindowWillCloseErrCode1300002_0100
         * @tc.name        testOffWindowWillCloseErrCode1300002_static_0100
         * @tc.desc        testOffWindowWillCloseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOffWindowWillCloseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffWindowWillCloseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage!.createSubWindow('testOffWindowWillCloseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offWindowWillClose();
                hilog.info(domain, tag,msgStr + 'window.on_windowWillClose success');
                expect(false).assertTrue();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to off_windowWillClose. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_OnWindowWillClose_1300004_static_0300
         * @tc.name        testonWindowWillClose1300004_static
         * @tc.desc        testonWindowWillClose1300004
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testonWindowWillClose1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testonWindowWillClose1300004_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let config: window.Configuration = {
                name: "test",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let windowClass:window.Window = await window.createWindow(config);
            const callback = () => {
                return new Promise<boolean>((resolve, reject) => {
                    // 是否关闭该窗口
                    let result: boolean = true;
                    resolve(result);
                });
            }
            try {
                windowClass.onWindowWillClose(callback);
                hilog.info(domain, tag,msgStr  + 'Succeeded on windowWillClose ');
                expect(false).assertFail();
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.info(domain, tag,msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
                await windowClass.destroyWindow();
                if(e.code == 801){
                    done();
                }else {
                    expect(e.code).assertEqual(1300004);
                    done()
                }
            }

        })

        /**
                  * @tc.number       testCreateWindowCallbackErrCode1300006_0100
                  * @tc.name         testCreateWindowCallbackErrCode1300006_static_0100
                  * @tc.desc         testCreateWindowCallbackErrCode1300006_static_0100
                  * @tc.size         MediumTest
                  * @tc.type         Function
                  * @tc.level        Level 3
                  */
                it('testCreateWindowCallbackErrCode1300006_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
                    let caseName : string = "testCreateWindowCallbackErrCode1300006_static_0100";
                    let msgStr : string = 'jsunittest ' + caseName + ' ';
                    hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
                    let windowConfig: window.Configuration = {
                        name: "testCreateWindowCallbackErrCode1300006_static_0100",
                        windowType: window.WindowType.TYPE_DIALOG,
                        ctx: undefined,
                    };
                    try {
                        window.createWindow(windowConfig, (err: BusinessError<void>|null,data:window.Window|undefined):void => {
                            const errCode: number = err!.code;
                            if (errCode) {
                                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(err));
                                expect(err!.code).assertEqual(1300006);
                                done()
                                return;
                            }
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling createWindow.');
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (exception) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                /**
                 * @tc.number       testCreateWindowPromiseErrCode1300006_0100
                 * @tc.name         testCreateWindowPromiseErrCode1300006_static_0100
                 * @tc.desc         testCreateWindowPromiseErrCode1300006_static_0100
                 * @tc.size         MediumTest
                 * @tc.type         Function
                 * @tc.level        Level 3
                 */
                it('testCreateWindowPromiseErrCode1300006_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
                    let caseName : string = "testCreateWindowPromiseErrCode1300006_static_0100";
                    let msgStr : string = 'jsunittest ' + caseName + ' ';
                    hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
                    let windowConfig: window.Configuration = {
                        name: "testCreateWindowPromiseErrCode1300006_static_0100",
                        windowType: window.WindowType.TYPE_DIALOG,
                        ctx: undefined,
                    };
                    try {
                        window.createWindow(windowConfig).then((data:window.Window|undefined) => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling createWindow.');
                            expect(false).assertTrue();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300006);
                        });
                        done()
                    } catch (exception) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call createWindow. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                /**
                 * @tc.number       testCreateWindowCallbackErrCode1300002_0200
                 * @tc.name         testCreateWindowCallbackErrCode1300002_static_0200
                 * @tc.desc         testCreateWindowCallbackErrCode1300002_static_0200
                 * @tc.size         MediumTest
                 * @tc.type         Function
                 * @tc.level        Level 3
                 */
                it('testCreateWindowCallbackErrCode1300002_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
                    let caseName : string = "testCreateWindowCallbackErrCode1300002_static_0200";
                    let msgStr : string = 'jsunittest ' + caseName + ' ';
                    hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
                    let windowConfig: window.Configuration = {
                        name: "testCreateWindowCallbackErrCode1300002_static_0200",
                        windowType:window.WindowType.TYPE_FLOAT,
                        ctx: context!,
                    };
                    try {
                        window.createWindow(windowConfig, (err: BusinessError<void>|null,data:window.Window|undefined):void => {
                            const errCode: number = err!.code;
                            if (errCode) {
                                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(err));
                                if (err!.code === 1300002) {
                                    done();
                                } else if(err!.code === 801){
                                    done();
                                }else {
                                    expect(false).assertTrue();
                                    done();
                                }
                            }
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling createWindow.');
                            expect(!!data).assertTrue();
                            done();
                        });
                    } catch (exception) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                /**
                 * @tc.number       testCreateWindowPromiseErrCode1300002_0200
                 * @tc.name         testCreateWindowPromiseErrCode1300002_static_0200
                 * @tc.desc         testCreateWindowPromiseErrCode1300002_static_0200
                 * @tc.size         MediumTest
                 * @tc.type         Function
                 * @tc.level        Level 3
                 */
                it('testCreateWindowPromiseErrCode1300002_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
                    let caseName : string = "testCreateWindowPromiseErrCode1300002_static_0200";
                    let msgStr : string = 'jsunittest ' + caseName + ' ';
                    hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
                    let windowConfig: window.Configuration = {
                        name: "testCreateWindowPromiseErrCode1300002_static_0200",
                        windowType: window.WindowType.TYPE_FLOAT,
                        ctx: context!,
                        displayId:0,
                        parentId:0,
                        decorEnabled:true,
                        title:'123',
                        // defaultDensityEnabled:true
                    };
                    try {
                        window.createWindow(windowConfig).then((data:window.Window|undefined) => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling createWindow.');
                            expect(!!data).assertTrue();
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause: ' + JSON.stringify(err));
                            if (err!.code === 1300002) {
                                done();
                            } else if(err!.code === 801){
                                done();
                            }else {
                                expect(false).assertTrue();
                                done();
                            }
                        });
                        done()
                    } catch (exception) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call createWindow. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })

        /**
         * @tc.number      testCreateSubWindow_Callback_static_0100
         * @tc.name        testCreateSubWindow_Callback_static_0100
         * @tc.desc        testCreateSubWindow_Callback_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testCreateSubWindow_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCreateSubWindow_Callback';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin');
            let windowClass:window.Window;
            try {
                windowStage!.createSubWindow('testCreateSubWindow_Callback',  (err: BusinessError<void>|null, data : window.Window|undefined):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]', msgStr + `Failed to create the subwindow. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                    // windowClass = data;
                    hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    await data!.destroyWindow();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]', msgStr + `Failed to create the subwindow. Cause code: ${exception!.code}, message: ${exception!.message}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testCreateSubWindow_Promise_static_0100
         * @tc.name        testCreateSubWindow_Promise_static_0100
         * @tc.desc        testCreateSubWindow_Promise_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testCreateSubWindow_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string  = 'testCreateSubWindow_Promise';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin');
            let windowClass:window.Window;
            try {
                await windowStage!.createSubWindow('testCreateSubWindow_Promise').then((data : window.Window) => {
                    windowClass = data;
                    hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    await windowClass.destroyWindow();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]', msgStr + `Failed to create the subwindow. Cause code: ${err!.code}, message: ${err!.message}`);
                    expect(false).assertTrue();
                    done();
                });
            } catch (exception) {
                hilog.error(0x0000, '[ANI]', msgStr + `Failed to create the subwindow. Cause code: ${exception!.code}, message: ${exception!.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number       testOnWindowStageEventErrCode1300002_static_0100
         * @tc.name         testOnWindowStageEventErrCode1300002_static_0100
         * @tc.desc         testOnWindowStageEventErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnWindowStageEventErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnWindowStageEventErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = (res: window.WindowStageEventType) => {
                };
                windowStageStart.onWindowStageEvent(callback);
                hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling on windowStageEvent.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call on windowStageEvent. Cause:' + JSON.stringify(e));
                expect(e!.code).assertEqual(1300002);
                done()
            }
        })


        /**
         * @tc.number       testOffWindowStageEventErrCode1300002_static_0100
         * @tc.name         testOffWindowStageEventErrCode1300002_static_0100
         * @tc.desc         testOffWindowStageEventErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffWindowStageEventErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffWindowStageEventErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = (res: window.WindowStageEventType) => {
                };
                windowStageStart.offWindowStageEvent(callback);
                hilog.error(0x0000, '[ANI]', msgStr + 'Succeeded in calling off windowStageEvent.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr + 'Failed to call off windowStageEvent. Cause:' + JSON.stringify(e));
                expect(e!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number      testOnWindowStageCloseErrCode1300002_static_0100
         * @tc.name        testOnWindowStageCloseErrCode1300002_static_0100
         * @tc.desc        testOnWindowStageCloseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOnWindowStageCloseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnWindowStageCloseErrCode1300002_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let windowStageStart : window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = () => {
                    return true;
                };
                windowStageStart.onWindowStageClose(callback);
                hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling on windowStageClose.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr + 'Failed to call on windowStageClose. Cause:' + JSON.stringify(e));
                expect(e!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number      testOff_windowStageCloseErrCode1300002_static_0100
         * @tc.name        testOff_windowStageCloseErrCode1300002_static_0100
         * @tc.desc        testOff_windowStageCloseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testOff_windowStageCloseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOff_windowStageCloseErrCode1300002_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let windowStageStart : window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                const callback = () => {
                    return true;
                };
                windowStageStart.offWindowStageClose(callback);
                hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling off windowStageClose.');
                expect(false).assertTrue();
                done()
            } catch (e) {
                e = e as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr + 'Failed to call off windowStageClose. Cause:' + JSON.stringify(e));
                expect(e!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number      testGetWindowStatusErrCode1300002_static_0100
         * @tc.name        testGetWindowStatusErrCode1300002_static_0100
         * @tc.desc        testGetWindowStatusErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowStatusErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testGetWindowStatusErrCode1300002_static_0100";
            let msgStr : string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testGetWindowStatusErrCode1300002_static_0100')
                .then((data : window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await data!.destroyWindow();
                    try {
                        let windowStatusType : window.WindowStatusType = data!.getWindowStatus();
                        hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in calling getWindowStatus.');
                        expect(false).assertTrue();
                        done()
                    } catch (e) {
                        e = e as BusinessError;
                        hilog.error(0x0000, '[ANI]', msgStr + 'Failed to call getWindowStatus. Cause:' + JSON.stringify(e));
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
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_API_REMOVE_STARTING_WINDOW_static_0100
         * @tc.name      testRemoveStartingWindow_Promise_static
         * @tc.desc      testRemoveStartingWindow_Promise_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it("testRemoveStartingWindow_Promise_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let msgStr:string = "testRemoveStartingWindow_Promise_static";
            hilog.info(domain, tag,msgStr + "begin");
            try {
                windowStage!.removeStartingWindow().then(() => {
                    hilog.info(domain, tag,'Succeeded in removing starting window.');
                    expect(true).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`Failed to remove starting window. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code != 801) {
                        hilog.error(domain, tag,msgStr + 'Failed testRemoveStartingWindow_Promise. Cause:' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        hilog.info(domain, tag,msgStr + 'The device not support SystemCapability.Window.SessionManager');
                        expect(err.code).assertEqual(801);
                        done();
                    }
                });

            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag,msgStr + 'Failed to testRemoveStartingWindow_Promise. Cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number     testRemoveStartingWindowPromiseErrCode1300002_static_0100
         * @tc.name       testRemoveStartingWindowPromiseErrCode1300002_static_0100
         * @tc.desc       testRemoveStartingWindowPromiseErrCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testRemoveStartingWindowPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testRemoveStartingWindowPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                windowStageStart.removeStartingWindow().then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling removeStartingWindow.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call removeStartingWindow. Cause: ' + JSON.stringify(err));
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
         * @tc.number      testMinimizePromiseErrCode1300002_static_0100
         * @tc.name        testMinimizePromiseErrCode1300002_static_0100
         * @tc.desc        testMinimizePromiseErrCode1300002_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testMinimizePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testMinimizePromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let subWin: window.Window;
            windowStage!.createSubWindow('testMinimizePromiseErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await subWin.destroyWindow();
                    try {
                        subWin.minimize().then(() => {
                            hilog.info(domain, tag,msgStr + 'Succeeded in calling minimize.');
                            expect(false).assertTrue();
                            done()
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
                            if(err.code == 801){
                                done();
                            }else{
                                expect(err.code).assertEqual(1300002);
                                expect(err.message!=null).assertTrue();
                                done()
                            }
                        });
        
                    } catch (exception) {
                        exception = exception as BusinessError;
                        hilog.error(domain, tag,msgStr + 'Failed to set the call minimize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
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
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_3910
         * @tc.name       testCreateSubWindowWithOptions_Function_Promise_static
         * @tc.desc       Test the function value of createSubWindowWithOptions
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level0
         */
        it('testCreateSubWindowWithOptions_Function_Promise_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr:string = "testCreateSubWindowWithOptions_Function_Promise_static";
            hilog.info(domain, tag,msgStr + " begin");
            let windowClass: window.Window;
            hilog.info(domain, tag,msgStr + " try begin")
            let options: window.SubWindowOptions = {
                title: 'title',
                decorEnabled: true,
                isModal: false,
                maximizeSupported: false,
                zLevel:11,
                outlineEnabled:false
            };
            windowStage!.createSubWindowWithOptions('testCreateSubWindowWithOptions_Function_Promise_static', options)
                .then((data:window.Window) => {
                    windowClass = data;
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + data);
                    windowClass.destroyWindow();
                    expect(true).assertTrue();
                    done();
                })
                .catch((err: Error):PromiseLike<void>|undefined => {
                    if (err.code != 1300002) {
                        hilog.error(domain, tag,msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        hilog.info(domain, tag,msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                        hilog.info(domain, tag,msgStr + JSON.stringify(err))
                        expect(err.code).assertEqual(1300002);
                        done();
                    }
                });
        })

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_static_0400
         * @tc.name       testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY_static
         * @tc.desc       testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level3
         */
        it('testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY_static";
            hilog.info(domain, tag,msgStr + " begin");
            let windowClass: window.Window;
            hilog.info(domain, tag,msgStr + " try begin")
            let options: window.SubWindowOptions = {
                title: 'title',
                decorEnabled: true,
                isModal: true,
                modalityType: window.ModalityType.APPLICATION_MODALITY
            };
            try {
                windowStage!.createSubWindowWithOptions('testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY_static', options)
                    .then((data:window.Window) => {
                        windowClass = data;
                        hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + data);
                        windowClass.destroyWindow();
                        expect(true).assertTrue();
                        done();
                    })
                    .catch((error: Error):PromiseLike<void>|undefined => {
                        hilog.info(domain, tag,msgStr + 'Failed to create the subwindow. Cause: ' + error.code);
                        if (error.code === 1300002) {
                            done();
                        }else if(error.code === 801){
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    });
            } catch (error) {
                hilog.info(domain, tag,msgStr + ',error code:' + error.code);
                expect(false).assertTrue();
                done();
               
            }

        })
        /**
         * @tc.number      testCreateSubWindowWithOptionsPromiseErrCode1300002_static_0100
         * @tc.name        testCreateSubWindowWithOptionsPromiseErrCode1300002_static_0100
         * @tc.desc        testCreateSubWindowWithOptionsPromiseErrCode1300002_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testCreateSubWindowWithOptionsPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testCreateSubWindowWithOptionsPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let param: window.SubWindowOptions = {
                title: "aa",
                decorEnabled: true
            }
            let subWin: window.Window = await windowStage!.createSubWindow('testCreateSubWindowWithOptionsPromiseErrCode1300002_SubWindow_Promise_static')
            await (subWin! as window.Window).destroyWindow();
            try {

                (subWin! as window.Window).createSubWindowWithOptions("name", param).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling createSubWindowWithOptions.');
                    expect(false).assertTrue();
                    done();
                }).then((data) => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + data);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
                    if(err.code == 801){
                        done();
                    }else{
                        expect(err.code).assertEqual(1300002);
                        expect(err.message!=null).assertTrue();
                        done()
                    }
                });
            } catch (exception) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100
         * @tc.name        testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100
         * @tc.desc        testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let config: window.Configuration = {
                name: "testCreateSubWindowWithOptionsPromiseErrCode1300004_static_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await window.createWindow(config);
                expect(!!subWindowClass).assertTrue();
            } catch (err) {
                hilog.error(domain, tag,msgStr + 'window.createWindow ' + 'caught, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            try {
                let param: window.SubWindowOptions = {
                    title: "aa", decorEnabled: true
                }
                subWindowClass!.createSubWindowWithOptions("bb", param).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling createSubWindowWithOptions.');
                    expect(false).assertTrue();
                    done()
                }).then((data) => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + data);
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
                    await subWindowClass!.destroyWindow();
                    if(err.code == 801){
                        done();
                    }else{
                        expect(err.code).assertEqual(1300004);
                        expect(err.message!=null).assertTrue();
                        done()
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed to set the call createSubWindowWithOptions. Cause:' +
                JSON.stringify(exception));
                if (exception.code === undefined) {
                    hilog.info(domain, tag,msgStr + '此设备不支持createSubWindowWithOptions能力.');
                    done()
                } else {
                    expect(exception.code).assertEqual(1300004);
                    expect(exception.message!=null).assertTrue();
                    done()
                }

            }
        })
        /**
         * @tc.name   testOnwindowStatusDidChange_1300002_static
         * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_static_0100
         * @tc.desc   testOnwindowStatusDidChange_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testOnwindowStatusDidChange_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnwindowStatusDidChange_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            try {
                let windowClass:window.Window = await windowStage!.createSubWindow('testOnwindowStatusDidChange_1300002_static');
                await windowClass.destroyWindow();
                await Utils.msSleep(500);
                const callback = (data: window.WindowStatusType) => {
                    console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.onWindowStatusDidChange(callback);
                console.log(msgStr + 'Succeeded on windowStatusDidChange ');
                done()
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(err.code).assertEqual(1300002);
                    expect(err.message != null).assertTrue();
                    done()
                }
            }
        })

        /**
         * @tc.name   testOffwindowStatusDidChange_1300002_static
         * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_static_0200
         * @tc.desc   testOffwindowStatusDidChange_1300002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testOffwindowStatusDidChange_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "testOffwindowStatusDidChange_1300002_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testOffwindowStatusDidChange_1300002_static');
            try {
                const callback = (data: window.WindowStatusType) => {
                    console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.onWindowStatusDidChange(callback);
                await windowClass.destroyWindow();
                windowClass.offWindowStatusDidChange(callback);
                console.log(msgStr + 'Succeeded on windowStatusDidChange ');
                done()
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
                if (err.code == 801) {
                    expect(err.message != null).assertTrue();
                    done()
                } else {
                    expect(err.code).assertEqual(1300002);
                    expect(err.message != null).assertTrue();
                    done()
                }
            }
        })
        /**
         * @tc.name   testOnuiExtensionLimitChange_DestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_static_0100
         * @tc.desc   testOnuiExtensionLimitChange_DestoryedSubWindow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testOnuiExtensionLimitChange_DestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testOnuiExtensionLimitChange_DestoryedSubWindow_static';
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testOnuiExtensionLimitChange_DestoryedSubWindow_static');
            await subWindowClass.destroyWindow();
            try {
                const callback = (data: boolean) => { };
                subWindowClass.onUiExtensionSecureLimitChange(callback);
                expect(true).assertFail();
                done()
            } catch (error) {
                error = error as BusinessError;
                console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
                if (error.code === 801) {
                    expect(error.message != null).assertTrue();
                    done();
                } else {
                    expect(error.code).assertEqual(1300002);
                    expect(error.message != null).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOffuiExtensionLimitChange_DestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_WINDOW_ON_UIEXTENSION_SECURElIMITCHANGE_ERROECODE_static_0200
         * @tc.desc   testOffuiExtensionLimitChange_DestoryedSubWindow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testOffuiExtensionLimitChange_DestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'testOffuiExtensionLimitChange_DestoryedSubWindow_static';
            let subWindowClass:window.Window = await windowStage!.createSubWindow('testOffuiExtensionLimitChange_DestoryedSubWindow_static');
            await subWindowClass.destroyWindow();
            try {
                const callback = (data: boolean) => { };
                subWindowClass.offUiExtensionSecureLimitChange(callback);
                expect(true).assertFail();
                done()
            } catch (error) {
                error = error as BusinessError;
                console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
                if (error.code === 801) {
                    expect(error.message != null).assertTrue();
                    done();
                } else {
                    expect(error.code).assertEqual(1300002);
                    expect(error.message != null).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   test_windowClassLoadContentByName_callback_withstorage_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_static_3880
         * @tc.desc   Test the function of windowClass windowClassLoadContentByName withstorage callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_windowClassLoadContentByName_callback_withstorage_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msg:string = "test_windowClassLoadContentByName_callback_withstorage_static"
            let windowClass: window.Window = windowStage!.getMainWindowSync()
            let storage: LocalStorage = new LocalStorage()
            storage.setOrCreate('storageSimpleProp', 121)
            console.log(msg + ' begin')

            try {
                windowClass.loadContentByName("Index2", storage, (err: BusinessError<void>|null) => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
                        expect(true).assertFail()
                        done()
                    } else {
                        console.info(msg + 'Succeeded in loading the content.');
                        expect(true).assertTrue()
                        done()
                    }

                });
            } catch (exception) {
                console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
                expect(true).assertFail()
                done()
            }
        });

        /**
         * @tc.name   test_windowClassLoadContentByName_callback_withoutstorage_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_static_3890
         * @tc.desc   Test the function of windowClassLoadContentByName withoutstorage callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_windowClassLoadContentByName_callback_withoutstorage_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msg:string = "test_windowClassLoadContentByName_callback_withoutstorage_static"
            let windowClass: window.Window = windowStage!.getMainWindowSync()
            console.log(msg + ' begin')

            try {
                windowClass.loadContentByName("Index2", (err: BusinessError<void>|null) => {
                    const errCode = err!.code;
                    if (errCode) {
                        console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
                        expect(true).assertFail()
                        done()
                    } else {
                        console.info(msg + 'Succeeded in loading the content.');
                        expect(true).assertTrue()
                        done()
                    }
                });

            } catch (exception) {
                console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
                expect(true).assertFail()
                done()
            }
        });


        /**
         * @tc.name   test_windowClassLoadContentByName_Promise_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_static_3900
         * @tc.desc   Test the function of windowClassLoadContentByName Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_windowClassLoadContentByName_Promise_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msg:string = "test_windowClassLoadContentByName_Promise_static"
            let windowClass: window.Window = windowStage!.getMainWindowSync();
            let storage: LocalStorage = new LocalStorage();
            console.log(msg + ' begin')
            try {
                let promise = windowClass.loadContentByName("Index1", storage);
                promise.then(() => {
                    console.info(msg + 'Succeeded in loading the content.');
                    expect(true).assertTrue()
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
                    expect(true).assertFail()
                    done()
                });
            } catch (exception) {
                console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
                expect(true).assertFail()
                done()
            }
        })
        /**
         * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100_static
         * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100_static
         * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100_static ';
            console.log(caseName + 'begin');
            let config: window.Configuration = {
                name: "test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!
            };
            const subWindowClass:window.Window = await window.createWindow(config);
            console.info(`${caseName} Succeeded in creating the dialog window.`);
            try {
                let focusOnshowOptions: window.ShowWindowOptions = {
                    focusOnShow: false
                }
                let promise = subWindowClass.showWindow(focusOnshowOptions);
                promise.then(async () => {
                    console.info(caseName + 'Succeeded in showWindow.');
                    expect(true).assertFail();
                    await subWindowClass.destroyWindow();
                    done()
                }).catch(async (err: Error) => {
                    console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        expect(err.message != null).assertTrue();
                        await subWindowClass.destroyWindow();
                        done()
                    } else {
                        await subWindowClass.destroyWindow();
                        expect(err.code).assertEqual(1300004)
                        expect(err.message != null).assertTrue();
                        done()
                    }
                });
            } catch (e) {
                console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
                await subWindowClass.destroyWindow();
                expect(true).assertFail();
                done()
            }
        });
        /**
         * @tc.name   testStartAbilityAnimationNormal_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWANIMATION_JS_API_static_0150
         * @tc.desc   Test the application by pulling up the fade-in and fade-out animation effects
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testStartAbilityAnimationNormal_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName:string =  'testStartAbilityAnimationNormal_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let wantInfo: Want = {
                bundleName: 'com.example.actswindowtest.static',
                abilityName: 'StartAbility'
                // parameters: {
                //     info:'来自StartTestAbility页面'
                // }
            };
            let animation_param: window.StartAnimationParams = {
                type: window.AnimationType.FADE_IN_OUT
            };
            let windowParam: window.WindowCreateParams = {
                animationParams: animation_param
            };
            // let options: StartOptions = {
            //     windowCreateParams: windowParam
            // };
            try {
                context!.startAbility(wantInfo).then( async() => {
                    console.info(`${msgStr} Succeeded in starting ability.`);
                    await Utils.msSleep(900);
                    await Utils.msSleep(900);
                    await terminateAbility(msgStr);
                    console.info(`${msgStr} terminateSelf end.`);
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    console.error(msgStr + `Failed to starting ability. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done()
                });
            } catch (err) {
                console.error(msgStr + `Failed to starting ability. outcatch Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.name   testGetAllMainWindowInfo_static_0200
         * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_WINDOWINFO_TEST_static_0200
         * @tc.desc   北向getAllMainWindowInfo测试返回值覆盖
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetAllMainWindowInfo_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string =  "testGetAllMainWindowInfo_static_0200";
            console.log(caseName + " begin");
            if (isPCStatus !== '') {
                try {
                    let windowClass:window.Window = windowStage!.getMainWindowSync();
                    let windowId = windowClass.getWindowProperties().id;
                    console.info(caseName + ' windowId: ' + windowId);
                    let windowInfoArray = await window.getAllMainWindowInfo();
                    console.info(caseName + ' windowInfoArray.length: ' + JSON.stringify(windowInfoArray.length));
                    console.info(caseName + ' windowInfoArray: ' + JSON.stringify(windowInfoArray));
                    expect(windowInfoArray.length).assertLargerOrEqual(1);
                    for (let i = 0; i < windowInfoArray.length; i++) {
                        if (windowInfoArray[i].windowId == windowId) {
                            let mainWindowInfo = windowInfoArray[i];
                            console.info(caseName + ' mainWindowInfo: ' + JSON.stringify(mainWindowInfo));
                            console.info(caseName + ' mainWindowInfo windowId: ' + JSON.stringify(mainWindowInfo.windowId));
                            console.info(caseName + ' mainWindowInfo displayId: ' + JSON.stringify(mainWindowInfo.displayId));
                            console.info(caseName + ' mainWindowInfo showing: ' + JSON.stringify(mainWindowInfo.showing));
                            console.info(caseName + ' mainWindowInfo label: ' + JSON.stringify(mainWindowInfo.label));
                            expect(mainWindowInfo.windowId).assertEqual(windowId);
                            expect(mainWindowInfo.displayId).assertEqual(0);
                            expect(mainWindowInfo.showing).assertEqual(true);
                            expect(mainWindowInfo.label).assertEqual('label');
                            done();
                        }
                    }
                } catch (err) {
                    err = err as BusinessError;
                    console.error(caseName + ' failed. Cause: ' + JSON.stringify(err))
                    expect(false).assertTrue();
                    done();
                }
            } else {
                done();
            }
        });
        /**
         * @tc.name   testGetMainWindowSnapsho_statict_0400
         * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_static_0400
         * @tc.desc   北向getMainWindowSnapshot测试windowId入参包含0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetMainWindowSnapsho_statict_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string= "testGetMainWindowSnapsho_statict_0400";
            console.log(caseName + " begin");
            if (isPCStatus !== '') {
                try {
                    let windowClass :window.Window= windowStage!.getMainWindowSync();
                    let windowId:int = windowClass.getWindowProperties().id;
                    console.info(caseName + ' windowId: ' + windowId);
                    let windowIdArray:Array<int> = [0, windowId];
                    let configs: window.WindowSnapshotConfiguration = {
                        useCache: false
                    }
                    await window.getMainWindowSnapshot(windowIdArray, configs)
                    expect(true).assertFail();
                    done()
                } catch (err){
                    err = err as BusinessError;
                    console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
                    if (err.code == 401) {
                        expect(true).assertTrue()
                        done();
                    } else {
                        expect(true).assertFail();
                        done();
                    }
                }
            } else {
                done();
            }
        });


        
        

    })

}