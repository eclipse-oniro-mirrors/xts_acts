/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext'
import AbilityStage from '@ohos.app.ability.AbilityStage'
import { ShellCmdResult } from 'application.shellCmdResult'


let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'ACTS_PhotoEditorExtension'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'describe start');
        let globalscribe: commonEventManager.CommonEventSubscriber;


        /**
         * @tc.number ACTS_PhotoEditorExtension_static_0100
         * @tc.name   ACTS_PhotoEditorExtension_static_0100
         * @tc.desc   Start the PhotoEditorExtensionAbility, and the test is successful.
         * @tc.size   MediumTest
         * @tc.level  Level0
         * @tc.type   Function
        **/
        it("ACTS_PhotoEditorExtension_static_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
            const newTag = 'ACTS_PhotoEditorExtension_static_0100 == ';
            let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
                events: ['ACTS_PhotoEditorExtension_OnRemoteReady'],
            };

            hilog.info(DOMAIN_NUMBER, newTag, '%{public}s', 'ACTS_PhotoEditorExtension_static_0100 start');
            await commonEventManager.createSubscriber(subscribeInfo).then(
              (commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined): void => {
                hilog.info(DOMAIN_NUMBER, TAG, `ACTS_PhotoEditorExtension_static_0100 createSubscriber success`)
                if(commonEventSubscriber !== undefined){
                    globalscribe = commonEventSubscriber;
                    hilog.info(DOMAIN_NUMBER, TAG, `ACTS_PhotoEditorExtension_static_0100 globalscribe success`)
                    commonEventManager.subscribe(globalscribe, (err:BusinessError | null,
                        CommonEventData:commonEventManager.CommonEventData|undefined) => {
                        hilog.info(DOMAIN_NUMBER, TAG, `ACTS_PhotoEditorExtension_static_0100 subscribe success`)
                        if (err) {
                            hilog.info(DOMAIN_NUMBER, TAG, `subscribe failed! Err.Info ===> + ${err?.code}`)
                            expect(false).assertTrue()
                            done()
                        } else {
                            if (CommonEventData == undefined) {
                                hilog.info(DOMAIN_NUMBER, TAG,`subscribe failed! Err.Info ===> ${CommonEventData}`)
                                expect(false).assertTrue()
                                done()
                            } else {
                                hilog.info(DOMAIN_NUMBER, TAG,`subscribe successed! CommonEventData.Info ===>` +
                                    JSON.stringify(CommonEventData))
                                let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
                                await abilityDelegator.executeShellCommand('aa dump -e').then(
                                    (data:ShellCmdResult|undefined): void => {
                                    hilog.info(DOMAIN_NUMBER, TAG,`executeShellCommand  ===> ` + JSON.stringify(data))
                                    let output = JSON.stringify(data);
                                    try {
                                        hilog.info(DOMAIN_NUMBER, TAG,`executeShellCommand success`)
                                        expect(output).assertContain("MuseEditorExtensionAbility");
                                    } catch (error) {
                                        hilog.info(DOMAIN_NUMBER, TAG, ` catch fail`)
                                        expect().assertFalse();
                                        done();
                                    }
                                });
                            }
                        }
                    })

                }else{
                    hilog.info(DOMAIN_NUMBER, TAG, `commonEventSubscriber is undefined `)
                    expect(false).assertTrue()
                    done();
                }
            }).catch((err) => {
                hilog.info(DOMAIN_NUMBER, TAG, `createSubscriber err, `)
                expect(false).assertTrue()
                done();
            })

            await Utils.msSleep(2000)
            let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            hilog.info(DOMAIN_NUMBER, TAG, 'beforeAll AbilityDelegator');
            // 1.2 need to subscribe first, then publish.
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsphotoeditorextensiontest.static")
            await Utils.msSleep(4000);

            setTimeout(async () => {
                if (globalscribe) {
                    commonEventManager.unsubscribe(globalscribe, (err: BusinessError<void> | null) => {
                        hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', `${TAG} unsubscribe success`);
                        done();
                    })
                }
            }, 1000); // max wait 8s


            hilog.info(DOMAIN_NUMBER, newTag, '%{public}s', 'ACTS_PhotoEditorExtension_static_0100 end');

        })

    })

}