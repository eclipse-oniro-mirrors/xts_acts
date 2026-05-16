'use static'
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
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../hypium/index";
import { commonEventManager } from '@kit.BasicServicesKit';
import subtype from '@ohos.InputMethodSubtype';
import inputMethod from '@ohos.inputMethod';
import display from '@ohos.display';
import { Driver, ON, MatchPattern, Component, Rect } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import util from '@ohos.util';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIContext } from '@ohos.arkui.UIContext';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function inputMethodEngineStatic() {

    describe('inputMethodEngineStatic', (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        let driver = Driver.create();
        let textArea: Component|null;
        let rectInfo: Rect;
        let runCmd = async (data:Rect) => {
            let a = data.left + 20 + Math.floor(Math.random() * (data.right - data.left) * 0.7);
            let b = data.top + 20 + Math.floor(Math.random() * (data.bottom - data.top) * 0.7);
            let cursor_x: int = a.toInt();
            let cursor_y: int = b.toInt();
            console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`);
            driver.click(cursor_x, cursor_y);
        };

        let testTemplate: (testName: string, code: int, done: () => void) => Promise<void> =
            async (testName, code, done) => {
                let subscriber: commonEventManager.CommonEventSubscriber | null | undefined = null;

                let unSubscriberCallback = (err: BusinessError | null) => {
                    console.info(`====>${testName} unSubscriberCallback start`);
                    if (err) {
                        console.info(`====>${testName} unSubscriberCallback failed: ${JSON.stringify(err)}`);
                    } else {
                        console.info(`====>${testName} unSubscriberCallback finsh`);
                    }
                };
                let subscriberCallback = (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined | null) => {
                    console.info(`====>${testName} subscriberCallback data:${JSON.stringify(data)}`);
                    if (data !== undefined) {
                        const currentSubscriber = subscriber as commonEventManager.CommonEventSubscriber;
                        commonEventManager.unsubscribe(currentSubscriber, unSubscriberCallback);
                        setTimeout(() => {
                            try {
                              expect(data?.data).assertEqual('SUCCESS');
                              console.info(`====>${testName} end`);
                              done();
                            } catch (err) {
                              console.info(`====>${testName} err: ${JSON.stringify(err)}`);
                              done();
                            }
                        }, 500)
                    }
                };
                let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
                    events: [testName]
                };
                commonEventManager.createSubscriber(commonEventSubscribeInfo, (err: BusinessError | null,
                    data: commonEventManager.CommonEventSubscriber | undefined | null): void => {
                        try{
                            if (!err && data) {
                                subscriber = data as commonEventManager.CommonEventSubscriber;
                                commonEventManager.subscribe(data, subscriberCallback);
                                console.info(`====>${testName} subscribe finish====`);
                            }
                        } catch (err) {
                            console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
                        }
            
                        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
                            code: code
                        }
                        commonEventManager.publish('keyboardControllerStatic', commonEventPublishData, (err: BusinessError | null) => {
                            console.info(`====>${testName} publishCallback start`);
                            if (err) {
                              console.info(`====>${testName} publishCallback failed: ${JSON.stringify(err)}`);
                            }
                        });
                  })
            };

        beforeAll(async (done: ()=> void) => {
            try {
              let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
              await Utils.msSleep(2000);
              abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.inputmethodwidmanage.test.static');
              await Utils.msSleep(2000);
              await abilityDelegator.executeShellCommand('ime -e com.acts.inputmethodwidmanage.test.static -f');
              await abilityDelegator.executeShellCommand('ime -s com.acts.inputmethodwidmanage.test.static');
              console.info('====>beforeAll inputMethod_enable success');
              await Utils.msSleep(1000);
              textArea = await driver.findComponent(ON.type('TextArea'));
              console.info('====>beforeAll inputMethodSwitch window textArea:' + JSON.stringify(textArea));
              rectInfo = await textArea!.getBounds();
              console.info('====>beforeAll inputMethodSwitch textArea rectInfo:' + JSON.stringify(rectInfo));
              await Utils.msSleep(1000);
              await runCmd(rectInfo);
              await Utils.msSleep(1000);
              done();
            } catch (err) {
              console.info('====>beforeAll throw err:' + JSON.stringify(err.message));
              done();
            }
        })

        /**
         * @tc.name   SUB_InputMethod_IsTextPreviewSupport_static_0101
         * @tc.number SUB_InputMethod_IsTextPreviewSupport_static_0101
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IsTextPreviewSupport_static_0101', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('SUB_InputMethod_IsTextPreviewSupport_static_0101', 1, done);
        });

        /**
         * @tc.name   SUB_InputMethod_IsTextPreviewSupport_static_0201
         * @tc.number SUB_InputMethod_IsTextPreviewSupport_static_0201
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IsTextPreviewSupport_static_0201', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('SUB_InputMethod_IsTextPreviewSupport_static_0201', 2, done);
        });

        /**
         * @tc.name   SUB_InputMethod_IsTextPreviewSupport_static_0301
         * @tc.number SUB_InputMethod_IsTextPreviewSupport_static_0301
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IsTextPreviewSupport_static_0301', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('SUB_InputMethod_IsTextPreviewSupport_static_0301', 3, done);
        });

        /**
         * @tc.name   SUB_InputMethod_IsTextPreviewSupport_static_0401
         * @tc.number SUB_InputMethod_IsTextPreviewSupport_static_0401
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_InputMethod_IsTextPreviewSupport_static_0401', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('SUB_InputMethod_IsTextPreviewSupport_static_0401', 4, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IMF_SecurityKeyboard_static_0600
         * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_static_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IMF_SecurityKeyboard_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('Sub_InputMethod_IMF_SecurityKeyboard_static_0600', 5, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IMF_SecurityKeyboard_static_0700
         * @tc.number Sub_InputMethod_IMF_SecurityKeyboard_static_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IMF_SecurityKeyboard_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('Sub_InputMethod_IMF_SecurityKeyboard_static_0700', 6, done);
        });

        /** 
        * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_static_0301 
        * @tc.number Sub_InputMethod_IMF_sendMessagePromise_static_0301 
        * @tc.desc   Function test 
        * @tc.type   FUNCTION 
        * @tc.size   MEDIUMTEST 
        * @tc.level  LEVEL0 
        */ 
        it('Sub_InputMethod_IMF_sendMessagePromise_static_0301', Level.LEVEL0, async (done: () => void) => { 
            const testName = 'Sub_InputMethod_IMF_sendMessagePromise_static_0301'; 
            const ATTRIBUTE: inputMethod.TextConfig = { 
                inputAttribute: { 
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED 
                } 
            }; 
            await inputMethod.getController().attach(true, ATTRIBUTE); 
            console.info(`====>${testName} attach success.`); 
            try { 
                await inputMethod.getController().sendMessage('aaaa'); 
                console.info(`====>${testName} sendMessage success.`);
                expect().assertFail(); 
                done(); 
            } catch (err) { 
                console.info(`====>${testName} errCode:${err.code}, errMessage is ${err.message}`) 
                await inputMethod.getController().detach(); 
                expect(err.code).assertEqual(12800015);
                done(); 
            }; 
        });

        /** 
        * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_static_0302 
        * @tc.number Sub_InputMethod_IMF_sendMessagePromise_static_0302 
        * @tc.desc   Function test 
        * @tc.type   FUNCTION 
        * @tc.size   MEDIUMTEST 
        * @tc.level  LEVEL3 
        */ 
        it('Sub_InputMethod_IMF_sendMessagePromise_static_0302', Level.LEVEL3, async (done: () => void) => { 
            const testName = 'Sub_InputMethod_IMF_sendMessagePromise_static_0302'; 
            const ATTRIBUTE: inputMethod.TextConfig = { 
                inputAttribute: { 
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED 
                } 
            }; 
            try {
                await inputMethod.getController().attach(true, ATTRIBUTE); 
                console.info(`====>${testName} attach success.`); 
                await inputMethod.getController().hideTextInput();
                console.info(`====>${testName} hideTextInput success.`); 
                let msgParam: ArrayBuffer = new ArrayBuffer(128); 
                await inputMethod.getController().sendMessage('aaa', msgParam); 
                console.info(`====>${testName} sendMessage success.`); 
                expect().assertFail();
                done(); 
            } catch (err) { 
                console.info(`====>${testName} errCode:${err.code}, errMessage is ${err.message}`) 
                await inputMethod.getController().detach(); 
                expect(err.code).assertEqual(12800016);
                done(); 
            }; 
        });


    })
}