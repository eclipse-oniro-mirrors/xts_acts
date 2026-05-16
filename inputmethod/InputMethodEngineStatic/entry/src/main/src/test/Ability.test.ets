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

        let newArrayBuffer = (str:string|undefined): ArrayBuffer => {
            let arrayBuffer = new ArrayBuffer(0);
            if (str === undefined) {
              const view = new Uint8Array(arrayBuffer);
            } else {
              arrayBuffer = new ArrayBuffer(str.length);
              const view = new Uint8Array(arrayBuffer);
              for(let i = 0; i < str.length; i++){
                view[i] = str.charCodeAt(i);
              }
            }
            return arrayBuffer
        };

        let GetArrayBufferString = (buffer: ArrayBuffer): string => {
            console.info('====>GetArrayBufferString: ' + JSON.stringify(buffer));
            const decoder = util.TextDecoder.create('"utf-8"');
            const str = decoder.decodeToString(new Uint8Array(buffer));
            return str
        }

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
              abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.inputmethodEngine.test.static');
              await Utils.msSleep(2000);
              await abilityDelegator.executeShellCommand('ime -e com.acts.inputmethodEngine.test.static -f');
              await abilityDelegator.executeShellCommand('ime -s com.acts.inputmethodEngine.test.static');
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
         * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_static_0800
         * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_static_0800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_InputMethod_IMF_attachWithUIContextPromise_static_0800', Level.LEVEL3, async (done: () => void): Promise<void> => {
            const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_static_0800';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
                },
                newEditBox: false,
                capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
            };
            let attachOptions: inputMethod.AttachOptions = {
                requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
                showKeyboard: false
            };
            try {
                let uiContext:UIContext = UIContext.getCallingScopeUIContext()!;
                await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
                console.info(`${CASE_NAME} attach success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(0);
                done();
            }
        });

        /**
         * @tc.name   inputMethodEngine_test_static_038
         * @tc.number inputMethodEngine_test_static_038
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('inputMethodEngine_test_static_038', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('inputMethodEngine_test_static_038', 1, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_createPanelCallback_static_0100
         * @tc.number Sub_InputMethod_IME_createPanelCallback_static_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_createPanelCallback_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('Sub_InputMethod_IME_createPanelCallback_static_0100', 2, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_PrivateDateTransferred_static_0500
         * @tc.number Sub_InputMethod_IME_PrivateDateTransferred_static_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('Sub_InputMethod_IME_PrivateDateTransferred_static_0500', 3, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_PrivateDateTransferred_static_0600
         * @tc.number Sub_InputMethod_IME_PrivateDateTransferred_static_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_PrivateDateTransferred_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
            testTemplate('Sub_InputMethod_IME_PrivateDateTransferred_static_0600', 4, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0900
         * @tc.number Sub_InputMethod_IME_Custom_static_0900
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute:{
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info("====>Sub_InputMethod_IME_Custom_static_0900 onTerminated");
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info('====>Sub_InputMethod_IME_Custom_static_0900 onMessage msgId: ' + msgId + ', msgParam: ' +
                    GetArrayBufferString(msgParam!) + ', msgParamObj' + msgParam);
                    expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_static_0900');
                    if (msgParam !== undefined) {
                        expect(GetArrayBufferString(msgParam!)).assertEqual('SUCCESS')
                    } else {
                        expect().assertFail();
                    }
                    done();
                }
            }
            inputMethod.getController().recvMessage(msgHandler);
            testTemplate('Sub_InputMethod_IME_Custom_static_0900', 5, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0200
         * @tc.number Sub_InputMethod_IME_Custom_static_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute:{
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info("====>Sub_InputMethod_IME_Custom_static_0200 onTerminated");
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info('====>Sub_InputMethod_IME_Custom_static_0200 onMessage msgId: ' + msgId + ', msgParam: ' +
                    GetArrayBufferString(msgParam!) + ', msgParamObj' + msgParam);
                    expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_static_0200');
                    if (msgParam !== undefined) {
                        expect(GetArrayBufferString(msgParam!)).assertEqual('SUCCESS')
                    } else {
                        expect().assertFail();
                    }
                    done();
                }
            }
            inputMethod.getController().recvMessage(msgHandler);
            testTemplate('Sub_InputMethod_IME_Custom_static_0200', 6, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0800
         * @tc.number Sub_InputMethod_IME_Custom_static_0800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute:{
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info("====>Sub_InputMethod_IME_Custom_static_0800 onTerminated");
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info('====>Sub_InputMethod_IME_Custom_static_0800 onMessage msgId: ' + msgId + ', msgParam: ' +
                    GetArrayBufferString(msgParam!) + ', msgParamObj' + msgParam);
                    expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_static_0800');
                    if (msgParam !== undefined) {
                        expect(GetArrayBufferString(msgParam!)).assertEqual('SUCCESS')
                    } else {
                        expect().assertFail();
                    }
                    done();
                }
            }
            inputMethod.getController().recvMessage(msgHandler);
            testTemplate('Sub_InputMethod_IME_Custom_static_0800', 7, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0400
         * @tc.number Sub_InputMethod_IME_Custom_static_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute:{
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info("====>Sub_InputMethod_IME_Custom_static_0400 onTerminated");
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info('====>Sub_InputMethod_IME_Custom_static_0400 onMessage msgId: ' + msgId + ', msgParam: ' +
                    GetArrayBufferString(msgParam!) + ', msgParamObj' + msgParam);
                    expect().assertFail();
                    done();
                }
            }
            inputMethod.getController().recvMessage(msgHandler);
            testTemplate('Sub_InputMethod_IME_Custom_static_0400', 8, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0300
         * @tc.number Sub_InputMethod_IME_Custom_static_0300
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Sub_InputMethod_IME_Custom_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_0300 onTerminated`);
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_0300 onMessage msgId: ${msgId}`);
                    expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_static_0300');
                    expect().assertFail();
                    done();
                }
            };
            inputMethod.getController().recvMessage(msgHandler);

            testTemplate('Sub_InputMethod_IME_Custom_static_0300', 9, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_1100
         * @tc.number Sub_InputMethod_IME_Custom_static_1100
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
                textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_1100 onTerminated`);
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    try {
                        console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_1100 onMessage msgId: ${msgId}`);
                        expect(msgId).assertEqual('Sub_InputMethod_IME_Custom_static_1100');
                        expect(typeof(msgParam)).assertEqual('undefined');
                        done();
                    } catch (err) {
                        console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_1100 catch err: ${err}`);
                    }
                }
            };
            inputMethod.getController().recvMessage(msgHandler);

            testTemplate('Sub_InputMethod_IME_Custom_static_1100', 10, done);
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0901
         * @tc.number Sub_InputMethod_IME_Custom_static_0901
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0901', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            await inputMethod.getController().hideTextInput();
            
            let msgHandler: inputMethod.MessageHandler = {
                onTerminated(): void {
                    console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_0901 onTerminated`);
                },
                onMessage(msgId: string, msgParam?: ArrayBuffer): void {
                    console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_0901 onMessage msgId: ${msgId}, msgParam: ${GetArrayBufferString(msgParam!)}`);   
                        
                }
            };
            inputMethod.getController().recvMessage(msgHandler);
            console.info(`${tag} ====>Sub_InputMethod_IME_Custom_static_0901 recvMessage success`);
            let testName:string = 'Sub_InputMethod_IME_Custom_static_0901';
            let subscriber: commonEventManager.CommonEventSubscriber | null | undefined = null;

            let unSubscriberCallback = (err: BusinessError | null) => {
            console.info(`====>${testName} unSubscriberCallback start`);
            if (err) {
                console.info(`====>${testName} unSubscriberCallback failed: ${JSON.stringify(err)}`);
            } else {
                console.info(`====>${testName} unSubscriberCallback finish`)
            }
            }
            let subscriberCallback = (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined | null) => {
                console.info(`====>${testName} subscriberCallback data: ${JSON.stringify(data)}`);
                if (data != undefined) {
                    const currentSubscriber = subscriber as commonEventManager.CommonEventSubscriber;
                    commonEventManager.unsubscribe(currentSubscriber, unSubscriberCallback);
                    setTimeout(() => {
                        try {
                            expect(data?.data).assertEqual("SUCCESS");
                            console.info(`====>${testName} end`);
                            inputMethod.getController().recvMessage();
                            done();
                        } catch (err) {
                            console.info(`====>${testName} err: ${JSON.stringify(err)}`);
                            done();
                        }
                    }, 500)
                }
            }

            let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
                events: [testName]
            }
            commonEventManager.createSubscriber(commonEventSubscribeInfo, (err: BusinessError | null, data: commonEventManager.CommonEventSubscriber | undefined | null): void => {
            try {
                if (data != undefined) {
                    subscriber = data as commonEventManager.CommonEventSubscriber;
                    commonEventManager.subscribe(data, subscriberCallback);
                    console.info(`====>${testName} subscriber finish`);
                }        
            } catch (err) {
                console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
            }

            let commonEventPublishData: commonEventManager.CommonEventPublishData = {
                code: 11
            }
            commonEventManager.publish('keyboardControllerStatic', commonEventPublishData, (err: BusinessError | null) => {
                console.info(`====>${testName} publishCallback start`);
                if (err) {
                console.info(`====>${testName} publishCallback failed: ${JSON.stringify(err)}`);
                }
            })
            })
        });

        /**
         * @tc.name   Sub_InputMethod_IME_Custom_static_0902
         * @tc.number Sub_InputMethod_IME_Custom_static_0902
         * @tc.desc   Switch current input method subtype.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_InputMethod_IME_Custom_static_0902', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
                textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            }
            }
            await inputMethod.getController().attach(true, ATTRIBUTE);
            testTemplate('Sub_InputMethod_IME_Custom_static_0902', 12, done)
        });

        /** 
        * @tc.name   Sub_InputMethod_IMF_sendMessagePromise_static_0300 
        * @tc.number Sub_InputMethod_IMF_sendMessagePromise_static_0300 
        * @tc.desc   Function test 
        * @tc.type   FUNCTION 
        * @tc.size   MEDIUMTEST 
        * @tc.level  LEVEL3 
        */ 
        it('Sub_InputMethod_IMF_sendMessagePromise_static_0300', Level.LEVEL3, async (done: () => void) => { 
            const testName = 'Sub_InputMethod_IMF_sendMessagePromise_static_0300'; 
            const ATTRIBUTE: inputMethod.TextConfig = { 
                inputAttribute: { 
                    textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED 
                } 
            }; 
            await inputMethod.getController().attach(true, ATTRIBUTE); 
            console.info(`====>${testName} attach success.`); 
            try { 
                let msgParam: ArrayBuffer = new ArrayBuffer(128); 
                await inputMethod.getController().sendMessage('', msgParam); 
                console.info(`====>${testName} sendMessage success.`); 
                done(); 
            } catch (err) { 
                console.info(`====>${testName} errCode:${err.code}, errMessage is ${err.message}`) 
                await inputMethod.getController().detach(); 
                expect().assertFail();
                done(); 
            }; 
        });

        /**
        * @tc.name   Sub_InputMethod_IME_Custom_static_0903
        * @tc.number Sub_InputMethod_IME_Custom_static_0903
        * @tc.desc   Switch current input method subtype.
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
        it('Sub_InputMethod_IME_Custom_static_0903', Level.LEVEL2, async (done: () => void): Promise<void> => {
            const testName = 'Sub_InputMethod_IME_Custom_static_0903'; 
            const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
                textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
            }
            }
            let value:string = 'B';
            let placeholderValue = value.repeat(255);
            let abilityNameValue = value.repeat(127);
            ATTRIBUTE.inputAttribute.placeholder = placeholderValue;
            ATTRIBUTE.inputAttribute.abilityName = abilityNameValue;
            try {
                await inputMethod.getController().attach(false, ATTRIBUTE);
                expect(true).assertTrue();
                done();
            } catch (err) {
                console.info(`====>${testName} errCode:${err.code}, errMessage is ${err.message}`) 
                expect().assertFail();
                done(); 
            }
        });

        /**
         * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_static_0801
         * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_static_0801
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_InputMethod_IMF_attachWithUIContextPromise_static_0801', Level.LEVEL3, async (done: () => void): Promise<void> => {
            const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_static_0801';
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
                },
                newEditBox: false,
                capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
            };
            try {
                let uiContext:UIContext = UIContext.getCallingScopeUIContext()!;
                await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE);
                console.info(`${CASE_NAME} attach success`);
                done();
            } catch (error) {
                console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
                expect(error.code).assertEqual(0);
                done();
            }
        });

        /**
         * @tc.name   Sub_InputMethod_IME_InputMethodState_static_0900
         * @tc.number Sub_InputMethod_IME_InputMethodState_static_0900
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Sub_InputMethod_IME_InputMethodState_static_0900', Level.LEVEL0, async (done: () => void) => {
            try {
                let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info('====>Sub_InputMethod_IME_InputMethodState_static_0900 getSetting success');
                let state =  await inputMethodSetting.getInputMethodState();
                console.info('====>Sub_InputMethod_IME_InputMethodState_static_0900 state is: ' + state);
                expect(state).assertEqual(inputMethod.EnabledState.FULL_EXPERIENCE_MODE);
                done();
            } catch (err) {
                console.info(`====>Sub_InputMethod_IME_InputMethodState_static_0900 errCode:${err.code}, errMessage is ${err.message}`)
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
         * @tc.level  LEVEL3
         */
        it('Sub_InputMethod_IME_InputMethodState_static_0901', Level.LEVEL3, async (done: () => void) => {
            try {
                let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
                await abilityDelegator.executeShellCommand('ime -e com.acts.inputmethodEngine.test.static -b');
                let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info('====>Sub_InputMethod_IME_InputMethodState_static_0901 getSetting success');
                let state =  await inputMethodSetting.getInputMethodState();
                console.info(`====>Sub_InputMethod_IME_InputMethodState_static_0901 state is: ${state}`);
                await Utils.msSleep(1000);
                await abilityDelegator.executeShellCommand('ime -e com.acts.inputmethodEngine.test.static -f');
                await Utils.msSleep(1000);
                expect(state).assertEqual(inputMethod.EnabledState.BASIC_MODE);
                done();
            } catch (err) {
                console.info(`====>Sub_InputMethod_IME_InputMethodState_static_0901 errCode:${err.code}, errMessage is ${err.message}`)
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   Sub_InputMethod_IME_InputMethodState_static_0902
         * @tc.number Sub_InputMethod_IME_InputMethodState_static_0902
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_InputMethod_IME_InputMethodState_static_0902', Level.LEVEL3, async (done: () => void) => {
            try {
                let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
                await abilityDelegator.executeShellCommand('ime -d com.acts.inputmethodEngine.test.static');
                await Utils.msSleep(1000);
                let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
                console.info('====>Sub_InputMethod_IME_InputMethodState_static_0902 getSetting success');
                let state =  await inputMethodSetting.getInputMethodState();
                console.info(`====>Sub_InputMethod_IME_InputMethodState_static_0902 state is: ${state}`);
                await abilityDelegator.executeShellCommand('ime -e com.acts.inputmethodEngine.test.static -f');
                await Utils.msSleep(1000);
                await abilityDelegator.executeShellCommand('ime -s com.acts.inputmethodEngine.test.static');
                await Utils.msSleep(1000);
                expect(state).assertEqual(inputMethod.EnabledState.DISABLED);
                done();
            } catch (err) {
                console.info(`====>Sub_InputMethod_IME_InputMethodState_static_0902 errCode:${err.code}, errMessage is ${err.message}`)
                expect().assertFail();
                done();
            }
        });


    })
}