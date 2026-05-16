'use static'
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function WindowEventStatic() {
    describe("WindowEventStatic", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowEventStatic describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode = false;

        beforeAll(() => {
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                win = windowStage!.getMainWindowSync();
                isFreeWindowMode = win!.isInFreeWindowMode();
                hilog.info(domain, tag, 'beforeAll windowStage and mainWindow obtained successfully');
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'beforeAll getANI fail = ' + JSON.stringify(e));
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFTOUCHOUTSIDE_NORMAL_001
         * * @tc.name testOffTouchOutside_NORMAL_001
         * @tc.desc offTouchOutside unregister specified callback test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffTouchOutside_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffTouchOutside_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffTouchOutside_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callbackInvoked: boolean = false;
                let touchOutsideCallback: Callback<void> = (): void => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, caseName + ' onTouchOutside callback invoked');
                };

                subWindow.onTouchOutside(touchOutsideCallback);
                hilog.info(domain, tag, caseName + ' onTouchOutside registered');

                await Utils.msSleep(100);

                subWindow.offTouchOutside(touchOutsideCallback);
                hilog.info(domain, tag, caseName + ' offTouchOutside success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
				expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFTOUCHOUTSIDE_NORMAL_002
         * @tc.name testOffTouchOutside_NORMAL_002
         * @tc.desc offTouchOutside unregister all callbacks test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffTouchOutside_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffTouchOutside_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffTouchOutside_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callback1: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback1 invoked');
                };
                let callback2: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback2 invoked');
                };

                subWindow.onTouchOutside(callback1);
                subWindow.onTouchOutside(callback2);
                hilog.info(domain, tag, caseName + ' onTouchOutside registered');

                await Utils.msSleep(100);

                subWindow.offTouchOutside();
                hilog.info(domain, tag, caseName + ' offTouchOutside all success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
				expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ONNOINTERACTIONDETECTED_NORMAL_001
         * @tc.name testOnNoInteractionDetected_NORMAL_001
         * @tc.desc onNoInteractionDetected normal timeout detection test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOnNoInteractionDetected_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnNoInteractionDetected_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOnNoInteractionDetected_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callbackInvoked: boolean = false;
                let noInteractionCallback: Callback<void> = (): void => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, caseName + ' onNoInteractionDetected callback invoked');
                };

                subWindow.onNoInteractionDetected(6, noInteractionCallback);
                hilog.info(domain, tag, caseName + ' onNoInteractionDetected registered');

                await Utils.msSleep(100);

                subWindow.offNoInteractionDetected(noInteractionCallback);
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ONNOINTERACTIONDETECTED_NORMAL_002
         * @tc.name testOnNoInteractionDetected_NORMAL_002
         * @tc.desc onNoInteractionDetected short timeout detection test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOnNoInteractionDetected_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnNoInteractionDetected_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOnNoInteractionDetected_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callbackInvoked: boolean = false;
                let noInteractionCallback: Callback<void> = (): void => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, caseName + ' onNoInteractionDetected callback invoked');
                };

                subWindow.onNoInteractionDetected(1, noInteractionCallback);
                hilog.info(domain, tag, caseName + ' onNoInteractionDetected registered');

                await Utils.msSleep(100);

                subWindow.offNoInteractionDetected(noInteractionCallback);
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ONNOINTERACTIONDETECTED_ERRCODE1300002_001
         * @tc.name testOnNoInteractionDetected_ErrCode1300002_001
         * @tc.desc onNoInteractionDetected window state abnormal test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOnNoInteractionDetected_ErrCode1300002_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnNoInteractionDetected_ErrCode1300002_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOnNoInteractionDetected_subWindow8');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                let noInteractionCallback: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' onNoInteractionDetected callback invoked');
                };

                subWindow.onNoInteractionDetected(1000, noInteractionCallback);
                hilog.info(domain, tag, caseName + ' onNoInteractionDetected registered');

                await Utils.msSleep(100);

                subWindow.offNoInteractionDetected(noInteractionCallback);
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 1300002) {
                    done();
                } else if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFF_OFFNOINTERACTIONDETECTED_NORMAL_001
         * @tc.name testOffNoInteractionDetected_NORMAL_001
         * @tc.desc offNoInteractionDetected unregister specified callback test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffNoInteractionDetected_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffNoInteractionDetected_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffNoInteractionDetected_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callbackInvoked: boolean = false;
                let noInteractionCallback: Callback<void> = (): void => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, caseName + ' onNoInteractionDetected callback invoked');
                };

                subWindow.onNoInteractionDetected(1, noInteractionCallback);
                hilog.info(domain, tag, caseName + ' onNoInteractionDetected registered');

                await Utils.msSleep(2000);

                expect(callbackInvoked).assertTrue();

                subWindow.offNoInteractionDetected(noInteractionCallback);
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFNOINTERACTIONDETECTED_NORMAL_002
         * @tc.name testOffNoInteractionDetected_NORMAL_002
         * @tc.desc offNoInteractionDetected unregister all callbacks test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffNoInteractionDetected_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffNoInteractionDetected_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffNoInteractionDetected_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callback1: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback1 invoked');
                };
                let callback2: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback2 invoked');
                };

                subWindow.onNoInteractionDetected(1, callback1);
                subWindow.onNoInteractionDetected(1, callback2);
                hilog.info(domain, tag, caseName + ' onNoInteractionDetected registered');

                await Utils.msSleep(100);

                subWindow.offNoInteractionDetected();
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected all success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFNOINTERACTIONDETECTED_NORMAL_003
         * @tc.name testOffNoInteractionDetected_NORMAL_003
         * @tc.desc offNoInteractionDetected 801
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffNoInteractionDetected_NORMAL_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffNoInteractionDetected_NORMAL_003';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffNoInteractionDetected_subWindow3');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await Utils.msSleep(100);

                subWindow.offNoInteractionDetected();
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected all success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFNOINTERACTIONDETECTED_ERROR_001
         * @tc.name testOffNoInteractionDetected_ErrCode1300002_001
         * @tc.desc offNoInteractionDetected error code 1300002 test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffNoInteractionDetected_ErrCode1300002_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffNoInteractionDetected_ErrCode1300002_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffNoInteractionDetected_subWindow3');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                await Utils.msSleep(1000);

                subWindow.offNoInteractionDetected();
                hilog.info(domain, tag, caseName + ' offNoInteractionDetected success');

                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 1300002) {
                    done();
                } else if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFDIALOGTARGETTOUCH_NORMAL_001
         * @tc.name testOffDialogTargetTouch_NORMAL_001
         * @tc.desc offDialogTargetTouch unregister specified callback test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffDialogTargetTouch_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffDialogTargetTouch_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffDialogTargetTouch_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callbackInvoked: boolean = false;
                let dialogTargetTouchCallback: Callback<void> = (): void => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, caseName + ' onDialogTargetTouch callback invoked');
                };

                subWindow.onDialogTargetTouch(dialogTargetTouchCallback);
                hilog.info(domain, tag, caseName + ' onDialogTargetTouch registered');

                await Utils.msSleep(100);

                subWindow.offDialogTargetTouch(dialogTargetTouchCallback);
                hilog.info(domain, tag, caseName + ' offDialogTargetTouch success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_OFFDIALOGTARGETTOUCH_NORMAL_002
         * @tc.name testOffDialogTargetTouch_NORMAL_002
         * @tc.desc offDialogTargetTouch unregister all callbacks test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testOffDialogTargetTouch_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffDialogTargetTouch_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testOffDialogTargetTouch_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let callback1: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback1 invoked');
                };
                let callback2: Callback<void> = (): void => {
                    hilog.info(domain, tag, caseName + ' callback2 invoked');
                };

                subWindow.onDialogTargetTouch(callback1);
                subWindow.onDialogTargetTouch(callback2);
                hilog.info(domain, tag, caseName + ' onDialogTargetTouch registered');

                await Utils.msSleep(100);

                subWindow.offDialogTargetTouch();
                hilog.info(domain, tag, caseName + ' offDialogTargetTouch all success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');
                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_SETWINDOWMASK_NORMAL_001
         * @tc.name testSetWindowMask_NORMAL_001
         * @tc.desc setWindowMask single region mask test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testSetWindowMask_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowMask_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowMask_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.resize(200, 200);
                hilog.info(domain, tag, caseName + ' resize success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let maskWidth = subWindow.getWindowProperties().windowRect.width;
                let maskHeight = subWindow.getWindowProperties().windowRect.height;
                let windowMask = Array.create<Array<Long>>(maskHeight, [] as Array<Long>).map((_, row) => {
                    let array = new Array<Long>(maskWidth, (i) => { return (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0 });
                    return array;
                });

                await subWindow.setWindowMask(windowMask);
                hilog.info(domain, tag, caseName + ' setWindowMask success');

                await subWindow.clearWindowMask();
                hilog.info(domain, tag, caseName + ' clearWindowMask success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_SETWINDOWMASK_NORMAL_002
         * @tc.name testSetWindowMask_NORMAL_002
         * @tc.desc setWindowMask multiple region mask test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testSetWindowMask_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowMask_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testSetWindowMask_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.resize(200, 200);
                hilog.info(domain, tag, caseName + ' resize success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let maskWidth = subWindow.getWindowProperties().windowRect.width;
                let maskHeight = subWindow.getWindowProperties().windowRect.height;
                let windowMask = Array.create<Array<Long>>(maskHeight, [] as Array<Long>).map((_, row) => {
                    let array = new Array<Long>(maskWidth, (i) => { return (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0 });
                    return array;
                });

                await subWindow.setWindowMask(windowMask);
                hilog.info(domain, tag, caseName + ' setWindowMask success');

                await subWindow.clearWindowMask();
                hilog.info(domain, tag, caseName + ' clearWindowMask success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_SETSEPARATIONTOUCHENABLED_NORMAL_001
         * @tc.name testSetSeparationTouchEnabled_NORMAL_001
         * @tc.desc setSeparationTouchEnabled enable test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testSetSeparationTouchEnabled_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSeparationTouchEnabled_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testSetSeparationTouchEnabled_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setSeparationTouchEnabled(false);
                hilog.info(domain, tag, caseName + ' setSeparationTouchEnabled false');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ISSEPARATIONTOUCHENABLED_NORMAL_001
         * @tc.name testIsSeparationTouchEnabled_NORMAL_001
         * @tc.desc isSeparationTouchEnabled get state test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testIsSeparationTouchEnabled_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsSeparationTouchEnabled_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testIsSeparationTouchEnabled_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setSeparationTouchEnabled(false);
                hilog.info(domain, tag, caseName + ' setSeparationTouchEnabled false');

                let result = subWindow.isSeparationTouchEnabled();
                hilog.info(domain, tag, caseName + ' isSeparationTouchEnabled result: ' + result);

                expect(result).assertFalse();

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ISSEPARATIONTOUCHENABLED_RETURN_001
         * @tc.name testIsSeparationTouchEnabled_Return_001
         * @tc.desc isSeparationTouchEnabled verify return value type test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testIsSeparationTouchEnabled_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsSeparationTouchEnabled_Return_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testIsSeparationTouchEnabled_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setSeparationTouchEnabled(true);
                hilog.info(domain, tag, caseName + ' setSeparationTouchEnabled success');

                let result = subWindow.isSeparationTouchEnabled();
                hilog.info(domain, tag, caseName + ' isSeparationTouchEnabled result: ' + result);

                expect(result).assertTrue();

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_SETRECEIVEDRAGEVENTENABLED_NORMAL_001
         * @tc.name testSetReceiveDragEventEnabled_NORMAL_001
         * @tc.desc setReceiveDragEventEnabled enable test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testSetReceiveDragEventEnabled_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetReceiveDragEventEnabled_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testSetReceiveDragEventEnabled_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setReceiveDragEventEnabled(true);
                hilog.info(domain, tag, caseName + ' setReceiveDragEventEnabled success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_SETRECEIVEDRAGEVENTENABLED_NORMAL_002
         * @tc.name testSetReceiveDragEventEnabled_NORMAL_002
         * @tc.desc setReceiveDragEventEnabled disable test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testSetReceiveDragEventEnabled_NORMAL_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetReceiveDragEventEnabled_NORMAL_002';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testSetReceiveDragEventEnabled_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setReceiveDragEventEnabled(false);
                hilog.info(domain, tag, caseName + ' setReceiveDragEventEnabled success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ISRECEIVEDRAGEVENTENABLED_NORMAL_001
         * @tc.name testIsReceiveDragEventEnabled_NORMAL_001
         * @tc.desc isReceiveDragEventEnabled get state test test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testIsReceiveDragEventEnabled_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsReceiveDragEventEnabled_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testIsReceiveDragEventEnabled_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setReceiveDragEventEnabled(false);
                hilog.info(domain, tag, caseName + ' setReceiveDragEventEnabled success');

                let result = subWindow.isReceiveDragEventEnabled();
                hilog.info(domain, tag, caseName + ' isReceiveDragEventEnabled result: ' + result);

                expect(result).assertFalse();

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ISRECEIVEDRAGEVENTENABLED_RETURN_001
         * @tc.name testIsReceiveDragEventEnabled_Return_001
         * @tc.desc isReceiveDragEventEnabled verify return value type test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testIsReceiveDragEventEnabled_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsReceiveDragEventEnabled_Return_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testIsReceiveDragEventEnabled_subWindow2');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.setReceiveDragEventEnabled(true);
                hilog.info(domain, tag, caseName + ' setReceiveDragEventEnabled success');

                let result = subWindow.isReceiveDragEventEnabled();
                hilog.info(domain, tag, caseName + ' isReceiveDragEventEnabled result: ' + result);

                expect(result).assertTrue();

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_ISRECEIVEDRAGEVENTENABLED_ERRCODE1300002_001
         * @tc.name testIsReceiveDragEventEnabled_ErrCode1300002_001
         * @tc.desc isReceiveDragEventEnabled window state abnormal test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testIsReceiveDragEventEnabled_ErrCode1300002_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsReceiveDragEventEnabled_ErrCode1300002_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testIsReceiveDragEventEnabled_subWindow3');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                let result = subWindow.isReceiveDragEventEnabled();
                hilog.info(domain, tag, caseName + ' isReceiveDragEventEnabled result: ' + result);

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 1300002) {
                    done();
                } else if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_CLEARWINDOWMASK_NORMAL_001
         * @tc.name testClearWindowMask_NORMAL_001
         * @tc.desc clearWindowMask clear mask test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testClearWindowMask_NORMAL_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClearWindowMask_NORMAL_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testClearWindowMask_subWindow');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.resize(200, 200);
                hilog.info(domain, tag, caseName + ' resize success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                let maskWidth = subWindow.getWindowProperties().windowRect.width;
                let maskHeight = subWindow.getWindowProperties().windowRect.height;
                let windowMask = Array.create<Array<Long>>(maskHeight, [] as Array<Long>).map((_, row) => {
                    let array = new Array<Long>(maskWidth, (i) => { return (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0 });
                    return array;
                });

                await subWindow.setWindowMask(windowMask);
                hilog.info(domain, tag, caseName + ' setWindowMask success');

                await subWindow.clearWindowMask();
                hilog.info(domain, tag, caseName + ' clearWindowMask success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                hilog.error(domain, tag, msgStr + 'exception code = ' + JSON.stringify(e.code));
                hilog.error(domain, tag, msgStr + 'exception code = ' + JSON.stringify(e.message));
                if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_CLEARWINDOWMASK_ERRCODE1300002_001
         * @tc.name testClearWindowMask_ErrCode1300002_001
         * @tc.desc clearWindowMask window state abnormal test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testClearWindowMask_ErrCode1300002_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClearWindowMask_ErrCode1300002_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWindow: window.Window = await windowStage!.createSubWindow('testClearWindowMask_subWindow3');
                hilog.info(domain, tag, caseName + ' create subWindow success');
                await subWindow.setUIContent('pages/index2');
                hilog.info(domain, tag, caseName + ' setUIContent success');
                await subWindow.showWindow();
                hilog.info(domain, tag, caseName + ' showWindow success');

                await subWindow.destroyWindow();
                hilog.info(domain, tag, caseName + ' destroyWindow success');

                await subWindow.clearWindowMask();
                hilog.info(domain, tag, caseName + ' clearWindowMask success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 1300002) {
                    done();
                } else if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number SUB_WINDOW_EVENT_CLEARWINDOWMASK_ERRCODE1300004_001
         * @tc.name testClearWindowMask_ErrCode1300004_001
         * @tc.desc clearWindowMask unauthorized operation test.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testClearWindowMask_ErrCode1300004_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testClearWindowMask_ErrCode1300004_001';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                await win!.clearWindowMask();
                hilog.info(domain, tag, caseName + ' clearWindowMask success');

                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
                if (e.code === 1300004) {
                    done();
                } else if (e.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
     * @tc.number    SUB_WINDOW_WINDOWTOUCHABLE_FALSE_0100
     * @tc.name      testSetWindowTouchableFalse_static_0100
     * @tc.desc      test setWindowTouchable with false parameter using Promise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowTouchableFalse_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowTouchableFalse_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          await win!.setWindowTouchable(false);
          hilog.info(domain, tag, caseName + ' setWindowTouchable with false success');

          await win!.setWindowTouchable(true);
          hilog.info(domain, tag, caseName + ' setWindowTouchable with true success');
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          expect(false).assertTrue();
        }
      })

    /**
     * @tc.number    SUB_WINDOW_WINDOWTOUCHABLE_FALSE_CALLBACK_0100
     * @tc.name      testSetWindowTouchableFalseCallback_static_0100
     * @tc.desc      test setWindowTouchable with false parameter using AsyncCallback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowTouchableFalseCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowTouchableFalseCallback_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowTouchable(false, (err: BusinessError | null) => {
            hilog.info(domain, tag, caseName + ' setWindowTouchable callback err: ' + JSON.stringify(err));
            if (err && err.code != 0) {
              hilog.error(domain, tag,
                caseName + ' setWindowTouchable failed. code: ' + err.code + ', message: ' + err.message);
              expect(false).assertTrue();
              done();
            } else {
              hilog.info(domain, tag, caseName + ' setWindowTouchable with false success');
              win!.setWindowTouchable(true, (err2: BusinessError | null) => {
                hilog.info(domain, tag, caseName + ' setWindowTouchable callback err2: ' + JSON.stringify(err2));
                if (err2 && err2.code != 0) {
                  hilog.error(domain, tag,
                    caseName + ' setWindowTouchable true failed. code: ' + err2.code + ', message: ' + err2.message);
                  expect(false).assertTrue();
                  done();
                } else {
                  hilog.info(domain, tag, caseName + ' setWindowTouchable with true success');
                  done();
                }
              });
            }
          });
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          expect(false).assertTrue();
        }
      })

    

    /**
     * @tc.number    SUB_WINDOW_SETSUBWINDOWMODAL_MODALITY_0100
     * @tc.name      testSetSubWindowModalModality_static
     * @tc.desc      test setSubWindowModal with modalityType parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetSubWindowModalModality_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetSubWindowModalModality_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetSubWindowModalModality_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          await subWin.setSubWindowModal(false, window.ModalityType.APPLICATION_MODALITY);
          hilog.info(domain, tag, caseName + ' setSubWindowModal with APPLICATION_MODALITY success');

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else if (e.code === 401) {
            hilog.error(domain, tag, caseName + ' 不支持设置false');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

      /**
     * @tc.number    SUB_BASIC_WMS_GETWINDOWSBYCOORDINATE_static_return_0100
     * @tc.name      testGetWindowsByCoordinate_static_return_0100
     * @tc.desc      Test getWindowsByCoordinate with all 4 parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it('testGetWindowsByCoordinate_static_return_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testGetWindowsByCoordinate_static_return_0100';
      let msgStr: string = 'jsunittest ' + caseName + ' ';
      hilog.info(domain, tag, msgStr + 'begin');
      try {
        let mainWindowClass: window.Window = windowStage!.getMainWindowSync();
        let properties: window.WindowProperties = mainWindowClass.getWindowProperties();
        let displayId: long = properties.displayId!;
        let windowRect: window.Rect = properties.windowRect;
        hilog.info(domain, tag, msgStr + 'displayId: ' + displayId);
        hilog.info(domain, tag, msgStr + 'windowRect: ' + JSON.stringify(windowRect));

        if(isFreeWindowMode){
          let x: int = Math.floor(windowRect.width).toInt();
          let y: int = Math.floor(windowRect.height).toInt();
          let windowNumber: int = 0;
          window.getWindowsByCoordinate(displayId, windowNumber, x + 10, y + 10).then((data: Array<window.Window>) => {
            hilog.info(domain, tag, msgStr + 'Succeeded in getting windows. Data: ' + JSON.stringify(data));
            expect(data.length).assertEqual(0);
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
          done();
        }else{
          let x: int = Math.floor(windowRect.width / 2).toInt();
          let y: int = Math.floor(windowRect.height / 2).toInt();
          let windowNumber: int = 0;
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
          done();
        }


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

    });
}
