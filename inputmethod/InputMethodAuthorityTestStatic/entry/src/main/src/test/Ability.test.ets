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
import inputMethod from '@ohos.inputMethod';
import inputMethodSubtype from '@ohos.InputMethodSubtype';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
export default function inputMethodAuthorityJSUnit() {

    describe("inputMethodAuthorityJSUnit", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
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
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.inputmethodauthority.test.static")
            await Utils.msSleep(2000)
            console.info('%{public}s', 'beforeAll end');
        })

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0100', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0100 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0100 getCurrentInputMethod: " + JSON.stringify(inputM));
            try {
                hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod permission fail')
                let result = await inputMethod.switchInputMethod(inputM);
                expect(result == true).assertTrue();
                done();
                hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0100 end");
            } catch (err) {
                hilog.error(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_Misc_inputMethod_switchInputMethod__static_0200
         * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0200', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0200 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0200 getCurrentInputMethod: " + JSON.stringify(inputM));
            inputMethod.switchInputMethod(inputM, (err : BusinessError | null, data : boolean | undefined) => {
                try {
                    if (err != null && err.code != 0) {
                        hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 switchInputMethod permission fail: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0200 success: ' + data);
                        expect(data == true).assertTrue();
                        done();
                    }
                } catch (err) {
                    hilog.error(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
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
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_001 start************");
            let inputMethodCtrl = inputMethod.getController()
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            try {
                let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 execution success, data: ${JSON.stringify(data)}`);
            } catch (error) {
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
            inputMethodCtrl.hideSoftKeyboard((error : BusinessError | null) => {
                try {
                    if (error != null) {
                        hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 hideSoftKeyboard permission fail: " + JSON.stringify(error));
                        expect(error?.code == 0).assertTrue();
                    } else {
                        hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_001 success: ');
                        expect(error == null).assertTrue();
                    }
                    done();
                } catch (err) {
                    hilog.error(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 end");
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
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_002 start************");
            let inputMethodCtrl = inputMethod.getController()
            try {
                const ATTRIBUTE: inputMethod.TextConfig = {
                    inputAttribute: {
                        textInputType: inputMethod.TextInputType.TEXT,
                        enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                    }
                }
                try {
                    let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 execution success, data: ${JSON.stringify(data)}`);
                } catch (error) {
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 catch error, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                    done();
                }
                hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard permission fail')
                await inputMethodCtrl.hideSoftKeyboard();
                expect(ATTRIBUTE != null).assertTrue();
                done();
            } catch (err) {
                hilog.error(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
                hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_002 end");
            }
        });

        /**
         * @tc.name   inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.number inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));

            inputMethod.switchCurrentInputMethodSubtype(inputMS, (err : BusinessError | null, data : boolean | undefined) => {
                try {
                    if (err != null) {
                        hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_001 data: " + JSON.stringify(data));
                    expect(data == true).assertTrue();
                    done();
                } catch (error) {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 catch error: ' + JSON.stringify(error));
                    done();
                }
            });
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test end*************");
        });

        /**
         * @tc.name   inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.number inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_002', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
            let extras: Record<string, string> ={}
            let inputMethodSubProperty: inputMethodSubtype = {
                id: inputMS.id,
                label: "",
                labelId: 123,
                name: inputMS.name,
                mode: "lower",
                locale: "",
                language: "",
                icon: "",
                iconId: 0,
                extra: extras
            };
            try {
                inputMethod.switchCurrentInputMethodSubtype(inputMS).then((data: boolean) => {
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_002 data: " + JSON.stringify(data));
                    expect(data == true).assertTrue();
                    done();
                }).catch((err: Error):void => {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 err: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 catch error: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            };
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test end*************");
        });
    })

}