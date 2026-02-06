/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Utils'
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "ACTS_PhotoEditorExtension"

export default function abilityTest() {
    describe('ActsAbilityTest', () => {
        let globalscribe: commonEventManager.CommonEventSubscriber|undefined = undefined;

        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(async () => {
            hilog.info(0x0000, TAG, `ACTS_PhotoEditorExtension beforeEach start`);

            let options: router.RouterOptions = {
                url: 'testAbility/pages/p1',
            }
            try {
                await router.pushUrl(options);
                await Utils.sleep(500);
                console.info("ACTS_PhotoEditorExtension push page suceed");
            } catch (err) {
                console.error("ACTS_PhotoEditorExtension push page error: " + err);
            }

            setTimeout(async () => {
                if (globalscribe !== undefined) {
                    Utils.unsubscribe(globalscribe)
                }
            }, 8000); // max wait 8s
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

       /**
        * @tc.number SUB_ABILITY_ABILITYRUNTIME_PHOTOEDITOREXTENSION_0100
        * @tc.name test PhotoEditorExtension interface
        * @tc.desc Start the PhotoEditorExtensionAbility, and the test is successful.
        * @tc.size MediumTest
        * @tc.level Level0
        * @tc.type Function
        */
        it('ACTS_PhotoEditorExtension_0100', Level.LEVEL0, async () => {
            // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
            const newTag = 'ACTS_PhotoEditorExtension_0100 == ';

            let subscriber: commonEventManager.CommonEventSubscriber | null = null;
            let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
                events: ['ACTS_PhotoEditorExtension_OnRemoteReady'],
            };

            await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
                console.log(newTag + "createSubscriber data : " + JSON.stringify(data));
                globalscribe = data;
                commonEventManager.subscribe(globalscribe, async (err, data) => {
                    console.log(newTag + "SubscribeInfoCallback : " + JSON.stringify(data));

                    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
                    await abilityDelegator.executeShellCommand('aa dump -e').then((data) => {
                        console.info(newTag + 'data: ' + JSON.stringify(data));
                        let output = JSON.stringify(data);
                        try {
                            expect(output).assertContain("MuseEditorExtensionAbility");
                        } catch {
                            expect().assertFail();
                        }
                    });
                });
            }).catch((error: BusinessError) => {
                console.log(newTag + "createSubscriber err");
                expect().assertFail();
            })
        })
    })
}