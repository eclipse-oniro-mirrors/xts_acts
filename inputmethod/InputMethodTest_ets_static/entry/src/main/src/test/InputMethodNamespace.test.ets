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
import { Pattern, PatternOptions, inputMethodEngine } from '@kit.IMEKit';

const INVALID_INPUT_PARAMETER: int = 401;
const INVALID_INPUT_METHOD_CLIENT_DETACHED: int = 12800009;
const INVALID_INPUT_METHOD_CLIENT_ERROR: int = 12800003;
const INVALID_INPUT_METHOD_SERVICE_ERROR: int = 12800008;
const INVALID_INPUT_METHOD_CONFIG_ERROR: int = 12800005;

export default function inputMethodNamespaceTest() {
    describe('inputMethod_namespace', () => {
        /**
         * @tc.name   SUB_Misc_inputMethod_getController_static_0100
         * @tc.number SUB_Misc_inputMethod_getController_static_0100
         * @tc.desc   Test getController interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getController_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getController_static_0100';
            try {
                let controller: inputMethod.InputMethodController = inputMethod.getController();
                console.info(`${CASE_NAME} getController success`);
                expect(controller != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getSetting_static_0100
         * @tc.number SUB_Misc_inputMethod_getSetting_static_0100
         * @tc.desc   Test getSetting interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getSetting_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getSetting_static_0100';
            try {
                let setting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info(`${CASE_NAME} getSetting success`);
                expect(setting != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getDefaultInputMethod_static_0100
         * @tc.number SUB_Misc_inputMethod_getDefaultInputMethod_static_0100
         * @tc.desc   Test getDefaultInputMethod interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Misc_inputMethod_getDefaultInputMethod_static_0100', Level.LEVEL0, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getDefaultInputMethod_static_0100';
            try {
                let defaultIme: inputMethod.InputMethodProperty = inputMethod.getDefaultInputMethod();
                console.info(`${CASE_NAME} getDefaultInputMethod success: ${JSON.stringify(defaultIme)}`);
                expect(defaultIme.name != null).assertTrue();
                expect(defaultIme.id != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100
         * @tc.number SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100
         * @tc.desc   Test getSystemInputMethodConfigAbility interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getSystemInputMethodConfigAbility_static_0100';
            try {
                let config = inputMethod.getSystemInputMethodConfigAbility();
                console.info(`${CASE_NAME} getSystemInputMethodConfigAbility success: ${JSON.stringify(config)}`);
                expect(config != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getCurrentInputMethod_static_0100
         * @tc.number SUB_Misc_inputMethod_getCurrentInputMethod_static_0100
         * @tc.desc   Test getCurrentInputMethod interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getCurrentInputMethod_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getCurrentInputMethod_static_0100';
            try {
                let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
                console.info(`${CASE_NAME} getCurrentInputMethod success: ${JSON.stringify(currentIme)}`);
                expect(currentIme.name != null).assertTrue();
                expect(currentIme.id != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100
         * @tc.number SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100
         * @tc.desc   Test getCurrentInputMethodSubtype interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_getCurrentInputMethodSubtype_static_0100';
            try {
                let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
                console.info(`${CASE_NAME} getCurrentInputMethodSubtype success: ${JSON.stringify(subtype)}`);
                expect(subtype != null).assertTrue();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchInputMethod_Async_static_0100
         * @tc.desc   Test switchInputMethod interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchInputMethod_Async_static_0100';
            let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchInputMethod(currentIme, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100
         * @tc.desc   Test switchInputMethod interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchInputMethod_Promise_static_0100';
            let currentIme: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            try {
                let result: boolean = await inputMethod.switchInputMethod(currentIme);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100
         * @tc.desc   Test switchCurrentInputMethodSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Async_static_0100';
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let extra: Record<string, string> = {};
            let target: InputMethodMethod = {
                id: subtype.id,
                label: subtype.label,
                name: subtype.name,
                mode: subtype.mode,
                locale: subtype.locale,
                language: subtype.language,
                icon: subtype.icon,
                iconId: subtype.iconId,
                extra: extra
            };
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchCurrentInputMethodSubtype(target, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100
         * @tc.desc   Test switchCurrentInputMethodSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodSubtype_Promise_static_0100';
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let extra: Record<string, string> = {};
            let target: InputMethodMethod = {
                id: subtype.id,
                label: subtype.label,
                name: subtype.name,
                mode: subtype.mode,
                locale: subtype.locale,
                language: subtype.language,
                icon: subtype.icon,
                iconId: subtype.iconId,
                extra: extra
            };
            try {
                let result: boolean = await inputMethod.switchCurrentInputMethodSubtype(target);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100
         * @tc.desc   Test switchCurrentInputMethodAndSubtype interface with callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Async_static_0100';
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            let CallBack = (error: BusinessError | null, data: boolean | undefined) => {
                if (error != null) {
                    console.info(`${CASE_NAME} execution fail, error: [${error.code}, ${error.message}]`);
                    expect(error.code === 201).assertTrue();
                } else {
                    console.info(`${CASE_NAME} execution success`);
                    expect().assertFail();
                }
                done();
            };
            try {
                inputMethod.switchCurrentInputMethodAndSubtype(inputM, subtype, CallBack);
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100
         * @tc.number SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100
         * @tc.desc   Test switchCurrentInputMethodAndSubtype interface with promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_switchCurrentInputMethodAndSubtype_Promise_static_0100';
            let inputM: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
            let subtype: InputMethodMethod = inputMethod.getCurrentInputMethodSubtype();
            try {
                let result: boolean = await inputMethod.switchCurrentInputMethodAndSubtype(inputM, subtype);
                console.info(`${CASE_NAME} execution success, result: ${result}`);
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code === 201).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100
         * @tc.number SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100
         * @tc.desc   Test setSimpleKeyboardEnabled interface with enable=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0100';
            try {
                inputMethod.setSimpleKeyboardEnabled(true);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200
         * @tc.number SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200
         * @tc.desc   Test setSimpleKeyboardEnabled interface with enable=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_setSimpleKeyboardEnabled_static_0200';
            try {
                inputMethod.setSimpleKeyboardEnabled(false);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_onAttachmentDidFail_static_0100
         * @tc.number SUB_Misc_inputMethod_onAttachmentDidFail_static_0100
         * @tc.desc   Test onAttachmentDidFail interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_onAttachmentDidFail_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_onAttachmentDidFail_static_0100';
            let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
                expect(typeof(reason.CALLER_NOT_FOCUSED)).assertEqual('int');
                expect(typeof(reason.IME_ABNORMAL)).assertEqual('int');
                expect(typeof(reason.IME_ABNORMAL)).assertEqual('int');
            };
            try {
                inputMethod.onAttachmentDidFail(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_Misc_inputMethod_offAttachmentDidFail_static_0100
         * @tc.number SUB_Misc_inputMethod_offAttachmentDidFail_static_0100
         * @tc.desc   Test offAttachmentDidFail interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_offAttachmentDidFail_static_0100', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_offAttachmentDidFail_static_0100';
            let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
            };
            try {
                inputMethod.onAttachmentDidFail(callback);
                inputMethod.offAttachmentDidFail(callback);
                console.info(`${CASE_NAME} execution success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });

        /**
 	          * @tc.name   SUB_Misc_inputMethod_offAttachmentDidFail_static_0200
 	          * @tc.number SUB_Misc_inputMethod_offAttachmentDidFail_static_0200
 	          * @tc.desc   Test offAttachmentDidFail interface
 	          * @tc.type   FUNCTION
 	          * @tc.size   MEDIUMTEST
 	          * @tc.level  LEVEL2
 	          */
 	         it('SUB_Misc_inputMethod_offAttachmentDidFail_static_0200', Level.LEVEL2, async (done: () => void) => {
 	             const CASE_NAME: string = 'SUB_Misc_inputMethod_offAttachmentDidFail_static_02100';
 	             let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
 	                 console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
 	             };
 	             try {
 	                 inputMethod.onAttachmentDidFail(callback);
 	                 inputMethod.offAttachmentDidFail();
 	                 console.info(`${CASE_NAME} execution success`);
 	                 done();
 	             } catch (error) {
 	                 console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
 	                 expect().assertFail();
 	                 done();
 	             }
 	         });

        /**
         * @tc.name   SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100
         * @tc.number SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100
         * @tc.desc   Test MAX_TYPE_NUM constant
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_MAX_TYPE_NUM_static_0100';
            console.info(`${CASE_NAME} MAX_TYPE_NUM: ${inputMethod.MAX_TYPE_NUM}`);
            expect(inputMethod.MAX_TYPE_NUM === 128).assertTrue();
            done();
        });

        /**
        * @tc.name   SUB_Misc_inputMethod_property_static_0100
        * @tc.number SUB_Misc_inputMethod_property_static_0100
        * @tc.desc   Test MAX_TYPE_NUM constant
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('SUB_Misc_inputMethod_property_static_0100', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_property_static_0100';
            console.info(`${CASE_NAME} CapitalizeMode.WORDS: ${inputMethodEngine.CapitalizeMode.WORDS}`);
            expect(inputMethodEngine.CapitalizeMode.WORDS === 2).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.RequestKeyboardReason.TOUCH: ${inputMethodEngine.RequestKeyboardReason.TOUCH}`);
            expect(inputMethodEngine.RequestKeyboardReason.TOUCH === 2).assertTrue();
            console.info(`${CASE_NAME} CapitalizeMode.SENTENCES: ${inputMethodEngine.CapitalizeMode.SENTENCES}`);
            expect(inputMethodEngine.CapitalizeMode.SENTENCES === 1).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.ExtendAction.SELECT_ALL: ${inputMethodEngine.ExtendAction.SELECT_ALL}`);
            expect(inputMethodEngine.ExtendAction.SELECT_ALL === 0).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.ExtendAction.PASTE: ${inputMethodEngine.ExtendAction.PASTE}`);
            expect(inputMethodEngine.ExtendAction.PASTE === 5).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.RequestKeyboardReason.OTHER: ${inputMethodEngine.RequestKeyboardReason.OTHER}`);
            expect(inputMethodEngine.RequestKeyboardReason.OTHER === 20).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE: ${inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE}`);
            expect(inputMethodEngine.ImmersiveMode.NONE_IMMERSIVE === 0).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.GradientMode.NONE: ${inputMethodEngine.GradientMode.NONE}`);
            expect(inputMethodEngine.GradientMode.NONE === 0).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.RequestKeyboardReason.NONE: ${inputMethodEngine.RequestKeyboardReason.NONE}`);
            expect(inputMethodEngine.RequestKeyboardReason.NONE === 0).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.RequestKeyboardReason.MOUSE: ${inputMethodEngine.RequestKeyboardReason.MOUSE}`);
            expect(inputMethodEngine.RequestKeyboardReason.MOUSE === 1).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.SecurityMode.FULL: ${inputMethodEngine.SecurityMode.FULL}`);
            expect(inputMethodEngine.SecurityMode.FULL === 1).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.ExtendAction.CUT: ${inputMethodEngine.ExtendAction.CUT}`);
            expect(inputMethodEngine.ExtendAction.CUT === 3).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.Direction.CURSOR_UP: ${inputMethodEngine.Direction.CURSOR_UP}`);
            expect(inputMethodEngine.Direction.CURSOR_UP === 1).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.Direction.CURSOR_DOWN: ${inputMethodEngine.Direction.CURSOR_DOWN}`);
            expect(inputMethodEngine.Direction.CURSOR_DOWN === 2).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.Direction.CURSOR_LEFT: ${inputMethodEngine.Direction.CURSOR_LEFT}`);
            expect(inputMethodEngine.Direction.CURSOR_LEFT === 3).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.Direction.CURSOR_RIGHT: ${inputMethodEngine.Direction.CURSOR_RIGHT}`);
            expect(inputMethodEngine.Direction.CURSOR_RIGHT === 4).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.ExtendAction.COPY: ${inputMethodEngine.ExtendAction.COPY}`);
            expect(inputMethodEngine.ExtendAction.COPY === 4).assertTrue();
            console.info(`${CASE_NAME} inputMethodEngine.SecurityMode.BASIC: ${inputMethodEngine.SecurityMode.BASIC}`);
            expect(inputMethodEngine.SecurityMode.BASIC === 0).assertTrue();
            console.info(`${CASE_NAME} CapitalizeMode.CHARACTERS: ${inputMethodEngine.CapitalizeMode.CHARACTERS}`);
            expect(inputMethodEngine.CapitalizeMode.CHARACTERS === 3).assertTrue();
            console.info(`${CASE_NAME} CapitalizeMode.NONE: ${inputMethodEngine.CapitalizeMode.NONE}`);
            expect(inputMethodEngine.CapitalizeMode.NONE === 0).assertTrue();
            done();
        });

        /**
        * @tc.name   SUB_Misc_inputMethod_property_static_0200
        * @tc.number SUB_Misc_inputMethod_property_static_0200
        * @tc.desc   Test MAX_TYPE_NUM constant
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL1
        */
        it('SUB_Misc_inputMethod_property_static_0200', Level.LEVEL1, async (done: () => void) => {
            const CASE_NAME: string = 'SUB_Misc_inputMethod_property_static_0200';
            console.info(`${CASE_NAME} WINDOW_TYPE_INPUT_METHOD_FLOAT: ${inputMethodEngine.WINDOW_TYPE_INPUT_METHOD_FLOAT}`);
            expect(inputMethodEngine.WINDOW_TYPE_INPUT_METHOD_FLOAT === 2105).assertTrue();
            console.info(`${CASE_NAME} PATTERN_USER_NAME: ${inputMethodEngine.PATTERN_USER_NAME}`);
            expect(inputMethodEngine.PATTERN_USER_NAME === 10).assertTrue();
            console.info(`${CASE_NAME} PATTERN_URI: ${inputMethodEngine.PATTERN_URI}`);
            expect(inputMethodEngine.PATTERN_URI === 6).assertTrue();
            console.info(`${CASE_NAME} PATTERN_TEXT: ${inputMethodEngine.PATTERN_TEXT}`);
            expect(inputMethodEngine.PATTERN_TEXT === 0).assertTrue();
            console.info(`${CASE_NAME} PATTERN_PHONE: ${inputMethodEngine.PATTERN_PHONE}`);
            expect(inputMethodEngine.PATTERN_PHONE === 3).assertTrue();
            console.info(`${CASE_NAME} PATTERN_PASSWORD_SCREEN_LOCK: ${inputMethodEngine.PATTERN_PASSWORD_SCREEN_LOCK}`);
            expect(inputMethodEngine.PATTERN_PASSWORD_SCREEN_LOCK === 9).assertTrue();
            console.info(`${CASE_NAME} PATTERN_PASSWORD_NUMBER: ${inputMethodEngine.PATTERN_PASSWORD_NUMBER}`);
            expect(inputMethodEngine.PATTERN_PASSWORD_NUMBER === 8).assertTrue();
            console.info(`${CASE_NAME} PATTERN_PASSWORD: ${inputMethodEngine.PATTERN_PASSWORD}`);
            expect(inputMethodEngine.PATTERN_PASSWORD === 7).assertTrue();
            console.info(`${CASE_NAME} PATTERN_ONE_TIME_CODE: ${inputMethodEngine.PATTERN_ONE_TIME_CODE}`);
            expect(inputMethodEngine.PATTERN_ONE_TIME_CODE === 13).assertTrue();
            console.info(`${CASE_NAME} PATTERN_NUMBER_DECIMAL: ${inputMethodEngine.PATTERN_NUMBER_DECIMAL}`);
            expect(inputMethodEngine.PATTERN_NUMBER_DECIMAL === 12).assertTrue();
            console.info(`${CASE_NAME} PATTERN_NUMBER: ${inputMethodEngine.PATTERN_NUMBER}`);
            expect(inputMethodEngine.PATTERN_NUMBER === 2).assertTrue();
            console.info(`${CASE_NAME} PATTERN_NULL: ${inputMethodEngine.PATTERN_NULL}`);
            expect(inputMethodEngine.PATTERN_NULL === -1).assertTrue();
            console.info(`${CASE_NAME} PATTERN_NEW_PASSWORD: ${inputMethodEngine.PATTERN_NEW_PASSWORD}`);
            expect(inputMethodEngine.PATTERN_NEW_PASSWORD === 11).assertTrue();
            console.info(`${CASE_NAME} PATTERN_EMAIL: ${inputMethodEngine.PATTERN_EMAIL}`);
            expect(inputMethodEngine.PATTERN_EMAIL === 5).assertTrue();
            console.info(`${CASE_NAME} PATTERN_DATETIME: ${inputMethodEngine.PATTERN_DATETIME}`);
            expect(inputMethodEngine.PATTERN_DATETIME === 4).assertTrue();
            console.info(`${CASE_NAME} OPTION_NONE: ${inputMethodEngine.OPTION_NONE}`);
            expect(inputMethodEngine.OPTION_NONE === 0).assertTrue();
            console.info(`${CASE_NAME} OPTION_NO_FULLSCREEN: ${inputMethodEngine.OPTION_NO_FULLSCREEN}`);
            expect(inputMethodEngine.OPTION_NO_FULLSCREEN === 10).assertTrue();
            console.info(`${CASE_NAME} OPTION_MULTI_LINE: ${inputMethodEngine.OPTION_MULTI_LINE}`);
            expect(inputMethodEngine.OPTION_MULTI_LINE === 1).assertTrue();
            console.info(`${CASE_NAME} OPTION_AUTO_WORDS: ${inputMethodEngine.OPTION_AUTO_WORDS}`);
            expect(inputMethodEngine.OPTION_AUTO_WORDS === 4).assertTrue();
            console.info(`${CASE_NAME} OPTION_AUTO_CAP_SENTENCES: ${inputMethodEngine.OPTION_AUTO_CAP_SENTENCES}`);
            expect(inputMethodEngine.OPTION_AUTO_CAP_SENTENCES === 8).assertTrue();
            console.info(`${CASE_NAME} OPTION_AUTO_CAP_CHARACTERS: ${inputMethodEngine.OPTION_AUTO_CAP_CHARACTERS}`);
            expect(inputMethodEngine.OPTION_AUTO_CAP_CHARACTERS === 2).assertTrue();
            console.info(`${CASE_NAME} OPTION_ASCII: ${inputMethodEngine.OPTION_ASCII}`);
            expect(inputMethodEngine.OPTION_ASCII === 20).assertTrue();
            console.info(`${CASE_NAME} FLAG_SINGLE_LINE: ${inputMethodEngine.FLAG_SINGLE_LINE}`);
            expect(inputMethodEngine.FLAG_SINGLE_LINE === 1).assertTrue();
            console.info(`${CASE_NAME} FLAG_SELECTING: ${inputMethodEngine.FLAG_SELECTING}`);
            expect(inputMethodEngine.FLAG_SELECTING === 2).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_UNSPECIFIED: ${inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_UNSPECIFIED === 0).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_SEND: ${inputMethodEngine.ENTER_KEY_TYPE_SEND}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_SEND === 4).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_SEARCH: ${inputMethodEngine.ENTER_KEY_TYPE_SEARCH}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_SEARCH === 3).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_PREVIOUS: ${inputMethodEngine.ENTER_KEY_TYPE_PREVIOUS}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_PREVIOUS === 7).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_NEXT: ${inputMethodEngine.ENTER_KEY_TYPE_NEXT}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_NEXT === 5).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_NEWLINE: ${inputMethodEngine.ENTER_KEY_TYPE_NEWLINE}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_NEWLINE === 8).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_GO: ${inputMethodEngine.ENTER_KEY_TYPE_GO}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_GO === 2).assertTrue();
            console.info(`${CASE_NAME} ENTER_KEY_TYPE_DONE: ${inputMethodEngine.ENTER_KEY_TYPE_DONE}`);
            expect(inputMethodEngine.ENTER_KEY_TYPE_DONE === 6).assertTrue();
            console.info(`${CASE_NAME} DISPLAY_MODE_PART: ${inputMethodEngine.DISPLAY_MODE_PART}`);
            expect(inputMethodEngine.DISPLAY_MODE_PART === 0).assertTrue();
            console.info(`${CASE_NAME} DISPLAY_MODE_FULL: ${inputMethodEngine.DISPLAY_MODE_FULL}`);
            expect(inputMethodEngine.DISPLAY_MODE_FULL === 1).assertTrue();
            console.info(`${CASE_NAME} CURSOR_UP: ${inputMethodEngine.CURSOR_UP}`);
            expect(inputMethodEngine.CURSOR_UP === 1).assertTrue();
            console.info(`${CASE_NAME} CURSOR_RIGHT: ${inputMethodEngine.CURSOR_RIGHT}`);
            expect(inputMethodEngine.CURSOR_RIGHT === 4).assertTrue();
            console.info(`${CASE_NAME} CURSOR_LEFT: ${inputMethodEngine.CURSOR_LEFT}`);
            expect(inputMethodEngine.CURSOR_LEFT === 3).assertTrue();
            console.info(`${CASE_NAME} CURSOR_DOWN: ${inputMethodEngine.CURSOR_DOWN}`);
            expect(inputMethodEngine.CURSOR_DOWN === 2).assertTrue();
            done();
        });



        /**
 	      * @tc.name   Sub_Misc_inputMethod_CapitalizeMode_static_0100
 	      * @tc.number Sub_Misc_inputMethod_CapitalizeMode_static_0100
 	      * @tc.desc   Function test
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('Sub_Misc_inputMethod_CapitalizeMode_static_0100', Level.LEVEL2, async (done: () => void) => {
 	       let none = inputMethod.CapitalizeMode.NONE;
 	       console.info("====>Sub_Misc_inputMethod_CapitalizeMode_static_0100 none:" + none);
 	       expect(none).assertEqual(0);
 	       let sentences = inputMethod.CapitalizeMode.SENTENCES;
 	       console.info("====>Sub_Misc_inputMethod_CapitalizeMode_static_0100 test:" + sentences);
 	       expect(sentences).assertEqual(1);
 	       let words = inputMethod.CapitalizeMode.WORDS;
 	       console.info("====>Sub_Misc_inputMethod_CapitalizeMode_static_0100 nultiline:" + words);
 	       expect(words).assertEqual(2);
 	       let characters = inputMethod.CapitalizeMode.CHARACTERS;
 	       console.info("====>Sub_Misc_inputMethod_CapitalizeMode_static_0100 number:" + characters);
 	       expect(characters).assertEqual(3);
 	 
 	       done();
 	     });
 	     /**
 	      * @tc.name   Sub_Misc_inputMethod_AttachFailureReason_static_0100
 	      * @tc.number Sub_Misc_inputMethod_AttachFailureReason_static_0100
 	      * @tc.desc   Function test
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('Sub_Misc_inputMethod_AttachFailureReason_static_0100', Level.LEVEL2, async (done: () => void) => {
 	       let caller_not_focused = inputMethod.AttachFailureReason.CALLER_NOT_FOCUSED;
 	       console.info("====>Sub_Misc_inputMethod_AttachFailureReason_static_100 none:" + caller_not_focused);
 	       expect(caller_not_focused).assertEqual(0);
 	       let ime_abnormal = inputMethod.AttachFailureReason.IME_ABNORMAL;
 	       console.info("====>Sub_Misc_inputMethod_AttachFailureReason_static_0100 test:" + ime_abnormal);
 	       expect(ime_abnormal).assertEqual(1);
 	       let service_abnormal = inputMethod.AttachFailureReason.SERVICE_ABNORMAL;
 	       console.info("====>Sub_Misc_inputMethod_AttachFailureReason_static_0100 nultiline:" + service_abnormal);
 	       expect(service_abnormal).assertEqual(2);
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   Sub_InputMethod_IMF_AttachOptions_static_0100
 	      * @tc.number Sub_InputMethod_IMF_AttachOptions_static_0100
 	      * @tc.desc   Function test
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('Sub_InputMethod_IMF_AttachOptions_static_0100', Level.LEVEL3, async (done: () => void) => {
 	         const CASE_NAME = '====>Sub_InputMethod_IMF_AttachOptions_static_0100';
 	         let attachOptions: inputMethod.AttachOptions = {
 	           requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
 	           showKeyboard: true
 	          };
 	         expect(attachOptions.requestKeyboardReason).assertEqual(0);
 	         expect(attachOptions.showKeyboard).assertTrue();
 	         done();
 	     });
 	   
 	     /**
 	     * @tc.name   Sub_InputMethod_IMF_TextConfig_static_0100
 	     * @tc.number Sub_InputMethod_IMF_TextConfig_static_0100
 	     * @tc.desc   Function test
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL3
 	     */
 	    it('Sub_InputMethod_IMF_TextConfig_static_0100', Level.LEVEL3, async (done: () => void) => {
 	        const CASE_NAME = '====>Sub_InputMethod_IMF_TextConfig_static_0100';
            let attribute: inputMethod.InputAttribute = {
                textInputType: inputMethod.TextInputType.TEXT,
                enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            }
 	        let ATTRIBUTE: inputMethod.TextConfig = {
 	         inputAttribute:attribute,
 	         newEditBox: true,
 	         capitalizeMode: inputMethod.CapitalizeMode.NONE
 	     }
 	        expect(typeof(ATTRIBUTE.inputAttribute)).assertEqual('object');
 	        expect(typeof(ATTRIBUTE.newEditBox)).assertEqual('boolean');
 	        expect(typeof(ATTRIBUTE.capitalizeMode)).assertEqual('int');
 	        done();
 	    });

        /**
         * @tc.name   Sub_InputMethod_IMF_EasyConnStatic_0800
         * @tc.number SUB_INPUTMETHOD_IMF_EASYCONNSTATIC_0800
         * @tc.desc   Test onAttachmentDidFail interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IMF_EasyConnStatic_0800', Level.LEVEL2, async (done: () => void) => {
            const CASE_NAME: string = 'Sub_InputMethod_IMF_EasyConnStatic_0800';
            let callback: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason: ${reason}`);
            };
            let callback1: (reason: inputMethod.AttachFailureReason) => void = (reason: inputMethod.AttachFailureReason): void => {
                console.info(`${CASE_NAME} attachment failed, reason1: ${reason}`);
            };
            try {
                inputMethod.onAttachmentDidFail(callback);
                console.info(`${CASE_NAME} onAttachmentDidFail success`);
                inputMethod.onAttachmentDidFail(callback1);
                console.info(`${CASE_NAME} onAttachmentDidFail1 success`);
                inputMethod.offAttachmentDidFail(callback);
                console.info(`${CASE_NAME} offAttachmentDidFail success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
        });
    })
}
