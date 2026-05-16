/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'

export default function inputMethodNoAttachTest() {
    describe('inputMethodNoAttachTest', () => {

        beforeAll(async (): Promise<void> => {
            console.info('====>inputMethodNoAttachTest beforeAll start');
            try {
                await inputMethod.getController().detach();
                console.info(`====>inputMethodNoAttachTest close inputMethod success`);
            } catch (error) {
                console.info(`====>inputMethodNoAttachTest close inputMethod fail, error: [${error.code}, ${error.message}]`);
            };
            console.info('====>inputMethodNoAttachTest beforeAll end');
        })

        /**
         * @tc.name   SUB_Misc_inputMethodController_discardTypingText_Parser_static_0101
         * @tc.number SUB_Misc_inputMethodController_discardTypingText_Parser_static_0101
         * @tc.desc   Test discardTypingText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_discardTypingText_Parser_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_discardTypingText_Parser_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            try {
                await inputMethodCtrl.discardTypingText();
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_setCallingWindow_Async_static_0101
         * @tc.number SUB_Misc_inputMethodController_setCallingWindow_Async_static_0101
         * @tc.desc   Test setCallingWindow interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_setCallingWindow_Async_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_setCallingWindow_Async_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let windowId: int = 1;
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code).assertEqual(12800009);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethodCtrl.setCallingWindow(windowId, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0102
         * @tc.number SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0102
         * @tc.desc   Test setCallingWindow interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0102', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_setCallingWindow_Parser_static_0102';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let windowId: int = 1;
            try {
                await inputMethodCtrl.setCallingWindow(windowId);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateCursor_Async_static_0101
         * @tc.number SUB_Misc_inputMethodController_updateCursor_Async_static_0101
         * @tc.desc   Test updateCursor interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Misc_inputMethodController_updateCursor_Async_static_0101', Level.LEVEL0, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateCursor_Async_static_0101';
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
                    expect(error.code).assertEqual(12800009);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethodCtrl.updateCursor(cursorInfo, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateCursor_Parser_static_0101
         * @tc.number SUB_Misc_inputMethodController_updateCursor_Parser_static_0101
         * @tc.desc   Test updateCursor interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateCursor_Parser_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateCursor_Parser_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let cursorInfo: inputMethod.CursorInfo = {
                left: 100.0,
                top: 200.0,
                width: 10.0,
                height: 20.0,
                displayId: 0
            };
            try {
                await inputMethodCtrl.updateCursor(cursorInfo);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_changeSelection_Async_static_0101
         * @tc.number SUB_Misc_inputMethodController_changeSelection_Async_static_0101
         * @tc.desc   Test changeSelection interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_changeSelection_Async_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_changeSelection_Async_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let text: string = "Hello World";
            let start: int = 0;
            let end: int = 5;
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code).assertEqual(12800009);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethodCtrl.changeSelection(text, start, end, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_changeSelection_Parser_static_0101
         * @tc.number SUB_Misc_inputMethodController_changeSelection_Parser_static_0101
         * @tc.desc   Test changeSelection interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_changeSelection_Parser_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_changeSelection_Parser_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let text: string = "Hello World";
            let start: int = 0;
            let end: int = 5;
            try {
                await inputMethodCtrl.changeSelection(text, start, end);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateAttribute_Async_static_0101
         * @tc.number SUB_Misc_inputMethodController_updateAttribute_Async_static_0101
         * @tc.desc   Test updateAttribute interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateAttribute_Async_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateAttribute_Async_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.DONE
            };
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code).assertEqual(12800009);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethodCtrl.updateAttribute(attribute, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_updateAttribute_Parser_static_0101
         * @tc.number SUB_Misc_inputMethodController_updateAttribute_Parser_static_0101
         * @tc.desc   Test updateAttribute interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_updateAttribute_Parser_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_updateAttribute_Parser_static_0101';
            let inputMethodCtrl: inputMethod.InputMethodController = inputMethod.getController();
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.DONE
            };
            try {
                await inputMethodCtrl.updateAttribute(attribute);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onInsertText_static_0101
         * @tc.number SUB_Misc_inputMethodController_onInsertText_static_0101
         * @tc.desc   Test onInsertText interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onInsertText_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onInsertText_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (text: string) => {
                console.info(`${CASE_NAME} callback text: ${text}`);
            };
            try {
                inputMethodCtrl.onInsertText(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onDeleteLeft_static_0101
         * @tc.number SUB_Misc_inputMethodController_onDeleteLeft_static_0101
         * @tc.desc   Test onDeleteLeft interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onDeleteLeft_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onDeleteLeft_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteLeft(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onDeleteRight_static_0101
         * @tc.number SUB_Misc_inputMethodController_onDeleteRight_static_0101
         * @tc.desc   Test onDeleteRight interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onDeleteRight_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onDeleteRight_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (length: int) => {
                console.info(`${CASE_NAME} callback length: ${length}`);
            };
            try {
                inputMethodCtrl.onDeleteRight(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0101
         * @tc.number SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0101
         * @tc.desc   Test onSendKeyboardStatus interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSendKeyboardStatus_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (keyboardStatus: inputMethod.KeyboardStatus) => {
                console.info(`${CASE_NAME} callback keyboardStatus: ${keyboardStatus}`);
            };
            try {
                inputMethodCtrl.onSendKeyboardStatus(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onSendFunctionKey_static_0101
         * @tc.number SUB_Misc_inputMethodController_onSendFunctionKey_static_0101
         * @tc.desc   Test onSendFunctionKey interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onSendFunctionKey_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onSendFunctionKey_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (functionKey: inputMethod.FunctionKey) => {
                console.info(`${CASE_NAME} callback functionKey.enterKeyType: ${functionKey.enterKeyType}`);
            };
            try {
                inputMethodCtrl.onSendFunctionKey(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onMoveCursor_static_0101
         * @tc.number SUB_Misc_inputMethodController_onMoveCursor_static_0101
         * @tc.desc   Test onMoveCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onMoveCursor_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onMoveCursor_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (direction: inputMethod.Direction) => {
                console.info(`${CASE_NAME} callback direction: ${direction}`);
            };
            try {
                inputMethodCtrl.onMoveCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onHandleExtendAction_static_0101
         * @tc.number SUB_Misc_inputMethodController_onHandleExtendAction_static_0101
         * @tc.desc   Test onHandleExtendAction interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onHandleExtendAction_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onHandleExtendAction_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback = (action: inputMethod.ExtendAction) => {
                console.info(`${CASE_NAME} callback action: ${action}`);
            };
            try {
                inputMethodCtrl.onHandleExtendAction(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0101
         * @tc.number SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0101
         * @tc.desc   Test onGetLeftTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetLeftTextOfCursor_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetLeftTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0101
         * @tc.number SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0101
         * @tc.desc   Test onGetRightTextOfCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetRightTextOfCursor_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextCallback = (length: int): string => {
                console.info(`${CASE_NAME} callback length: ${length}`);
                let text:string = "";
                return text;
            };
            try {
                inputMethodCtrl.onGetRightTextOfCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0101
         * @tc.number SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0101
         * @tc.desc   Test onGetTextIndexAtCursor interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodController_onGetTextIndexAtCursor_static_0101';
            let inputMethodCtrl = inputMethod.getController();
            let callback: inputMethod.GetTextIndexAtCursorCallback = (): int =>  {
                console.info(`${CASE_NAME} callback `);
                let index:int = 0;
                return index;
            };
            try {
                inputMethodCtrl.onGetTextIndexAtCursor(callback);
                console.info(`${CASE_NAME} execution success`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(12800009);
                done();
            }
        });

        

    })
}