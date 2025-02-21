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
import inputMethodEngine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import promptAction from '@ohos.promptAction';
import commoneventmanager from '@ohos.commonEventManager';

let inputMethodAbility = inputMethodEngine.getInputMethodAbility();
let inputKeyboardDelegate = inputMethodEngine.getKeyboardDelegate();

const TAG = 'KeyboardDelegate';

export class KeyboardDelegate {
    mContext;
    WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
    windowName = 'inputApp';
    private windowHeight: number = 0;
    private windowWidth: number = 0;
    private nonBarPosition: number = 0;
    private keyboardController: inputMethodEngine.KeyboardController;
    private InputClient: inputMethodEngine.InputClient;

    constructor(context) {
        this.mContext = context;
    }

    private onInputStop() {
        try{
            this.mContext.destroy((err) => {
                console.info(TAG + '====>inputMethodEngine destroy err:' + JSON.stringify(err));
            })
        }catch(err){
            console.info(TAG + '====>inputMethodEngine destroy catch err:' + JSON.stringify(err));
        }
    }

    public onCreate(): void {
        this.initWindow();
        let that = this;
        this.onInputStop = this.onInputStop.bind(this)
        inputMethodAbility.on('inputStop', this.onInputStop)
        inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
            this.keyboardController = keyboardController;
            this.InputClient = InputClient
            console.info(TAG + '====>inputMethodAbility inputStart into');
        })

        function subscriberCallback(err, data) {
            console.info(TAG + '====>receive event err:' + JSON.stringify(err));
            console.info(TAG + '====>receive event data:' + JSON.stringify(data));
            switch (data.code) {
                case 1:
                    console.info(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 event:' + data.event);
                    that.inputMethodAbility_test_getInputMethodAbility_001();
                    break;
                case 2:
                    console.info(TAG + '====>inputMethodAbility_test_getInputMethodDelegate_001 event:' + data.event);
                    that.inputMethodAbility_test_getKeyboardDelegate_001();
                    break;
                case 28:
                    console.info(TAG + '====>inputMethodAbility_test_028 event:' + data.event);
                    that.inputMethodAbility_test_028();
                    break;
                case 29:
                    console.info(TAG + '====>inputMethodAbility_test_029 event:' + data.event);
                    that.inputMethodAbility_test_029();
                    break;
                case 30:
                    console.info(TAG + '====>inputMethodAbility_test_030 event:' + data.event);
                    that.inputMethodAbility_test_030();
                    break;
                case 31:
                    console.info(TAG + '====>inputMethodAbility_test_031 event:' + data.event);
                    that.inputMethodAbility_test_031();
                    break;
                case 32:
                    console.info(TAG + '====>inputMethodAbility_test_032 event:' + data.event);
                    that.inputMethodAbility_test_032();
                    break;
                case 33:
                    console.info(TAG + '====>inputMethodAbility_test_033 event:' + data.event);
                    that.inputMethodAbility_test_033();
                    break;
                case 34:
                    console.info(TAG + '====>inputMethodAbility_test_034 event:' + data.event);
                    that.inputMethodAbility_test_034();
                    break;
                case 35:
                    console.info(TAG + '====>inputMethodAbility_test_035 event:' + data.event);
                    that.inputMethodAbility_test_035();
                    break;
                case 36:
                    console.info(TAG + '====>inputMethodAbility_test_036 event:' + data.event);
                    that.inputMethodAbility_test_036();
                    break;
                case 37:
                    console.info(TAG + '====>inputMethodAbility_test_037 event:' + data.event);
                    that.inputMethodAbility_test_037();
                    break;
                case 38:
                    console.info(TAG + '====>inputMethodAbility_test_038 event:' + data.event);
                    that.inputMethodAbility_test_038();
                    break;
                case 39:
                    console.info(TAG + '====>inputMethodAbility_test_039 event:' + data.event);
                    that.inputMethodAbility_test_039();
                    break;
                case 40:
                    console.info(TAG + '====>inputMethodAbility_test_040 event:' + data.event);
                    that.inputMethodAbility_test_040();
                    break;
                case 41:
                    console.info(TAG + '====>inputMethodAbility_test_041 event:' + data.event);
                    that.inputMethodAbility_test_041();
                    break;
                case 42:
                    console.info(TAG + '====>inputMethodAbility_test_042 event:' + data.event);
                    that.inputMethodAbility_test_042();
                    break;
                case 43:
                    console.info(TAG + '====>inputMethodAbility_test_043 event:' + data.event);
                    that.inputMethodAbility_test_043();
                    break;
                case 45:
                    console.info(TAG + '====>inputMethodAbility_test_045 event:' + data.event);
                    that.inputMethodAbility_test_045();
                    break;
                case 46:
                    console.info(TAG + '====>inputMethodAbility_test_046 event:' + data.event);
                    that.inputMethodAbility_test_046();
                    break;
                case 47:
                    console.info(TAG + '====>inputMethodAbility_test_047 event:' + data.event);
                    that.inputMethodAbility_test_047();
                    break;
                case 48:
                    console.info(TAG + '====>inputMethodAbility_test_048 event:' + data.event);
                    that.inputMethodAbility_test_048();
                    break;
                case 49:
                    console.info(TAG + '====>inputMethodAbility_test_049 event:' + data.event);
                    that.inputMethodAbility_test_049();
                    break;
                case 50:
                    console.info(TAG + '====>inputMethodAbility_test_050 event:' + data.event);
                    that.inputMethodAbility_test_050();
                    break;
                case 70:
                    console.info(TAG + '====>inputMethodAbility_test_070 event:' + data.event);
                    that.inputMethodAbility_test_070();
                    break;
                case 71:
                    console.info(TAG + '====>inputMethodAbility_test_071 event:' + data.event);
                    that.inputMethodAbility_test_071();
                    break;
                case 72:
                    console.info(TAG + '====>inputMethodAbility_test_072 event:' + data.event);
                    that.inputMethodAbility_test_072();
                    break;
                case 73:
                    console.info(TAG + '====>inputMethodAbility_test_073 event:' + data.event);
                    that.inputMethodAbility_test_073();
                    break;
                case 74:
                    console.info(TAG + '====>inputMethodAbility_test_074 event:' + data.event);
                    that.inputMethodAbility_test_074();
                    break;
                case 91:
                    console.info(TAG + '====>inputMethodAbility_test_091 event:' + data.event);
                    that.inputMethodAbility_test_091();
                    break;
                case 101:
                    console.info(TAG + '====>inputMethodAbility_test_0101 event:' + data.event);
                    that.inputMethodAbility_test_101();
                    break;
                case 102:
                    console.info(TAG + '====>inputMethodAbility_test_0102 event:' + data.event);
                    that.inputMethodAbility_test_102();
                    break;
                case 103:
                    console.info(TAG + '====>inputMethodAbility_test_0103 event:' + data.event);
                    that.inputMethodAbility_test_103();
                    break;
                case 104:
                    console.info(TAG + '====>inputMethodAbility_test_0104 event:' + data.event);
                    that.inputMethodAbility_test_104();
                    break;
                case 105:
                    console.info(TAG + '====>inputMethodAbility_test_0105 event:' + data.event);
                    that.inputMethodAbility_test_105();
                    break;
                case 106:
                    console.info(TAG + '====>inputMethodAbility_test_0106 event:' + data.event);
                    that.inputMethodAbility_test_106();
                    break;
                case 110:
                    console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByRange_0110 event:' + data.event);
                    that.Sub_Misc_inputMethod_onSelectByRange_0110();
                    break;
                case 120:
                    console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByMovement_0120 event:' + data.event);
                    that.Sub_Misc_inputMethod_onSelectByMovement_0120();
                    break;
                case 130:
                    console.info(TAG + '====>Sub_Misc_inputMethod_offSelectByRange_0130 event:' + data.event);
                    that.Sub_Misc_inputMethod_offSelectByRange_0130();
                    break;
                case 140:
                    console.info(TAG + '====>Sub_Misc_inputMethod_offSelectByMovement_0140 event:' + data.event);
                    that.Sub_Misc_inputMethod_offSelectByMovement_0140();
                    break;
                case 170:
                    console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0170 event:' + data.event);
                    that.Sub_Misc_inputMethod_sendExtendAction_0170();
                    break;
                case 180:
                    console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0180 event:' + data.event);
                    that.Sub_Misc_inputMethod_sendExtendAction_0180();
                    break;
                case 200:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0200 event:' + data.event);
                    that.Sub_Misc_inputMethod_getForward_sync_0200();
                    break;
                case 201:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0201 event:' + data.event);
                    that.Sub_Misc_inputMethod_getForward_sync_0201();
                    break;
                case 210:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0210 event:' + data.event);
                    that.Sub_Misc_inputMethod_getBackward_sync_0210();
                    break;
                case 211:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0211 event:' + data.event);
                    that.Sub_Misc_inputMethod_getBackward_sync_0211();
                    break;
                case 220:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 event:' + data.event);
                    that.Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220();
                    break;
                case 221:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 event:' + data.event);
                    that.Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221();
                    break;
                case 230:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 event:' + data.event);
                    that.Sub_Misc_inputMethod_getEditorAttribute_sync_0230();
                    break;
                case 231:
                    console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 event:' + data.event);
                    that.Sub_Misc_inputMethod_getEditorAttribute_sync_0231();
                    break;
                case 240:
                    console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0240 event:' + data.event);
                    that.Sub_Misc_inputMethod_moveCursor_sync_0240();
                    break;
                case 241:
                    console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0241 event:' + data.event);
                    that.Sub_Misc_inputMethod_moveCursor_sync_0241();
                    break;
                case 250:
                    console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0250 event:' + data.event);
                    that.Sub_Misc_inputMethod_deleteForward_sync_0250();
                    break;
                case 251:
                    console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0251 event:' + data.event);
                    that.Sub_Misc_inputMethod_deleteForward_sync_0251();
                    break;
                case 260:
                    console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0260 event:' + data.event);
                    that.Sub_Misc_inputMethod_deleteBackward_sync_0260();
                    break;
                case 261:
                    console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0261 event:' + data.event);
                    that.Sub_Misc_inputMethod_deleteBackward_sync_0261();
                    break;
                case 270:
                    console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_0270 event:' + data.event);
                    that.Sub_Misc_inputMethod_insertText_sync_0270();
                    break;
                case 271:
                    console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_0271 event:' + data.event);
                    that.Sub_Misc_inputMethod_insertText_sync_0271();
                    break;
                case 280:
                    console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0280 event:' + data.event);
                    that.Sub_Misc_inputMethod_selectByRange_sync_0280();
                    break;
                case 281:
                    console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0281 event:' + data.event);
                    that.Sub_Misc_inputMethod_selectByRange_sync_0281();
                    break;
                case 290:
                    console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0290 event:' + data.event);
                    that.Sub_Misc_inputMethod_selectByMovement_sync_0290();
                    break;
                case 291:
                    console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0291 event:' + data.event);
                    that.Sub_Misc_inputMethod_selectByMovement_sync_0291();
                    break;
                case 300:
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0400 event:' + data.event);
                    that.Sub_Misc_Request_InputMethod_selectContext_0400();
                    break;
                case 310:
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0500 event:' + data.event);
                    that.Sub_Misc_Request_InputMethod_selectContext_0500();
                    break;
                case 320:
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0600 event:' + data.event);
                    that.Sub_Misc_Request_InputMethod_selectContext_0600();
                    break;
            }
        }

        var commonEventSubscribeInfo = {
            events: ["test"]
        };

        var subscriber;
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
            subscriber = data;
            commoneventmanager.subscribe(subscriber, subscriberCallback);
            console.info(TAG + '====>scene subscribe finish====');
        });
    }

    public initWindow(): void {
        let dis = display.getDefaultDisplaySync();
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
            cts: this.mContext
        };

        windowManager.createWindow(config).then((win) => {
            win.resize(dWidth, keyHeight).then(() => {
                win.moveWindowTo(0, this.nonBarPosition).then(() => {
                    win.setUIContent('page/service/index').then(() => {
                    });
                });
            });
        });
    }

    public onDestroy(): void {
        console.info(TAG + '====>onDestroy');
        inputMethodAbility.off('inputStop', this.onInputStop)

    }

    private publishCallback(err): void {
        if (err) {
            console.error(TAG + '====>publish failed:' + JSON.stringify(err));
        } else {
            console.info(TAG + '====>publish');
        }
    }

    public async offInputStop_test() {
        console.info(TAG + '====>inputMethodAbility_test_091.offInputStop_test callback');
        let commonEventPublishData = {
            data: "FAILED"
        };
        this.mContext.destroy((err) => {
            console.info(TAG + '====>inputMethodAbility offInputStop_test destroy err: ' + JSON.stringify(err));
            commoneventmanager.publish("inputMethodAbility_test_091", commonEventPublishData,() => {});
        })
    }

    public inputMethodAbility_test_091(): void{
        console.info(TAG + '====>inputMethodAbility_test_091 start');
        this.offInputStop_test = this.offInputStop_test.bind(this);
        inputMethodAbility.on("inputStop",this.offInputStop_test);
        inputMethodAbility.off("inputStop",this.offInputStop_test);
        console.info(TAG + '====>inputMethodAbility_test_091 end');
    }

    private inputMethodAbility_test_getInputMethodAbility_001(): void {
        console.info(TAG + '====>receive inputMethodAbility_test_getInputMethodAbility_001 data');
        if (typeof(inputMethodAbility) === 'object') {
            console.info(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 success');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.info(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_getInputMethodAbility_001", commonEventPublishData, this.publishCallback);
    }

    private inputMethodAbility_test_getKeyboardDelegate_001(): void {
        console.info(TAG + '====>receive inputMethodAbility_test_getKeyboardDelegate_001 data');
        if (typeof (inputKeyboardDelegate) === 'object') {
            console.info(TAG + '====>inputMethodAbility_test_getKeyboardDelegate_001 success');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.info(TAG + '====>inputMethodAbility_test_getKeyboardDelegate_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_getKeyboardDelegate_001", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_028() {
        console.info(TAG + '====>receive inputMethodAbility_test_028 data');
        let commonEventPublishData;
        let editorAttribyte =  await this.InputClient.getEditorAttribute();
        console.info(TAG + '====>inputMethodAbility_test_028 editorAttribyte:' + JSON.stringify(editorAttribyte));
        this.InputClient.sendKeyFunction(editorAttribyte.enterKeyType, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_028 sendKeyFunction err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_028 sendKeyFunction value:' + JSON.stringify(value));
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
            commoneventmanager.publish("inputMethodAbility_test_028", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_029() {
        console.info(TAG + '====>receive inputMethodAbility_test_029 data');
        let commonEventPublishData;
        let editorAttribyte =  await this.InputClient.getEditorAttribute();
        console.info(TAG + '====>inputMethodAbility_test_029 editorAttribyte:' + JSON.stringify(editorAttribyte));
        let value = this.InputClient.sendKeyFunction(editorAttribyte.enterKeyType);
        console.info(TAG + '====>inputMethodAbility_test_029 sendKeyFunction value:' + JSON.stringify(value));
        if (value) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_029", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_030() {
        console.info(TAG + '====>receive inputMethodAbility_test_030 data');
        let commonEventPublishData;
        this.InputClient.deleteForward(1, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_030 deleteForward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_030 deleteForward value:' + JSON.stringify(value));
                if (typeof value === 'boolean') {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                }
            }
            commoneventmanager.publish("inputMethodAbility_test_030", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_031() {
        console.info(TAG + '====>receive inputMethodAbility_test_031 data');
        let commonEventPublishData;
        let value =  await this.InputClient.deleteForward(1);
        console.info(TAG + '====>inputMethodAbility_test_031 deleteForward value:' + value);
        if (typeof value === 'boolean') {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_031", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_032() {
        console.info(TAG + '====>receive inputMethodAbility_test_032 data');
        let commonEventPublishData;
        this.InputClient.deleteBackward(1, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_032 deleteBackward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_032 deleteBackward value:' + JSON.stringify(value));
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
            commoneventmanager.publish("inputMethodAbility_test_032", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_033() {
        console.info(TAG + '====>receive inputMethodAbility_test_033 data');
        let commonEventPublishData;
        let value =  await this.InputClient.deleteBackward(1);
        console.info(TAG + '====>inputMethodAbility_test_033 deleteBackward value:' + JSON.stringify(value));
        if (value) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_033", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_034() {
        console.info(TAG + '====>receive inputMethodAbility_test_034 data');
        let commonEventPublishData;
        this.InputClient.insertText('test', (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_034 insertText err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_034 insertText value:' + JSON.stringify(value));
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
            commoneventmanager.publish("inputMethodAbility_test_034", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_035() {
        console.info(TAG + '====>receive inputMethodAbility_test_035 data');
        let commonEventPublishData;
        let value =  await this.InputClient.insertText('test');
        console.info(TAG + '====>inputMethodAbility_test_035 insertText value:' + JSON.stringify(value));
        if (value) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_035", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_036() {
        console.info(TAG + '====>receive inputMethodAbility_test_036 data');
        let commonEventPublishData;
        this.InputClient.getForward(1, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_036 getForward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_036 getForward value:' + JSON.stringify(value));
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
            commoneventmanager.publish("inputMethodAbility_test_036", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_037() {
        console.info(TAG + '====>receive inputMethodAbility_test_037 data');
        let commonEventPublishData;
        let value =  await this.InputClient.getForward(1);
        console.info(TAG + '====>inputMethodAbility_test_037 getForward value' + JSON.stringify(value));
        if (typeof(value) !== null) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_037", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_038() {
        console.info(TAG + '====>receive inputMethodAbility_test_038 data');
        let commonEventPublishData;
        this.InputClient.getEditorAttribute((err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_038 getEditorAttribute err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_038 getEditorAttribute value:' + JSON.stringify(value));
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
            commoneventmanager.publish("inputMethodAbility_test_038", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_039() {
        console.info(TAG + '====>receive inputMethodAbility_test_039 data');
        let commonEventPublishData;           
        let value =  await this.InputClient.getEditorAttribute();
        console.info(TAG + '====>inputMethodAbility_test_039 getEditorAttribute value:' + JSON.stringify(value));
        if (value) {
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_039", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_040() {
        console.info(TAG + '====>receive inputMethodAbility_test_040 data');
        let commonEventPublishData;
        try {
            this.keyboardController.hideKeyboard((err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_040 hideKeyboard err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_040 hideKeyboard throw_err:');
            commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodAbility_test_041() {
        console.info(TAG + '====>receive inputMethodAbility_test_041 data');
        let commonEventPublishData;
        try {
            await this.keyboardController.hideKeyboard();
            console.info(TAG + '====>inputMethodAbility_test_041 hideKeyboard success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_041 hideKeyboard catch err:' + JSON.stringify(err));
        }
        commoneventmanager.publish("inputMethodAbility_test_041", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_042() {
        console.info(TAG + '====>receive inputMethodAbility_test_042 data');
        let commonEventPublishData;
        this.InputClient.getBackward(1, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_042 getBackward err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_042 getBackward value:' + JSON.stringify(value));
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_042", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_043() {
        console.info(TAG + '====>receive inputMethodAbility_test_043 data');
        let commonEventPublishData;
        let value =  await this.InputClient.getBackward(1);
        console.info(TAG + '====>inputMethodAbility_test_043 getBackward value:' + JSON.stringify(value));
        commonEventPublishData = {
            data: "SUCCESS"
        };
        commoneventmanager.publish("inputMethodAbility_test_043", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_045() {
        console.info(TAG + '====>receive inputMethodAbility_test_045 data');
        let t = setTimeout(()=>{
            let commonEventPublishData;
            this.InputClient.moveCursor(inputMethodEngine.CURSOR_UP, (err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_045 CURSOR_UP err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    console.info(TAG + '====>inputMethodAbility_test_045 CURSOR_UP value:' + JSON.stringify(value));
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodAbility_test_045", commonEventPublishData, this.publishCallback);
            });
                clearTimeout(t);
        },1000);
    }

    async inputMethodAbility_test_046() {
        console.info(TAG + '====>receive inputMethodAbility_test_046 data');
        let commonEventPublishData;
        this.InputClient.moveCursor(inputMethodEngine.CURSOR_DOWN, (err, value) => {
            if (err) {
                console.info(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN err:' + JSON.stringify(err));
                commonEventPublishData = {
                    data: "FAILED"
                };
            } else {
                console.info(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN value:' + JSON.stringify(value));
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_046", commonEventPublishData, this.publishCallback);
        });
}

    async inputMethodAbility_test_047() {
        console.info(TAG + '====>receive inputMethodAbility_test_047 data');
        let commonEventPublishData;
        await this.InputClient.moveCursor(inputMethodEngine.CURSOR_LEFT);
        console.info(TAG + '====>inputMethodAbility_test_047 CURSOR_LEFT success');
        commonEventPublishData = {
            data: "SUCCESS"
        };
        commoneventmanager.publish("inputMethodAbility_test_047", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_048() {
        console.info(TAG + '====>receive inputMethodAbility_test_048 data');
        let commonEventPublishData;
        await this.InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
        console.info(TAG + '====>inputMethodAbility_test_048 CURSOR_RIGHT success');
        commonEventPublishData = {
            data: "SUCCESS"
        };
        commoneventmanager.publish("inputMethodAbility_test_048", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_049() {
        console.info(TAG + '====>receive inputMethodAbility_test_049 data');
        let commonEventPublishData;
        try {
            this.keyboardController.hide((err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_049 hide err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodAbility_test_049", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_049 hide throw_err:');
            commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodAbility_test_050() {
        console.info(TAG + '====>receive inputMethodAbility_test_050 data');
        let commonEventPublishData;
        try {
            await this.keyboardController.hide();
            console.info(TAG + '====>inputMethodAbility_test_050 hideKeyboard success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_050 hideKeyboard catch err:' + JSON.stringify(err));
        }
        commoneventmanager.publish("inputMethodAbility_test_050", commonEventPublishData, this.publishCallback);
            
    }

    async inputMethodAbility_test_070() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_070 success');
        let count = 0;
        await this.keyboardController.hideKeyboard();
        inputMethodAbility.on('keyboardShow', () => {
            inputMethodAbility.off('keyboardShow');
            console.info(TAG + '====>inputMethodAbility.on("keyboardShow") count: ' + count);
            count += 1;
        });
        inputMethodAbility.on('setSubtype', () => {
            inputMethodAbility.off('setSubtype');
            console.info(TAG + '====>inputMethodAbility.on("setSubtype") count: ' + count);
            count += 1;
        });

        let t = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_070", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        }, 2000);
    }

    async inputMethodAbility_test_071() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_071 success');
        let count = 0;
        inputMethodAbility.on('keyboardHide', () => {
            count += 1;
            inputMethodAbility.off("keyboardHide");
            console.info(TAG + '====>inputMethodAbility.off("keyboardHide") count: ' + count);
        });
        let t = setTimeout(async () => {
            await this.keyboardController.hideKeyboard();
            console.info(TAG + '====>inputMethodAbility_test_071 hideKeyboard success');
        }, 200);
        let t1 = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_071", commonEventPublishData, this.publishCallback);
            clearTimeout(t1);
        }, 2000);
    }

    async inputMethodAbility_test_072() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_072 success');
        let count = 0;
        await this.keyboardController.hideKeyboard();
        inputMethodAbility.on('keyboardShow', () => {
            count += 1;
            inputMethodAbility.off("keyboardShow");
            console.info(TAG + '====>inputMethodAbility.off("keyboardShow") count: ' + count);
        });
        let t = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_072", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        }, 2000);
    }

    async inputMethodAbility_test_073() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_073 success');
        let count = 0;
        inputKeyboardDelegate.on('keyDown', (keyEvent) => {
            inputKeyboardDelegate.off('keyDown');
            console.info(TAG + "====>inputKeyboardDelegate.on('keyDown') count: " + count);
            if (keyEvent.keyCode === 2000){
                count += 1;
            }
            return true;
        });

        inputKeyboardDelegate.on('keyUp', (keyEvent) => {
            inputKeyboardDelegate.off('keyUp');
            console.info(TAG + "====>inputKeyboardDelegate.on('keyUp') count: " + count);
            if (keyEvent.keyCode === 2000){
                count += 1;
            }
            console.info(TAG + "====>inputKeyboardDelegate.on('keyUp') count: " + count);
            return true;
        });
        let t = setTimeout(() => {
            if(count === 2){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_073", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        },500);
    }

    async inputMethodAbility_test_074() {
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_074 success');
        inputMethodAbility.on('setCallingWindow', (wid) => {
            console.info(TAG + "====>inputKeyboardDelegate.on('setCallingWindow')" + wid);
            inputMethodAbility.off('setCallingWindow', () => {
                console.log('inputMethodAbility off setCallingWindow' );
            });
            if (typeof(wid) === "number"){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_074", commonEventPublishData, this.publishCallback);
        });
    }

    async inputMethodAbility_test_101() {
        console.info(TAG + '====>receive inputMethodAbility_test_101 data');
        let commonEventPublishData;
        let range = { start: 0, end: 1 };
        try {
            this.InputClient.selectByRange(range, (err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_101 selectByRange err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodAbility_test_101", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_101 selectByRange throw_err:');
            commoneventmanager.publish("inputMethodAbility_test_101", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodAbility_test_102() {
        console.info(TAG + '====>receive inputMethodAbility_test_102 data');
        let commonEventPublishData;
        let range = { start: 1, end: 0 };
        try {
            await this.InputClient.selectByRange(range);
            console.info(TAG + '====>inputMethodAbility_test_102 selectByRange success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_102 selectByRange catch err:' + JSON.stringify(err));
        }
        commoneventmanager.publish("inputMethodAbility_test_102", commonEventPublishData, this.publishCallback);            
    }

    async inputMethodAbility_test_103() {
        console.info(TAG + '====>receive inputMethodAbility_test_103 data');
        let commonEventPublishData;
        try {
            this.InputClient.getTextIndexAtCursor((err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor success' + JSON.stringify(value));
                    if (typeof value === 'number') {
                        commonEventPublishData = {
                            data: "SUCCESS"
                        };
                    } else {
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    }
                }
                commoneventmanager.publish("inputMethodAbility_test_103", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_103 getTextIndexAtCursor throw_err:');
            commoneventmanager.publish("inputMethodAbility_test_103", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodAbility_test_104() {
        console.info(TAG + '====>receive inputMethodAbility_test_104 data');
        let commonEventPublishData;
        try {
            let value =  await this.InputClient.getTextIndexAtCursor();
            console.info(TAG + '====>inputMethodAbility_test_104 getTextIndexAtCursor value:' + JSON.stringify(value));
            if (typeof value === 'number') {
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            } else {
                commonEventPublishData = {
                    data: "FAILED"
                };
            }
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_104 getTextIndexAtCursor catch err:');
        }
        commoneventmanager.publish("inputMethodAbility_test_104", commonEventPublishData, this.publishCallback);
    }

    async inputMethodAbility_test_105() {
        console.info(TAG + '====>receive inputMethodAbility_test_105 data');
        let commonEventPublishData;
        let movement = { direction: inputMethodEngine.CURSOR_DOWN };
        try {
            this.InputClient.selectByMovement(movement, (err, value) => {
                if (err) {
                    console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement success');
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("inputMethodAbility_test_105", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_105 selectByMovement throw_err:');
            commoneventmanager.publish("inputMethodAbility_test_105", commonEventPublishData, this.publishCallback);
        }
    }

    async inputMethodAbility_test_106() {
        console.info(TAG + '====>receive inputMethodAbility_test_106 data');
        let commonEventPublishData;
        let movement = { direction: inputMethodEngine.CURSOR_RIGHT };
        try {
            let value =  await this.InputClient.selectByMovement(movement);
            console.info(TAG + '====>inputMethodAbility_test_106 selectByMovement success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>inputMethodAbility_test_106 getTextIndexAtCursor catch err:');
        }
        commoneventmanager.publish("inputMethodAbility_test_106", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_onSelectByRange_0110() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_onSelectByRange_0110 success');
        let range = { start: 0, end: 10 };
        try {
            console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByRange_0110 selectByRange start');
            await this.InputClient.selectByRange(range);
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByRange_0110 selectByRange catch err:' + JSON.stringify(err));
        }
    }

    async Sub_Misc_inputMethod_onSelectByMovement_0120() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_onSelectByMovement_0120 success');
        let movement = { direction: inputMethodEngine.CURSOR_DOWN };
        try {
            console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByMovement_0120 onSelectByMovement start');
            await this.InputClient.selectByMovement(movement);
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_onSelectByMovement_0120 onSelectByMovement catch err:' + JSON.stringify(err));
        }
    }

    async  Sub_Misc_inputMethod_offSelectByRange_0130() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_offSelectByRange_0130 success');
        let timeCount = 0;
        let range = { start: 0, end: 10 };
        let t = setInterval(async () => {;
            await this.InputClient.selectByRange(range);
            timeCount += 1;
            console.info(TAG + '====>Sub_Misc_inputMethod_offSelectByRange_0130 this.softKeyboardPanel.hide setInterval timeCount: ' +  timeCount);
            if(timeCount === 2){
                clearInterval(t);
            }
        },300);
    }

    async  Sub_Misc_inputMethod_offSelectByMovement_0140() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_offSelectByMovement_0140 success');
        let timeCount = 0;
        let movement = { direction: inputMethodEngine.CURSOR_DOWN };
        let t1 = setInterval(async () => {;
            await this.InputClient.selectByMovement(movement);
            timeCount += 1;
            console.info(TAG + '====>Sub_Misc_inputMethod_offSelectByMovement_0140 this.softKeyboardPanel.hide setInterval timeCount: ' +  timeCount);
            if(timeCount === 2){
                clearInterval(t1);
            }
        },300);
    }

    async Sub_Misc_inputMethod_sendExtendAction_0170() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_sendExtendAction_0170 data');
        let commonEventPublishData;
        try {
            this.InputClient.sendExtendAction(inputMethodEngine.ExtendAction.COPY, (err,) => {
                if (err) {
                    console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0170 sendExtendAction err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0170 sendExtendAction success' );
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                commoneventmanager.publish("Sub_Misc_inputMethod_sendExtendAction_0170", commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0170 getTextIndexAtCursor throw_err:');
            commoneventmanager.publish("Sub_Misc_inputMethod_sendExtendAction_0170", commonEventPublishData, this.publishCallback);
        }
    }

    async Sub_Misc_inputMethod_sendExtendAction_0180() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_sendExtendAction_0180 data');
        let commonEventPublishData;
        try {
            await this.InputClient.sendExtendAction(inputMethodEngine.ExtendAction.COPY);
            console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0180 sendExtendAction success:');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>Sub_Misc_inputMethod_sendExtendAction_0180 sendExtendAction catch err:');
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_sendExtendAction_0180", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getForward_sync_0200() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getForward_sync_0200 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
            let str =  this.InputClient.getForwardSync(1);
            console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0200 getForwardSync str: ' + JSON.stringify(str));
            if(typeof(str) === "string"){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("Sub_Misc_inputMethod_getForward_sync_0200", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getForward_sync_0201() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getForward_sync_0201 data');
        let commonEventPublishData = {
            data: "FAILED"
        }
        try {
            // @ts-ignore
            this.InputClient.getForwardSync("1");
            console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0201 getForwardSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_getForward_sync_0201 getForwardSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getForward_sync_0201", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getBackward_sync_0210() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getBackward_sync_0210 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        let str =  this.InputClient.getBackwardSync(1);
        console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0210 getBackwardSync str: ' + JSON.stringify(str));
        if(typeof(str) === "string"){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getBackward_sync_0210", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getBackward_sync_0211() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getBackward_sync_0211 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.getBackwardSync("1");
            console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0211 getBackwardSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_getBackward_sync_0211 getBackwardSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getBackward_sync_0211", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        let num = this.InputClient.getTextIndexAtCursorSync();
        console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220 getTextIndexAtCursorSync num: ' + JSON.stringify(num));
        if(typeof(num) === "number"){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0220", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.getTextIndexAtCursorSync("1");
            console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 getTextIndexAtCursorSync success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221 getTextIndexAtCursorSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getTextIndexAtCursor_sync_0221", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getEditorAttribute_sync_0230() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getEditorAttribute_sync_0230 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        let obj = this.InputClient.getEditorAttributeSync();
        console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 getEditorAttributeSync enterKeyType: ' + JSON.stringify(obj.enterKeyType));
        console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0230 getEditorAttributeSync inputPattern: ' + JSON.stringify(obj.inputPattern));
        if(typeof(obj.enterKeyType) === "number" && typeof(obj.inputPattern) === "number"){
            commonEventPublishData = {
                data: "SUCCESS"
            };
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getEditorAttribute_sync_0230", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_getEditorAttribute_sync_0231() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_getEditorAttribute_sync_0231 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.getEditorAttributeSync(true);
            console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 getEditorAttributeSync success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_getEditorAttribute_sync_0231 getEditorAttributeSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_getEditorAttribute_sync_0231", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_moveCursor_sync_0240() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_moveCursor_sync_0240 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            this.InputClient.moveCursorSync(inputMethodEngine.CURSOR_UP);
            console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0240 moveCursorSync success' );
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0240 moveCursorSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_moveCursor_sync_0240", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_moveCursor_sync_0241() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_moveCursor_sync_0241 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.moveCursorSync(true);
            console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0241 moveCursorSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_moveCursor_sync_0241 moveCursorSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_moveCursor_sync_0241", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_deleteForward_sync_0250() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteForward_sync_0250 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            this.InputClient.deleteForwardSync(1);
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0250 deleteForwardSync success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0250 deleteForwardSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_deleteForward_sync_0250", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_deleteForward_sync_0251() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteForward_sync_0251 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.deleteForwardSync(false);
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0251 deleteForwardSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteForward_sync_0251 deleteForwardSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_deleteForward_sync_0251", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_deleteBackward_sync_0260() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteBackward_sync_0260 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            this.InputClient.deleteBackwardSync(1);
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0260 deleteBackwardSync success');
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0260 deleteBackwardSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_deleteBackward_sync_0260", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_deleteBackward_sync_0261() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_deleteBackward_sync_0261 data');
            let commonEventPublishData = {
                data: "FAILED"
            };
        try {
            // @ts-ignore
            this.InputClient.deleteBackwardSync(false);
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0261 deleteBackwardSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_deleteBackward_sync_0261 deleteBackwardSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_deleteBackward_sync_0261", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_insertText_sync_0270() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_insertText_sync_0270 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        this.InputClient.insertTextSync('test');
        console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_0270 insertTextSync');
        commonEventPublishData = {
            data: "SUCCESS"
        };
        commoneventmanager.publish("Sub_Misc_inputMethod_insertText_sync_0270", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_insertText_sync_0271() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_insertText_sync_0271 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.insertTextSync(123);
            console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_0271 insertTextSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_insertText_sync_0271 insertTextSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_insertText_sync_0271", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_selectByRange_sync_0280() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByRange_sync_0280 data');
        let range = { start: 0, end: 1 };
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            this.InputClient.selectByRangeSync(range);
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0280 selectByRangeSync success' );
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0280 selectByRangeSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_selectByRange_sync_0280", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_selectByRange_sync_0281() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByRange_sync_0281 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.selectByRangeSync(true);
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0281 selectByRangeSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByRange_sync_0281 selectByRangeSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_selectByRange_sync_0281", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_selectByMovement_sync_0290() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByMovement_sync_0290 data');
        let movement = { direction: inputMethodEngine.CURSOR_DOWN };
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            this.InputClient.selectByMovementSync(movement);
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0290 selectByMovementSync success' );
            commonEventPublishData = {
                data: "SUCCESS"
            };
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0290 selectByMovementSync err: ' + JSON.stringify(err));
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_selectByMovement_sync_0290", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_inputMethod_selectByMovement_sync_0291() {
        console.info(TAG + '====>receive Sub_Misc_inputMethod_selectByMovement_sync_0291 data');
        let commonEventPublishData = {
            data: "FAILED"
        };
        try {
            // @ts-ignore
            this.InputClient.selectByMovementSync(true);
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0291 selectByMovementSync over');
        } catch (err) {
            console.info(TAG + '====>Sub_Misc_inputMethod_selectByMovement_sync_0291 selectByMovementSync err: ' + JSON.stringify(err));
            if(err.code === 401){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
        }
        commoneventmanager.publish("Sub_Misc_inputMethod_selectByMovement_sync_0291", commonEventPublishData, this.publishCallback);
    }

    async Sub_Misc_Request_InputMethod_selectContext_0400() {
        console.info(TAG + '====>receive Sub_Misc_Request_InputMethod_selectContext_0400 data');
        let commonEventPublishData;
        let range = { start: 99, end: 88 };
        try {
            this.InputClient.selectByRange(range, (err) => {
                if (err) {
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0400 selectByRange err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                }
                console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0400 selectByRange success');
                commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0400', commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0400 selectByRange throw_err:');
            commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0400', commonEventPublishData, this.publishCallback);
        }
    }

    async Sub_Misc_Request_InputMethod_selectContext_0500() {
        console.info(TAG + '====>receive Sub_Misc_Request_InputMethod_selectContext_0500 data');
        let commonEventPublishData;
        let range = { start:168, end: -66 };
        try {
            this.InputClient.selectByRange(range, (err) => {
                if (err) {
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0500 selectByRange err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } else {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0500 selectByRange success');
                }
                commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0500', commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0500 selectByRange throw_err:');
            commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0500', commonEventPublishData, this.publishCallback);
        }
    }

    async Sub_Misc_Request_InputMethod_selectContext_0600() {
        console.info(TAG + '====>receive Sub_Misc_Request_InputMethod_selectContext_0600 data');
        let commonEventPublishData;
        let range = { start: 100, end: 2000 };
        try {
            this.InputClient.selectByRange(range, (err) => {
                if (err) {
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0600 selectByRange err:' + JSON.stringify(err));
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                } else {
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                    console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0600 selectByRange success');
                }
                commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0600', commonEventPublishData, this.publishCallback);
            });
        } catch (err) {
            commonEventPublishData = {
                data: "FAILED"
            };
            console.info(TAG + '====>Sub_Misc_Request_InputMethod_selectContext_0600 selectByRange throw_err:');
            commoneventmanager.publish('Sub_Misc_Request_InputMethod_selectContext_0600', commonEventPublishData, this.publishCallback);
        }
    }

}