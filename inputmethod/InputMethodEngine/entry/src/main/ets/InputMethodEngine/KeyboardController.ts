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


let inputMethodEngine = inputmethodengine.getInputMethodEngine();
let inputKeyboardDelegate = inputmethodengine.createKeyboardDelegate();
let inputMethodAbility = inputmethodengine.getInputMethodAbility();
const TAG = "keyboardController";

export class KeyboardController {
    mContext;
    WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
    windowName = 'inputApp';
    private windowHeight: number = 0;
    private windowWidth: number = 0;
    private nonBarPosition: number = 0;
    private keyboardController: inputmethodengine.KeyboardController;
    private TextInputClient: inputmethodengine.TextInputClient;

    constructor(context) {
        this.mContext = context;
    }

    public onCreate(): void {
        this.initWindow();
        let that = this;
        inputMethodAbility.on("inputStop", () => {
            inputMethodAbility.off("inputStop", () => {
                console.log('====>inputMethodEngine delete inputStop notification.');
            });
            try{
                that.mContext.destroy((err) => {
                    console.info(TAG + '====>inputMethodEngine destroy err:' + JSON.stringify(err));
                })
            }catch(err){
                console.info(TAG + '====>inputMethodEngine destroy catch err:' + JSON.stringify(err));
            }
        })

        inputMethodEngine.on('inputStart', async (keyboardController, TextInputClient) => {
            this.keyboardController = keyboardController;
            this.TextInputClient = TextInputClient
            console.info(TAG + '====>inputMethodEngine inputStart into');
        })

        function subscriberCallback(err, data) {
            console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
            console.info(TAG + '====>receive event data ' + JSON.stringify(data));
            switch (data.code) {
                case 1:
                    console.info(TAG + '====>inputMethodEngine_test_getInputMethodEngine_001 event:' + data.event);
                    that.inputMethodEngine_test_getInputMethodEngine_001();
                    break;
                case 2:
                    console.info(TAG + '====>inputMethodEngine_test_getKeyboardDelegate_001 event:' + data.event);
                    that.inputMethodEngine_test_getKeyboardDelegate_001();
                    break;
                case 28:
                    console.info(TAG + '====>inputMethodEngine_test_028 event:' + data.event);
                    that.inputMethodEngine_test_028();
                    break;
                case 29:
                    console.info(TAG + '====>inputMethodEngine_test_029 event:' + data.event);
                    that.inputMethodEngine_test_029();
                    break;
                case 30:
                    console.info(TAG + '====>inputMethodEngine_test_030 event:' + data.event);
                    that.inputMethodEngine_test_030();
                    break;
                case 31:
                    console.info(TAG + '====>inputMethodEngine_test_031 event:' + data.event);
                    that.inputMethodEngine_test_031();
                    break;
                case 32:
                    console.info(TAG + '====>inputMethodEngine_test_032 event:' + data.event);
                    that.inputMethodEngine_test_032();
                    break;
                case 33:
                    console.info(TAG + '====>inputMethodEngine_test_033 event:' + data.event);
                    that.inputMethodEngine_test_033();
                    break;
                case 34:
                    console.info(TAG + '====>inputMethodEngine_test_034 event:' + data.event);
                    that.inputMethodEngine_test_034();
                    break;
                case 35:
                    console.info(TAG + '====>inputMethodEngine_test_035 event:' + data.event);
                    that.inputMethodEngine_test_035();
                    break;
                case 36:
                    console.info(TAG + '====>inputMethodEngine_test_036 event:' + data.event);
                    that.inputMethodEngine_test_036();
                    break;
                case 37:
                    console.info(TAG + '====>inputMethodEngine_test_037 event:' + data.event);
                    that.inputMethodEngine_test_037();
                    break;
                case 38:
                    console.info(TAG + '====>inputMethodEngine_test_038 event:' + data.event);
                    that.inputMethodEngine_test_038();
                    break;
                case 39:
                    console.info(TAG + '====>inputMethodEngine_test_039 event:' + data.event);
                    that.inputMethodEngine_test_039();
                    break;
                case 40:
                    console.info(TAG + '====>inputMethodEngine_test_040 event:' + data.event);
                    that.inputMethodEngine_test_040();
                    break;
                case 41:
                    console.info(TAG + '====>inputMethodEngine_test_041 event:' + data.event);
                    that.inputMethodEngine_test_041();
                    break;
                case 42:
                    console.info(TAG + '====>inputMethodEngine_test_042 event:' + data.event);
                    that.inputMethodEngine_test_042();
                    break;
                case 43:
                    console.info(TAG + '====>inputMethodEngine_test_043 event:' + data.event);
                    that.inputMethodEngine_test_043();
                    break;
                case 49:
                    console.info(TAG + '====>inputMethodEngine_test_049 event:' + data.event);
                    that.inputMethodEngine_test_049();
                    break;
                case 50:
                    console.info(TAG + '====>inputMethodEngine_test_050 event:' + data.event);
                    that.inputMethodEngine_test_050();
                    break;
                case 71:
                    console.info(TAG + '====>inputMethodEngine_test_071 event:' + data.event);
                    that.inputMethodEngine_test_071();
                    break;
                case 72:
                    console.info(TAG + '====>inputMethodEngine_test_072 event:' + data.event);
                    that.inputMethodEngine_test_072();
                    break;
                case 73:
                    console.info(TAG + '====>inputMethodEngine_test_073 event:' + data.event);
                    that.inputMethodEngine_test_073();
                    break;
                case 74:
                    console.info(TAG + '====>inputMethodEngine_test_074 event:' + data.event);
                    that.inputMethodEngine_test_074();
                    break;
                case 76:
                    console.info(TAG + '====>inputMethodEngine_test_076 event:' + data.event);
                    that.inputMethodEngine_test_076();
                    break;
                case 77:
                    console.info(TAG + '====>inputMethodEngine_test_077 event:' + data.event);
                    that.inputMethodEngine_test_077();
                    break;
                case 78:
                    console.debug(TAG + '====>Sub_InputMethod_IME_VisualInput_0500 event:' + data.event);
                    that.Sub_InputMethod_IME_VisualInput_0500();
                    break;
                case 79:
                    console.debug(TAG + '====>Sub_InputMethod_IME_VisualInput_0600 event:' + data.event);
                    that.Sub_InputMethod_IME_VisualInput_0600();
                    break;
            }
        }

        var commonEventSubscribeInfo = {
            events: ["test1"]
        };

        var subscriber;
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
            subscriber = data;
            commoneventmanager.subscribe(subscriber, subscriberCallback);
            console.info(TAG + '====>scene subscribe finish====');
        });
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

    private initWindow(): void {
        display.getDefaultDisplay().then(dis => {
            var dWidth = dis.width;
            var dHeight = dis.height;
            var keyHeightRate = 0.47;
            var keyHeight = dHeight * keyHeightRate;
            this.windowWidth = dWidth;
            this.windowHeight = keyHeight;
            this.nonBarPosition = dHeight - keyHeight;

            var config = {
                name: this.windowName,
                windowType: this.WINDOW_TYPE_INPUT_METHOD_FLOAT,
                ctx: this.mContext
            };
            windowManager.createWindow(config).then((win) => {
                win.resize(dWidth, keyHeight).then(() => {
                    win.moveWindowTo(0, this.nonBarPosition).then(() => {
                        win.setUIContent('pages/service/index').then(() => {
                        });
                    });
                });
            });
        });
    }

    private publishCallback(err): void {
        if (err) {
            console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
        } else {
            console.log(TAG + '====>publish');
        }
    }

    private inputMethodEngine_test_getInputMethodEngine_001(): void {
        console.info(TAG + '====>receive inputMethodEngine_test_getInputMethodEngine_001 data');
        if (typeof(inputMethodEngine) === "object") {
            console.info(TAG + '====>receive inputMethodEngine_test_getInputMethodEngine_001 object');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.info(TAG + '====>receive inputMethodEngine_test_getInputMethodEngine_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_getInputMethodEngine_001", commonEventPublishData, this.publishCallback);
    }

    private inputMethodEngine_test_getKeyboardDelegate_001(): void {
        console.info(TAG + '====>receive inputMethodEngine_test_getKeyboardDelegate_001 data');
        if (typeof(inputKeyboardDelegate) === "object") {
            console.info(TAG + '====>receive inputMethodEngine_test_getKeyboardDelegate_001 object');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.info(TAG + '====>receive inputMethodEngine_test_getKeyboardDelegate_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_getKeyboardDelegate_001", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_028() {
        console.info(TAG + '====>receive inputMethodEngine_test_028 data');
        let commonEventPublishData;
        let editorAttribyte = await this.TextInputClient.getEditorAttribute();
        console.info(TAG + '====>receive inputMethodEngine_test_028 editorAttribyte: ' + JSON.stringify(editorAttribyte));
        this.TextInputClient.sendKeyFunction(editorAttribyte.enterKeyType, (err, value) => {
            if (err) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                console.info(TAG + '====>inputMethodEngine_test_028 TextInputClient sendKeyFunction err: ' + JSON.stringify(err));
            } else {
                console.info(TAG + '====>inputMethodEngine_test_028 TextInputClient sendKeyFunction value: ' + JSON.stringify(value));
                if (value) {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }

            }
            commoneventmanager.publish("inputMethodEngine_test_028", commonEventPublishData, this.publishCallback);
        })
    }
    async inputMethodEngine_test_029() {
        console.info(TAG + '====>receive inputMethodEngine_test_029 data');
        let commonEventPublishData;
        let editorAttribyte = await this.TextInputClient.getEditorAttribute();
        console.info(TAG + '====>inputMethodEngine_test_029 editorAttribyte:' + JSON.stringify(editorAttribyte));
        let value = await this.TextInputClient.sendKeyFunction(editorAttribyte.inputPattern);
        console.info(TAG + '====>inputMethodEngine_test_029 sendKeyFunction:' + JSON.stringify(value));
        if (value){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_029", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_030(){
        console.info(TAG + '====>receive inputMethodEngine_test_030 data');
        let commonEventPublishData;
        this.TextInputClient.deleteForward(1, (err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_030 deleteForward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_030 deleteForward value:' + JSON.stringify(value));
                if (typeof(value) === 'boolean'){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodEngine_test_030", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodEngine_test_031(){
        console.info(TAG + '====>receive inputMethodEngine_test_031 data');
        let commonEventPublishData;        
        let value = await this.TextInputClient.deleteForward(1);
        console.info(TAG + '====>inputMethodEngine_test_031 deleteForward:' + JSON.stringify(value));
        if (typeof(value) === 'boolean'){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_031", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_032() {
        console.info(TAG + '====>receive inputMethodEngine_test_032 data');        
        let commonEventPublishData;        
        this.TextInputClient.deleteBackward(1, (err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_032 deleteBackward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_032 deleteBackward value:' + JSON.stringify(value));
                if (value){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodEngine_test_032", commonEventPublishData, this.publishCallback);
        });                
    }

    async inputMethodEngine_test_033() {
        console.info(TAG + '====>receive inputMethodEngine_test_033 data');
        let commonEventPublishData;
        let value = await this.TextInputClient.deleteBackward(1);
        console.info(TAG + '====>inputMethodEngine_test_033 deleteBackward:' + JSON.stringify(value));
        if (value){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_033", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_034() {
        console.info(TAG + '====>receive inputMethodEngine_test_034 data');
        let commonEventPublishData;
        this.TextInputClient.insertText('test', (err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_034 insertText err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_034 insertText value:' + JSON.stringify(value));
                if (value){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodEngine_test_034", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodEngine_test_035() {
        console.info(TAG + '====>receive inputMethodEngine_test_035 data');
        let commonEventPublishData;
        let value =  await this.TextInputClient.insertText('test');
        console.info(TAG + '====>inputMethodEngine_test_035 insertText:' + JSON.stringify(value));
        if (value){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_035", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_036() {
        console.info(TAG + '====>receive inputMethodEngine_test_036 data');
        let commonEventPublishData;
        this.TextInputClient.getForward(1, (err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_036 getForward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_036 getForward value:' + JSON.stringify(value));
                if (typeof(value) !== null) {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodEngine_test_036", commonEventPublishData, this.publishCallback);
        });
}

    async inputMethodEngine_test_037() {
        console.info(TAG + '====>receive inputMethodEngine_test_037 data');
        let commonEventPublishData;
        let value =  await this.TextInputClient.getForward(1);
        console.info(TAG + '====>inputMethodEngine_test_037 getForward:' + JSON.stringify(value));
        if (typeof(value) !== null) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_037", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_038() {
        console.info(TAG + '====>receive inputMethodEngine_test_038 data');
        let commonEventPublishData;
        this.TextInputClient.getEditorAttribute((err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_038 getEditorAttribute err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_038 getEditorAttribute value:' + JSON.stringify(value));
                if (value){
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodEngine_test_038", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodEngine_test_039() {
        console.info(TAG + '====>receive inputMethodEngine_test_039 data');
        let commonEventPublishData;
        let value =  await this.TextInputClient.getEditorAttribute();
        console.info(TAG + '====>inputMethodEngine_test_039 getEditorAttribute:' + JSON.stringify(value));
        if (value){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodEngine_test_039", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_040() {
        console.info(TAG + '====>receive inputMethodEngine_test_040 data');
        let commonEventPublishData;
        try{
            this.keyboardController.hideKeyboard((err, value) => {
                if (err){
                    console.info(TAG + '====>inputMethodEngine_test_040 hideKeyboard:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodEngine_test_040", commonEventPublishData, this.publishCallback);
            });
        }catch(err){
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodEngine_test_040 hideKeyboard throw_err:');
            commoneventmanager.publish("inputMethodEngine_test_040", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodEngine_test_041() {
        console.info(TAG + '====>receive inputMethodEngine_test_041 data');
        let commonEventPublishData;
        try{
            await this.keyboardController.hideKeyboard();
            console.info(TAG + '====>inputMethodEngine_test_041 hideKeyboard success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        }catch(err){
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodEngine_test_041 hideKeyboard catch err:');
        }
        commoneventmanager.publish("inputMethodEngine_test_041", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_042() {
        console.info(TAG + '====>receive inputMethodEngine_test_042 data');
        let commonEventPublishData;
        this.TextInputClient.getBackward(1, (err, value) => {
            if (err){
                console.info(TAG + '====>inputMethodEngine_test_042 getBackward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodEngine_test_042 getBackward value:' + JSON.stringify(value));
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodEngine_test_042", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodEngine_test_043() {
        console.info(TAG + '====>receive inputMethodEngine_test_043 data');
        let commonEventPublishData;
        let value =  await this.TextInputClient.getBackward(1);
        console.info(TAG + '====>inputMethodEngine_test_043 getBackward:' + JSON.stringify(value));
        commonEventPublishData = {
            data: "SUCCESS"
        };
        commoneventmanager.publish("inputMethodEngine_test_043", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_049() {
        console.info(TAG + '====>receive inputMethodEngine_test_049 data');
        let commonEventPublishData;
        try{
            this.keyboardController.hide((err, value) => {
                if (err){
                    console.info(TAG + '====>inputMethodEngine_test_049 hide:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodEngine_test_049", commonEventPublishData, this.publishCallback);
            });
        }catch(err){
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodEngine_test_049 hide throw_err:');
            commoneventmanager.publish("inputMethodEngine_test_040", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodEngine_test_050() {
        console.info(TAG + '====>receive inputMethodEngine_test_050 data');
        let commonEventPublishData;
        try{
            await this.keyboardController.hide();
            console.info(TAG + '====>inputMethodEngine_test_050 hideKeyboard success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        }catch(err){
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodEngine_test_050 hideKeyboard catch err:');
        }
        commoneventmanager.publish("inputMethodEngine_test_050", commonEventPublishData, this.publishCallback);
    }

    async inputMethodEngine_test_071() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_071 success');
        let count = 0;
        inputMethodEngine.on('keyboardHide', () => {
            count += 1;
            inputMethodEngine.off("keyboardHide");
            console.info(TAG + '====>inputMethodEngine.off("keyboardHide") count: ' + count);
        });

        let t = setTimeout(async () => {
            clearTimeout(t);
            await this.keyboardController.hideKeyboard();
            console.info(TAG + '====>inputMethodEngine_test_071 hideKeyboard success');
        },100);

        let t1 = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodEngine_test_071", commonEventPublishData, this.publishCallback);
            clearTimeout(t1);
        },1000);
    }

    async inputMethodEngine_test_072() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_072 success');
        let count = 0;
        inputMethodEngine.on('keyboardShow', () => {
            count += 1;
            inputMethodEngine.off("keyboardShow");
            console.info(TAG + '====>inputMethodEngine.off("keyboardShow") count: ' + count);
        });

        let t1 = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodEngine_test_072", commonEventPublishData, this.publishCallback);
            clearTimeout(t1);
        },1500);
    }

    async inputMethodEngine_test_073() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_073 success');
        let count = 0;
        inputKeyboardDelegate.on('keyDown', (keyEvent) => {
            inputKeyboardDelegate.off('keyDown');
            console.info(TAG + "====>inputKeyboardDelegate.on('keyDown') count: " + count);
            console.info(TAG + "====>inputKeyboardDelegate.keyEvent.keyAction " + keyEvent.keyAction);
            if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 2){
                count += 1;
            }
            return true;
        });
        inputKeyboardDelegate.on('keyUp', (keyEvent) => {
            inputKeyboardDelegate.off('keyUp');
            console.info(TAG + "====>inputKeyboardDelegate.on('keyUp') count: " + count);
            console.info(TAG + "====>inputKeyboardDelegate.keyEvent.keyAction " + keyEvent.keyAction);
            if (keyEvent.keyCode === 2000 && keyEvent.keyAction === 3){
                count += 1;
            }
            return true;
        });
        let t = setTimeout(() => {
            commonEventPublishData = {
                data: "SUCCESS"
            };
            commoneventmanager.publish("inputMethodEngine_test_073", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        },1000);
    }

    async inputMethodEngine_test_074() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_074 success');
        let count = 0;
        inputKeyboardDelegate.on('cursorContextChange', (x, y, h) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('cursorContextChange') count: " + count);
            if (count === 1){
                inputKeyboardDelegate.off('cursorContextChange');
            }
            count += 1;
            console.info(TAG + '====>inputMethodEngine_test_074 x,y,z: ' + x + "---" + y + "---" + h);
        });
        
        let t = setTimeout(async () => {
            clearTimeout(t);
            await this.TextInputClient.insertText("ttt");
            console.info(TAG + '====>keyboardController.insertText count: ' +  count);
        },1000);

        let t1 = setTimeout(() => {
            if(count === 2){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodEngine_test_074", commonEventPublishData, this.publishCallback);
            clearTimeout(t1);
        },1500);
    }

    async inputMethodEngine_test_076() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_076 success');
        inputKeyboardDelegate.on('selectionChange', (oldBegin, oldEnd, newBegin, newEnd) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('selectionChange')");
            inputKeyboardDelegate.off('selectionChange');
            commonEventPublishData = {
                data: "SUCCESS"
            };
            console.info(TAG + '====>inputMethodEngine_test_076 oldBegin,oldEnd,newBegin,newEnd: ' + oldBegin + "---" + oldEnd + "---" + newBegin + "---" + newEnd);
        });

        let t = setTimeout(() => {
            commoneventmanager.publish("inputMethodEngine_test_076", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        },2000);
    }

    async inputMethodEngine_test_077() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodEngine_test_077 success');
        let count = 0;
        inputKeyboardDelegate.on('textChange', (text) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('textChange') count:" + count);
            if (count === 1){
                inputKeyboardDelegate.off('textChange');
            }
            count += 1;
            console.info(TAG + '====>inputMethodEngine_test_077 text: ' + text);
        });

        let loopCount = 0;
        let t = setInterval(async () => {
                await this.TextInputClient.insertText("tttt");
            console.info(TAG + '====>keyboardController.insertText count: ' +  count);
            if (loopCount === 2) {
                clearInterval(t);
            }
            loopCount += 1;
        },300);

        let t1 = setTimeout(() => {
            if(count === 2){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodEngine_test_077", commonEventPublishData, this.publishCallback);
            clearTimeout(t1);
        },2000);
    }

    async Sub_InputMethod_IME_VisualInput_0500() {
        console.info(TAG + '====>receive Sub_InputMethod_IME_VisualInput_0500 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try{
            console.info(TAG + '====>Sub_InputMethod_IME_VisualInput_0500 exitCurrentInputType start');
            await this.keyboardController.exitCurrentInputType();
            console.info(TAG + '====>Sub_InputMethod_IME_VisualInput_0500 exitCurrentInputType success');
            commonEventPublishData = {
                data: "FAILED"
            };
        }catch(err){
            console.info(TAG + '====>Sub_InputMethod_IME_VisualInput_0500 exitCurrentInputType catch err:' + JSON.stringify(err));
            if (err.code === 12800010) {
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish('Sub_InputMethod_IME_VisualInput_0500', commonEventPublishData, this.publishCallback);
    }

    async Sub_InputMethod_IME_VisualInput_0600() {
        console.info(TAG + '====>receive Sub_InputMethod_IME_VisualInput_0600 data');
            let commonEventPublishData = {
                data: "FAILED"
            };
            this.keyboardController.exitCurrentInputType((err) => {
                console.info(TAG + '====>Sub_InputMethod_IME_VisualInput_0600 exitCurrentInputType failed: ' + JSON.stringify(err));
                if (err.code === 12800010) {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    console.info(TAG + '====>Sub_InputMethod_IME_VisualInput_0600 exitCurrentInputType not throw 12800010');
                }
                commoneventmanager.publish('Sub_InputMethod_IME_VisualInput_0600', commonEventPublishData, this.publishCallback);
            });
    }

}