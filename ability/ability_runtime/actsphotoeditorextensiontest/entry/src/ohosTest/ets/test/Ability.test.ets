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
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
    describe('ActsAbilityTest', () => {
        let globalscribe: commonEventManager.CommonEventSubscriber|undefined = undefined;

        beforeAll(() => {
           
        })
        beforeEach(async () => {
            hilog.info(0x0000, TAG, `ACTS_PhotoEditorExtension beforeEach start`);

        })
        afterEach(async() => {
 	        hilog.info(0x0000, TAG, `ACTS_PhotoEditorExtension afterEach start`);
 	        commonEventManager.publish("Ability_Terminate",()=>{})
 	        await Utils.sleep(1000);
 	        hilog.info(0x0000, TAG, `ACTS_PhotoEditorExtension afterEach end`);
 	    })
        afterAll(() => {
        })

        /**
         * @tc.name   ACTS_PhotoEditorExtension_0100
         * @tc.number SUB_ABILITY_ABILITYRUNTIME_PHOTOEDITOREXTENSION_0100
         * @tc.desc   Start the PhotoEditorExtensionAbility, and the test is successful.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_PhotoEditorExtension_0100', Level.LEVEL0, async () => {
 	        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
 	        const newTag = 'ACTS_PhotoEditorExtension_0100 == ';
 	        try{
 	            let subscriber: commonEventManager.CommonEventSubscriber | null = null;
 	            let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
 	                events: ['ACTS_PhotoEditorExtension_OnRemoteReady'],
 	            };
 	            await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
 	                console.log(newTag + "createSubscriber data : " + JSON.stringify(data));
 	                globalscribe = data;
 	                commonEventManager.subscribe(globalscribe, async (err, data) => {
 	                    console.log(newTag + "SubscribeInfoCallback : " + JSON.stringify(data));
 	   
 	                    await abilityDelegator.executeShellCommand('aa dump -e').then((data) => {
 	                        console.info(newTag + 'data: ' + JSON.stringify(data));
 	                        let output = JSON.stringify(data);
 	                        try {
 	                            expect(output).assertContain("MuseEditorExtensionAbility");
 	                            commonEventManager.unsubscribe(globalscribe)
 	                        } catch {
 	                            expect().assertFail();
 	                        }
 	                    });
 	                });
 	            }).catch((error: BusinessError) => {
 	                console.log(newTag + "createSubscriber err");
 	                expect().assertFail();
 	            })
 	            await abilityDelegator.executeShellCommand('aa start -a EntryAbility2 -b com.acts.photoeditorextensiontest --ps action test_0100')
 	        }catch{
 	            console.log(newTag + "createSubscriber err");
 	            expect().assertFail();
 	        }
 	    })
    })
}