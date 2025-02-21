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
                    console.info(TAG + '====>inputMethodAbility destroy err:' + JSON.stringify(err));
                })
            }catch(err){
                console.info(TAG + '====>inputMethodAbility destroy catch err:' + JSON.stringify(err));
                console.info(TAG + '====>inputMethodAbility destroy catch err:' + err);
            }
        })

        function subscriberCallback(err, data) {
            console.debug(TAG + '====>receive event err:' + JSON.stringify(err));
            console.debug(TAG + '====>receive event data:' + JSON.stringify(data));
            switch (data.code) {
                case 1:
                    console.debug(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 event:' + data.event);
                    that.inputMethodAbility_test_getInputMethodAbility_001();
                    break;
                case 2:
                    console.debug(TAG + '====>inputMethodAbility_test_getInputMethodDelegate_001 event:' + data.event);
                    that.inputMethodAbility_test_getKeyboardDelegate_001();
                    break;
                case 28:
                    console.debug(TAG + '====>inputMethodAbility_test_028 event:' + data.event);
                    that.inputMethodAbility_test_028();
                    break;
                case 29:
                    console.debug(TAG + '====>inputMethodAbility_test_029 event:' + data.event);
                    that.inputMethodAbility_test_029();
                    break;
                case 30:
                    console.debug(TAG + '====>inputMethodAbility_test_030 event:' + data.event);
                    that.inputMethodAbility_test_030();
                    break;
                case 31:
                    console.debug(TAG + '====>inputMethodAbility_test_031 event:' + data.event);
                    that.inputMethodAbility_test_031();
                    break;
                case 32:
                    console.debug(TAG + '====>inputMethodAbility_test_032 event:' + data.event);
                    that.inputMethodAbility_test_032();
                    break;
                case 33:
                    console.debug(TAG + '====>inputMethodAbility_test_033 event:' + data.event);
                    that.inputMethodAbility_test_033();
                    break;
                case 34:
                    console.debug(TAG + '====>inputMethodAbility_test_034 event:' + data.event);
                    that.inputMethodAbility_test_034();
                    break;
                case 35:
                    console.debug(TAG + '====>inputMethodAbility_test_035 event:' + data.event);
                    that.inputMethodAbility_test_035();
                    break;
                case 36:
                    console.debug(TAG + '====>inputMethodAbility_test_036 event:' + data.event);
                    that.inputMethodAbility_test_036();
                    break;
                case 37:
                    console.debug(TAG + '====>inputMethodAbility_test_037 event:' + data.event);
                    that.inputMethodAbility_test_037();
                    break;
                case 38:
                    console.debug(TAG + '====>inputMethodAbility_test_038 event:' + data.event);
                    that.inputMethodAbility_test_038();
                    break;
                case 39:
                    console.debug(TAG + '====>inputMethodAbility_test_039 event:' + data.event);
                    that.inputMethodAbility_test_039();
                    break;
                case 40:
                    console.debug(TAG + '====>inputMethodAbility_test_040 event:' + data.event);
                    that.inputMethodAbility_test_040();
                    break;
                case 41:
                    console.debug(TAG + '====>inputMethodAbility_test_041 event:' + data.event);
                    that.inputMethodAbility_test_041();
                    break;
                case 42:
                    console.debug(TAG + '====>inputMethodAbility_test_042 event:' + data.event);
                    that.inputMethodAbility_test_042();
                    break;
                case 43:
                    console.debug(TAG + '====>inputMethodAbility_test_043 event:' + data.event);
                    that.inputMethodAbility_test_043();
                    break;
                case 45:
                    console.debug(TAG + '====>inputMethodAbility_test_045 event:' + data.event);
                    that.inputMethodAbility_test_045();
                    break;
                case 46:
                    console.debug(TAG + '====>inputMethodAbility_test_046 event:' + data.event);
                    that.inputMethodAbility_test_046();
                    break;
                case 47:
                    console.debug(TAG + '====>inputMethodAbility_test_047 event:' + data.event);
                    that.inputMethodAbility_test_047();
                    break;
                case 48:
                    console.debug(TAG + '====>inputMethodAbility_test_048 event:' + data.event);
                    that.inputMethodAbility_test_048();
                    break;
                case 49:
                    console.debug(TAG + '====>inputMethodAbility_test_049 event:' + data.event);
                    that.inputMethodAbility_test_049();
                    break;
                case 50:
                    console.debug(TAG + '====>inputMethodAbility_test_050 event:' + data.event);
                    that.inputMethodAbility_test_050();
                    break;
                case 70:
                    console.debug(TAG + '====>inputMethodAbility_test_070 event:' + data.event);
                    that.inputMethodAbility_test_070();
                    break;
                case 71:
                    console.debug(TAG + '====>inputMethodAbility_test_071 event:' + data.event);
                    that.inputMethodAbility_test_071();
                    break;
                case 72:
                    console.debug(TAG + '====>inputMethodAbility_test_072 event:' + data.event);
                    that.inputMethodAbility_test_072();
                    break;
                case 73:
                    console.debug(TAG + '====>inputMethodAbility_test_073 event:' + data.event);
                    that.inputMethodAbility_test_073();
                    break;
                case 74:
                    console.debug(TAG + '====>inputMethodAbility_test_074 event:' + data.event);
                    that.inputMethodAbility_test_074();
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
            console.debug(TAG + '====>scene subscribe finish====');
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
        console.debug(TAG + '====>onDestroy');
        globalThis.textInputClient.getTextIndexAtCursor().then((index) => {
            console.debug(TAG + '====>getTextIndexAtCursor index:' + index);
            promptAction.showToast({ message: 'getTextIndexAtCursor success' + index, duration: 200, bottom: 500 });
            var win = windowManager.findWindow(this.windowName);
            win.destroyWindow();
            this.mContext.terminateSelf();
            return true;
        }).catch((err) => {
            promptAction.showToast({ message: 'getTextIndexAtCursor failed', duration: 200, bottom: 500 });
        });
    }

    private publishCallback(err): void {
        if (err) {
            console.error(TAG + '====>publish failed:' + JSON.stringify(err));
        } else {
            console.debug(TAG + '====>publish');
        }
    }

    private inputMethodAbility_test_getInputMethodAbility_001(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_getInputMethodAbility_001 data');
        if (typeof(inputMethodAbility) === 'object') {
            console.debug(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 success');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.debug(TAG + '====>inputMethodAbility_test_getInputMethodAbility_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_getInputMethodAbility_001", commonEventPublishData, this.publishCallback);
    }

    private inputMethodAbility_test_getKeyboardDelegate_001(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_getKeyboardDelegate_001 data');
        if (typeof (inputKeyboardDelegate) === 'object') {
            console.debug(TAG + '====>inputMethodAbility_test_getKeyboardDelegate_001 success');
            var commonEventPublishData = {
                data: "SUCCESS"
            };
        } else {
            console.debug(TAG + '====>inputMethodAbility_test_getKeyboardDelegate_001 failed');
            var commonEventPublishData = {
                data: "FAILED"
            };
        }
        commoneventmanager.publish("inputMethodAbility_test_getKeyboardDelegate_001", commonEventPublishData, this.publishCallback);
    }

    private inputMethodAbility_test_028(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_028 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_028", commonEventPublishData, this.publishCallback);
            } else {
                let editorAttribyte = await InputClient.getEditorAttribute();
                console.debug(TAG + '====>inputMethodAbility_test_028 editorAttribyte:' + JSON.stringify(editorAttribyte));
                InputClient.sendKeyFunction(editorAttribyte.enterKeyType, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_028 sendKeyFunction err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_028 sendKeyFunction value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_029(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_029 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_029", commonEventPublishData, this.publishCallback);
            } else {
                let editorAttribyte = await InputClient.getEditorAttribute();
                console.debug(TAG + '====>inputMethodAbility_test_029 editorAttribyte:' + JSON.stringify(editorAttribyte));
                let value = InputClient.sendKeyFunction(editorAttribyte.enterKeyType);
                console.debug(TAG + '====>inputMethodAbility_test_029 sendKeyFunction value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_030(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_030 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_030", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.deleteForward(1, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_030 deleteForward err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_030 deleteForward value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_031(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_031 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_031", commonEventPublishData, this.publishCallback);
            } else {
                let value = await InputClient.deleteForward(1);
                console.debug(TAG + '====>inputMethodAbility_test_031 deleteForward value:' + value);
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
        });
    }

    private inputMethodAbility_test_032(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_032 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_032", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.deleteBackward(1, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_032 deleteBackward err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_032 deleteBackward value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_033(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_033 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_033", commonEventPublishData, this.publishCallback);
            } else {
                let value = await InputClient.deleteBackward(1);
                console.debug(TAG + '====>inputMethodAbility_test_033 deleteBackward value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_034(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_034 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_034", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.insertText('test', (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_034 insertText err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_034 insertText value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_035(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_035 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_035", commonEventPublishData, this.publishCallback);
            } else {
                let value = InputClient.insertText('test');
                console.debug(TAG + '====>inputMethodAbility_test_035 insertText value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_036(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_036 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_036", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.getForward(1, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_036 getForward err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_036 getForward value:' + JSON.stringify(value));
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
                    commoneventmanager.publish("inputMethodAbility_test_036", commonEventPublishData, this.publishCallback);
                });
            }
        });
    }

    private inputMethodAbility_test_037(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_037 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_037", commonEventPublishData, this.publishCallback);
            } else {
                let value = InputClient.getForward(1);
                console.debug(TAG + '====>inputMethodAbility_test_037 getForward value' + JSON.stringify(value));
                if (value) {
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
        });
    }

    private inputMethodAbility_test_038(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_038 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_038", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.getEditorAttribute((err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_038 getEditorAttribute err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_038 getEditorAttribute value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_039(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_039 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_039", commonEventPublishData, this.publishCallback);
            } else {
                let value = InputClient.getEditorAttribute();
                console.debug(TAG + '====>inputMethodAbility_test_039 getEditorAttribute value:' + JSON.stringify(value));
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
        });
    }

    private inputMethodAbility_test_040(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_040 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
            } else {
                try {
                    KeyboardDelegate.hideKeyboard((err, value) => {
                        if (err) {
                            console.debug(TAG + '====>inputMethodAbility_test_040 hideKeyboard err:' + JSON.stringify(err));
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
                    console.debug(TAG + '====>inputMethodAbility_test_040 hideKeyboard throw_err:');
                    commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
                }
            }
        });
    }

    private inputMethodAbility_test_041(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_041 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_041", commonEventPublishData, this.publishCallback);
            } else {
                try {
                    await KeyboardDelegate.hideKeyboard();
                    console.debug(TAG + '====>inputMethodAbility_test_041 hideKeyboard success');
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } catch (err) {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                    console.debug(TAG + '====>inputMethodAbility_test_041 hideKeyboard catch err:' + JSON.stringify(err));
                }
                commoneventmanager.publish("inputMethodAbility_test_041", commonEventPublishData, this.publishCallback);
            }
        });
    }

    private inputMethodAbility_test_042(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_042 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_042", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.getBackward(1, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_042 getBackward err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_042 getBackward value:' + JSON.stringify(value));
                        commonEventPublishData = {
                            data: "SUCCESS"
                        };
                    }
                    commoneventmanager.publish("inputMethodAbility_test_042", commonEventPublishData, this.publishCallback);
                });
            }
        });
    }

    private inputMethodAbility_test_043(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_043 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_043", commonEventPublishData, this.publishCallback);
            } else {
                let value = InputClient.getBackward(1);
                console.debug(TAG + '====>inputMethodAbility_test_043 getBackward value:' + JSON.stringify(value));
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("inputMethodAbility_test_043", commonEventPublishData, this.publishCallback);
            }
        });
    }

    private inputMethodAbility_test_045(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_045 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let t = setTimeout(()=>{
                let commonEventPublishData;
                if (InputClient == null) {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                    commoneventmanager.publish("inputMethodAbility_test_045", commonEventPublishData, this.publishCallback);
                } else {
                    InputClient.moveCursor(inputMethodEngine.CURSOR_UP, (err, value) => {
                        if (err) {
                            console.debug(TAG + '====>inputMethodAbility_test_045 CURSOR_UP err:' + JSON.stringify(err));
                            commonEventPublishData = {
                                data: "FAILED"
                            };
                        } else {
                            console.debug(TAG + '====>inputMethodAbility_test_045 CURSOR_UP value:' + JSON.stringify(value));
                            commonEventPublishData = {
                                data: "SUCCESS"
                            };
                        }
                        commoneventmanager.publish("inputMethodAbility_test_045", commonEventPublishData, this.publishCallback);
                    });
                }
                clearTimeout(t);
            },1000);

        });
    }

    private inputMethodAbility_test_046(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_046 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_046", commonEventPublishData, this.publishCallback);
            } else {
                InputClient.moveCursor(inputMethodEngine.CURSOR_DOWN, (err, value) => {
                    if (err) {
                        console.debug(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN err:' + JSON.stringify(err));
                        commonEventPublishData = {
                            data: "FAILED"
                        };
                    } else {
                        console.debug(TAG + '====>inputMethodAbility_test_046 CURSOR_DOWN value:' + JSON.stringify(value));
                        commonEventPublishData = {
                            data: "SUCCESS"
                        };
                    }
                    commoneventmanager.publish("inputMethodAbility_test_046", commonEventPublishData, this.publishCallback);
                });
            }
        });
    }

    private inputMethodAbility_test_047(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_047 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_047", commonEventPublishData, this.publishCallback);
            } else {
                await InputClient.moveCursor(inputMethodEngine.CURSOR_LEFT);
                console.debug(TAG + '====>inputMethodAbility_test_047 CURSOR_LEFT success');
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("inputMethodAbility_test_047", commonEventPublishData, this.publishCallback);
            }
        });
    }

    private inputMethodAbility_test_048(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_048 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_048", commonEventPublishData, this.publishCallback);
            } else {
                await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
                console.debug(TAG + '====>inputMethodAbility_test_048 CURSOR_RIGHT success');
                commonEventPublishData = {
                    data: "SUCCESS"
                };
                commoneventmanager.publish("inputMethodAbility_test_048", commonEventPublishData, this.publishCallback);
            }
        });
    }

    private inputMethodAbility_test_049(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_049 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_049", commonEventPublishData, this.publishCallback);
            } else {
                try {
                    KeyboardDelegate.hide((err, value) => {
                        if (err) {
                            console.debug(TAG + '====>inputMethodAbility_test_049 hide err:' + JSON.stringify(err));
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
                    console.debug(TAG + '====>inputMethodAbility_test_049 hide throw_err:');
                    commoneventmanager.publish("inputMethodAbility_test_040", commonEventPublishData, this.publishCallback);
                }
            }
        });
    }

    private inputMethodAbility_test_050(): void {
        console.debug(TAG + '====>receive inputMethodAbility_test_050 data');
        inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            let commonEventPublishData;
            if (InputClient == null) {
                commonEventPublishData = {
                    data: "FAILED"
                };
                commoneventmanager.publish("inputMethodAbility_test_050", commonEventPublishData, this.publishCallback);
            } else {
                try {
                    await KeyboardDelegate.hide();
                    console.debug(TAG + '====>inputMethodAbility_test_050 hideKeyboard success');
                    commonEventPublishData = {
                        data: "SUCCESS"
                    };
                } catch (err) {
                    commonEventPublishData = {
                        data: "FAILED"
                    };
                    console.debug(TAG + '====>inputMethodAbility_test_050 hideKeyboard catch err:' + JSON.stringify(err));
                }
                commoneventmanager.publish("inputMethodAbility_test_050", commonEventPublishData, this.publishCallback);
            }
        });
    }

    private inputMethodAbility_test_070(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_070 success');
        let count = 0;
        inputMethodAbility.on('inputStart', (KeyboardDelegate, InputClient) => {
            inputMethodAbility.off('inputStart');
            console.info(TAG + '====>inputMethodAbility.on("inputStart") count: ' + count);
            count += 1;
        });
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
            if(count === 3){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_070", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        },500);
    }

    private inputMethodAbility_test_071(): void{
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
        inputMethodAbility.on('inputStart', (KeyboardDelegate, InputClient) => {
            console.info(TAG + '====>inputMethodAbility_test_071 inputMethodAbility.on("inputStart")');
            let t = setInterval(async () => {
                await KeyboardDelegate.hideKeyboard();
                console.info(TAG + '====>KeyboardDelegate.hideKeyboard count: ' +  count);
                if(count === 1){
                    clearInterval(t);
                }
            },100);
        });
        let t = setTimeout(() => {
            if(count === 1){
                commonEventPublishData = {
                    data: "SUCCESS"
                };
            }
            commoneventmanager.publish("inputMethodAbility_test_071", commonEventPublishData, this.publishCallback);
            clearTimeout(t);
        },500);
    }

    private inputMethodAbility_test_072(): void{
        let commonEventPublishData = {
            data: "FAILED"
        };
        console.info(TAG + '====>receive inputMethodAbility_test_072 success');
        let count = 0;
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
        },300);
    }

    private inputMethodAbility_test_073(): void{
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

    private inputMethodAbility_test_074(): void{
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
}