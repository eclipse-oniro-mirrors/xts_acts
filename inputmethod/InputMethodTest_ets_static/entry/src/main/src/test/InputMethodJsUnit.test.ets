/**
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import inputMethod from '@ohos.inputMethod'
import InputMethodSubtype from '@ohos.InputMethodSubtype'
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel'
let testAbilityContext:common.UIAbilityContext;

export default function inputMethodTest() {

    describe("inputMethodTest", (): void => {
        console.info('%{public}s', 'describe start');
        beforeAll(() => {
            console.info('%{public}s', 'beforeAll start');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    testAbilityContext = abilitys.context
                    console.info('%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError | null) : void => {
                if (err != null ) {
                    console.info('%{public}s', '-----'+ err.code);
                }
                console.info('%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.inputmethodtest.static")
            await Utils.msSleep(2000)
            console.info('%{public}s', 'beforeAll end');
        })

        /**
         * @tc.name   inputmethodNomal_test_switchInputMethod_static_001
         * @tc.number inputmethodNomal_test_switchInputMethod_static_001
         * @tc.desc   Test Indicates the input method which will replace the current one.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethodNomal_test_switchInputMethod_static_001', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>************* inputmethodNomal_test_switchInputMethod_static_001 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            let property: inputMethod.InputMethodProperty = {
                name: inputM.name,
                id: inputM.id,
                label: inputM.label,
                labelId: inputM.labelId,
                icon: inputM.icon,
                iconId: inputM.iconId
            }
            console.info("inputmethodNomal_test_switchInputMethod_static_001 getCurrentInputMethod: " + JSON.stringify(inputM));
            try {
                console.info('====>inputmethodNomal_test_switchInputMethod_static_001 switchInputMethod permission fail')
                await inputMethod.switchInputMethod(inputM);
                expect().assertFail();
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error('====>inputmethodNomal_test_switchInputMethod_static_001 switchInputMethod catch err' + JSON.stringify(err))
                expect(err.code).assertEqual(201);
                expect(err.message).assertContain("the permissions check fails");
                done();
                console.info("====>inputmethodNomal_test_switchInputMethod_static_001 end");
            }
        })

        /**
         * @tc.name   inputmethodNomal_test_switchInputMethod_static_002
         * @tc.number inputmethodNomal_test_switchInputMethod_static_002
         * @tc.desc   Test Indicates the input method which will replace the current one.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethodNomal_test_switchInputMethod_static_002', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>************* inputmethodNomal_test_switchInputMethod_static_002 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            console.info("inputmethodNomal_test_switchInputMethod_static_002 getCurrentInputMethod: " + JSON.stringify(inputM));
            inputMethod.switchInputMethod(inputM, (err : BusinessError | null, data : boolean | undefined) => {
                try {
                    if (err?.code) {
                        console.info("====>inputmethodNomal_test_switchInputMethod_static_002 switchInputMethod permission fail: " + JSON.stringify(err));
                        expect(err?.code).assertEqual(201);
                        done();
                    } else {
                        console.info('====>inputmethodNomal_test_switchInputMethod_static_002 success: ' + data);
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.error("====>inputmethodNomal_test_switchInputMethod_static_002 catch err: " + JSON.stringify(err));
                    done();
                    console.info("====>inputmethodNomal_test_switchInputMethod_static_002 end");
                }
            });
        });


        /**
         * @tc.name   inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.number inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.desc   Test Indicates the input method which will hide softboard with calback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_001', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_static_001 start************");
            let inputMethodCtrl = inputMethod.getController()
            inputMethodCtrl.hideSoftKeyboard((err : BusinessError | null) => {
                try {
                    if (err != null) {
                        console.info("====>inputmethodNomal_test_hideSoftKeyboard_static_001 hideSoftKeyboard permission fail: " + JSON.stringify(err));
                        expect(err?.code).assertEqual(201);
                        done();
                    } else {
                        console.info('====>inputmethodNomal_test_hideSoftKeyboard_static_001 success: ');
                        expect().assertFail();
                        done();
                    }
                } catch (err) {
                    console.error("====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    console.info("====>inputmethodNomal_test_hideSoftKeyboard_static_001 end");
                }
            });
        });

        /**
         * @tc.name   inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.number inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.desc   Test Indicates the input method which will hide softboard with Promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_002', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_static_002 start************");
            let inputMethodCtrl = inputMethod.getController()
            try {
                console.info('====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard permission fail')
                await inputMethodCtrl.hideSoftKeyboard();
                expect().assertFail();
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error('====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard catch err' + JSON.stringify(err))
                expect(err.code).assertEqual(201);
                expect(err.message).assertContain("the permissions check fails");
                done();
                console.info("====>inputmethodNomal_test_hideSoftKeyboard_static_002 end");
            }
        });

        /**
         * @tc.name   inputmethod_test_getCurrentInputMethod_static_001
         * @tc.number inputmethod_test_getCurrentInputMethod_static_001
         * @tc.desc   return The InputMethodProperty object of the current input method.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('inputmethod_test_getCurrentInputMethod_static_001', Level.LEVEL1, async (done: () => void)  => {
            let currentIme = inputMethod.getCurrentInputMethod();
            console.info("====>inputmethod_test_getCurrentInputMethod_static_001 currentIme---" + JSON.stringify(currentIme));
            console.info(currentIme.name);
            console.info(currentIme.id);
            expect(currentIme.name !== null).assertTrue();
            expect(currentIme.id !== null).assertTrue();
            console.info("====>************* inputmethod_test_getCurrentInputMethod_static_001 Test end*************");
            done();
        });

        /**
         * @tc.name   inputmethod_test_getInputMethods_static_001
         * @tc.number inputmethod_test_getInputMethods_static_001
         * @tc.desc   List input methods,getInputMethods().interfaces. Callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethod_test_getInputMethods_static_001', Level.LEVEL2, async (done: () => void)  => {
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputmethod_test_getInputMethods_static_001 result:" + JSON.stringify(inputMethodSetting));
            inputMethodSetting.getInputMethods(false, (err : BusinessError | null, arr : inputMethod.InputMethodProperty[] | undefined) => {
                console.info("====>inputmethod_test_getInputMethods_static_001 start:" + JSON.stringify(arr));
                try {
                    if (err != null) {
                        console.error("inputmethod_test_getInputMethods_static_001 failed because: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    console.info("====>inputmethod_test_getInputMethods_static_001 listInputMethod result---" + JSON.stringify(arr));
                    expect(arr != undefined).assertTrue();
                    console.info("====>************* inputmethod_test_getInputMethods_static_001 Test end*************");
                    done();
                } catch (err) {
                    console.error("inputmethod_test_getInputMethods_static_001 catch error: " + err);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   inputmethod_test_getInputMethods_static_002
         * @tc.number inputmethod_test_getInputMethods_static_002
         * @tc.desc   List input methods,getInputMethods().interfaces. Callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethod_test_getInputMethods_static_002', Level.LEVEL2, async (done: () => void)  => {
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputmethod_test_getInputMethods_static_002 result:" + JSON.stringify(inputMethodSetting));
            inputMethodSetting.getInputMethods(true, (err : BusinessError | null, arr : inputMethod.InputMethodProperty[] | undefined) => {
                try {
                    console.info("====>inputmethod_test_getInputMethods_static_002 start:");
                    if (err != null) {
                        console.error("inputmethod_test_getInputMethods_static_002 failed because: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    console.info("====>inputmethod_test_getInputMethods_static_002 listInputMethod result---");
                    expect(arr != undefined).assertTrue();
                    done();
                } catch (err) {
                    console.error("inputmethod_test_getInputMethods_static_002 catch error: " + err);
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   inputmethod_test_getInputMethods_static_003
         * @tc.number inputmethod_test_getInputMethods_static_003
         * @tc.desc   List input methods,getInputMethods().interfaces.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethod_test_getInputMethods_static_003', Level.LEVEL2, async (done: () => void)  => {
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputmethod_test_getInputMethods_static_003 result:" + JSON.stringify(inputMethodSetting));
            try {
                let setting = await inputMethodSetting.getInputMethods(true);
                console.info("inputmethod_test_getInputMethods_static_003 success because: " + setting);
                expect(typeof (setting) === 'object').assertTrue();
                done();
                console.info("====>************* inputmethod_test_getInputMethods_static_003 Test end*************");
            } catch (err) {
                console.info("inputmethod_test_getInputMethods_static_003 catch error: " + err);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   inputmethod_test_getInputMethods_static_004
         * @tc.number inputmethod_test_getInputMethods_static_004
         * @tc.desc   List input methods,().interfaces.Promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputmethod_test_getInputMethods_static_004', Level.LEVEL2, async (done: () => void)  => {
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputmethod_test_getInputMethods_static_004 result:" + JSON.stringify(inputMethodSetting));
            try {
                let setting = await inputMethodSetting.getInputMethods(false);
                console.info("inputmethod_test_getInputMethods_static_004 success because: " + setting);
                expect(typeof (setting) === 'object').assertTrue();
                done();
                console.info("====>************* inputmethod_test_getInputMethods_static_004 Test end*************");
            } catch (err) {
                console.info("inputmethod_test_getInputMethods_static_004 catch error: " + err);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Enable_static_0100
         * @tc.number SUB_InputMethod_IMF_Enable_static_0100
         * @tc.desc   List input methods sync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_InputMethod_IMF_Enable_static_0100', Level.LEVEL1, async (done: () => void)  => {
            console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0100 start-----------------------");
            let inputMethodSetting = inputMethod.getSetting();
            let enable: boolean = true;
            let bool: boolean = false;
            let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
            console.info("====>SUB_InputMethod_IMF_Enable_static_0100 getInputMethodsSync success: ");
            let arr = Array<string>();
            for (let i = 0; i < Enable_List.length; i++) {
                arr.push(Enable_List[i].name);
            }
            let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
            bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
            expect(bool == true).assertTrue();
            console.info("====>SUB_InputMethod_IMF_Enable_static_0100 bool: " + JSON.stringify(bool));
            done();
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Enable_static_0200
         * @tc.number SUB_InputMethod_IMF_Enable_static_0200
         * @tc.desc   List input methods sync.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_Enable_static_0200', Level.LEVEL2, async (done: () => void)  => {
            console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0200 start-----------------------");
            let inputMethodSetting = inputMethod.getSetting();
            try {
                let enable: boolean = false;
                let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
                console.info("====>SUB_InputMethod_IMF_Enable_static_0200 getInputMethodsSync success: ");
                expect(Enable_List.length >= 0).assertTrue();
                done();
            } catch (err) {
                console.info("====>SUB_InputMethod_IMF_Enable_static_0200 Failed to getInputMethodsSync" + JSON.stringify(err) + err);
                expect().assertFail();
                done();
                console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0200 Test end-----------------------");
            }
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Enable_static_0400
         * @tc.number SUB_InputMethod_IMF_Enable_static_0400
         * @tc.desc   List all input methods.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_Enable_static_0400', Level.LEVEL2, async (done: () => void)  => {
            console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0400 start-----------------------");
            let bool: boolean = false;
            let inputMethodSetting = inputMethod.getSetting();
            inputMethodSetting.getAllInputMethods((err : BusinessError | null, Enable_List : inputMethod.InputMethodProperty[] | undefined) => {
                console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0400 start 1-----------------------");
                try {
                    if (err != null || Enable_List == undefined) {
                        console.info("====>SUB_InputMethod_IMF_Enable_static_0400 getAllInputMethods fail because: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>SUB_InputMethod_IMF_Enable_static_0400 getAllInputMethods success: ' + JSON.stringify(Enable_List));
                    let arr = Array<string>();
                    if (Enable_List != undefined && Enable_List.length > 0) {
                        for (let i = 0; i < Enable_List.length; i++) {
                            arr.push(Enable_List[i].name);
                        }
                    }
                    let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
                    bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
                    expect(bool == true).assertTrue();
                    console.info("====>SUB_InputMethod_IMF_Enable_static_0400 bool: " + JSON.stringify(bool));
                    done();
                } catch (err) {
                    console.info("====>SUB_InputMethod_IMF_Enable_static_0400 err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Enable_static_0500
         * @tc.number SUB_InputMethod_IMF_Enable_static_0500
         * @tc.desc   List all input methods.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_Enable_static_0500', Level.LEVEL2, async (done: () => void)  => {
            console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0500 is start-----------------------");
            let bool: boolean = false;
            let inputMethodSetting = inputMethod.getSetting();
            try {
                let Enable_List = await inputMethodSetting.getAllInputMethods();
                console.info('====>SUB_InputMethod_IMF_Enable_static_0500 getAllInputMethods success: ' + JSON.stringify(Enable_List));
                let arr = Array<string>();
                for (let i = 0; i < Enable_List.length; i++) {
                    arr.push(Enable_List[i].name);
                }
                let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
                bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
                expect(bool == true).assertTrue();
                console.info("====>SUB_InputMethod_IMF_Enable_static_0500 bool: " + JSON.stringify(bool));
                done();
                console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0500 end-----------------------");
            } catch (err) {
                console.info("====>SUB_InputMethod_IMF_Enable_static_0500 catch error: " + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Enable_static_0600
         * @tc.number SUB_InputMethod_IMF_Enable_static_0600
         * @tc.desc   List all input methods.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_Enable_static_0600', Level.LEVEL2, async (done: () => void)  => {
            console.info("-----------------------SUB_InputMethod_IMF_Enable_static_0600 start-----------------------");
            let bool: boolean = false;
            let inputMethodSetting = inputMethod.getSetting();
            let Enable_List = inputMethodSetting.getAllInputMethodsSync();
            console.info("====>SUB_InputMethod_IMF_Enable_static_0600 getAllInputMethodsSync success: ");
            let arr = Array<string>();
            for (let i = 0; i < Enable_List.length; i++) {
                arr.push(Enable_List[i].name);
            }
            let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
            bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
            expect(bool == true).assertTrue();
            console.info("====>SUB_InputMethod_IMF_Enable_static_0600 bool: " + JSON.stringify(bool));
            done();
        });

        /**
         * @tc.name   inputMethod_test_getCurrentInputMethodSubtype_static_001
         * @tc.number inputMethod_test_getCurrentInputMethodSubtype_static_001
         * @tc.desc   Get the current input method subtype
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_getCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_static_001 start---------------------");
            try {
                let inputMethodSubtype = inputMethod.getCurrentInputMethodSubtype();
                console.info("====>inputMethod_test_getCurrentInputMethodSubtype_static_001 result:" + typeof inputMethodSubtype);
                expect(typeof (inputMethodSubtype) === 'object').assertTrue();
            } catch (error) {
                console.info("====>inputMethod_test_getCurrentInputMethodSubtype_static_001 getCurrentInputMethodSubtype error" + JSON.stringify(error));
                expect().assertFail();
            }
            console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_static_001 end---------------------");
            done();
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_ListControl_static_0600
         * @tc.number SUB_InputMethod_IMF_ListControl_static_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_ListControl_static_0600', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>SUB_InputMethod_IMF_ListControl_static_0600 start");
            let kikakeyboard =  "com.example.kikakeyboard";
            let hmos = "com.huawei.hmos.inputmethod";
            try {
                let defaultIme = inputMethod.getDefaultInputMethod();
                console.info("====>SUB_InputMethod_IMF_ListControl_static_0600: " + JSON.stringify(defaultIme));
                expect(defaultIme.name === kikakeyboard || defaultIme.name === hmos).assertTrue();
                done();
                console.info("====>SUB_InputMethod_IMF_ListControl_static_0600 try end");
            } catch (err) {
                console.info(`====>Failed to getDefaultInputMethod: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
                console.info("====>SUB_InputMethod_IMF_ListControl_static_0600 err end");
            }
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_Panel_static_0600
         * @tc.number SUB_InputMethod_IMF_Panel_static_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_Panel_static_0600', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>SUB_InputMethod_IMF_Panel_static_0600 start");
            try {
                let inputMethodConfig = inputMethod.getSystemInputMethodConfigAbility();
                console.info("====>SUB_InputMethod_IMF_Panel_static_0600: " + JSON.stringify(inputMethodConfig));
                let bundleName = inputMethodConfig.bundleName;
                let abilityName = inputMethodConfig.abilityName;
                expect(typeof (bundleName) === 'string').assertTrue();
                expect(typeof (abilityName) === 'string').assertTrue();
                console.info("====>SUB_InputMethod_IMF_Panel_static_0600 end");
                done();
            } catch (err) {
                console.info(`====>Failed to getSystemInputMethodConfigAbility: ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   inputMethod_test_listCurrentInputMethodSubtype_static_001
         * @tc.number inputMethod_test_listCurrentInputMethodSubtype_static_001
         * @tc.desc   List subtype of the specified input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_static_001 start---------------------");
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputMethod_test_listCurrentInputMethodSubtype_static_001 getSetting result:" + inputMethodSetting);
            inputMethodSetting.listCurrentInputMethodSubtype((err : BusinessError | null, data : InputMethodSubtype[] | undefined) => {
                try {
                    if (err != null) {
                        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_static_001  failed" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    console.info("====>inputMethod_test_listCurrentInputMethodSubtype_static_001 listCurrentInputMethodSubtype: " + JSON.stringify(data));
                    expect(data != undefined).assertTrue();
                    done();
                } catch (error) {
                    console.info("====>inputMethod_test_listCurrentInputMethodSubtype_static_001 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
                    expect().assertFail();
                    done();
                }
            });
            console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_static_001 end---------------------");
        });

        /**
         * @tc.name   inputMethod_test_listCurrentInputMethodSubtype_002
         * @tc.number inputMethod_test_listCurrentInputMethodSubtype_002
         * @tc.desc   List subtype of current input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listCurrentInputMethodSubtype_002', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 start---------------------");
            try {
                let inputMethodSetting = inputMethod.getSetting();
                console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
                let data = await inputMethodSetting.listCurrentInputMethodSubtype();
                expect(data != null).assertTrue();
                console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype: ");
                done();
            } catch (error) {
                console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
                expect().assertFail();
                done();
            }
            ;
            console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 end---------------------");
        });

        /**
         * @tc.name   inputMethod_test_listInputMethodSubtype_static_001
         * @tc.number inputMethod_test_listInputMethodSubtype_static_001
         * @tc.desc   List subtype of the specified input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_001 start---------------------");
            let inputM = inputMethod.getCurrentInputMethod()
            console.info("inputMethod_test_listInputMethodSubtype_static_001 getCurrentInputMethod: " + JSON.stringify(inputM));
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputMethod_test_listInputMethodSubtype_static_001 getSetting result:" + inputMethodSetting);
            inputMethodSetting.listInputMethodSubtype(inputM, (err : BusinessError | null, data : InputMethodSubtype[] | undefined) => {
                try {
                    if (err != null) {
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_001  failed" + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_001 listInputMethodSubtype: " + JSON.stringify(data));
                    expect(data != undefined).assertTrue();
                    done();
                } catch (error) {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_001 listInputMethodSubtype catch error" + JSON.stringify(error));
                    expect().assertFail();
                    done();
                }
            });
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_001 end---------------------");
        });

        /**
         * @tc.name   inputMethod_test_listInputMethodSubtype_static_002
         * @tc.number inputMethod_test_listInputMethodSubtype_static_002
         * @tc.desc   List subtype of the specified input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listInputMethodSubtype_static_002', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_002 start---------------------");
            let inputM = inputMethod.getCurrentInputMethod()
            console.info("inputMethod_test_listInputMethodSubtype_static_002 getCurrentInputMethod: " + JSON.stringify(inputM));
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputMethod_test_listInputMethodSubtype_static_002 getSetting result:" + inputMethodSetting);
            inputMethodSetting.listInputMethodSubtype(inputM, (err : BusinessError | null, data : InputMethodSubtype[] | undefined) => {
                try {
                    if (err != null) {
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_002  failed" + JSON.stringify(err));
                        expect().assertFail();
                        done()
                    }
                    ;
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_002 listInputMethodSubtype:" + JSON.stringify(data));
                    if (data != undefined && data.length >= 1) {
                        let inputMethodSubtype = data[0]
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_002 inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
                        expect(inputMethodSubtype.id != null).assertTrue();
                        expect(inputMethodSubtype.label != null).assertTrue();
                        done();
                    } else {
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_002 listInputMethodSubtype length less 1");
                        expect().assertFail();
                        done();
                    }
                    ;
                } catch (error) {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_002 listInputMethodSubtype catch error" + JSON.stringify(error));
                    expect().assertFail();
                    done();
                }
            });
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_002 end---------------------");
        });

        /**
         * @tc.name   inputMethod_test_listInputMethodSubtype_static_003
         * @tc.number inputMethod_test_listInputMethodSubtype_static_003
         * @tc.desc   List subtype of the specified input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listInputMethodSubtype_static_003', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_003 start---------------------");
            let inputM = inputMethod.getCurrentInputMethod()
            console.info("inputMethod_test_listInputMethodSubtype_static_003 getCurrentInputMethod: " + JSON.stringify(inputM));
            try {
                let inputMethodSetting = inputMethod.getSetting();
                console.info("====>inputMethod_test_listInputMethodSubtype_static_003 getSetting result:" + inputMethodSetting);
                inputMethodSetting.listInputMethodSubtype(inputM).then((data: Array<InputMethodSubtype>) => {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_003 listInputMethodSubtype: ");
                    expect(data != null).assertTrue();
                    done();
                }).catch((err: Error):void => {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_003  failed" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.info("====>inputMethod_test_listInputMethodSubtype_static_003 listInputMethodSubtype catch error" + JSON.stringify(error));
                expect().assertFail();
                done();
            }
            ;
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_003 end---------------------");
        });

        /**
         * @tc.name   inputMethod_test_listInputMethodSubtype_static_004
         * @tc.number inputMethod_test_listInputMethodSubtype_static_004
         * @tc.desc   List subtype of the specified input method
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_listInputMethodSubtype_static_004', Level.LEVEL2, async (done: () => void)  => {
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_004 start---------------------");
            let inputM = inputMethod.getCurrentInputMethod()
            console.info("inputMethod_test_listInputMethodSubtype_static_004 getCurrentInputMethod: " + JSON.stringify(inputM));
            let inputMethodSetting = inputMethod.getSetting();
            console.info("====>inputMethod_test_listInputMethodSubtype_static_004 getSetting result:" + inputMethodSetting);
            inputMethodSetting.listInputMethodSubtype(inputM).then((data: Array<InputMethodSubtype>) => {
                try {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_004 listInputMethodSubtype:");
                    if (data.length >= 1) {
                        let inputMethodSubtype = data[0]
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_004  inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
                        expect(inputMethodSubtype.id != null).assertTrue();
                        expect(inputMethodSubtype.label != null).assertTrue();
                        done();
                    } else {
                        console.info("====>inputMethod_test_listInputMethodSubtype_static_004 listInputMethodSubtype length less 1");
                        expect().assertFail();
                        done();
                    }
                } catch (error) {
                    console.info("====>inputMethod_test_listInputMethodSubtype_static_004 listInputMethodSubtype catch error" + JSON.stringify(error));
                    expect().assertFail();
                    done();
                }
            }).catch((err: Error):void => {
                console.info("====>inputMethod_test_listInputMethodSubtype_static_004  failed" + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info("====>-----------------inputMethod_test_listInputMethodSubtype_static_004 end---------------------");
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_Direction_static_0100
         * @tc.number Sub_Misc_inputMethod_Direction_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_Direction_static_0100', Level.LEVEL2, async (done: () => void) => {
            let movement: inputMethod.Movement = {
                direction: inputMethod.Direction.CURSOR_UP
            };
            console.info("====>Sub_Misc_inputMethod_Direction_static_0100 cursor_up:" + movement.direction);
            expect(inputMethod.Direction.CURSOR_UP == 1).assertTrue();
            let cursor_up = inputMethod.Direction.CURSOR_UP;
            console.info("====>Sub_Misc_inputMethod_Direction_static_0100 cursor_up:" + cursor_up);
            expect(cursor_up == 1).assertTrue();
            let cursor_down = inputMethod.Direction.CURSOR_DOWN;
            console.info("====>Sub_Misc_inputMethod_Direction_static_0100 cursor_down:" + cursor_down);
            expect(cursor_down == 2).assertTrue();
            let cursor_left = inputMethod.Direction.CURSOR_LEFT;
            console.info("====>Sub_Misc_inputMethod_Direction_static_0100 cursor_left:" + cursor_left);
            expect(cursor_left == 3).assertTrue();
            let cursor_right = inputMethod.Direction.CURSOR_RIGHT;
            console.info("====>Sub_Misc_inputMethod_Direction_static_0100 cursor_right:" + cursor_right);
            expect(cursor_right == 4).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_TextInputType_static_0100
         * @tc.number Sub_Misc_inputMethod_TextInputType_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_TextInputType_static_0100', Level.LEVEL2, async (done: () => void) => {
            let none = inputMethod.TextInputType.NONE;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 none:" + none);
            expect(none == -1).assertTrue();
            let test = inputMethod.TextInputType.TEXT;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 test:" + test);
            expect(test == 0).assertTrue();
            let nultiline = inputMethod.TextInputType.MULTILINE;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 nultiline:" + nultiline);
            expect(nultiline == 1).assertTrue();
            let num = inputMethod.TextInputType.NUMBER;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 number:" + num);
            expect(num == 2).assertTrue();
            let phone = inputMethod.TextInputType.PHONE;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 phone:" + phone);
            expect(phone == 3).assertTrue();
            let datetime = inputMethod.TextInputType.DATETIME;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 datetime:" + datetime);
            expect(datetime == 4).assertTrue();
            let email_addres = inputMethod.TextInputType.EMAIL_ADDRESS;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 email_addres:" + email_addres);
            expect(email_addres == 5).assertTrue();
            let url = inputMethod.TextInputType.URL;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 url:" + url);
            expect(url == 6).assertTrue();
            let visble_password = inputMethod.TextInputType.VISIBLE_PASSWORD;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 visble_password:" + visble_password);
            expect(visble_password == 7).assertTrue();
            let number_password = inputMethod.TextInputType.NUMBER_PASSWORD;
            console.info("====>Sub_Misc_inputMethod_TextInputType_static_0100 NUMBER_PASSWORD:" + number_password);
            expect(number_password == 8).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_EnterKeyType_static_0100
         * @tc.number Sub_Misc_inputMethod_EnterKeyType_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_EnterKeyType_static_0100', Level.LEVEL2, async (done: () => void) => {
            let unspecified = inputMethod.EnterKeyType.UNSPECIFIED;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 unspecified:" + unspecified);
            expect(unspecified == 0).assertTrue();
            let none = inputMethod.EnterKeyType.NONE;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 none:" + none);
            expect(none == 1).assertTrue();
            let go = inputMethod.EnterKeyType.GO;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 go:" + go);
            expect(go == 2).assertTrue();
            let search = inputMethod.EnterKeyType.SEARCH;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 search:" + search);
            expect(search == 3).assertTrue();
            let send = inputMethod.EnterKeyType.SEND;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 send:" + send);
            expect(send == 4).assertTrue();
            let next = inputMethod.EnterKeyType.NEXT;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 next:" + next);
            expect(next == 5).assertTrue();
            let done_ = inputMethod.EnterKeyType.DONE;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 done_:" + done_);
            expect(done_ == 6).assertTrue();
            let previous = inputMethod.EnterKeyType.PREVIOUS;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 previous:" + previous);
            expect(previous == 7).assertTrue();
            let newline = inputMethod.EnterKeyType.NEWLINE;
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 previous:" + newline);
            expect(newline == 8).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_KeyboardStatus_static_0100
         * @tc.number Sub_Misc_inputMethod_KeyboardStatus_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_KeyboardStatus_static_0100', Level.LEVEL2, async (done: () => void) => {
            let none = inputMethod.KeyboardStatus.NONE;
            console.info("====>Sub_Misc_inputMethod_KeyboardStatus_static_0100 none:" + none);
            expect(none == 0).assertTrue();
            let hide = inputMethod.KeyboardStatus.HIDE;
            console.info("====>Sub_Misc_inputMethod_KeyboardStatus_static_0100 hide:" + hide);
            expect(hide == 1).assertTrue();
            let show = inputMethod.KeyboardStatus.SHOW;
            console.info("====>Sub_Misc_inputMethod_KeyboardStatus_static_0100 show:" + show);
            expect(show == 2).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_RequestKeyboardReason_static_0100
         * @tc.number Sub_Misc_inputMethod_RequestKeyboardReason_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_RequestKeyboardReason_static_0100', Level.LEVEL2, async (done: () => void) => {
            let none = inputMethod.RequestKeyboardReason.NONE;
            console.info("====>Sub_Misc_inputMethod_RequestKeyboardReason_static_0100 none:" + none);
            expect(none == 0).assertTrue();
            let mouse = inputMethod.RequestKeyboardReason.MOUSE;
            console.info("====>Sub_Misc_inputMethod_RequestKeyboardReason_static_0100 mouse:" + mouse);
            expect(mouse == 1).assertTrue();
            let touch = inputMethod.RequestKeyboardReason.TOUCH;
            console.info("====>Sub_Misc_inputMethod_RequestKeyboardReason_static_0100 touch:" + touch);
            expect(touch == 2).assertTrue();
            let other = inputMethod.RequestKeyboardReason.OTHER;
            console.info("====>Sub_Misc_inputMethod_RequestKeyboardReason_static_0100 other:" + other);
            expect(other == 20).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_InputMethod_IMF_panelInfo_static_0100
         * @tc.number SUB_InputMethod_IMF_panelInfo_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IMF_panelInfo_static_0100', Level.LEVEL2, async (done: () => void) => {
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 start');
            let panel: PanelInfo;
            panel = {
                type: PanelType.SOFT_KEYBOARD,
                flag: PanelFlag.FLAG_FLOATING
            }
            let FLAG_FLOATING = PanelFlag.FLAG_FLOATING
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 FLAG_FLOATING: ' + FLAG_FLOATING);
            expect(FLAG_FLOATING == 1).assertTrue();
            let FLAG_FIXED = PanelFlag.FLAG_FIXED
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 FLAG_FIXED: ' + FLAG_FIXED);
            expect(FLAG_FIXED == 0).assertTrue();

            let FLAG_CANDIDATE = PanelFlag.FLAG_CANDIDATE
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 FLAG_CANDIDATE: ' + FLAG_CANDIDATE);
            expect(FLAG_CANDIDATE == 2).assertTrue();

            let SOFT_KEYBOARD = PanelType.SOFT_KEYBOARD
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 SOFT_KEYBOARD: ' + SOFT_KEYBOARD);
            expect(SOFT_KEYBOARD == 0).assertTrue();

            let STATUS_BAR = PanelType.STATUS_BAR
            console.info('====>SUB_InputMethod_IMF_panelInfo_static_0100 STATUS_BAR: ' + STATUS_BAR);
            expect(STATUS_BAR == 1).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_inputWindowInfo_static_0201
         * @tc.number Sub_Misc_inputMethod_inputWindowInfo_static_0201
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_inputWindowInfo_static_0201', Level.LEVEL2, async (done: () => void) => {
            let inputWindowInfo: inputMethod.InputWindowInfo = {
                name: 'inputWindowInfo_0201/99',
                left: 100,
                top: 607,
                width: 720,
                height: 601,
            }
            try {
                console.info('====>Sub_Misc_inputMethod_inputWindowInfo_static_0201 inputWindowInfo: ' + JSON.stringify(inputWindowInfo));
                expect(inputWindowInfo.name).assertEqual('inputWindowInfo_0201/99')
                expect(inputWindowInfo.left).assertEqual(100)
                expect(inputWindowInfo.top).assertEqual(607)
                expect(inputWindowInfo.width).assertEqual(720)
                expect(inputWindowInfo.height).assertEqual(601)
                done();
            } catch (err) {
                console.info('====>Sub_Misc_inputMethod_inputWindowInfo_static_0201 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_ExtendAction_static_0100
         * @tc.number Sub_Misc_inputMethod_ExtendAction_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_ExtendAction_static_0100', Level.LEVEL2, async (done: () => void) => {
            let select_all = inputMethod.ExtendAction.SELECT_ALL;
            console.info("====>Sub_Misc_inputMethod_ExtendAction_static_0100 select_all:" + select_all);
            expect(select_all == 0).assertTrue();
            let cut = inputMethod.ExtendAction.CUT;
            console.info("====>Sub_Misc_inputMethod_ExtendAction_static_0100 cut:" + cut);
            expect(cut == 3).assertTrue();
            let copy = inputMethod.ExtendAction.COPY;
            console.info("====>Sub_Misc_inputMethod_ExtendAction_static_0100 copy:" + copy);
            expect(copy == 4).assertTrue();
            let paste = inputMethod.ExtendAction.PASTE;
            console.info("====>Sub_Misc_inputMethod_ExtendAction_static_0100 paste:" + paste);
            expect(paste == 5).assertTrue();
            done();
        });

        /**
         * @tc.name   Sub_Misc_inputMethod_FunctionKey_static_0100
         * @tc.number Sub_Misc_inputMethod_FunctionKey_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Misc_inputMethod_FunctionKey_static_0100', Level.LEVEL2, async (done: () => void) => {
            let functionKey: inputMethod.FunctionKey = {
                enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            };
            console.info("====>Sub_Misc_inputMethod_EnterKeyType_static_0100 unspecified:" + functionKey.enterKeyType);
            expect(functionKey.enterKeyType == 0).assertTrue();
            done();
        });
    })
}