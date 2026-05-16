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
export default function WindowModalTest() {

    describe("WindowModalTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowModalTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
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

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //console.info(`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0900
         * @tc.name        test_setSubWindowModal_ModalityType_enum_static_0100
         * @tc.desc        test_setSubWindowModal_ModalityType_enum
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it("test_setSubWindowModal_ModalityType_enum_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_setSubWindowModal_ModalityType_enum_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            expect(window.ModalityType.WINDOW_MODALITY).assertEqual(0);
            expect(window.ModalityType.APPLICATION_MODALITY).assertEqual(1);
            done();
        })
/**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_static_0300
         * @tc.name      testsetSubWindowModal_Function_Promise3_static
         * @tc.desc      Test the function value of setSubWindowModal
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it("testsetSubWindowModal_Function_Promise3_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testsetSubWindowModal_Function_Promise3_static ";
            hilog.info(domain, tag,msgStr + " begin");
            let wnd:window.Window = windowStage.getMainWindowSync();
            hilog.info(domain, tag,msgStr + ' window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            try {
                wnd.setSubWindowModal(true).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
                    if(err.code == 801){
                        done();
                    }else{
                        expect(err.code).assertEqual(1300004);
                        done();
                    }

                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + ' Failed to setSubWindowModal. Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }

        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_static_0240
         * @tc.name      testSetSubWindowModal_SubWindowDestroy_static
         * @tc.desc      Sets whether the modal properties of the subwindow are enabled
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testSetSubWindowModal_SubWindowDestroy_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetSubWindowModal_SubWindowDestroy_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let subWin:window.Window = await windowStage.createSubWindow('testSetSubWindowModal_SubWindowDestroy_static');
            hilog.info(domain, tag,msgStr + `createSubWindow success.`);
            expect(!!subWin).assertTrue();
            await subWin.destroyWindow();
            try {
                await subWin.setSubWindowModal(false).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        done();
                    } else if(err.code == 1300002){
                        expect(true).assertTrue();
                        done();
                    }else{
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }

        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_static_1100
         * @tc.name      test_setSubWindowModal_MainWindow_1300004_static
         * @tc.desc      test_setSubWindowModal_MainWindow_1300004_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it("test_setSubWindowModal_MainWindow_1300004_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_setSubWindowModal_MainWindow_1300004_static";
            hilog.info(domain, tag,msgStr + "begin");
            let windowClass:window.Window =  windowStage.getMainWindowSync();
            try {
                windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + `Failed to setSubWindowModal. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 1300004) {
                        hilog.info(domain, tag,msgStr + 'The mainWindow not support setSubWindowModal');
                        expect(true).assertTrue();
                        done();
                    } else if(err.code == 801){
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag,msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_static_1000
         * @tc.name      test_setSubWindowModal_subWindow_destory_1300002_static
         * @tc.desc      test_setSubWindowModal_subWindow_destory_1300002_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it("test_setSubWindowModal_subWindow_destory_1300002_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "test_setSubWindowModal_subWindow_destory_1300002_static";
            hilog.info(domain, tag,msgStr + "begin");
            let subWindowClass: window.Window = await windowStage.createSubWindow('test_setSubWindowModal_subWindow_destory_1300002_static');
            hilog.info(domain, tag,msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(subWindowClass));
            try {
                await subWindowClass.destroyWindow();
                await subWindowClass.setSubWindowModal(true, window.ModalityType.WINDOW_MODALITY).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 1300002) {
                        hilog.info(domain, tag,msgStr + 'The SubWindow is destroyed');
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag,msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }


        })
        /**
         * @tc.number    testSetSubWindowModalModalityType_static_0300
         * @tc.name      testSetSubWindowModalModalityType_static_0300
         * @tc.desc      testSetSubWindowModalModalityType_static_0300
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSubWindowModalModalityType_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetSubWindowModalModalityType_static_0300';
            let windowClass:window.Window = windowStage.getMainWindowSync();
            try {
                let promise = windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY);
                promise.then(() => {
                    hilog.info(domain, tag,`${message} setSubWindowModal success`)
                    expect(false).assertTrue();
                }).catch((err: Error) :PromiseLike<void>|undefined => {
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        expect(false).assertFalse()
                        done()
                    } else if (err.code == 1300004) {
                        hilog.error(domain, tag,`${message} Unauthorized operation.`);
                        expect(false).assertFalse()
                        done()
                    } else {
                        hilog.error(domain, tag,`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done()
                    }
                });
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done()
            }


        })

        /**
         * @tc.number     testSetWindowModalPromiseErrCode1300002_static_0100
         * @tc.name       testSetWindowModalPromiseErrCode1300002_static_0100
         * @tc.desc       testSetWindowModalPromiseErrCode1300002_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowModalPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowModalPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context);
            await terminateAbility(caseName);
            try {
                windowStageStart.setWindowModal(false).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling removeStartingWindow.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowModal. Cause: ' + JSON.stringify(err));
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
         * @tc.number     testSetWindowModalPromise_static_0200
         * @tc.name       testSetWindowModalPromise_static_0200
         * @tc.desc       testSetWindowModalPromise_static_0200
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetWindowModalPromise_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowModalPromise_static_0200";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                windowStage.setWindowModal(false).then(() => {
                    hilog.info(domain, tag,msgStr + 'Succeeded in calling setWindowModal.');
                    expect(true).assertTrue();
                    done()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,msgStr + 'Failed to call setWindowModal. Cause: ' + JSON.stringify(err));
                    if(err.code == 801){
                        expect(err.code).assertEqual(801);
                        expect(err.message!=null).assertTrue();
                        done()
                    }else{
                        expect(false).assertTrue();
                        done()
                    }

                });

            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
                expect(false).assertTrue();
                done()
            }
        })






    })

}