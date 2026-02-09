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
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
export default function inputMethodAttachTest() {
    describe('inputMethod_attach', () => {
        /**
         * @tc.name   SUB_Misc_inputMethod_attach_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_attach_Async_static_0100
         * @tc.desc   Call the attach interface in Async mode. Optional input parameter showkeyboard=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_attach_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_static_0100';
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            }
            let info: inputMethod.CursorInfo = {
                left: 2.0,
                top: 2.0,
                width: 2.0,
                height: 2.0
            }
            let range: inputMethod.Range = {
                start: 1,
                end:2
            }
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: attribute,
                cursorInfo:info,
                selection:range,
                windowId:100
            }
            let CallBack = (error: BusinessError | null) => {
                expect(error == null).assertTrue();
                if (error?.code != 0) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
            } catch (error: BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_attach_Async_static_0200
         * @tc.number SUB_Misc_inputMethod_attach_Async_static_0200
         * @tc.desc   Call the attach interface in Async mode. Optional input parameter showkeyboard=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_attach_Async_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_static_0200';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            let CallBack = (error: BusinessError | null) => {
                expect(error == null).assertTrue();
                if (error?.code != 0) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                done();
            };
            try {
                inputMethod.getController().attach(false, ATTRIBUTE, CallBack);
            } catch (error: BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_attach_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_attach_Promise_static_0100
         * @tc.desc   Call the attach interface in Promise mode. Optional input parameter showkeyboard=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_attach_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_static_0100';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            try {
                await inputMethod.getController().attach(true, ATTRIBUTE);
                console.info(`${CASE_NAME} execution success`);
                expect(ATTRIBUTE != null).assertTrue();
                done();
            } catch (error: BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_attach_Promise_static_0200
         * @tc.number SUB_Misc_inputMethod_attach_Promise_static_0200
         * @tc.desc   Call the attach interface in Promise mode. Optional input parameter showkeyboard=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_attach_Promise_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_static_0200';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            try {
                await inputMethod.getController().attach(false, ATTRIBUTE);
                console.info(`${CASE_NAME} execution success`);
                expect(ATTRIBUTE != null).assertTrue();
                done();
            } catch (error: BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_attach_Promise_static_0300
         * @tc.number SUB_Misc_inputMethod_attach_Promise_static_0300
         * @tc.desc   Call the attach interface in Promise mode.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_attach_Promise_static_0300', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_static_0300';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            const reason = inputMethod.RequestKeyboardReason.NONE;
            try {
                await inputMethod.getController().attach(false, ATTRIBUTE, reason);
                console.info(`${CASE_NAME} execution success`);
                expect(ATTRIBUTE != null).assertTrue();
                done();
            } catch (error: BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });
    })
}