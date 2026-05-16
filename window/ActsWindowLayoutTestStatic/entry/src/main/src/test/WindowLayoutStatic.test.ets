/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import common from '@ohos.app.ability.common';
import type { AsyncCallback, Callback } from '@ohos.base'
import { AppStorage } from '@ohos.arkui.stateManagement';
import deviceInfo from '@ohos.deviceInfo';
import {Driver,ON} from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'WindowLayoutStaticTest';


export default function WindowLayoutStaticTest() {
    describe("WindowLayoutStaticTest", (): void => {
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let deviceType:string = deviceInfo.deviceType;
        hilog.info(domain, tag, `deviceType: ${deviceType}`);
        let driver: Driver;
        let isFreeWindowMode:boolean = false;

        beforeAll(() => {
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            } catch (e) {
                hilog.info(domain, tag, 'getANI fail = ' + JSON.stringify(e));
            }
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isFreeWindowMode == true 自由窗口模式
            //isFreeWindowMode == false 非自由窗口模式
            console.info(`brforeAll isFreeWindowMode: ${isFreeWindowMode}`);
        })

        /**
         * @tc.number   SUB_WINDOW_getWindowStatus_004
         * @tc.name testGetWindowStatus_allStatus_static_003
         * @tc.desc   Test the function value of GetWindowStatu
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowStatus_allStatus_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done: () => void): Promise<void> => {
                let caseName: string = 'testGetWindowStatus_allStatus_static_003';
                let driver = Driver.create();
                if (deviceType === '2in1') {
                    try {
                        let windowClass: window.Window = windowStage!.getMainWindowSync()
                        await Utils.msSleep(1000);
                        let windowStatus: window.WindowStatusType = windowClass.getWindowStatus()
                        if(windowStatus !== window.WindowStatusType.FLOATING){
                            await windowClass.recover();
                        }
                        hilog.info(domain, tag, caseName + `windowStatus1: ${windowStatus}`);
                        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
                        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
                        await Utils.msSleep(1000)
                        let titlePoint = await title!.getBounds()
                        driver.drag((titlePoint.left + 300)as int, (titlePoint.top + 45) as int, 0, (titlePoint.top + 45) as int, 10000)
                        await Utils.msSleep(2000)
                        windowStatus = windowClass.getWindowStatus()
                        hilog.info(domain, tag, caseName + `windowStatus2: ${windowStatus}`);
                        await Utils.msSleep(1000)
                        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
                        await windowClass.recover()
                        hilog.info(domain, tag, caseName + 'Succeeded in recovering the window.');
                        await Utils.msSleep(1000)
                        await windowClass.maximize()
                        hilog.info(domain, tag, caseName + 'Succeeded in maximizing the window.');
                        await Utils.msSleep(1000)
                        windowStatus = windowClass.getWindowStatus();
                        hilog.info(domain, tag, caseName + `windowStatus3: ${windowStatus}`);
                        await Utils.msSleep(1000)
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        await windowClass.recover()
                        hilog.info(domain, tag, caseName + 'Succeeded in recovering the window.');
                        await Utils.msSleep(1000)
                        windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE)
                        hilog.info(domain, tag, caseName + 'Succeeded in maximizing the window.');
                        await Utils.msSleep(1000)
                        windowStatus = windowClass.getWindowStatus();
                        hilog.info(domain, tag, caseName + ` windowStatus4: ${windowStatus}`);
                        await Utils.msSleep(1000)
                        expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
                        await windowClass.recover()
                        hilog.info(domain, tag, caseName + 'Succeeded in recovering the window.');
                        await windowClass.minimize()
                        hilog.info(domain, tag, caseName + 'Succeeded in minimizing the window.');
                        await Utils.msSleep(1000)
                        windowStatus = windowClass.getWindowStatus();
                        hilog.info(domain, tag, caseName + `windowStatus5: ${windowStatus}`);
                        await Utils.msSleep(1000)
                        expect(windowStatus).assertEqual(window.WindowStatusType.MINIMIZE);
                        await windowClass.restore()
                        hilog.info(domain, tag, caseName + 'Succeeded in restoring the window.');
                        done();
                    } catch (exception) {
                        hilog.error(domain, tag, caseName +
                            `Failed to obtain the window status of window. Cause code: ${exception.code}, message: ${exception.message}`);
                        if (exception.code === 801) {
                            expect(exception!.code).assertEqual(801);
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    }
                } else {
                    hilog.info(domain, tag, caseName + `not support`);
                    done()
                }
            })

        
        // todo SetFollowParentWindowLayoutEnabled
        /**
         * @tc.number      SUB_WINDOW_setFollowParentWindowLayoutEnabled_001
         * @tc.name        testSetFollowParentWindowLayoutEnabled_True_SubWindow_static_001
         * @tc.desc        setFollowParentWindowLayoutEnabled true test.
         * @tc.size        MediumMediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentWindowLayoutEnabled_True_SubWindow_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentWindowLayoutEnabled_True_SubWindow_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setFollowParentWindowLayoutEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting follow parent window layout enabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setFollowParentWindowLayoutEnabled_002
         * @tc.name        testSetFollowParentWindowLayoutEnabled_False_SubWindow_static_002
         * @tc.desc        setFollowParentWindowLayoutEnabled false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentWindowLayoutEnabled_False_SubWindow_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentWindowLayoutEnabled_False_SubWindow_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setFollowParentWindowLayoutEnabled(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting follow parent window layout disabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setFollowParentWindowLayoutEnabled_003
         * @tc.name        testSetFollowParentWindowLayoutEnabled_ErrorCode1300002_static_003
         * @tc.desc        setFollowParentWindowLayoutEnabled 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentWindowLayoutEnabled_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentWindowLayoutEnabled_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.setFollowParentWindowLayoutEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo SetRelativePositionToParentWindowEnabled
        /**
         * @tc.number      SUB_WINDOW_setRelativePositionToParentWindowEnabled_001
         * @tc.name        testSetRelativePositionToParentWindowEnabled_True_WithAnchor_static_001
         * @tc.desc        setRelativePositionToParentWindowEnabled true with anchor test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetRelativePositionToParentWindowEnabled_True_WithAnchor_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetRelativePositionToParentWindowEnabled_True_WithAnchor_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow('SetRelativePositionToParentWindowEnabled_True_WithAnchor');
                expect(!!subWin).assertTrue();
                await subWin.setRelativePositionToParentWindowEnabled(true,window.WindowAnchor.TOP_START,100,100).then(() => {
                // await subWin.setRelativePositionToParentWindowEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting relative position to parent window enabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setRelativePositionToParentWindowEnabled_002
         * @tc.name        testSetRelativePositionToParentWindowEnabled_False_static_002
         * @tc.desc        setRelativePositionToParentWindowEnabled false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetRelativePositionToParentWindowEnabled_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetRelativePositionToParentWindowEnabled_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setRelativePositionToParentWindowEnabled(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting relative position to parent window disabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setRelativePositionToParentWindowEnabled_003
         * @tc.name        testSetRelativePositionToParentWindowEnabled_ErrorCode1300002_static_003
         * @tc.desc        setRelativePositionToParentWindowEnabled 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetRelativePositionToParentWindowEnabled_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetRelativePositionToParentWindowEnabled_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.setRelativePositionToParentWindowEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setRelativePositionToParentWindowEnabled_004
         * @tc.name        testSetRelativePositionToParentWindowEnabled_ErrorCode1300004_static_004
         * @tc.desc        setRelativePositionToParentWindowEnabled 1300004 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetRelativePositionToParentWindowEnabled_ErrorCode1300004_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetRelativePositionToParentWindowEnabled_ErrorCode1300004_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setRelativePositionToParentWindowEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300004) {
                        hilog.info(domain, tag, msgStr + 'Unauthorized operation as expected.');
                        expect(err!.code).assertEqual(1300004);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300004) {
                    hilog.info(domain, tag, msgStr + 'Unauthorized operation as expected.');
                    expect(exception!.code).assertEqual(1300004);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo getGlobalRect

        /**
         * @tc.number      SUB_WINDOW_getGlobalRect_001
         * @tc.name        testGetGlobalRect_Normal_static_001
         * @tc.desc        getGlobalRect normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetGlobalRect_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetGlobalRect_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let rect: window.Rect = mainWindow.getGlobalRect();
                hilog.info(domain, tag, msgStr + `Succeeded in getting global rect: ${JSON.stringify(rect)}`);
                expect(rect.left != null).assertTrue();
                expect(rect.top != null).assertTrue();
                expect(rect.width).assertLarger(0);
                expect(rect.height).assertLarger(0);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        /**
         * @tc.number      SUB_WINDOW_getGlobalRect_003
         * @tc.name        testGetGlobalRect_ErrorCode1300002_static_003
         * @tc.desc        getGlobalRect 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetGlobalRect_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetGlobalRect_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                let rect: window.Rect = subWin.getGlobalRect();
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo setGestureBackEnabled
        /**
         * @tc.number      SUB_WINDOW_setGestureBackEnabled_001
         * @tc.name        testSetGestureBackEnabled_True_static_001
         * @tc.desc        setGestureBackEnabled true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetGestureBackEnabled_True_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetGestureBackEnabled_True_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setGestureBackEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting gesture back enabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setGestureBackEnabled_002
         * @tc.name        testSetGestureBackEnabled_False_static_002
         * @tc.desc        setGestureBackEnabled false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetGestureBackEnabled_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetGestureBackEnabled_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setGestureBackEnabled(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting gesture back disabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setGestureBackEnabled_003
         * @tc.name        testSetGestureBackEnabled_ErrorCode1300002_static_003
         * @tc.desc        setGestureBackEnabled 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetGestureBackEnabled_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetGestureBackEnabled_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.setGestureBackEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setGestureBackEnabled_004
         * @tc.name        testSetGestureBackEnabled_ErrorCode1300004_static_004
         * @tc.desc        setGestureBackEnabled 1300004 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetGestureBackEnabled_ErrorCode1300004_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetGestureBackEnabled_ErrorCode1300004_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setGestureBackEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300004) {
                        hilog.info(domain, tag, msgStr + 'Unauthorized operation as expected.');
                        expect(err!.code).assertEqual(1300004);
                        subWin.destroyWindow();
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300004) {
                    hilog.info(domain, tag, msgStr + 'Unauthorized operation as expected.');
                    expect(exception!.code).assertEqual(1300004);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo onWindowSizeChange
        /**
         * @tc.number      SUB_WINDOW_onWindowSizeChange_001
         * @tc.name        testOnWindowSizeChange_Register_static_001
         * @tc.desc        onWindowSizeChange register test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowSizeChange_Register_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowSizeChange_Register_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.Size> = (data: window.Size) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window size change callback. Data: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowSizeChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in registering window size change callback.');
                mainWindow.offWindowSizeChange(callback);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onWindowSizeChange_002
         * @tc.name        testOnWindowSizeChange_Trigger_static_002
         * @tc.desc        onWindowSizeChange trigger test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowSizeChange_Trigger_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowSizeChange_Trigger_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();
                await Utils.msSleep(300);
                
                let callbackTriggered: boolean = false;
                const callback: Callback<window.Size> = (data: window.Size) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window size change callback. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertLarger(0);
                    expect(data.height).assertLarger(0);
                    callbackTriggered = true;
                };
                
                subWin.onWindowSizeChange(callback);
                await subWin.resize(500, 500);
                await Utils.msSleep(300);
                
                subWin.offWindowSizeChange(callback);
                subWin.destroyWindow();
                
                if (callbackTriggered) {
                    hilog.info(domain, tag, msgStr + 'Callback triggered successfully.');
                    expect(callbackTriggered).assertTrue();
                    done();
                }
                else {
                    hilog.info(domain, tag, msgStr + 'Callback not triggered, window size change may not be supported.');
                    done();
                }
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        // todo offWindowSizeChange
        /**
         * @tc.number      SUB_WINDOW_offWindowSizeChange_001
         * @tc.name        testOffWindowSizeChange_WithCallback_static_001
         * @tc.desc        offWindowSizeChange with callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowSizeChange_WithCallback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowSizeChange_WithCallback_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.Size> = (data: window.Size) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowSizeChange(callback);
                mainWindow.offWindowSizeChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering window size change callback.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_offWindowSizeChange_002
         * @tc.name        testOffWindowSizeChange_All_static_002
         * @tc.desc        offWindowSizeChange all test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowSizeChange_All_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowSizeChange_All_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback1: Callback<window.Size> = (data: window.Size) => {
                    hilog.info(domain, tag, msgStr + `Callback1: ${JSON.stringify(data)}`);
                };
                const callback2: Callback<window.Size> = (data: window.Size) => {
                    hilog.info(domain, tag, msgStr + `Callback2: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowSizeChange(callback1);
                mainWindow.onWindowSizeChange(callback2);
                mainWindow.offWindowSizeChange();
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering all window size change callbacks.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        // todo onWindowStatusChange
        /**
         * @tc.number      SUB_WINDOW_onWindowStatusChange_001
         * @tc.name        testOnWindowStatusChange_Register_static_001
         * @tc.desc        onWindowStatusChange register test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowStatusChange_Register_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowStatusChange_Register_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window status change callback. Data: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowStatusChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in registering window status change callback.');
                mainWindow.offWindowStatusChange(callback);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo onWindowStatusDidChange
        /**
         * @tc.number      SUB_WINDOW_onWindowStatusDidChange_001
         * @tc.name        testOnWindowStatusDidChange_Register_static_001
         * @tc.desc        onWindowStatusDidChange register test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowStatusDidChange_Register_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowStatusDidChange_Register_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window status did change callback. Data: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowStatusDidChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in registering window status did change callback.');
                mainWindow.offWindowStatusDidChange(callback);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onWindowStatusDidChange_002
         * @tc.name        testOnWindowStatusDidChange_ErrorCode1300002_static_002
         * @tc.desc        onWindowStatusDidChange 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowStatusDidChange_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowStatusDidChange_ErrorCode1300002_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                const callback: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                subWin.onWindowStatusDidChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onWindowStatusDidChange_004
         * @tc.name        testOnWindowStatusDidChange_Trigger_static_004
         * @tc.desc        onWindowStatusChange trigger test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowStatusDidChange_Trigger_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowStatusDidChange_Trigger_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();
                await Utils.msSleep(1000);

                let callbackTriggered: boolean = false;
                const callback: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window status change callback. Data: ${JSON.stringify(data)}`);
                    callbackTriggered = true;
                };

                subWin.onWindowStatusDidChange(callback);
                await subWin.minimize().then(()=>{
                    hilog.info(domain, tag, msgStr + `Window minimized successfully.`);
                }).catch((err: Error): PromiseLike<void> | undefined =>{
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed` + `. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
                await Utils.msSleep(1000);

                subWin.offWindowStatusDidChange(callback);
                subWin.destroyWindow();

                if (callbackTriggered) {
                    hilog.info(domain, tag, msgStr + 'Callback triggered successfully.');
                    expect(callbackTriggered).assertTrue();
                    done();
                } else {
                    hilog.info(domain, tag, msgStr + 'Callback not triggered, window status change may not be supported.');
                    done();
                }
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed` + `. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo offWindowStatusDidChange
        /**
         * @tc.number      SUB_WINDOW_offWindowStatusDidChange_001
         * @tc.name        testOffWindowStatusDidChange_WithCallback_static_001
         * @tc.desc        offWindowStatusDidChange with callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowStatusDidChange_WithCallback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowStatusDidChange_WithCallback_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowStatusDidChange(callback);
                mainWindow.offWindowStatusDidChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering window status did change callback.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_offWindowStatusDidChange_002
         * @tc.name        testOffWindowStatusDidChange_All_static_002
         * @tc.desc        offWindowStatusDidChange all test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowStatusDidChange_All_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowStatusDidChange_All_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback1: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Callback1: ${JSON.stringify(data)}`);
                };
                const callback2: Callback<window.WindowStatusType> = (data: window.WindowStatusType) => {
                    hilog.info(domain, tag, msgStr + `Callback2: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowStatusDidChange(callback1);
                mainWindow.onWindowStatusDidChange(callback2);
                mainWindow.offWindowStatusDidChange();
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering all window status did change callbacks.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo minimize
        /**
         * @tc.number      SUB_WINDOW_IMMERSIVE_minimize_Callback_0100
         * @tc.name        testMinimize_Callback_SubWindow_static_001
         * @tc.desc        minimize callback main window test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMinimize_Callback_SubWindow_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMinimize_Callback_SubWindow_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();
                await Utils.msSleep(1000);
                subWin.minimize(async(err: BusinessError<void> | null): void => {
                    if (err!.code) {
                        err === err as BusinessError;
                        if (err!.code === 801) {
                            hilog.info(domain, tag, msgStr + 'Capability not supported.');
                            await subWin.destroyWindow();
                            expect(err!.code).assertEqual(801);
                            done();
                        } else {
                            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                            await subWin.destroyWindow();
                            expect(false).assertTrue();
                            done();
                        }
                    }
                    hilog.info(domain, tag, msgStr + 'Succeeded in minimizing window.');
                    await subWin.destroyWindow();
                    done();
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_minimize_Callback_002
         * @tc.name        testMinimize_Callback_ErrorCode1300002_static_002
         * @tc.desc        minimize callback 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMinimize_Callback_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMinimize_Callback_ErrorCode1300002_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                subWin.minimize((err: BusinessError<void> | null): void => {
                    if (err!.code) {
                        err === err as BusinessError;
                        if (err!.code === 1300002) {
                            hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                            expect(err!.code).assertEqual(1300002);
                            done();
                        } else if (err!.code === 801) {
                            hilog.info(domain, tag, msgStr + 'Capability not supported.');
                            expect(err!.code).assertEqual(801);
                            done();
                        } else {
                            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                            expect(false).assertTrue();
                            done();
                        }
                    }else{
                        hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_IMMERSIVE_minimize_Promise_0100
         * @tc.name        testMinimize_Promise_SubWindow_static_001
         * @tc.desc        minimize promise main window test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMinimize_Promise_SubWindow_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMinimize_Promise_SubWindow_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();
                await Utils.msSleep(1000);
                subWin.minimize().then(async() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in minimizing window.');
                    await subWin.destroyWindow();
                    done();
                }).catch(async(err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        await subWin.destroyWindow();
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        await subWin.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_minimize_Promise_002
         * @tc.name        testMinimize_Promise_ErrorCode1300002_static_002
         * @tc.desc        minimize promise 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMinimize_Promise_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMinimize_Promise_ErrorCode1300002_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                subWin.minimize().then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo maximize
        /**
         * @tc.number      SUB_WINDOW_maximize_OneParam_001
         * @tc.name        testMaximize_OneParam_Default_static_001
         * @tc.desc        maximize one param default test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_OneParam_Default_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_OneParam_Default_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let windowStatus_before: window.WindowStatusType = mainWindow.getWindowStatus()
                hilog.info(domain, tag, caseName + `windowStatus_before: ${windowStatus_before}`);
                mainWindow.maximize().then(async ()=> {
                    hilog.info(domain, tag, msgStr + 'Succeeded in maximizing window.');
                    await Utils.msSleep(1500)
                    let windowStatus: window.WindowStatusType = mainWindow.getWindowStatus()
                    hilog.info(domain, tag, caseName + `windowStatus: ${windowStatus}`);
                    if(isFreeWindowMode){
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        await mainWindow.recover();
                        hilog.info(domain, tag, msgStr + 'Succeeded in recover window.');
                        done();
                    }else{
                        expect(windowStatus).assertEqual(windowStatus_before);
                        done()
                    }
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_OneParam_002
         * @tc.name        testMaximize_OneParam_WithPresentation_static_002
         * @tc.desc        maximize one param with presentation test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_OneParam_WithPresentation_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_OneParam_WithPresentation_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let windowStatus_before: window.WindowStatusType = mainWindow.getWindowStatus()
                hilog.info(domain, tag, caseName + `windowStatus_before: ${windowStatus_before}`);
                mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE).then(async() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in maximizing window.');
                     await Utils.msSleep(1500)
                    let windowStatus: window.WindowStatusType = mainWindow.getWindowStatus()
                    hilog.info(domain, tag, caseName + `windowStatus: ${windowStatus}`);
                    if(isFreeWindowMode){
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        await mainWindow.recover();
                        hilog.info(domain, tag, msgStr + 'Succeeded in recover window.');
                        done();
                    }else{
                        expect(windowStatus).assertEqual(windowStatus_before);
                        done()
                    }
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_OneParam_003
         * @tc.name        testMaximize_OneParam_WithPresentation_static_003
         * @tc.desc        maximize one param with presentation test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_OneParam_WithPresentation_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_OneParam_WithPresentation_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
                try {
                    let mainWindow: window.Window = windowStage!.getMainWindowSync();
                    let windowStatus_before: window.WindowStatusType = mainWindow.getWindowStatus()
                    hilog.info(domain, tag, caseName + `windowStatus_before: ${windowStatus_before}`);
                    mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(async() => {
                        hilog.info(domain, tag, msgStr + 'Succeeded in maximizing window.');
                         await Utils.msSleep(1500)
                        let windowStatus: window.WindowStatusType = mainWindow.getWindowStatus()
                        hilog.info(domain, tag, caseName + `windowStatus: ${windowStatus}`);
                        if(isFreeWindowMode){
                            expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
                            await mainWindow.recover();
                            hilog.info(domain, tag, msgStr + 'Succeeded in recover window.');
                            done();
                        }else{
                            expect(windowStatus).assertEqual(windowStatus_before);
                            done()
                        }
                    }).catch((err: Error): PromiseLike<void> | undefined => {
                        err === err as BusinessError;
                        if (err!.code === 801) {
                            hilog.info(domain, tag, msgStr + 'Capability not supported.');
                            expect(err!.code).assertEqual(801);
                            done();
                        } else {
                            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                            expect(false).assertTrue();
                            done();  
                        }
                    });
                } catch (exception) {
                    exception === exception as BusinessError;
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
        })



        /**
         * @tc.number      SUB_WINDOW_maximize_OneParam_004
         * @tc.name        testMaximize_OneParam_ErrorCode1300002_static_004
         * @tc.desc        maximize one param 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_OneParam_ErrorCode1300002_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_OneParam_ErrorCode1300002_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.maximize().then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_OneParam_005
         * @tc.name        testMaximize_OneParam_ErrorCode1300004_static_005
         * @tc.desc        maximize one param 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_OneParam_ErrorCode1300004_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_OneParam_ErrorCode1300004_static_005';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.maximize().then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300004) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300004);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300004) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300004);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_TwoParams_001
         * @tc.name        testMaximize_TwoParams_Both_static_001
         * @tc.desc        maximize two params both test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_TwoParams_Both_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_TwoParams_Both_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let windowStatus_before: window.WindowStatusType = mainWindow.getWindowStatus()
                hilog.info(domain, tag, caseName + `windowStatus_before: ${windowStatus_before}`);
                mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, true).then(async() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in maximizing window.');
                    await Utils.msSleep(1500)
                    let windowStatus: window.WindowStatusType = mainWindow.getWindowStatus()
                    hilog.info(domain, tag, caseName + `windowStatus: ${windowStatus}`);
                    if(isFreeWindowMode){
                        await mainWindow.recover();
                        hilog.info(domain, tag, msgStr + 'Succeeded in recover window.');
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        done();
                    }else{
                        expect(windowStatus).assertEqual(windowStatus_before);
                        done()
                    }
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_TwoParams_002
         * @tc.name        testMaximize_TwoParams_Both_static_002
         * @tc.desc        maximize two params only acrossDisplay test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_TwoParams_Both_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_TwoParams_Both_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
                try {
                    let mainWindow: window.Window = windowStage!.getMainWindowSync();
                    let windowStatus_before: window.WindowStatusType = mainWindow.getWindowStatus()
                    hilog.info(domain, tag, caseName + `windowStatus_before: ${windowStatus_before}`);
                    await mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING, false).then(async() => {
                        hilog.info(domain, tag, msgStr + 'Succeeded in maximizing window.');
                        await Utils.msSleep(1500)
                        let windowStatus: window.WindowStatusType = mainWindow.getWindowStatus()
                        hilog.info(domain, tag, caseName + `windowStatus: ${windowStatus}`);
                        if(isFreeWindowMode){
                            await mainWindow.recover();
                            hilog.info(domain, tag, msgStr + 'Succeeded in recover window.');
                            expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
                            done();
                        }else{
                            expect(windowStatus).assertEqual(windowStatus_before);
                            done()
                        }
                    }).catch((err: Error): PromiseLike<void> | undefined => {
                        err === err as BusinessError;
                        if (err!.code === 801) {
                            hilog.info(domain, tag, msgStr + 'Capability not supported.');
                            expect(err!.code).assertEqual(801);
                            done();
                        } else {
                            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } catch (exception) {
                    exception === exception as BusinessError;
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_TwoParams_003
         * @tc.name        testMaximize_TwoParams_ErrorCode1300002_static_003
         * @tc.desc        maximize two params 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_TwoParams_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_TwoParams_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.maximize(window.MaximizePresentation.EXIT_IMMERSIVE, true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_maximize_TwoParams_004
         * @tc.name        testMaximize_TwoParams_ErrorCode1300004_static_004
         * @tc.desc        maximize one param 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testMaximize_TwoParams_ErrorCode1300004_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMaximize_TwoParams_ErrorCode1300004_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER, true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300004) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300004);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err!.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300004) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300004);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo setResizeByDragEnabled
        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_001
         * @tc.name        testSetResizeByDragEnabled_True_Callback_static_001
         * @tc.desc        setResizeByDragEnabled true callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_True_Callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_True_Callback_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                mainWindow.setResizeByDragEnabled(true, (err: BusinessError<void> | null): void => {
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else if (err!.code) {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting resize by drag enabled.');
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_002
         * @tc.name        testSetResizeByDragEnabled_False_Callback_static_002
         * @tc.desc        setResizeByDragEnabled false callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_False_Callback_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_False_Callback_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                mainWindow.setResizeByDragEnabled(false, (err: BusinessError<void> | null): void => {
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else if (err!.code) {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting resize by drag disabled.');
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_003
         * @tc.name        testSetResizeByDragEnabled_True_Promise_static_003
         * @tc.desc        setResizeByDragEnabled true promise test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_True_Promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_True_Promise_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setResizeByDragEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting resize by drag enabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_004
         * @tc.name        testSetResizeByDragEnabled_False_Promise_static_004
         * @tc.desc        setResizeByDragEnabled false promise test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_False_Promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_False_Promise_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                await mainWindow.setResizeByDragEnabled(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting resize by drag disabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_005
         * @tc.name        testSetResizeByDragEnabled_ErrorCode1300002_static_005
         * @tc.desc        setResizeByDragEnabled 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_ErrorCode1300002_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_ErrorCode1300002_static_005';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.setResizeByDragEnabled(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected1.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setResizeByDragEnabled_006
         * @tc.name        testSetResizeByDragEnabled_ErrorCode1300002_static_006
         * @tc.desc        setResizeByDragEnabled true callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetResizeByDragEnabled_ErrorCode1300002_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetResizeByDragEnabled_ErrorCode1300002_static_006';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                subWin.setResizeByDragEnabled(true, (err: BusinessError<void> | null): void => {
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code) {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting resize by drag enabled.');
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected1.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo setWindowTitleMoveEnabled
        /**
         * @tc.number      SUB_WINDOW_setWindowTitleMoveEnabled_001
         * @tc.name        testSetWindowTitleMoveEnabled_True_static_001
         * @tc.desc        setWindowTitleMoveEnabled true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowTitleMoveEnabled_True_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowTitleMoveEnabled_True_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            try {
                mainWindow.setWindowTitleMoveEnabled(true);
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window title move enabled.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowTitleMoveEnabled_002
         * @tc.name        testSetWindowTitleMoveEnabled_False_static_002
         * @tc.desc        setWindowTitleMoveEnabled false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowTitleMoveEnabled_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowTitleMoveEnabled_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            try {
                mainWindow.setWindowTitleMoveEnabled(false);
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window title move disabled.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        /**
         * @tc.number      SUB_WINDOW_setWindowTitleMoveEnabled_003
         * @tc.name        testSetWindowTitleMoveEnabled_ErrorCode1300002_static_003
         * @tc.desc        setWindowTitleMoveEnabled 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowTitleMoveEnabled_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowTitleMoveEnabled_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                subWin.setWindowTitleMoveEnabled(true);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo enableDrag
        /**
         * @tc.number      SUB_WINDOW_enableDrag_001
         * @tc.name        testEnableDrag_True_static_001
         * @tc.desc        enableDrag true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testEnableDrag_True_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testEnableDrag_True_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.enableDrag(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in enabling drag.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_enableDrag_002
         * @tc.name        testEnableDrag_False_static_002
         * @tc.desc        enableDrag false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testEnableDrag_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testEnableDrag_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.enableDrag(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in disabling drag.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })


        /**
         * @tc.number      SUB_WINDOW_enableDrag_003
         * @tc.name        testEnableDrag_ErrorCode1300002_static_003
         * @tc.desc        enableDrag 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testEnableDrag_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testEnableDrag_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.enableDrag(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo onWindowRectChange
        /**
         * @tc.number      SUB_WINDOW_onWindowRectChange_001
         * @tc.name        testOnWindowRectChange_Register_static_001
         * @tc.desc        onWindowRectChange register test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowRectChange_Register_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowRectChange_Register_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window rect change callback. Data: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowRectChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in registering window rect change callback.');
                mainWindow.offWindowRectChange(callback);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onWindowRectChange_002
         * @tc.name        testOnWindowRectChange_Trigger_static_002
         * @tc.desc        onWindowRectChange trigger test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowRectChange_Trigger_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowRectChange_Trigger_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                // await subWin.showWindow();
                await Utils.msSleep(300);

                let callbackTriggered: boolean = false;
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in window rect change callback. Data: ${JSON.stringify(data)}`);
                    expect(data.rect.left != null).assertTrue();
                    expect(data.rect.top != null).assertTrue();
                    expect(data.rect.width != null).assertTrue();
                    expect(data.rect.height != null).assertTrue();
                    expect(data.reason != null).assertTrue();
                    callbackTriggered = true;
                };

                subWin.onWindowRectChange(callback);
                await subWin.resize(500, 500);
                await Utils.msSleep(300);

                subWin.offWindowRectChange(callback);
                subWin.destroyWindow();

                if (callbackTriggered) {
                    hilog.info(domain, tag, msgStr + 'Callback triggered successfully.');
                    expect(callbackTriggered).assertTrue();
                    done();
                }
                else {
                    hilog.info(domain, tag, msgStr + 'Callback not triggered, window rect change may not be supported.');
                    done();
                }
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onWindowRectChange_003
         * @tc.name        testOnWindowRectChange_ErrorCode1300002_static_003
         * @tc.desc        onWindowRectChange 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnWindowRectChange_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnWindowRectChange_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                subWin.onWindowRectChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        //todo offWindowRectChange
        /**
         * @tc.number      SUB_WINDOW_offWindowRectChange_001
         * @tc.name        testOffWindowRectChange_WithCallback_static_001
         * @tc.desc        offWindowRectChange with callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowRectChange_WithCallback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowRectChange_WithCallback_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowRectChange(callback);
                mainWindow.offWindowRectChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering window rect change callback.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_offWindowRectChange_002
         * @tc.name        testOffWindowRectChange_All_static_002
         * @tc.desc        offWindowRectChange all test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowRectChange_All_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowRectChange_All_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback1: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback1: ${JSON.stringify(data)}`);
                };
                const callback2: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback2: ${JSON.stringify(data)}`);
                };
                mainWindow.onWindowRectChange(callback1);
                mainWindow.onWindowRectChange(callback2);
                mainWindow.offWindowRectChange();
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering all window rect change callbacks.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo onRectChangeInGlobalDisplay
        /**
         * @tc.number      SUB_WINDOW_onRectChangeInGlobalDisplay_001
         * @tc.name        testOnRectChangeInGlobalDisplay_Register_static_001
         * @tc.desc        onRectChangeInGlobalDisplay register test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnRectChangeInGlobalDisplay_Register_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnRectChangeInGlobalDisplay_Register_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in rect change in global display callback. Data: ${JSON.stringify(data)}`);
                };
                mainWindow.onRectChangeInGlobalDisplay(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in registering rect change in global display callback.');
                mainWindow.offRectChangeInGlobalDisplay(callback);
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onRectChangeInGlobalDisplay_002
         * @tc.name        testOnRectChangeInGlobalDisplay_Trigger_static_002
         * @tc.desc        onRectChangeInGlobalDisplay trigger test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnRectChangeInGlobalDisplay_Trigger_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnRectChangeInGlobalDisplay_Trigger_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setUIContent('pages/index2');
                // await subWin.showWindow();
                await Utils.msSleep(1000);

                let callbackTriggered: boolean = false;
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in rect change in global display callback. Data: ${JSON.stringify(data)}`);
                    expect(data.rect.left != null).assertTrue();
                    expect(data.rect.top != null).assertTrue();
                    expect(data.rect.width != null).assertTrue();
                    expect(data.rect.height != null).assertTrue();
                    expect(data.reason != null).assertTrue();
                    callbackTriggered = true;
                };

                subWin.onRectChangeInGlobalDisplay(callback);
                await subWin.resize(500, 500);
                await Utils.msSleep(1000);

                subWin.offRectChangeInGlobalDisplay(callback);
                subWin.destroyWindow();

                if (callbackTriggered) {
                    hilog.info(domain, tag, msgStr + 'Callback triggered successfully.');
                    expect(callbackTriggered).assertTrue();
                    done();
                }
                else {
                    hilog.info(domain, tag, msgStr + 'Callback not triggered, rect change in global display may not be supported.');
                    done();
                }
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_onRectChangeInGlobalDisplay_003
         * @tc.name        testOnRectChangeInGlobalDisplay_ErrorCode1300002_static_003
         * @tc.desc        onRectChangeInGlobalDisplay 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnRectChangeInGlobalDisplay_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnRectChangeInGlobalDisplay_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                subWin.onRectChangeInGlobalDisplay(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo offRectChangeInGlobalDisplay
        /**
         * @tc.number      SUB_WINDOW_offRectChangeInGlobalDisplay_001
         * @tc.name        testOffRectChangeInGlobalDisplay_WithCallback_static_001
         * @tc.desc        offRectChangeInGlobalDisplay with callback test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffRectChangeInGlobalDisplay_WithCallback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffRectChangeInGlobalDisplay_WithCallback_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                mainWindow.onRectChangeInGlobalDisplay(callback);
                mainWindow.offRectChangeInGlobalDisplay(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering rect change in global display callback.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_offRectChangeInGlobalDisplay_002
         * @tc.name        testOffRectChangeInGlobalDisplay_All_static_002
         * @tc.desc        offRectChangeInGlobalDisplay all test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffRectChangeInGlobalDisplay_All_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffRectChangeInGlobalDisplay_All_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                const callback1: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback1: ${JSON.stringify(data)}`);
                };
                const callback2: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback2: ${JSON.stringify(data)}`);
                };
                mainWindow.onRectChangeInGlobalDisplay(callback1);
                mainWindow.onRectChangeInGlobalDisplay(callback2);
                mainWindow.offRectChangeInGlobalDisplay();
                hilog.info(domain, tag, msgStr + 'Succeeded in unregistering all rect change in global display callbacks.');
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        //todo clientToGlobalDisplay
        /**
         * @tc.number      SUB_WINDOW_clientToGlobalDisplay_001
         * @tc.name        testClientToGlobalDisplay_Normal_static_001
         * @tc.desc        clientToGlobalDisplay normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testClientToGlobalDisplay_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClientToGlobalDisplay_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.clientToGlobalDisplay(100, 100);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_clientToGlobalDisplay_002
         * @tc.name        testClientToGlobalDisplay_Boundary_static_002
         * @tc.desc        clientToGlobalDisplay boundary test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testClientToGlobalDisplay_Boundary_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClientToGlobalDisplay_Boundary_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.clientToGlobalDisplay(0, 0);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_clientToGlobalDisplay_003
         * @tc.name        testClientToGlobalDisplay_Negative_static_003
         * @tc.desc        clientToGlobalDisplay negative test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testClientToGlobalDisplay_Negative_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClientToGlobalDisplay_Negative_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.clientToGlobalDisplay(-100, -100);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_clientToGlobalDisplay_004
         * @tc.name        testClientToGlobalDisplay_ErrorCode1300002_static_004
         * @tc.desc        clientToGlobalDisplay 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testClientToGlobalDisplay_ErrorCode1300002_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClientToGlobalDisplay_ErrorCode1300002_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                let position: window.Position = subWin.clientToGlobalDisplay(100, 100);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo globalDisplayToClient
        /**
         * @tc.number      SUB_WINDOW_globalDisplayToClient_001
         * @tc.name        testGlobalDisplayToClient_Normal_static_001
         * @tc.desc        globalDisplayToClient normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGlobalDisplayToClient_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGlobalDisplayToClient_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.globalDisplayToClient(100, 100);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_globalDisplayToClient_002
         * @tc.name        testGlobalDisplayToClient_Boundary_static_002
         * @tc.desc        globalDisplayToClient boundary test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGlobalDisplayToClient_Boundary_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGlobalDisplayToClient_Boundary_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.globalDisplayToClient(0, 0);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_globalDisplayToClient_003
         * @tc.name        testGlobalDisplayToClient_Negative_static_003
         * @tc.desc        globalDisplayToClient negative test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGlobalDisplayToClient_Negative_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGlobalDisplayToClient_Negative_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let position: window.Position = mainWindow.globalDisplayToClient(-100, -100);
                hilog.info(domain, tag, msgStr + `Succeeded in converting position. Position: ${JSON.stringify(position)}`);
                expect(position.x != null).assertTrue();
                expect(position.y != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_globalDisplayToClient_004
         * @tc.name        testGlobalDisplayToClient_ErrorCode1300002_static_004
         * @tc.desc        globalDisplayToClient 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGlobalDisplayToClient_ErrorCode1300002_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGlobalDisplayToClient_ErrorCode1300002_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                let position: window.Position = subWin.globalDisplayToClient(100, 100);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })



        // todo getWindowStatus
        /**
         * @tc.number      SUB_WINDOW_getWindowStatus_001
         * @tc.name        testGetWindowStatus_Normal_static_001
         * @tc.desc        getWindowStatus normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowStatus_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowStatus_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let windowStatusType: window.WindowStatusType = mainWindow.getWindowStatus();
                hilog.info(domain, tag, msgStr + `Succeeded in getting window status. Status: ${windowStatusType}`);
                expect(windowStatusType != null).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_WINDOW_getWindowStatus_003
         * @tc.name        testGetWindowStatus_ErrorCode1300002_static_003
         * @tc.desc        getWindowStatus 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testGetWindowStatus_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowStatus_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                let windowStatusType: window.WindowStatusType = subWin.getWindowStatus();
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        // todo setFollowParentMultiScreenPolicy
        /**
         * @tc.number      SUB_WINDOW_setFollowParentMultiScreenPolicy_001
         * @tc.name        testSetFollowParentMultiScreenPolicy_True_static_001
         * @tc.desc        setFollowParentMultiScreenPolicy true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentMultiScreenPolicy_True_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentMultiScreenPolicy_True_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setFollowParentMultiScreenPolicy(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting follow parent multi-screen policy enabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setFollowParentMultiScreenPolicy_002
         * @tc.name        testSetFollowParentMultiScreenPolicy_False_static_002
         * @tc.desc        setFollowParentMultiScreenPolicy false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentMultiScreenPolicy_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentMultiScreenPolicy_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.setFollowParentMultiScreenPolicy(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting follow parent multi-screen policy disabled.');
                    subWin.destroyWindow();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        subWin.destroyWindow();
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        subWin.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })


        /**
         * @tc.number      SUB_WINDOW_setFollowParentMultiScreenPolicy_003
         * @tc.name        testSetFollowParentMultiScreenPolicy_ErrorCode1300002_static_003
         * @tc.desc        setFollowParentMultiScreenPolicy 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetFollowParentMultiScreenPolicy_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetFollowParentMultiScreenPolicy_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                await subWin.setFollowParentMultiScreenPolicy(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected1.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported1.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code1: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })


        // todo removeStartingWindow
        /**
         * @tc.number      SUB_WINDOW_removeStartingWindow_001
         * @tc.name        testRemoveStartingWindow_Normal_static_001
         * @tc.desc        removeStartingWindow normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testRemoveStartingWindow_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testRemoveStartingWindow_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.removeStartingWindow().then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in removing starting window.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_removeStartingWindow_002
         * @tc.name        testRemoveStartingWindow_ErrorCode1300002_static_002
         * @tc.desc        removeStartingWindow 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testRemoveStartingWindow_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testRemoveStartingWindow_ErrorCode1300002_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.removeStartingWindow().then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + `Succeeded. Cause code: ${err!.code}, message: ${err.message}`);
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        // todo setWindowRectAutoSave
        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_001
         * @tc.name        testSetWindowRectAutoSave_True_static_001
         * @tc.desc        setWindowRectAutoSave true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_True_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_True_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting window rect auto-save enabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_2_002
         * @tc.name        testSetWindowRectAutoSave_False_static_002
         * @tc.desc        setWindowRectAutoSave false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_False_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting window rect auto-save disabled.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })


        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_003
         * @tc.name        testSetWindowRectAutoSave_ErrorCode1300002_static_003
         * @tc.desc        setWindowRectAutoSave 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + `Succeeded. Cause code: ${err!.code}, message: ${err.message}`);
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_004
         * @tc.name        testSetWindowRectAutoSave_TrueTrue_static_004
         * @tc.desc        setWindowRectAutoSave true true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_TrueTrue_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_TrueTrue_static_004';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(true, true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting window rect auto-save enabled with flag.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_005
         * @tc.name        testSetWindowRectAutoSave_TrueFalse_static_005
         * @tc.desc        setWindowRectAutoSave true false test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_TrueFalse_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_TrueFalse_static_005';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(true, false).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting window rect auto-save enabled without flag.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_006
         * @tc.name        testSetWindowRectAutoSave_FalseTrue_static_006
         * @tc.desc        setWindowRectAutoSave false true test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_FalseTrue_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_FalseTrue_static_006';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(false, true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting window rect auto-save disabled with flag.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_WINDOW_setWindowRectAutoSave_007
         * @tc.name        testSetWindowRectAutoSave_ErrorCode1300002_2_static_007
         * @tc.desc        setWindowRectAutoSave 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetWindowRectAutoSave_ErrorCode1300002_2_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowRectAutoSave_ErrorCode1300002_2_static_007';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.setWindowRectAutoSave(true, true).then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded.');
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + `Succeeded. Cause code: ${err!.code}, message: ${err.message}`);
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        // todo isWindowRectAutoSave
        /**
         * @tc.number      SUB_WINDOW_isWindowRectAutoSave_001
         * @tc.name        testIsWindowRectAutoSave_Normal_static_001
         * @tc.desc        isWindowRectAutoSave normal test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testIsWindowRectAutoSave_Normal_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsWindowRectAutoSave_Normal_static_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.isWindowRectAutoSave().then((result: boolean) => {
                    hilog.info(domain, tag, msgStr + `Succeeded in getting window rect auto-save. Result: ${result}`);
                    expect(typeof result === 'boolean').assertTrue();
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err!.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })


        /**
         * @tc.number      SUB_WINDOW_isWindowRectAutoSave_002
         * @tc.name        testIsWindowRectAutoSave_ErrorCode1300002_static_002
         * @tc.desc        isWindowRectAutoSave 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testIsWindowRectAutoSave_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsWindowRectAutoSave_ErrorCode1300002_static_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                await windowStage!.isWindowRectAutoSave().then((result: boolean) => {
                    hilog.info(domain, tag, msgStr + `Succeeded. Result: ${result}`);
                    done();
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    err === err as BusinessError;
                    if (err!.code === 1300002) {
                        hilog.info(domain, tag, msgStr + 'Window state abnormal.');
                        expect(err!.code).assertEqual(1300002);
                        done();
                    } else if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported.');
                        expect(err!.code).assertEqual(801);
                        done();
                    } else {
                        hilog.info(domain, tag, msgStr + `Succeeded. Cause code: ${err!.code}, message: ${err.message}`);
                        done();
                    }
                });
            } catch (exception) {
                exception === exception as BusinessError;
                hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        // todo setAspectRatio
        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Promise_Normal_0100
         * @tc.name        testSetAspectRatio_Promise_Normal_0100
         * @tc.desc        Set aspect ratio with Promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetAspectRatio_Promise_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_Promise_Normal_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            await mainWindow.showWindow();
            let ratio = 1.0;
            mainWindow.setAspectRatio(ratio).then(()=>{
                (async () => {
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                await mainWindow.destroyWindow();
                done();
                })().awaitSync()
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await mainWindow.destroyWindow();
                    done();
                } else {
                    await mainWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Callback_Normal_0200
         * @tc.name        testSetAspectRatio_Callback_Normal_0200
         * @tc.desc        Set aspect ratio with Callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetAspectRatio_Callback_Normal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_Callback_Normal_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            try {
                // await mainWindow.showWindow();
                let ratio = 1.5;
                mainWindow.setAspectRatio(ratio, (err: BusinessError<void> | null): void => {
                    if (err!.code) {
                        if (err!.code === 801) {
                            hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                            expect(err!.code).assertEqual(801);
                        } else {
                            hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                            expect(false).assertTrue();
                        }
                        mainWindow.destroyWindow();
                        done();
                        return;
                    }
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                    mainWindow.destroyWindow();
                    done();
                });
            } catch (err) {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                await mainWindow.destroyWindow();
                expect(false).assertTrue();
                done();
            }
        })
        

        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Error1300002_0300
         * @tc.name        testSetAspectRatio_promise_Error1300002_0300
         * @tc.desc        Set aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetAspectRatio_promise_Error1300002_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_promise_Error1300002_0300';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetAspectRatio_promise_Error1300002_0300');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            let ratio = 1.5;
            subWindow.setAspectRatio(ratio).then(()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 1300002) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                } else{
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Error1300002_0400
         * @tc.name        testSetAspectRatio_callback_Error1300002_0400
         * @tc.desc        Set aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetAspectRatio_callback_Error1300002_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_callback_Error1300002_0400';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetAspectRatio_callback_Error1300002_0400');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            let ratio = 1.5;
            subWindow.setAspectRatio(ratio, (err: BusinessError<void> | null): void => {
                if (err!.code) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                        expect(err!.code).assertEqual(801);
                    } else {
                        hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                        expect(err!.code).assertEqual(1300002);
                    }
                    done();
                    return;
                }
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                expect(false).assertTrue();
                done();
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Error1300004_0500
         * @tc.name        testSetAspectRatio_promise_Error1300004_0500
         * @tc.desc        Set aspect ratio with unauthorized operation
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetAspectRatio_promise_Error1300004_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_promise_Error1300004_0500';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetAspectRatio_promise_Error1300004_0500');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let ratio = 1.0;
            subWindow.setAspectRatio(ratio).then(()=>{
                (async () => {
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                expect(false).assertTrue();
                await subWindow.destroyWindow();
                done();
                })().awaitSync()
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 1300004) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300004);
                    await subWindow.destroyWindow();
                    done();
                } else{
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetAspectRatio_Error1300004_0600
         * @tc.name        testSetAspectRatio_callback_Error1300004_0600
         * @tc.desc        Set aspect ratio with unauthorized operation
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetAspectRatio_callback_Error1300004_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetAspectRatio_callback_Error1300004_0600';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetAspectRatio_callback_Error1300004_0600');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let ratio = 1.0;
            subWindow.setAspectRatio(ratio, (err: BusinessError<void> | null): void => {
                (async () => {
                if (err!.code) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    if (err!.code === 801) {
                        hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                        expect(err!.code).assertEqual(801);
                        await subWindow.destroyWindow();
                    } else {
                        hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                        expect(err!.code).assertEqual(1300004);
                        await subWindow.destroyWindow();
                    }
                    done();
                    return;
                }
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                expect(false).assertTrue();
                await subWindow.destroyWindow();
                done();
                })().awaitSync()
            });
        })

        // todo setContentAspectRatio
        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_PersistentTrue_0100
         * @tc.name        testSetContentAspectRatio_PersistentTrue_0100
         * @tc.desc        Set content aspect ratio with persistent true
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetContentAspectRatio_PersistentTrue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_PersistentTrue_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            // await mainWindow.showWindow();
            let ratio = 1.0;
            mainWindow.setContentAspectRatio(ratio, true, true).then(async ()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                await mainWindow.resetAspectRatio().then(()=>{
                    hilog.info(domain, tag, msgStr + 'Succeeded in resetting aspect ratio of window.');
                });
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_PersistentFalse_0200
         * @tc.name        testSetContentAspectRatio_PersistentFalse_0200
         * @tc.desc        Set content aspect ratio with persistent false
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetContentAspectRatio_PersistentFalse_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_PersistentFalse_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            // await mainWindow.showWindow();
            let ratio = 1.0;
            mainWindow.setContentAspectRatio(ratio, false, false).then(async ()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                await mainWindow.resetAspectRatio().then(()=>{
                    hilog.info(domain, tag, msgStr + 'Succeeded in resetting aspect ratio of window.');
                });
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_OnlyRatio_0300
         * @tc.name        testSetContentAspectRatio_OnlyRatio_0300
         * @tc.desc        Set content aspect ratio with only ratio parameter
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetContentAspectRatio_OnlyRatio_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_OnlyRatio_0300';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            // await mainWindow.showWindow();
            let ratio = 1.0;
            mainWindow.setContentAspectRatio(ratio).then(async ()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                await mainWindow.resetAspectRatio().then(()=>{
                    hilog.info(domain, tag, msgStr + 'Succeeded in resetting aspect ratio of window.');
                });
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(false).assertTrue();
                    done();
                }
            });
        })


        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_Error1300002_0400
         * @tc.name        testSetContentAspectRatio_Error1300002_0400
         * @tc.desc        Set content aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetContentAspectRatio_Error1300002_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_Error1300002_0400';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetContentAspectRatio_Error1300002_0400');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            let ratio = 1.0;
            subWindow.setContentAspectRatio(ratio).then(()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_Error1300004_0500
         * @tc.name        testSetContentAspectRatio_Error1300004_0500
         * @tc.desc        Set content aspect ratio with unauthorized operation
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetContentAspectRatio_Error1300004_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_Error1300004_0500';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetContentAspectRatio_Error1300004_0500');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let ratio = 1.0;
            subWindow.setContentAspectRatio(ratio).then(async ()=>{
                (async () => {
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                expect(false).assertTrue();
                await subWindow.destroyWindow();
                done();
                })().awaitSync()
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300004);
                    await subWindow.destroyWindow();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetContentAspectRatio_Error1300016_0600
         * @tc.name        testSetContentAspectRatio_Error1300016_0600
         * @tc.desc        Set content aspect ratio with invalid parameter range
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetContentAspectRatio_Error1300016_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetContentAspectRatio_Error1300016_0600';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let mainWindow: window.Window = windowStage!.getMainWindowSync();
            // await mainWindow.showWindow();
            let ratio = -1.0;
            mainWindow.setContentAspectRatio(ratio).then(()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting content aspect ratio.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set content aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300016);
                    done();
                }
            });
        })

        // todo resetAspectRatio
        /**
         * @tc.number      SUB_BASIC_WMS_ResetAspectRatio_Error1300002_0100
         * @tc.name        testResetAspectRatio_Promise_Error1300002_0100
         * @tc.desc        Reset aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResetAspectRatio_Promise_Error1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testResetAspectRatio_Promise_Error1300002_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testResetAspectRatio_Promise_Error1300002_0100');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            subWindow.resetAspectRatio().then(()=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in resetting aspect ratio on destroyed window.');
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to reset aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                expect(err!.code).assertEqual(1300002);
                done();
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_ResetAspectRatio_Error1300004_0200
         * @tc.name        testResetAspectRatio_Promise_Error1300004_0200
         * @tc.desc        Reset aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResetAspectRatio_Promise_Error1300004_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testResetAspectRatio_Promise_Error1300004_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testResetAspectRatio_Promise_Error1300004_0200');
            expect(!!subWindow).assertTrue();
            subWindow.resetAspectRatio().then(async ()=>{
                (async () => {
                hilog.info(domain, tag, msgStr + 'Succeeded in resetting aspect ratio on destroyed window.');
                expect(false).assertTrue();
                await subWindow.destroyWindow();
                done();
                })().awaitSync()
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to reset aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                expect(err!.code).assertEqual(1300004);
                await subWindow.destroyWindow();
                done();
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_ResetAspectRatio_Error1300002_0300
         * @tc.name        testResetAspectRatio_callback_Error1300002_0300
         * @tc.desc        Set aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResetAspectRatio_callback_Error1300002_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testResetAspectRatio_callback_Error1300002_0300';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testResetAspectRatio_callback_Error1300002_0300');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            subWindow.resetAspectRatio((err: BusinessError<void> | null): void => {
                if (err!.code) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                    return;
                }
                hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                expect(false).assertTrue();
                done();
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_ResetAspectRatio_Error1300004_0400
         * @tc.name        testResetAspectRatio_callback_Error1300004_0400
         * @tc.desc        Set aspect ratio on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testResetAspectRatio_callback_Error1300004_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testResetAspectRatio_callback_Error1300004_0400';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testResetAspectRatio_callback_Error1300004_0400');
            expect(!!subWindow).assertTrue();
            subWindow.resetAspectRatio((err: BusinessError<void> | null): void => {
                (async () => {
                if (err!.code === 1300004) {
                    hilog.error(domain, tag, msgStr + 'Failed to set aspect ratio. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300004);
                    await subWindow.destroyWindow();
                    done();
                }else{
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting aspect ratio.');
                    expect(false).assertTrue();
                    await subWindow.destroyWindow();
                    done();
                }
                })().awaitSync()
            });
        })


        // todo getWindowLimits
        /**
         * @tc.number      SUB_BASIC_WMS_GetWindowLimits_Normal_0100
         * @tc.name        testGetWindowLimits_Normal_0100
         * @tc.desc        Get window limits in px unit
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testGetWindowLimits_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowLimits_Normal_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testGetWindowLimits_Normal_0100');
            expect(!!subWindow).assertTrue();
            try {
                await subWindow.setUIContent('pages/index2');
                // await subWindow.showWindow();
                let windowLimits = subWindow.getWindowLimits();
                hilog.info(domain, tag, msgStr + 'Succeeded in getting window limits. Data: ' + JSON.stringify(windowLimits));
                expect(!!windowLimits).assertTrue();
                await subWindow.destroyWindow();
                done();
            } catch (err) {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to get window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_GetWindowLimits_Error1300002_0200
         * @tc.name        testGetWindowLimits_Error1300002_0200
         * @tc.desc        Get window limits on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowLimits_Error1300002_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowLimits_Error1300002_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testGetWindowLimits_Error1300002_0200');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            try {
                let windowLimits = subWindow.getWindowLimits();
                hilog.error(domain, tag, msgStr + 'Succeeded in getting window limits on destroyed window.');
                expect(false).assertTrue();
                done();
            } catch (err) {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to get window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                expect(err!.code).assertEqual(1300002);
                done();
            }
        })


        // todo getWindowLimitsVP
        /**
         * @tc.number      SUB_BASIC_WMS_GetWindowLimitsVP_Normal_0100
         * @tc.name        testGetWindowLimitsVP_Normal_0100
         * @tc.desc        Get window limits in vp unit
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testGetWindowLimitsVP_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowLimitsVP_Normal_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testGetWindowLimitsVP_Normal_0100');
            expect(!!subWindow).assertTrue();
            try {
                await subWindow.setUIContent('pages/index2');
                // await subWindow.showWindow();
                let windowLimits = subWindow.getWindowLimitsVP();
                hilog.info(domain, tag, msgStr + 'Succeeded in getting window limits VP. Data: ' + JSON.stringify(windowLimits));
                expect(!!windowLimits).assertTrue();
                await subWindow.destroyWindow();
                done();
            } catch (err) {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to get window limits VP. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_GetWindowLimitsVP_Error1300002_0200
         * @tc.name        testGetWindowLimitsVP_Error1300002_0200
         * @tc.desc        Get window limits VP on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testGetWindowLimitsVP_Error1300002_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowLimitsVP_Error1300002_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testGetWindowLimitsVP_Error1300002_0200');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            try {
                let windowLimits = subWindow.getWindowLimitsVP();
                hilog.error(domain, tag, msgStr + 'Succeeded in getting window limits limits VP on destroyed window.');
                expect(false).assertTrue();
                done();
            } catch (err) {
                err === err as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed to get window limits VP. Cause code: ' + err!.code + ', message: ' + err!.message);
                expect(err!.code).assertEqual(1300002);
                done();
            }
        })

        // todo setWindowLimits
        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_SingleParam_Normal_0100
         * @tc.name        testSetWindowLimits_SingleParam_Normal_0100
         * @tc.desc        Set window limits with single parameter
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetWindowLimits_SingleParam_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_SingleParam_Normal_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_SingleParam_Normal_0100');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400,
                pixelUnit: window.PixelUnit.PX
            };
            subWindow.setWindowLimits(windowLimits).then(async (result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(!!result).assertTrue();
                await subWindow.destroyWindow();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_SingleParam_Normal_0200
         * @tc.name        testSetWindowLimits_SingleParam_Normal_0200
         * @tc.desc        Set window limits with single parameter
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetWindowLimits_SingleParam_Normal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_SingleParam_Normal_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_SingleParam_Normal_0200');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400,
                pixelUnit: window.PixelUnit.VP
            };
            subWindow.setWindowLimits(windowLimits).then(async (result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(!!result).assertTrue();
                await subWindow.destroyWindow();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_DoubleParam_Normal_0100
         * @tc.name        testSetWindowLimits_DoubleParam_Normal_0100
         * @tc.desc        Set window limits with single parameter
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetWindowLimits_DoubleParam_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_DoubleParam_Normal_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_DoubleParam_Normal_0100');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400,
                pixelUnit: window.PixelUnit.VP
            };
            subWindow.setWindowLimits(windowLimits,true).then(async (result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(!!result).assertTrue();
                await subWindow.destroyWindow();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                })().awaitSync()
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_DoubleParam_Normal_0200
         * @tc.name        testSetWindowLimits_DoubleParam_Normal_0200
         * @tc.desc        Set window limits with single parameter
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testSetWindowLimits_DoubleParam_Normal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_DoubleParam_Normal_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_DoubleParam_Normal_0200');
            expect(!!subWindow).assertTrue();
            await subWindow.setUIContent('pages/index2');
            // await subWindow.showWindow();
            await Utils.msSleep(300);
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400,
                pixelUnit: window.PixelUnit.PX
            };
            subWindow.setWindowLimits(windowLimits,false).then(async (result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(!!result).assertTrue();
                await subWindow.destroyWindow();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                (async () => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    await subWindow.destroyWindow();
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    await subWindow.destroyWindow();
                    expect(false).assertTrue();
                    done();
                }
                })().awaitSync()
            });
        })


        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_Error1300002_0100
         * @tc.name        testSetWindowLimits_Error1300002_0100
         * @tc.desc        Set window limits on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowLimits_Error1300002_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_Error1300002_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_Error1300002_0100');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400
            };
            subWindow.setWindowLimits(windowLimits).then((result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SetWindowLimits_Error1300002_0200
         * @tc.name        testSetWindowLimits_Error1300002_0200
         * @tc.desc        Set window limits on destroyed window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowLimits_Error1300002_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowLimits_Error1300002_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowLimits_Error1300002_0200');
            expect(!!subWindow).assertTrue();
            await subWindow.destroyWindow();
            let windowLimits: window.WindowLimits = {
                maxWidth: 1500,
                maxHeight: 1000,
                minWidth: 500,
                minHeight: 400
            };
            subWindow.setWindowLimits(windowLimits,true).then((result:window.WindowLimits)=>{
                hilog.info(domain, tag, msgStr + 'Succeeded in setting window limits. Data: ' + JSON.stringify(result));
                expect(false).assertTrue();
                done();
            }).catch((err: Error): PromiseLike<void> | undefined => {
                err === err as BusinessError;
                if (err!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported on this device.');
                    expect(err!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + 'Failed to set window limits. Cause code: ' + err!.code + ', message: ' + err!.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                }
            });
        })

        

        /**
         * @tc.number      SUB_WINDOW_offRectChangeInGlobalDisplay_003
         * @tc.name        testOffRectChangeInGlobalDisplay_ErrorCode1300002_static_003
         * @tc.desc        onRectChangeInGlobalDisplay 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffRectChangeInGlobalDisplay_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffRectChangeInGlobalDisplay_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                subWin.offRectChangeInGlobalDisplay(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        }) 

        /**
         * @tc.number      SUB_WINDOW_offWindowRectChange_003
         * @tc.name        testOffWindowRectChange_ErrorCode1300002_static_003
         * @tc.desc        onWindowRectChange 1300002 test.
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOffWindowRectChange_ErrorCode1300002_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffWindowRectChange_ErrorCode1300002_static_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            try {
                let subWin: window.Window = await windowStage!.createSubWindow(caseName);
                expect(!!subWin).assertTrue();
                await subWin.destroyWindow();
                const callback: Callback<window.RectChangeOptions> = (data: window.RectChangeOptions) => {
                    hilog.info(domain, tag, msgStr + `Callback: ${JSON.stringify(data)}`);
                };
                subWin.offWindowRectChange(callback);
                hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception === exception as BusinessError;
                if (exception!.code === 1300002) {
                    hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
                    expect(exception!.code).assertEqual(1300002);
                    done();
                } else if (exception!.code === 801) {
                    hilog.info(domain, tag, msgStr + 'Capability not supported.');
                    expect(exception!.code).assertEqual(801);
                    done();
                } else {
                    hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception!.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })   

    })
}
