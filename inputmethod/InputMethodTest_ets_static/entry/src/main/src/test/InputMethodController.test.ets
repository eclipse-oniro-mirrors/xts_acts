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
import inputMethod from '@ohos.inputMethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import InputMethodMethod from '@ohos.InputMethodSubtype';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';

const INVALID_INPUT_PARAMETER: int = 401;
const INVALID_INPUT_METHOD_CLIENT_DETACHED: int = 12800009;
const INVALID_INPUT_METHOD_CLIENT_ERROR: int = 12800003;
const INVALID_INPUT_METHOD_SERVICE_ERROR: int = 12800008;


export default function inputMethodControllerTest() {
    describe('inputMethod_controller', () => {
        beforeEach(
            async () => {
                try {
                    let data = await inputMethod.getController().attach(true, {
                        inputAttribute: {
                            textInputType: inputMethod.TextInputType.MULTILINE,
                            enterKeyType: inputMethod.EnterKeyType.GO
                        }
                    });
                    console.info(`attach inputMethod success, data: ${JSON.stringify(data)}`);
                } catch (error) {
                    console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
                }
            }
        );

        afterEach(
            async () => {
                try {
                    await inputMethod.getController().detach();
                    console.info(`close inputMethod success`);
                } catch (error) {
                    console.info(`close inputMethod fail, error: [${error.code}, ${error.message}]`);
                };
            }
        );

        /**
         * @tc.name   SUB_Misc_inputMethodController_showTextInput_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_showTextInput_Async_static_0100
         * @tc.desc   Test showTextInput interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_showTextInput_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_showTextInput_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.showTextInput(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_showTextInput_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_showTextInput_Parser_static_0100
         * @tc.desc   Test showTextInput interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_showTextInput_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_showTextInput_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                await inputMethodCtrl.showTextInput();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_showTextInput_Parser_static_0200
         * @tc.number SUB_Misc_inputMethodController_showTextInput_Parser_static_0200
         * @tc.desc   Test showTextInput interface with requestKeyboardReason
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_showTextInput_Parser_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_showTextInput_Parser_static_0200';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let reason: inputMethod.RequestKeyboardReason = inputMethod.RequestKeyboardReason.NONE;
            try {
                await inputMethodCtrl.showTextInput(reason);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_hideTextInput_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_hideTextInput_Async_static_0100
         * @tc.desc   Test hideTextInput interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_hideTextInput_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_hideTextInput_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.hideTextInput(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_hideTextInput_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_hideTextInput_Parser_static_0100
         * @tc.desc   Test hideTextInput interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_hideTextInput_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_hideTextInput_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                await inputMethodCtrl.hideTextInput();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_detach_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_detach_Async_static_0100
         * @tc.desc   Test detach interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_detach_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_detach_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.detach(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_detach_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_detach_Parser_static_0100
         * @tc.desc   Test detach interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_detach_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_detach_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                await inputMethodCtrl.detach();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateCursor_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_updateCursor_Async_static_0100
         * @tc.desc   Test updateCursor interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateCursor_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateCursor_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let cursorInfo: inputMethod.CursorInfo = {
                left: 100.0,
                top: 200.0,
                width: 10.0,
                height: 20.0
            };
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.updateCursor(cursorInfo, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateCursor_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_updateCursor_Parser_static_0100
         * @tc.desc   Test updateCursor interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateCursor_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateCursor_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let cursorInfo: inputMethod.CursorInfo = {
                left: 100.0,
                top: 200.0,
                width: 10.0,
                height: 20.0
            };
            try {
                await inputMethodCtrl.updateCursor(cursorInfo);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_changeSelection_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_changeSelection_Async_static_0100
         * @tc.desc   Test changeSelection interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_changeSelection_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_changeSelection_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let text: string = "Hello World";
            let start: int = 0;
            let end: int = 5;
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.changeSelection(text, start, end, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_changeSelection_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_changeSelection_Parser_static_0100
         * @tc.desc   Test changeSelection interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_changeSelection_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_changeSelection_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let text: string = "Hello World";
            let start: int = 0;
            let end: int = 5;
            try {
                await inputMethodCtrl.changeSelection(text, start, end);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateAttribute_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_updateAttribute_Async_static_0100
         * @tc.desc   Test updateAttribute interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateAttribute_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateAttribute_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.DONE
            };
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.updateAttribute(attribute, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateAttribute_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_updateAttribute_Parser_static_0100
         * @tc.desc   Test updateAttribute interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateAttribute_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateAttribute_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.DONE
            };
            try {
                await inputMethodCtrl.updateAttribute(attribute);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_stopInputSession_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_stopInputSession_Async_static_0100
         * @tc.desc   Test stopInputSession interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_stopInputSession_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_stopInputSession_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data == true).assertTrue();
                    expect(typeof(data) === 'boolean').assertTrue();
                }
                done();
            };
            try {
                inputMethodCtrl.stopInputSession(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_stopInputSession_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_stopInputSession_Parser_static_0100
         * @tc.desc   Test stopInputSession interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_stopInputSession_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_stopInputSession_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                let result: boolean = await inputMethodCtrl.stopInputSession();
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect(result == true).assertTrue();
                expect(typeof(result) === 'boolean').assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_discardTypingText_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_discardTypingText_Parser_static_0100
         * @tc.desc   Test discardTypingText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_discardTypingText_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_discardTypingText_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                await inputMethodCtrl.discardTypingText();
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 12800015).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_setCallingWindow_Async_static_0100
         * @tc.number SUB_Misc_inputMethodController_setCallingWindow_Async_static_0100
         * @tc.desc   Test setCallingWindow interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_setCallingWindow_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_setCallingWindow_Async_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let windowId: int = 1;
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethodCtrl.setCallingWindow(windowId, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0100
         * @tc.number SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0100
         * @tc.desc   Test setCallingWindow interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0100';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let windowId: int = 1;
            try {
                await inputMethodCtrl.setCallingWindow(windowId);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   inputmethodNomal_test_showSoftKeyboard_static_001
         * @tc.number inputmethodNomal_test_showSoftKeyboard_static_001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('inputmethodNomal_test_showSoftKeyboard_static_001', Level.LEVEL0, async (done: () => void) => {
            const CASE_NAME: string = 'inputmethodNomal_test_showSoftKeyboard_static_001';
            console.info(`${CASE_NAME} start`);
            let inputMethodCtrl = inputMethod.getController()
            inputMethodCtrl.showSoftKeyboard((err, data) => {
                try {
                    if (err) {
                        console.info(`${CASE_NAME} execution fail, error: [${err.code}, ${err.message}]`);
                        expect(err.code).assertEqual(201);
                        done();
                    } else {
                        console.info(`${CASE_NAME} execution success`);
                        expect().assertFail();
                        done();
                    }
                } catch (error) {
                    console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   inputmethodNomal_test_showSoftKeyboard_static_002
         * @tc.number inputmethodNomal_test_showSoftKeyboard_static_002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethodNomal_test_showSoftKeyboard_static_002', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'inputmethodNomal_test_showSoftKeyboard_static_002';
            console.info(`${CASE_NAME} start`);
            let inputMethodCtrl = inputMethod.getController();
            try {
                await inputMethodCtrl.showSoftKeyboard();
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSelectByRange_static_0100
         * @tc.number SUB_Misc_inputMethodController_onSelectByRange_static_0100
         * @tc.desc   Test onSelectByRange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSelectByRange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSelectByRange_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (range: inputMethod.Range) => {
                console.info(`${CASE_NAME} callback start: ${range.start} , end: ${range.end}`);
                expect(typeof(range.start)).assertEqual('int');
 	            expect(typeof(range.end)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onSelectByRange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offSelectByRange_static_0100
         * @tc.number SUB_Misc_inputMethodController_offSelectByRange_static_0100
         * @tc.desc   Test offSelectByRange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offSelectByRange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSelectByRange_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (range: inputMethod.Range) => {
                console.info(`${CASE_NAME} callback start: ${range.start} , end: ${range.end}`);
            };
            try {
                inputMethodCtrl.onSelectByRange(callback);
                inputMethodCtrl.offSelectByRange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offSelectByRange_static_0200
        * @tc.number SUB_Misc_inputMethodController_offSelectByRange_static_0200
        * @tc.desc   Test offSelectByRange interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offSelectByRange_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSelectByRange_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (range: inputMethod.Range) => {
                console.info(`${CASE_NAME} callback start: ${range.start} , end: ${range.end}`);
            };
            try {
                inputMethodCtrl.onSelectByRange(callback);
                inputMethodCtrl.offSelectByRange();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSelectByMovement_static_0100
         * @tc.number SUB_Misc_inputMethodController_onSelectByMovement_static_0100
         * @tc.desc   Test onSelectByMovement interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSelectByMovement_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSelectByMovement_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (movement: inputMethod.Movement) => {
                console.info(`${CASE_NAME} callback direction: ${movement.direction}`);                
                expect(typeof(movement.direction.CURSOR_UP)).assertEqual('int');
                expect(typeof(movement.direction.CURSOR_DOWN)).assertEqual('int');
                expect(typeof(movement.direction.CURSOR_LEFT)).assertEqual('int');
                expect(typeof(movement.direction.CURSOR_RIGHT)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onSelectByMovement(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offSelectByMovement_static_0100
         * @tc.number SUB_Misc_inputMethodController_offSelectByMovement_static_0100
         * @tc.desc   Test offSelectByMovement interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offSelectByMovement_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSelectByMovement_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (movement: inputMethod.Movement) => {
                console.info(`${CASE_NAME} callback direction: ${movement.direction}`);
            };
            try {
                inputMethodCtrl.onSelectByMovement(callback);
                inputMethodCtrl.offSelectByMovement(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offSelectByMovement_static_0200
        * @tc.number SUB_Misc_inputMethodController_offSelectByMovement_static_0200
        * @tc.desc   Test offSelectByMovement interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offSelectByMovement_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSelectByMovement_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (movement: inputMethod.Movement) => {
                console.info(`${CASE_NAME} callback direction: ${movement.direction}`);
            };
            try {
                inputMethodCtrl.onSelectByMovement(callback);
                inputMethodCtrl.offSelectByMovement();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onInsertText_static_0100
         * @tc.number SUB_Misc_inputMethodController_onInsertText_static_0100
         * @tc.desc   Test onInsertText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onInsertText_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onInsertText_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (text: string) => {
                console.info(`${CASE_NAME} callback text: ${text}`);
            };
            try {
                inputMethodCtrl.onInsertText(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offInsertText_static_0100
         * @tc.number SUB_Misc_inputMethodController_offInsertText_static_0100
         * @tc.desc   Test offInsertText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offInsertText_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offInsertText_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (text: string) => {
                console.info(`${CASE_NAME} callback text: ${text}`);
            };
            try {
                inputMethodCtrl.onInsertText(callback);
                inputMethodCtrl.offInsertText(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offInsertText_static_0200
        * @tc.number SUB_Misc_inputMethodController_offInsertText_static_0200
        * @tc.desc   Test offInsertText interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offInsertText_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offInsertText_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (text: string) => {
                console.info(`${CASE_NAME} callback text: ${text}`);
            };
            try {
                inputMethodCtrl.onInsertText(callback);
                inputMethodCtrl.offInsertText();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onDeleteLeft_static_0100
         * @tc.number SUB_Misc_inputMethodController_onDeleteLeft_static_0100
         * @tc.desc   Test onDeleteLeft interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onDeleteLeft_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onDeleteLeft_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteLeft(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offDeleteLeft_static_0100
         * @tc.number SUB_Misc_inputMethodController_offDeleteLeft_static_0100
         * @tc.desc   Test offDeleteLeft interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offDeleteLeft_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offDeleteLeft_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteLeft(callback);
                inputMethodCtrl.offDeleteLeft(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offDeleteLeft_static_0200
        * @tc.number SUB_Misc_inputMethodController_offDeleteLeft_static_0200
        * @tc.desc   Test offDeleteLeft interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offDeleteLeft_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offDeleteLeft_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteLeft(callback);
                inputMethodCtrl.offDeleteLeft();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onDeleteRight_static_0100
         * @tc.number SUB_Misc_inputMethodController_onDeleteRight_static_0100
         * @tc.desc   Test onDeleteRight interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onDeleteRight_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onDeleteRight_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteRight(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offDeleteRight_static_0100
         * @tc.number SUB_Misc_inputMethodController_offDeleteRight_static_0100
         * @tc.desc   Test offDeleteRight interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offDeleteRight_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offDeleteRight_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteRight(callback);
                inputMethodCtrl.offDeleteRight(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offDeleteRight_static_0200
        * @tc.number SUB_Misc_inputMethodController_offDeleteRight_static_0200
        * @tc.desc   Test offDeleteRight interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offDeleteRight_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offDeleteRight_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteRight(callback);
                inputMethodCtrl.offDeleteRight();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0100
         * @tc.number SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0100
         * @tc.desc   Test onSendKeyboardStatus interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (keyboardStatus: inputMethod.KeyboardStatus) => {
                console.info(`${CASE_NAME} callback keyboardStatus: ${keyboardStatus}`);
                expect(typeof(keyboardStatus.NONE)).assertEqual('int');
                expect(typeof(keyboardStatus.HIDE)).assertEqual('int');
                expect(typeof(keyboardStatus.SHOW)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onSendKeyboardStatus(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0100
         * @tc.number SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0100
         * @tc.desc   Test offSendKeyboardStatus interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (keyboardStatus: inputMethod.KeyboardStatus) => {
                console.info(`${CASE_NAME} callback keyboardStatus: ${keyboardStatus}`);
            };
            try {
                inputMethodCtrl.onSendKeyboardStatus(callback);
                inputMethodCtrl.offSendKeyboardStatus(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0200
        * @tc.number SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0200
        * @tc.desc   Test offSendKeyboardStatus interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSendKeyboardStatus_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (keyboardStatus: inputMethod.KeyboardStatus) => {
                console.info(`${CASE_NAME} callback keyboardStatus: ${keyboardStatus}`);
            };
            try {
                inputMethodCtrl.onSendKeyboardStatus(callback);
                inputMethodCtrl.offSendKeyboardStatus();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSendFunctionKey_static_0100
         * @tc.number SUB_Misc_inputMethodController_onSendFunctionKey_static_0100
         * @tc.desc   Test onSendFunctionKey interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSendFunctionKey_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSendFunctionKey_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (functionKey: inputMethod.FunctionKey) => {
                console.info(`${CASE_NAME} callback functionKey.enterKeyType: ${functionKey.enterKeyType}`);
                expect(typeof(functionKey.enterKeyType.UNSPECIFIED)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.NONE)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.GO)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.SEARCH)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.SEND)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.NEXT)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.DONE)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.PREVIOUS)).assertEqual('int');
                expect(typeof(functionKey.enterKeyType.NEWLINE)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onSendFunctionKey(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offSendFunctionKey_static_0100
         * @tc.number SUB_Misc_inputMethodController_offSendFunctionKey_static_0100
         * @tc.desc   Test offSendFunctionKey interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offSendFunctionKey_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSendFunctionKey_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (functionKey: inputMethod.FunctionKey) => {
                console.info(`${CASE_NAME} callback functionKey.enterKeyType: ${functionKey.enterKeyType}`);
            };
            try {
                inputMethodCtrl.onSendFunctionKey(callback);
                inputMethodCtrl.offSendFunctionKey(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offSendFunctionKey_static_0200
        * @tc.number SUB_Misc_inputMethodController_offSendFunctionKey_static_0200
        * @tc.desc   Test offSendFunctionKey interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offSendFunctionKey_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSendFunctionKey_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (functionKey: inputMethod.FunctionKey) => {
                console.info(`${CASE_NAME} callback functionKey.enterKeyType: ${functionKey.enterKeyType}`);
            };
            try {
                inputMethodCtrl.onSendFunctionKey(callback);
                inputMethodCtrl.offSendFunctionKey();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onMoveCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_onMoveCursor_static_0100
         * @tc.desc   Test onMoveCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onMoveCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onMoveCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (direction: inputMethod.Direction) => {
                console.info(`${CASE_NAME} callback direction: ${direction}`);
                expect(typeof(direction.CURSOR_UP)).assertEqual('int');
                expect(typeof(direction.CURSOR_DOWN)).assertEqual('int');
                expect(typeof(direction.CURSOR_LEFT)).assertEqual('int');
                expect(typeof(direction.CURSOR_RIGHT)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onMoveCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offMoveCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_offMoveCursor_static_0100
         * @tc.desc   Test offMoveCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offMoveCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offMoveCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (direction: inputMethod.Direction) => {
                console.info(`${CASE_NAME} callback direction: ${direction}`);
            };
            try {
                inputMethodCtrl.onMoveCursor(callback);
                inputMethodCtrl.offMoveCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offMoveCursor_static_0200
        * @tc.number SUB_Misc_inputMethodController_offMoveCursor_static_0200
        * @tc.desc   Test offMoveCursor interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offMoveCursor_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offMoveCursor_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (direction: inputMethod.Direction) => {
                console.info(`${CASE_NAME} callback direction: ${direction}`);
            };
            try {
                inputMethodCtrl.onMoveCursor(callback);
                inputMethodCtrl.offMoveCursor();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onHandleExtendAction_static_0100
         * @tc.number SUB_Misc_inputMethodController_onHandleExtendAction_static_0100
         * @tc.desc   Test onHandleExtendAction interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onHandleExtendAction_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onHandleExtendAction_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (action: inputMethod.ExtendAction) => {
                console.info(`${CASE_NAME} callback action: ${action}`);
                expect(typeof(action.SELECT_ALL)).assertEqual('int');
                expect(typeof(action.CUT)).assertEqual('int');
                expect(typeof(action.COPY)).assertEqual('int');
                expect(typeof(action.PASTE)).assertEqual('int');
            };
            try {
                inputMethodCtrl.onHandleExtendAction(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offHandleExtendAction_static_0100
         * @tc.number SUB_Misc_inputMethodController_offHandleExtendAction_static_0100
         * @tc.desc   Test offHandleExtendAction interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offHandleExtendAction_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offHandleExtendAction_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (action: inputMethod.ExtendAction) => {
                console.info(`${CASE_NAME} callback action: ${action}`);                
            };
            try {
                inputMethodCtrl.onHandleExtendAction(callback);
                inputMethodCtrl.offHandleExtendAction(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offHandleExtendAction_static_0200
        * @tc.number SUB_Misc_inputMethodController_offHandleExtendAction_static_0200
        * @tc.desc   Test offHandleExtendAction interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offHandleExtendAction_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offHandleExtendAction_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (action: inputMethod.ExtendAction) => {
                console.info(`${CASE_NAME} callback action: ${action}`);
            };
            try {
                inputMethodCtrl.onHandleExtendAction(callback);
                inputMethodCtrl.offHandleExtendAction();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0100
         * @tc.desc   Test onGetLeftTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetLeftTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0100
         * @tc.desc   Test offGetLeftTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetLeftTextOfCursor(callback);
                inputMethodCtrl.offGetLeftTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0200
        * @tc.number SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0200
        * @tc.desc   Test offGetLeftTextOfCursor interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetLeftTextOfCursor_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetLeftTextOfCursor(callback);
                inputMethodCtrl.offGetLeftTextOfCursor();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0100
         * @tc.desc   Test onGetRightTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetRightTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0100
         * @tc.desc   Test offGetRightTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetRightTextOfCursor(callback);
                inputMethodCtrl.offGetRightTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0200
        * @tc.number SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0200
        * @tc.desc   Test offGetRightTextOfCursor interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetRightTextOfCursor_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetRightTextOfCursor(callback);
                inputMethodCtrl.offGetRightTextOfCursor();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0100
         * @tc.desc   Test onGetTextIndexAtCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextIndexAtCursorCallback = (): int =>  {
                console.info(`${CASE_NAME} callback `);
                let index:int = 0;
                return index;
            };
            try {
                inputMethodCtrl.onGetTextIndexAtCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0100
         * @tc.number SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0100
         * @tc.desc   Test offGetTextIndexAtCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextIndexAtCursorCallback = (): int => {
                console.info(`${CASE_NAME} callback `);
                let index:int = 0;
                return index;
            };
            try {
                inputMethodCtrl.onGetTextIndexAtCursor(callback);
                inputMethodCtrl.offGetTextIndexAtCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0200
        * @tc.number SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0200
        * @tc.desc   Test offGetTextIndexAtCursor interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offGetTextIndexAtCursor_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextIndexAtCursorCallback = (): int => {
                console.info(`${CASE_NAME} callback `);
                let index:int = 0;
                return index;
            };
            try {
                inputMethodCtrl.onGetTextIndexAtCursor(callback);
                inputMethodCtrl.offGetTextIndexAtCursor();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSetPreviewText_static_0100
         * @tc.number SUB_Misc_inputMethodController_onSetPreviewText_static_0100
         * @tc.desc   Test onSetPreviewText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSetPreviewText_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSetPreviewText_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range): void =>  {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onSetPreviewText(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offSetPreviewText_static_0100
         * @tc.number SUB_Misc_inputMethodController_offSetPreviewText_static_0100
         * @tc.desc   Test offSetPreviewText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offSetPreviewText_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSetPreviewText_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range): void => {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onSetPreviewText(callback);
                inputMethodCtrl.offSetPreviewText(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offSetPreviewText_static_0200
        * @tc.number SUB_Misc_inputMethodController_offSetPreviewText_static_0200
        * @tc.desc   Test offSetPreviewText interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offSetPreviewText_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offSetPreviewText_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range): void => {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onSetPreviewText(callback);
                inputMethodCtrl.offSetPreviewText();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onFinishTextPreview_static_0100
         * @tc.number SUB_Misc_inputMethodController_onFinishTextPreview_static_0100
         * @tc.desc   Test onFinishTextPreview interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onFinishTextPreview_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onFinishTextPreview_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (): void =>  {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onFinishTextPreview(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_offFinishTextPreview_static_0100
         * @tc.number SUB_Misc_inputMethodController_offFinishTextPreview_static_0100
         * @tc.desc   Test offFinishTextPreview interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_offFinishTextPreview_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offFinishTextPreview_static_0100';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (): void => {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onFinishTextPreview(callback);
                inputMethodCtrl.offFinishTextPreview(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodController_offFinishTextPreview_static_0200
        * @tc.number SUB_Misc_inputMethodController_offFinishTextPreview_static_0200
        * @tc.desc   Test offFinishTextPreview interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodController_offFinishTextPreview_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_offFinishTextPreview_static_0200';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (): void => {
                console.info(`${CASE_NAME} callback `);
            };
            try {
                inputMethodCtrl.onFinishTextPreview(callback);
                inputMethodCtrl.offFinishTextPreview();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });
    })
}
