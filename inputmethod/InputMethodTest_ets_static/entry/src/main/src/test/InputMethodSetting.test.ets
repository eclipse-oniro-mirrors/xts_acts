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
import InputMethodSubtype from '@ohos.InputMethodSubtype';

const INVALID_INPUT_PARAMETER: int = 401;
const INVALID_INPUT_METHOD_SERVICE_ERROR: int = 12800008;
const INVALID_BUNDLE_MANAGER_ERROR: int = 12800001;

export default function inputMethodSettingTest() {
    describe('inputMethod_setting', () => {
        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100
         * @tc.desc   Test getInputMethods interface with callback, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getInputMethods(true, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200
         * @tc.desc   Test getInputMethods interface with callback, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Async_static_0200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getInputMethods(false, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100
         * @tc.desc   Test getInputMethods interface with promise, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getInputMethods(true);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200
         * @tc.desc   Test getInputMethods interface with promise, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethods_Promise_static_0200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getInputMethods(false);
                console.info(`${CASE_NAME} execution: success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100
         * @tc.desc   Test getInputMethodsSync interface, enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getInputMethodsSync(true);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200
         * @tc.number SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200
         * @tc.desc   Test getInputMethodsSync interface, enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getInputMethodsSync_static_0200200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getInputMethodsSync(false);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100
         * @tc.desc   Test getAllInputMethods interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethods_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: inputMethod.InputMethodProperty[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.getAllInputMethods(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100
         * @tc.desc   Test getAllInputMethods interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethods_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = await inputMethodSetting.getAllInputMethods();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100
         * @tc.desc   Test getAllInputMethodsSync interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_getAllInputMethodsSync_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: inputMethod.InputMethodProperty[] = inputMethodSetting.getAllInputMethodsSync();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100
         * @tc.desc   Test listInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listInputMethodSubtype_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let CallBack = (error: BusinessError | null, data: InputMethodMethod[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.listInputMethodSubtype(inputM, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test listInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listInputMethodSubtype_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            try {
                let data: InputMethodMethod[] = await inputMethodSetting.listInputMethodSubtype(inputM);
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100
         * @tc.desc   Test listCurrentInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Async_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let CallBack = (error: BusinessError | null, data: InputMethodMethod[] | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect(data != undefined).assertTrue();
                }
                done();
            };
            try {
                inputMethodSetting.listCurrentInputMethodSubtype(CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test listCurrentInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_listCurrentInputMethodSubtype_Promise_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            try {
                let data: InputMethodMethod[] = await inputMethodSetting.listCurrentInputMethodSubtype();
                console.info(`${CASE_NAME} execution success`);
                expect(data.length >= 0).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_onImeChange_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_onImeChange_static_0100
         * @tc.desc   Test onImeChange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_onImeChange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_onImeChange_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let callback: inputMethod.ImeChangeCallback = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodMethod): void => {
                console.info(`${CASE_NAME} imeChange callback triggered`);
            };
            try {
                inputMethodSetting.onImeChange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethodSetting_offImeChange_static_0100
         * @tc.number SUB_Misc_inputMethodSetting_offImeChange_static_0100
         * @tc.desc   Test offImeChange interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethodSetting_offImeChange_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_offImeChange_static_0100';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let callback: inputMethod.ImeChangeCallback = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodMethod): void => {
                console.info(`${CASE_NAME} imeChange callback triggered`);
            };
            try {
                inputMethodSetting.onImeChange(callback);
                inputMethodSetting.offImeChange(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
        * @tc.name   SUB_Misc_inputMethodSetting_offImeChange_static_0200
        * @tc.number SUB_Misc_inputMethodSetting_offImeChange_static_0200
        * @tc.desc   Test offImeChange interface
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('SUB_Misc_inputMethodSetting_offImeChange_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethodSetting_offImeChange_static_0200';
            let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
            let callback: inputMethod.ImeChangeCallback = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodMethod): void => {
                console.info(`${CASE_NAME} imeChange callback triggered`);
            };
            try {
                inputMethodSetting.onImeChange(callback);
                inputMethodSetting.offImeChange();
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_InputMethod_IME_InputMethodState_static_0901
         * @tc.number Sub_InputMethod_IME_InputMethodState_static_0901
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_InputMethodState_static_0901', Level.LEVEL2, async (done: () => void) => {
            const testName = 'Sub_InputMethod_IME_InputMethodState_static_0901';
            try{
                let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info(`====>${testName} getSetting success`);
                let state:inputMethod.EnabledState =  await inputMethodSetting.getInputMethodState();
                console.info(`====>${testName} state is:${state}`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch err errCode:${err.code}, errMessage:${err.message}`)
                expect(err.code).assertEqual(12800004);
                done();
            };
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_0400
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_0400
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_0400', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_0400';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.DISABLED,
                label: '',
                icon: ''
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }     
                });
            } catch (err) {
                console.info(`====>${testName} catch.errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_0500
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_0500
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_0500', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_0500';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.BASIC_MODE
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }   
                });
            } catch (err) {
                console.info(`====>${testName} catch.errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_0600
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_0600
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_0600', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_0600';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.FULL_EXPERIENCE_MODE
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    } 
                });
            } catch (err) {
                console.info(`====>${testName} catch.errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_0800
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_0800
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_0800', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_0800';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.DISABLED,
                label: '',
                icon: ''
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                await inputMethodSetting.listInputMethodSubtype(inputMethodProperty);
                console.info(`====>${testName} success`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch.errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_0900
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_0900
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_0900', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_0900';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.BASIC_MODE
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                await inputMethodSetting.listInputMethodSubtype(inputMethodProperty);
                console.info(`====>${testName}  success`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch.errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });
  
        /**
         * @tc.name   Sub_Inputmethod_IMF_listInputMethodSubtype_static_1000
         * @tc.number Sub_Inputmethod_IMF_listInputMethodSubtype_static_1000
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_listInputMethodSubtype_static_1000', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_listInputMethodSubtype_static_1000';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.FULL_EXPERIENCE_MODE
            };
            try{
                let inputMethodSetting = inputMethod.getSetting();
                await inputMethodSetting.listInputMethodSubtype(inputMethodProperty); 
                console.info(`====>${testName}  success`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.name   inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.number inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            const testName = 'inputMethod_test_switchCurrentInputMethodSubtype_static_001';
            let inputMS = inputMethod.getCurrentInputMethodSubtype();
            console.info(`====>${testName} getCurrentInputMethodSubtype:${JSON.stringify(inputMS)}`);
            let inputMethodSubProperty: InputMethodSubtype = {
                id: inputMS.id,
                label: "",
                labelId: 123,
                name: inputMS.name,
                mode: "lower",
                locale: "",
                language: "",
                icon: "",
                iconId: 0,
                extra: {}
            };
    
            inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err, data) => {
                try {
                    if (err) {
                        console.info(`====>${testName} failed errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(201);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    } 
                } catch (err) {
                    console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                    done();
                }
            });
        });

        /**
         * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_001
         * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            const testName = 'inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_001';
            let inputMS = inputMethod.getCurrentInputMethodSubtype();
            console.info(`====>${testName} getCurrentInputMethodSubtype: ${JSON.stringify(inputMS)}`);
            let inputMethodSubProperty: InputMethodSubtype = {
                id: inputMS.id,
                label: '',
                name: inputMS.name,
                mode: 'lower',
                locale: '',
                language: '',
                icon: '',
                iconId: 0,
                extra: {}
            };
    
            inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err, data) => {
                try {
                    if (err) {
                        console.info(`====>${testName} failed. errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(201);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    } 
                } catch (err) {
                    console.info(`====>${testName} catch. errcode: ${err.code},message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_002
         * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_002', Level.LEVEL2, async (done: () => void) => {
            const testName = 'inputMethodNormalStage_test_switchCurrentInputMethodSubtype_static_002';
            let inputMS = inputMethod.getCurrentInputMethodSubtype();
            console.info(`====>${testName} getCurrentInputMethodSubtype: ${JSON.stringify(inputMS)}`);
            let inputMethodSubProperty: InputMethodSubtype = {
                id: inputMS.id,
                label: '',
                name: inputMS.name,
                mode: 'lower',
                locale: '',
                language: '',
                icon: '',
                iconId: 0,
                extra: {}
            };
            try {
                await inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty);
                console.info(`====>${testName} success`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.name   inputmethod_test_switchInputMethod_static_001
         * @tc.number inputmethod_test_switchInputMethod_static_001
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('inputmethod_test_switchInputMethod_static_001', Level.LEVEL0, async (done: () => void) => {
            const testName = 'inputmethod_test_switchInputMethod_static_001';
            let inputM = inputMethod.getCurrentInputMethod()
            console.info(`====>${testName} getCurrentInputMethod: ${JSON.stringify(inputM)}`);
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: inputM.name,
                id: inputM.id,
                extra: {}
            };
            try {
                let data = await inputMethod.switchInputMethod(inputMethodProperty);
                console.info(`====>${testName} success. data: ${data}`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`====>${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(201);
                done();
            }
        });

        /**
         * @tc.name   inputmethod_test_switchInputMethod_static_002
         * @tc.number inputmethod_test_switchInputMethod_static_002
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethod_test_switchInputMethod_static_002', Level.LEVEL2, async (done: () => void) => {
            const testName = 'inputmethod_test_switchInputMethod_static_002';
            let inputM = inputMethod.getCurrentInputMethod()
            console.info(`====>${testName} getCurrentInputMethod: ${JSON.stringify(inputM)}`);
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: inputM.name,
                id: inputM.id,
                extra: {}
            };
            inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
                try {
                    if (err) {
                        console.info(`====>${testName} failed. errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(201);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_0400
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_0400
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_0400', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_0400';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.DISABLED,
                label: '',
                icon: ''
            };
            try{
                inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed. errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_0500
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_0500
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_0500', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_0500';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.BASIC_MODE,
                label: '',
                icon: ''
            };
            try{
                inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed. errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_0600
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_0600
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_0600', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_0600';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.FULL_EXPERIENCE_MODE,
            };
            try{
                inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
                    if (err) {
                        console.info(`====>${testName} failed. errcode: ${err.code},message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`====>${testName} success. data: ${data}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_0800
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_0800
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_0800', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_0800';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.DISABLED,
                label: '',
                icon: ''
            };
            try{
                await inputMethod.switchInputMethod(inputMethodProperty);
                console.info(`====>${testName} success.`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_0900
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_0900
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_0900', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_0900';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.BASIC_MODE,
                label: '',
                icon: ''
            };
            try{
                await inputMethod.switchInputMethod(inputMethodProperty);
                console.info(`====>${testName} success.`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });

        /**
         * @tc.name   Sub_Inputmethod_IMF_switchInputMethod_static_1000
         * @tc.number Sub_Inputmethod_IMF_switchInputMethod_static_1000
         * @tc.desc   401 Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Inputmethod_IMF_switchInputMethod_static_1000', Level.LEVEL3, async (done: () => void) => {
            const testName = 'Sub_Inputmethod_IMF_switchInputMethod_static_1000';
            let inputMethodProperty: inputMethod.InputMethodProperty = {
                name: '',
                id: '',
                enabledState: inputMethod.EnabledState.FULL_EXPERIENCE_MODE,
                label: '',
                icon: ''
            };
            try{
                await inputMethod.switchInputMethod(inputMethodProperty);
                console.info(`====>${testName} success.`);
                expect().assertFail();
                done();
            } catch (err) {
                console.info(`${testName} catch. errcode: ${err.code},message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            }
        });

    })
}
