import prompt from '@ohos.prompt';
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import inputmethodengine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commoneventmanager from '@ohos.commonEventManager';


let inputKeyboardDelegate = inputmethodengine.getKeyboardDelegate();
let inputMethodAbility = inputmethodengine.getInputMethodAbility();
const TAG = "keyboardController";

export class KeyboardController {
    mContext;
    WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
    windowName = 'inputApp';

    constructor(context) {
        this.mContext = context;
    }

    public onCreate(): void {
        let that = this;
        inputMethodAbility.on("inputStop", () => {
            this.mContext.destroy((err, data) => {
                console.info(TAG + '====>inputMethodEngine destorey err:' + JSON.stringify(err));
                console.info(TAG + '====>inputMethodEngine destorey data:' + JSON.stringify(data));
            });
        });

        function subscriberCallback(err, data) {
            console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
            console.info(TAG + '====>receive event data ' + JSON.stringify(data));
            switch (data.code) {
                case 10:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0010();
                    break;
                case 20:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0020();
                    break;
                case 30:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0030();
                    break;
                case 40:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0040();
                    break;
                case 50:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0050();
                    break;
                case 60:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0060();
                    break;
                case 70:
                    console.info(TAG + '====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 event:' + data.event);
                    that.SUB_Misc_InputMethod_Manage_Physical_Buttons_0070();
                    break;
            }
        }

        var commonEventSubscribeInfo = {
            events: ["inputMethodEngineKeyTest"]
        };

        var subscriber;
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
            subscriber = data;
            commoneventmanager.subscribe(subscriber, subscriberCallback);
            console.info(TAG + '====>scene subscribe finish====');
        });
    }

    private publishCallback(err): void {
        if (err) {
            console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
        } else {
            console.log(TAG + '====>publish');
        }
    }

    public onDestroy(): void {
        console.log('imsakitjsapp onDestroy');
        globalThis.textInputClient.getTextIndexAtCursor().then((index) => {
            console.log('imsakitjsapp getTextIndexAtCursor:  index = ' + index);
            prompt.showToast({ message: 'getTextIndexAtCursor success' + index, duration: 200, bottom: 500 });
            var win = windowManager.findWindow(this.windowName);
            win.destroyWindow();
            this.mContext.terminateSelf();
            return true;
        }).catch((err) => {
            prompt.showToast({ message: 'getTextIndexAtCursor failed', duration: 200, bottom: 500 });
        });
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0010(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyEvent: "  + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyEvent: "  + KeyEvents.key.code);
                if (KeyEvents.key.code === 2045){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0010 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0010", commonEventPublishData, this.publishCallback);
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0020(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyEvent: "  + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyEvent: "  + KeyEvents.key.code);
                if (KeyEvents.key.code === 2017 && KeyEvents.action === 1){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }else{
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0020 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0020", commonEventPublishData, this.publishCallback);
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0030(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        let arr = new Array();
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 keyEvent: " + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 keyEvent: " + KeyEvents.key.code);
                arr.push(KeyEvents.action);
                arr.push(KeyEvents.key.code);
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 arr: " + JSON.stringify(arr));
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0030 arr: " + arr.join());
            if (arr.join() === '1,2072,1,2017,2,2017,2,2072'){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0030", commonEventPublishData, this.publishCallback);
            }else{
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0030", commonEventPublishData, this.publishCallback);
            }
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0040(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        let arr = new Array();
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 keyEvent: " + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 keyEvent: " + KeyEvents.key.code);
                arr.push(KeyEvents.action);
                arr.push(KeyEvents.key.code);
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 arr: " + JSON.stringify(arr));
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0040 arr: " + arr.join());
            if (arr.join() === '1,2017,1,2047,2,2047,2,2017'){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0040", commonEventPublishData, this.publishCallback);
            }else {
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0040", commonEventPublishData, this.publishCallback);
            }
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0050(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        let arr = new Array();
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 keyEvent: " + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 keyEvent: " + KeyEvents.key.code);
                arr.push(KeyEvents.action);
                arr.push(KeyEvents.key.code);
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 arr: " + JSON.stringify(arr));
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0050 arr: " + arr.join());
            if (arr.join() === '1,2047,1,2017,2,2017,2,2047'){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0050", commonEventPublishData, this.publishCallback);
            }else {
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0050", commonEventPublishData, this.publishCallback);
            }
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0060(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        let arr = new Array();
        console.info(TAG + '====>receive SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 keyEvent: " + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 keyEvent: " + KeyEvents.key.code);
                arr.push(KeyEvents.action);
                arr.push(KeyEvents.key.code);
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 arr: " + JSON.stringify(arr));
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0060 arr: " + arr.join());
            if (arr.join() === '1,2047,1,2001,2,2001,2,2047'){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0060", commonEventPublishData, this.publishCallback);
            }else {
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0060", commonEventPublishData, this.publishCallback);
            }
        }, 500);
    }

    private SUB_Misc_InputMethod_Manage_Physical_Buttons_0070(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        let arr = new Array();
        console.info(TAG + '====>receive r success');
        inputKeyboardDelegate.on('keyEvent', (KeyEvents) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('keyEvent')");
            try{
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 keyEvent: " + KeyEvents.action);
                console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 keyEvent: " + KeyEvents.key.code);
                arr.push(KeyEvents.action);
                arr.push(KeyEvents.key.code);
            }catch(err){
                console.error("====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 keyDown throw_error: " + err);
            }
            return true;
        });
        let t = setTimeout(() => {
            clearTimeout(t);
            inputKeyboardDelegate.off("keyEvent");
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 arr: " + JSON.stringify(arr));
            console.info(TAG + "====>SUB_Misc_InputMethod_Manage_Physical_Buttons_0070 arr: " + arr.join());
            if (arr.join() === '1,2047,1,2062,2,2062,2,2047'){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0070", commonEventPublishData, this.publishCallback);
            }else {
                commoneventmanager.publish("SUB_Misc_InputMethod_Manage_Physical_Buttons_0070", commonEventPublishData, this.publishCallback);
            }
        }, 500);
    }



}