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
import { BusinessError } from '@ohos.base'

function expectContain(a: ESObject, b: ESObject) {
    try {
        expect(a).assertContain(b);
    } catch (err) {
        console.info('assertion failure');
    }
};

function expectFalse() {
    try {
        expect().assertFail();
    } catch (err) {
        console.info('assertion failure');
    }
};

const INVALID_TYPE_NUMBER_123 = 123;

const INVALID_TYPE_STRING_123 = '123';

const INVALID_STRING_NULL = '';

const INVALID_NULL = null;

const INVALID_ENUM_N1 = -1;

const INVALID_ENUM_2 = 2;

const INVALID_INPUT_PARAMETER = 401;

const INVALID_INPUT_METHOD_CLIENT_DETACHED = 12800009;
export default function inputMethodTest() {
    describe('inputMethod_showTextInput_hideTextInput_detach', () => {
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
                } catch (error:BusinessError) {
                    console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
                }
            }
        );
        afterEach(
            async () => {
                try {
                    await inputMethod.getController().detach();
                    console.info(`clsoe inputMethod success`);
                } catch (error: BusinessError) {
                    console.info(`clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                };
            }
        );

        /**
         * @tc.name   SUB_Misc_inputMethod_showTextInput_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0100
         * @tc.desc   Async mode calls the showTextInput interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_showTextInput_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Async_static_0100';
            let CallBack = (error: BusinessError | null) => {
                if (error?.code != 0) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                expect(error == null).assertTrue();
                done();
            };
            try {
                inputMethod.getController().showTextInput(CallBack);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_showTextInput_Async_static_0400
         * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0400
         * @tc.desc   Do not bind the input method keyboard, and call the showTextInput interface in Async mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_showTextInput_Async_static_0400', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Async_static_0400';
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                    expect(error?.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                    done();
                    
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expectFalse();
                    done();
                }
            };
            try {
                let data = await inputMethod.getController().detach();
                console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
            }
            try {
                inputMethod.getController().showTextInput(CallBack);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();
                
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_showTextInput_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_showTextInput_Promise_static_0100
         * @tc.desc   Promise mode calls the showTextInput interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_showTextInput_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Promise_static_0100';
            try {
                await inputMethod.getController().showTextInput();
                console.info(`${CASE_NAME} execution success `);
                expect(CASE_NAME != null).assertTrue();
                done();
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_showTextInput_Promise_static_0400
         * @tc.number SUB_Misc_inputMethod_showTextInput_Promise_static_0400
         * @tc.desc   Do not bind the input method keyboard, and call the showTextInput interface in Promise mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_showTextInput_Promise_static_0400', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Promise_static_0400';
            try {
                let data = await inputMethod.getController().detach();
                console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
            try {
                await inputMethod.getController().showTextInput();
                console.info(`${CASE_NAME} execution success`);
                expectFalse();
                done();

            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();

            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_hideTextInput_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_hideTextInput_Async_static_0100
         * @tc.desc   Async mode calls the hideTextInput interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_hideTextInput_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_hideTextInput_Async_static_0100';
            let CallBack = (error: BusinessError | null) => {
                if (error?.code != 0) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                expect(error == null).assertTrue();
                done();
            };
            try {
                inputMethod.getController().hideTextInput(CallBack);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();

            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_hideTextInput_Async_static_0400
         * @tc.number SUB_Misc_inputMethod_hideTextInput_Async_static_0400
         * @tc.desc   The input method keyboard is not bound, and the hideTextInput interface is called in Async mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_hideTextInput_Async_static_0400', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_hideTextInput_Async_static_0400';
            let CallBack = (error: BusinessError | null) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                    expect(error?.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                    done();

                } else {
                    console.info(`${CASE_NAME} execution success `);
                    expectFalse();
                    done();

                }
            };
            try {
                let data = await inputMethod.getController().detach();
                console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
            try {
                inputMethod.getController().hideTextInput(CallBack);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();

            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_hideTextInput_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_hideTextInput_Promise_static_0100
         * @tc.desc   Promise mode calls the hideTextInput interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_hideTextInput_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_hideTextInput_Promise_static_0100';
            try {
                await inputMethod.getController().hideTextInput();
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();
            }
            try {
                await inputMethod.getController().hideTextInput();
                console.info(`${CASE_NAME} execution success `);
                done();

            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();

            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_hideTextInput_Promise_static_0400
         * @tc.number SUB_Misc_inputMethod_hideTextInput_Promise_static_0400
         * @tc.desc   The input method keyboard is not bound, and the hideTextInput interface is called in Promise mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_hideTextInput_Promise_static_0400', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_hideTextInput_Promise_static_0400';
            try {
                let data = await inputMethod.getController().detach();
                console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
            try {
                await inputMethod.getController().hideTextInput();
                console.info(`${CASE_NAME} execution success`);
                expectFalse();
                done();
                
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();
                
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_detach_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_detach_Async_static_0100
         * @tc.desc   Async mode calls the detach interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_detach_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_detach_Async_static_0100';
            let CallBack = (error: BusinessError | null) => {
                if (error?.code != 0) {
                    console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
                } else {
                    console.info(`${CASE_NAME} execution success`);
                }
                expect(error == null).assertTrue();
                done();
            };
            try {
                inputMethod.getController().detach(CallBack);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_detach_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_detach_Promise_static_0100
         * @tc.desc   Promise mode calls the detach interface without input parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_detach_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_detach_Promise_static_0100';
            try {
                await inputMethod.getController().detach();
                console.info(`${CASE_NAME} execution success `);
                expect(CASE_NAME != null).assertTrue();
                done();
                
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_showTextInput_Promise_static_0101
         * @tc.number SUB_Misc_inputMethod_showTextInput_Promise_static_0101
         * @tc.desc   Do not bind the input method keyboard, and call the showTextInput interface in Promise mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_showTextInput_Promise_static_0101', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Promise_static_0101';
            try {
                let data = await inputMethod.getController().detach();
                console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
                expectFalse();
                done();
                
            }
            const reason = inputMethod.RequestKeyboardReason.NONE;
            try {
                await inputMethod.getController().showTextInput(reason);
                console.info(`${CASE_NAME} execution success`);
                expectFalse();
                done();

            } catch (error:BusinessError) {
                console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
                expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
                done();

            }
        });
    })
}