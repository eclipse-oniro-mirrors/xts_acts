/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import inputmethodengine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commoneventmanager from '@ohos.commonEventManager';
import prompt from '@ohos.prompt';

let inputMethodAbility = inputmethodengine.getInputMethodAbility();
const TAG = 'keyboardController';
const SOFT_KEYBOARD = 0;
const STATUS_BAR = 1;
const FLG_FIXED = 0;
const FLG_FLOATING = 1;

let panelInfo = {
    type: SOFT_KEYBOARD,
    flag: FLG_FLOATING
};

export class KeyboardController {
    mContext;
    storage: LocalStorage;
    WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
    windowName = 'inputApp';
    private softKeyboardPanel: any = null;
    private windowHeight: number = 0;
    private windowWidth: number = 0;
    private nonBarPosition: number = 0;

    constructor(context) {
        this.storage = new LocalStorage();
        this.storage.setOrCreate('storageSimplePorp', 121);
        this.mContext = context;
        let display_info = display.getDefaultDisplaySync();
        this.windowWidth = display_info.width * 0.3;
        this.windowHeight = display_info.height * 0.35;
    }

    public onCreate(): void {
        this.initWindow();
        let that = this;
        inputMethodAbility.on('inputStop', () => {
            this.mContext.destroy((err, data) => {
                console.info(TAG + '====>inputMethodEngine destorey err:' + JSON.stringify(err));
                console.info(TAG + '====>inputMethodEngine destorey data:' + JSON.stringify(data));
            });
        });

        inputMethodAbility.createPanel(this.mContext, panelInfo, (err, panel) => {
            if (err !== undefined) {
                console.info('Failed to create panel, err: ' + JSON.stringify(err));
                return;
            }
            this.softKeyboardPanel = panel;
            console.info('Succeed in creating panel.' + JSON.stringify(panel));
        });

        function subscriberCallback(err, data) {
            console.debug(TAG + '====>receive event err: ' + JSON.stringify(err));
            console.debug(TAG + '====>receive event data ' + JSON.stringify(data));
            switch (data.code) {
                case 10:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_createPanelCallback_0010();
                    break;
                case 20:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_createPanelPromise_0020();
                    break;
                case 30:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030();
                    break;
                case 40:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040();
                    break;
                case 50:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0050();
                    break;
                case 60:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0060();
                    break;
                case 70:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_setUiContentCallback_0070();
                    break;
                case 80:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_setUiContentPromise_0080();
                    break;
                case 90:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_resizeCallback_0090();
                    break;
                case 100:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_resizePromise_0100 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_resizePromise_0100();
                    break;
                case 110:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_moveToCallback_0110();
                    break;
                case 120:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_moveToPromise_0120();
                    break;
                case 130:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_showCallback_0130 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_showCallback_0130();
                    break;
                case 140:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_showPromise_0140 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_showPromise_0140();
                    break;
                case 150:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_hideCallback_0150 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_hideCallback_0150();
                    break;
                case 160:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_hidePromise_0160 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_hidePromise_0160();
                    break;
                case 170:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onShow_0170 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_onShow_0170();
                    break;
                case 180:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_onHide_0180 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_onHide_0180();
                    break;
                case 190:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_offShow_0190 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_offShow_0190();
                    break;
                case 200:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_offHide_0200 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_offHide_0200();
                    break;
                case 210:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0210 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_changeFlag_0210();
                    break;
                case 211:
                    console.debug(TAG + '====>Sub_Misc_inputMethod_Panel_changeFlag_0211 event:' + data.event);
                    that.Sub_Misc_inputMethod_Panel_changeFlag_0211();
                    break;
                case 212:
                    console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 event:' + data.event);
                    that.Sub_InputMethod_IMF_SecurityKeyboard_0600();
                    break;
                case 213:
                    console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 event:' + data.event);
                    that.Sub_InputMethod_IMF_SecurityKeyboard_0700();
                    break;
                case 214:
                    console.debug(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 event:' + data.event);
                    that.Sub_InputMethod_IMF_SecurityKeyboard_0800();
                    break;
                case 215:
                    console.debug(TAG + '====>Sub_InputMethod_IMF_getSecurityMode_0100 event:' + data.event);
                    that.Sub_InputMethod_IMF_getSecurityMode_0100();
                    break;
            }
        }

        var commonEventSubscribeInfo = {
            events: ['test']
        };

        var subscriber
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
            subscriber = data;
            commoneventmanager.subscribe(subscriber, subscriberCallback)
            console.debug(TAG + '====>scene subscribe finish====');
        })
    }

    public onDestroy(): void {
        console.log('imsakitjsapp onDestroy');
        globalThis.textInputClient.getTextIndexAtCursor().then((index) => {
            console.log('imsakitjsapp getTextIndexAtCursor:  index = ' + index);
            prompt.showToast({ message: 'getTextIndexAtCursor success' + index, duration: 200, bottom: 500 })
            var win = windowManager.findWindow(this.windowName)
            win.destroyWindow()
            this.mContext.terminateSelf();
            return true;
        }).catch((err) => {
            prompt.showToast({ message: 'getTextIndexAtCursor failed', duration: 200, bottom: 500 })
        })
    }

    private initWindow(): void {
        display.getDefaultDisplay().then(dis => {
            var dWidth = dis.width;
            var dHeight = dis.height;
            var keyHeightRate = 0.47;
            var keyHeight = dHeight * keyHeightRate;
            this.windowWidth = dWidth;
            this.windowHeight = keyHeight;
            this.nonBarPosition = dHeight - keyHeight

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


    private Sub_Misc_inputMethod_Panel_createPanelCallback_0010(): void {
        let commonEventPublishData;
        let panelInfo1 = {
            type: STATUS_BAR,
            flag: FLG_FLOATING
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 success');
        try {
            inputMethodAbility.createPanel(this.mContext, panelInfo1, async (err, panel) => {
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 createPanel');
                if (err) {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 createPanel error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
                } else {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_createPanelCallback_0010 Succeed in creating panel.' + JSON.stringify(panel));
                }
                await inputMethodAbility.destroyPanel(panel);
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
            })
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelCallback_0010 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelCallback_0010', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_createPanelPromise_0020(): void {
        let commonEventPublishData;
        let panelInfo1 = {
            type: STATUS_BAR,
            flag: FLG_FLOATING
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 success');
        try {
            inputMethodAbility.createPanel(this.mContext, panelInfo1).then(async (panel) => {
                commonEventPublishData = {
                    data: 'SUCCESS'
                };
                console.info('====>Sub_Misc_inputMethod_Panel_createPanelPromise_0020 Succeed in creating panel.' + JSON.stringify(panel));
                await inputMethodAbility.destroyPanel(panel);
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
            }).catch(async (err) => {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 createPanel error: ' + JSON.stringify(err));
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
            });
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_createPanelPromise_0020 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_createPanelPromise_0020', commonEventPublishData, this.publishCallback);
        }
    }

    private async Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030(): Promise<void> {
        let commonEventPublishData;
        let panelInfo1 = {
            type: STATUS_BAR,
            flag: FLG_FIXED
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 success');
        try {
            let panel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
            inputMethodAbility.destroyPanel(panel, async (err, panel) => {
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 destroyPanel');
                if (err) {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 destroyPanel error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
                } else {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 Succeed in destroying panel.' + JSON.stringify(panel));
                }
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
            });
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelCallback_0030', commonEventPublishData, this.publishCallback);
        }
    }

    private async Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040(): Promise<void> {
        let commonEventPublishData;
        let panelInfo1 = {
            type: STATUS_BAR,
            flag: FLG_FIXED
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 success');
        try {
            let panel = await inputMethodAbility.createPanel(this.mContext, panelInfo1);
            inputMethodAbility.destroyPanel(panel).then(async () => {
                commonEventPublishData = {
                    data: 'SUCCESS'
                };
                console.info('====>Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 Succeed in destroyPanel panel.' + JSON.stringify(panel));
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
            }).catch(async (err) => {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 destroyPanel error: ' + JSON.stringify(err));
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
            });
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_destroyPanelPromise_0040', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_setUiContentCallback_0050(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.setUiContent('pages/second/second', async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 setUiContent error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('====>Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 Succeed setUiContent: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0050 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0050', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_setUiContentPromise_0060(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.setUiContent('pages/second/second').then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 Succeed in setUiContent.' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 setUiContent error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0060 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0060', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_setUiContentCallback_0070(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.setUiContent('pages/second/second', this.storage, async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 setUiContent error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 Succeed setUiContent: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
                })
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentCallback_0070 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentCallback_0070', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_setUiContentPromise_0080(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.setUiContent('pages/second/second', this.storage).then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 Succeed in setUiContent: ' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 setUiContent error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_setUiContentPromise_0080 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_setUiContentPromise_0080', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_resizeCallback_0090(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.resize(this.windowWidth, this.windowHeight, async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 resize error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('====>Sub_Misc_inputMethod_Panel_resizeCallback_0090 Succeeded in changing the panel size: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
                })
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizeCallback_0090 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizeCallback_0090', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_resizePromise_0100(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.resize(this.windowWidth, this.windowHeight).then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_resizePromise_0100 Succeed in changing the panel size: ' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 resize error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_resizePromise_0100 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_resizePromise_0100', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_moveToCallback_0110(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.moveTo(100, 100, async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 moveTo error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('====>Sub_Misc_inputMethod_Panel_moveToCallback_0110 Succeed in moving the panel: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToCallback_0110 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToCallback_0110', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_moveToPromise_0120(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.moveTo(100, 100).then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_moveToPromise_0120 Succeed in moving the panel: ' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 moveTo error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_moveToPromise_0120 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_moveToPromise_0120', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_showCallback_0130(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.show(async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 show error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('====>Sub_Misc_inputMethod_Panel_showCallback_0130 Succeed in showing the panel: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showCallback_0130 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showCallback_0130', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_showPromise_0140(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.show().then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_showPromise_0140 Succeed in showing the panel: ' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 show error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_showPromise_0140 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_showPromise_0140', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_hideCallback_0150(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.hide(async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide');
                    if (err) {
                        commonEventPublishData = {
                            data: 'FAILED'
                        };
                        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 hide error: ' + JSON.stringify(err));
                        commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
                    } else {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                        console.info('====>Sub_Misc_inputMethod_Panel_hideCallback_0150 Succeed in hiding the panel: ' + JSON.stringify(data));
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hideCallback_0150 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hideCallback_0150', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_hidePromise_0160(): void {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.hide().then(async (data) => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info('====>Sub_Misc_inputMethod_Panel_hidePromise_0160 Succeed in hiding the panel: ' + JSON.stringify(data));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
                }).catch(async (err) => {
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 hide error: ' + JSON.stringify(err));
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
                });
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_hidePromise_0160 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_hidePromise_0160', commonEventPublishData, this.publishCallback);
        }
    }

    private async Sub_Misc_inputMethod_Panel_onShow_0170(): Promise<void> {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.on('show', async () => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    this.softKeyboardPanel.off('show');
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 onShow error: ');
                    console.info('====>Sub_Misc_inputMethod_Panel_onShow_0170 Succeed onShow: ');
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
                });
                await this.softKeyboardPanel.show();
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 this.softKeyboardPanel is null');
                commoneventmanager.publish('ub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onShow_0170 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onShow_0170', commonEventPublishData, this.publishCallback);
        }
    }

    private async Sub_Misc_inputMethod_Panel_onHide_0180(): Promise<void> {
        let commonEventPublishData;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.on('hide', async () => {
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 onHide');
                    this.softKeyboardPanel.off('hide');
                    console.info('====>Sub_Misc_inputMethod_Panel_onHide_0180 Succeed onHide:');
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
                });
                await this.softKeyboardPanel.hide();
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_onHide_0180 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_onHide_0180', commonEventPublishData, this.publishCallback);
        }
    }

    private  Sub_Misc_inputMethod_Panel_offShow_0190(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        let count  = 0;
        let timeCount  = 0;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.on('show', async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 offShow if success: ' + JSON.stringify(err));
                    this.softKeyboardPanel.off('show');
                    count += 1;
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 off Show count: ' + count);
                });
                let t1 = setInterval(async () => {
                    await this.softKeyboardPanel.show();
                    await this.softKeyboardPanel.hide();
                    timeCount += 1;
                    console.info(TAG + '====>this.softKeyboardPanel.show setInterval timeCount: ' +  timeCount);
                    if(timeCount === 2){
                        clearInterval(t1);
                    }
                },100);

                let t2 = setTimeout(() => {
                    console.info(TAG + '====>setTimeout count: ' +  count);
                    if (count === 1) {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
                    clearTimeout(t2);
                },500);

            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offShow_0190 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offShow_0190', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_offHide_0200(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        let count  = 0;
        let timeCount  = 0;
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 success');
        try {
            if (this.softKeyboardPanel !== null) {
                this.softKeyboardPanel.on('hide', async (err, data) => {
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 offHide if success: ' + JSON.stringify(err));
                    this.softKeyboardPanel.off('hide');
                    count += 1;
                    console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 off hide count: ' + count);
                });

                let t1 = setInterval(async () => {;
                    await this.softKeyboardPanel.show();
                    await this.softKeyboardPanel.hide();
                    timeCount += 1;
                    console.info(TAG + '====>this.softKeyboardPanel.hide setInterval timeCount: ' +  timeCount);
                    if (timeCount === 2) {
                        clearInterval(t1);
                    }
                },100);

                let t2 = setTimeout(() => {
                    console.info(TAG + '====>setTimeout count: ' +  count);
                    if (count === 1) {
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                    }
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
                    clearTimeout(t2);
                },500);

            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_offHide_0200 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_offHide_0200', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_changeFlag_0210(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 success');
        try {
            if (this.softKeyboardPanel !== null) {
                try {
                    this.softKeyboardPanel.changeFlag(1);
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                    commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
                } catch (err) {
                    console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0210 throw_error: ' + err);
                }

            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 this.softKeyboardPanel is null');
                commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0210 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0210', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_Misc_inputMethod_Panel_changeFlag_0211(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 success');
        try {
            if (this.softKeyboardPanel !== null) {
                try {
                    let fla_fixed = inputmethodengine.PanelFlag.FLG_FIXED;
                    let fla_floating = inputmethodengine.PanelFlag.FLG_FLOATING;
                    this.softKeyboardPanel.changeFlag(fla_fixed);
                    console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 switch to fla_fixed');
                    this.softKeyboardPanel.changeFlag(fla_floating);
                    console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 switch to fla_floating');
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                } catch (err) {
                    console.info('====>Sub_Misc_inputMethod_Panel_changeFlag_0211 throw_error: ' + err);
                }
            } else {
                console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 this.softKeyboardPanel is null');
            }
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
        } catch (error) {
            console.info(TAG + '====>receive Sub_Misc_inputMethod_Panel_changeFlag_0211 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_Misc_inputMethod_Panel_changeFlag_0211', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_InputMethod_IMF_SecurityKeyboard_0600(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success');
        try {
            if (this.softKeyboardPanel !== null) {
                try {
                    let isPrivacyMode:boolean = true;
                    this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 success switch to PrivacyMode');
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                } catch (err) {
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0600 Failed to set privacy mode'  + err);
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                }
            } else {
                console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 this.softKeyboardPanel is null');
            }
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
        } catch (error){
            console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0600 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0600', commonEventPublishData, this.publishCallback);
        }
    }

        private Sub_InputMethod_IMF_SecurityKeyboard_0700(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success');
        try {
            if (this.softKeyboardPanel !== null) {
                try {
                    let isPrivacyMode:boolean = false;
                    this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 success switch to PrivacyMode');
                    commonEventPublishData = {
                        data: 'SUCCESS'
                    };
                } catch (err) {
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0700 Failed to set privacy mode'+ err);
                    commonEventPublishData = {
                        data: 'FAILED'
                    };
                }
            } else {
                console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 this.softKeyboardPanel is null');
            }
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
        } catch (error) {
            console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0700 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0700', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_InputMethod_IMF_SecurityKeyboard_0800(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success');
        try {
            if (this.softKeyboardPanel !== null) {
                try {
                    let isPrivacyMode:boolean = undefined;
                    this.softKeyboardPanel.setPrivacyMode(isPrivacyMode);
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 success switch to PrivacyMode');
                } catch (err) {
                    console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 Failed to set privacy mode catch: ' + err);
                    if (err.code === 401) {
                        console.info('====>Sub_InputMethod_IMF_SecurityKeyboard_0800 Failed to set privacy mode002: ' + err);
                        commonEventPublishData = {
                            data: 'SUCCESS'
                        };
                    }

                }
            } else {
                console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 this.softKeyboardPanel is null');
            }
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0800', commonEventPublishData, this.publishCallback);
        } catch (error) {
            console.info(TAG + '====>Sub_InputMethod_IMF_SecurityKeyboard_0800 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_InputMethod_IMF_SecurityKeyboard_0800', commonEventPublishData, this.publishCallback);
        }
    }

    private Sub_InputMethod_IMF_getSecurityMode_0100(): void {
        let commonEventPublishData = {
            data: 'FAILED'
        };
        console.info(TAG + '====>receive Sub_InputMethod_IMF_getSecurityMode_0100 success');
        try {
            let mode1: inputmethodengine.SecurityMode = inputMethodAbility.getSecurityMode();
            if (mode1 === inputmethodengine.SecurityMode.BASIC || mode1 === inputmethodengine.SecurityMode.FULL) {
                console.info('====>getSecurityMode, securityMode is : ${mode1}');
                commonEventPublishData = {
                    data: 'SUCCESS'
                };
                commoneventmanager.publish('Sub_InputMethod_IMF_getSecurityMode_0100', commonEventPublishData, this.publishCallback);
            } else {
                commonEventPublishData = {
                    data: 'FAILED'
                };
                console.info('====>Failed to getSecurityMode: ${JSON.stringify(err)}');
            }
        } catch (error) {
            commonEventPublishData = {
                data: 'FAILED'
            };
            console.info(TAG + '====>receive Sub_InputMethod_IMF_getSecurityMode_0100 catch error: ' + JSON.stringify(error));
            commoneventmanager.publish('Sub_InputMethod_IMF_getSecurityMode_0100', commonEventPublishData, this.publishCallback);
        }
    }

}