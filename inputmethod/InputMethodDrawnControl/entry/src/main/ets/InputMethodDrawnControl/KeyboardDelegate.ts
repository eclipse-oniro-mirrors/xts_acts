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

  private sleep(timeout): Promise<void> {
    return new Promise(resolve => {
      let t = setTimeout(() => {
        clearTimeout(t);
        resolve(null);
      }, timeout);
    });
  };

  public onCreate(): void {
    this.initWindow();
    let that = this;
    inputMethodAbility.on("inputStop", () => {
      inputMethodAbility.off("inputStop", () => {
        console.log('====>inputMethodEngine delete inputStop notification.');
      });
      try {
        that.mContext.destroy((err) => {
          console.info(TAG + '====>inputMethodAbility destroy err:' + JSON.stringify(err));
        });
      } catch (err) {
        console.info(TAG + '====>inputMethodAbility destroy catch err:' + JSON.stringify(err));
        console.info(TAG + '====>inputMethodAbility destroy catch err:' + err);
      }
    })

    function subscriberCallback(err, data) {
      console.debug(TAG + '====>receive event err:' + JSON.stringify(err));
      console.debug(TAG + '====>receive event data:' + JSON.stringify(data));
      switch (data.code) {
        case 10:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 event:' + data.event);
          that.SUB_Misc_inputMethod_onHandleExtendAction_0010();
          break;
        case 20:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offHandleExtendAction_0020 event:' + data.event);
          that.SUB_Misc_inputMethod_offHandleExtendAction_0020();
          break;
        case 30:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onSendFunctionKey_0030 event:' + data.event);
          that.SUB_Misc_inputMethod_onSendFunctionKey_0030();
          break;
        case 40:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offSendFunctionKey_0040 event:' + data.event);
          that.SUB_Misc_inputMethod_offSendFunctionKey_0040();
          break;
        case 50:
          console.debug(TAG + '====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 event:' + data.event);
          that.SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050();
          break;
        case 70:
          console.debug(TAG + '====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 event:' + data.event);
          that.SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070();
          break;
        case 80:
          console.debug(TAG + '====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 event:' + data.event);
          that.SUB_Misc_InputMethod_onGetRightTextOfCursor_0080();
          break;
        case 100:
          console.debug(TAG + '====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 event:' + data.event);
          that.SUB_Misc_InputMethod_offGetRightTextOfCursor_0100();
          break;
        case 110:
          console.debug(TAG + '====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 event:' + data.event);
          that.SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110();
          break;
        case 130:
          console.debug(TAG + '====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 event:' + data.event);
          that.SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130();
          break;

        case 140:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 event:' + data.event);
          that.SUB_Misc_inputMethod_onEditorAttributeChanged_0140();
          break;
        case 160:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 event:' + data.event);
          that.SUB_Misc_inputMethod_offEditorAttributeChanged_0160();
          break;
        case 170:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onInsertText_0170 event:' + data.event);
          that.SUB_Misc_inputMethod_onInsertText_0170();
          break;
        case 180:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offInsertText_0180 event:' + data.event);
          that.SUB_Misc_inputMethod_offInsertText_0180();
          break;
        case 190:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onDeleteLeft_0190 event:' + data.event);
          that.SUB_Misc_inputMethod_onDeleteLeft_0190();
          break;
        case 200:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offDeleteLeft_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_offDeleteLeft_0200();
          break;
        case 210:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onDeleteRight_0210 event:' + data.event);
          that.SUB_Misc_inputMethod_onDeleteRight_0210();
          break;
        case 220:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offDeleteRight_0220 event:' + data.event);
          that.SUB_Misc_inputMethod_offDeleteRight_0220();
          break;
        case 250:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onMoveCursor_0250 event:' + data.event);
          that.SUB_Misc_inputMethod_onMoveCursor_0250();
          break;
        case 260:
          console.debug(TAG + '====>SUB_Misc_inputMethod_offMoveCursor_0260 event:' + data.event);
          that.SUB_Misc_inputMethod_offMoveCursor_0260();
          break;
        case 270:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_insertText_Async_0100();
          break;
        case 280:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_insertText_Async_0200();
          break;
        case 290:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0900 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_insertText_Async_0900();
          break;
        case 300:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100();
          break;
        case 310:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200();
          break;
        case 320:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700();
          break;
        case 330:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteRight_Async_0100();
          break;
        case 340:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteRight_Async_0200();
          break;
        case 350:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_deleteRight_Async_0700();
          break;
        case 360:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100();
          break;
        case 370:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200();
          break;
        case 380:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700();
          break;
        case 390:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_moveCursor_Async_0100();
          break;
        case 400:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_moveCursor_Async_0200();
          break;
        case 410:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_moveCursor_Async_0700();
          break;
        case 420:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100();
          break;
        case 430:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200();
          break;
        case 440:
          console.debug(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700();
          break;
        case 450:
          console.debug(TAG + '====>SUB_inputMethod_IMF_InputMethodSettings_1000 event:' + data.event);
          that.SUB_inputMethod_IMF_InputMethodSettings_1000();
          break
      }
    }

    let commonEventSubscribeInfo = {
      events: ["inputMethodDrawnControlTest"]
    };

    let subscriber;
    commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
      subscriber = data;
      commoneventmanager.subscribe(subscriber, subscriberCallback);
      console.debug(TAG + '====>scene subscribe finish====');
    });
  }

  public initWindow(): void {
    let dis = display.getDefaultDisplaySync();
    let dWidth = dis.width;
    let dHeight = dis.height;
    let keyHeightRate = 0.47;
    let keyHeight = dHeight * keyHeightRate;
    this.windowWidth = dWidth;
    this.windowHeight = keyHeight;
    this.nonBarPosition = dHeight - keyHeight;

    let config = {
      name: this.windowName,
      windowType: windowManager.WindowType.TYPE_INPUT_METHOD,
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
      let win = windowManager.findWindow(this.windowName);
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

  private SUB_Misc_inputMethod_onHandleExtendAction_0010(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 sendExtendAction start');
        await InputClient.sendExtendAction(0);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 sendExtendAction end');
      }, 500);
    });
  }

  private SUB_Misc_inputMethod_offHandleExtendAction_0020(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_offHandleExtendAction_0020 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_offHandleExtendAction_0020 sendExtendAction start');
        await InputClient.sendExtendAction(0);
        await this.sleep(100);
        await InputClient.sendExtendAction(0);
        console.info(TAG + '====>SUB_Misc_inputMethod_offHandleExtendAction_0020 sendExtendAction end');
      }, 500);
    });
  }

  private SUB_Misc_inputMethod_onSendFunctionKey_0030(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onSendFunctionKey_0030 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onSendFunctionKey_0030 sendExtendAction start');
        await InputClient.sendKeyFunction(0);
        console.info(TAG + '====>SUB_Misc_inputMethod_onSendFunctionKey_0030 sendExtendAction end');
      }, 500);
    });
  }

  private SUB_Misc_inputMethod_offSendFunctionKey_0040(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_offSendFunctionKey_0040 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_offSendFunctionKey_0040 sendExtendAction start');
        await InputClient.sendKeyFunction(0);
        await this.sleep(100);
        await InputClient.sendKeyFunction(0);
        console.info(TAG + '====>SUB_Misc_inputMethod_offSendFunctionKey_0040 sendExtendAction end');
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        let getForward_info = await InputClient.getForward(10000);
        console.info(TAG + '====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 getForward_info: ' + getForward_info);
        if (getForward_info === 'test') {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        let getForward_info = await InputClient.getForward(10000);
        console.info(TAG + '====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 getForward_info: ' + getForward_info);
        if (getForward_info === '') {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_onGetRightTextOfCursor_0080(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        let getBackward_info = await InputClient.getBackward(10000);
        console.info(TAG + '====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 getBackward_info: ' + getBackward_info);
        if (getBackward_info === 'test') {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_onGetRightTextOfCursor_0080", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_offGetRightTextOfCursor_0100(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        let getBackward_info = await InputClient.getBackward(10000);
        console.info(TAG + '====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 getBackward_info: ' + getBackward_info);
        if (getBackward_info === '') {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_offGetRightTextOfCursor_0100", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        let getTextIndexAtCursor_info = await InputClient.getTextIndexAtCursor();
        console.info(TAG + '====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 getTextIndexAtCursor_info: ' + getTextIndexAtCursor_info);
        if (getTextIndexAtCursor_info === 10000) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 start');
    inputMethodAbility.on("inputStart", async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 getTextIndexAtCursor_info: ');

        let getTextIndexAtCursor_info = await InputClient.getTextIndexAtCursor();
        console.info(TAG + '====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 getTextIndexAtCursor_info: ' + getTextIndexAtCursor_info);
        if (getTextIndexAtCursor_info === -1) {
          commonEventPublishData = {
            data: "SUCCESS"
          };
        }
        commoneventmanager.publish("SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130", commonEventPublishData, this.publishCallback);
      }, 500);
    });
  }

  private SUB_Misc_inputMethod_onEditorAttributeChanged_0140(): void {
    let commonEventPublishData = {
      data: "FAILED"
    };
    console.info(TAG + '====>receive SUB_Misc_inputMethod_onEditorAttributeChanged_0140 success');
    inputKeyboardDelegate.on('editorAttributeChanged', (attr) => {
      console.log(`====>Succeeded in receiving attribute of editor, inputPattern = ${attr.inputPattern}, enterKeyType = ${attr.enterKeyType}`);
      if (attr.enterKeyType === 0) {
        commonEventPublishData = {
          data: "SUCCESS"
        };
        inputKeyboardDelegate.off('editorAttributeChanged');
        commoneventmanager.publish("SUB_Misc_inputMethod_onEditorAttributeChanged_0140", commonEventPublishData, this.publishCallback);
      }
    });
  }

  private SUB_Misc_inputMethod_offEditorAttributeChanged_0160(): void {
    let commonEventPublishData = {
      data: "SUCCESS"
    };
    let editorCallback = (attr) => {
      console.log(`====>Succeeded in receiving attribute of editor, inputPattern = ${attr.inputPattern}, enterKeyType = ${attr.enterKeyType}`);
      commonEventPublishData = {
        data: "FAILED"
      };
    };
    console.info(TAG + '====>receive SUB_Misc_inputMethod_offEditorAttributeChanged_0160 success');
    inputKeyboardDelegate.on('editorAttributeChanged', editorCallback);
    inputKeyboardDelegate.off('editorAttributeChanged', editorCallback);
    let t = setTimeout(() => {
      clearTimeout(t);
      commoneventmanager.publish("SUB_Misc_inputMethod_offEditorAttributeChanged_0160", commonEventPublishData, this.publishCallback);
    }, 100);
  }

  private SUB_Misc_inputMethod_onInsertText_0170(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_onInsertText_0170 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_onInsertText_0170 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_onInsertText_0170 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_onInsertText_0170 InputClient.insertText: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_onInsertText_0170 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_onInsertText_0170 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_offInsertText_0180(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_offInsertText_0180 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        inputMethodAbility.off('inputStart');
        console.info(TAG + '====>receive SUB_Misc_inputMethod_offInsertText_0180 success inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_offInsertText_0180 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool1 = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_offInsertText_0180 bool1: ' + bool1);
              await this.sleep(100);
              let bool2 = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_offInsertText_0180 bool2: ' + bool2);
            } catch (err) {
              console.debug(TAG + '====>SUB_Misc_inputMethod_offInsertText_0180 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_offInsertText_0180 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_onDeleteLeft_0190(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteLeft_0190 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteLeft_0190 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteLeft_0190 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteLeft_0190 InputClient.deleteForward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteLeft_0190 deleteForward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteLeft_0190 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_offDeleteLeft_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteLeft_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        inputMethodAbility.off('inputStart');
        console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteLeft_0200 success inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteLeft_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool1 = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteLeft_0200 bool1: ' + bool1);
              await this.sleep(100);
              let bool2 = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteLeft_0200 bool2: ' + bool2);
            } catch (err) {
              console.debug(TAG + '====>SUB_Misc_inputMethod_offDeleteLeft_0200 deleteForward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteLeft_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_onDeleteRight_0210(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteRight_0210 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteRight_0210 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteRight_0210 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteRight_0210 InputClient.deleteBackward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_onDeleteRight_0210 deleteBackward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_onDeleteRight_0210 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_offDeleteRight_0220(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteRight_0220 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        inputMethodAbility.off('inputStart');
        console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteRight_0220 success inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteRight_0220 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool1 = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteRight_0220 bool1: ' + bool1);
              await this.sleep(100);
              let bool2 = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_offDeleteRight_0220 bool2: ' + bool2);
            } catch (err) {
              console.debug(TAG + '====>SUB_Misc_inputMethod_offDeleteRight_0220 deleteBackward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_offDeleteRight_0220 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_onMoveCursor_0250(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_onMoveCursor_0250 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_onMoveCursor_0250 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_onMoveCursor_0250 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_onMoveCursor_0250 InputClient.moveCursor:');
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_onMoveCursor_0250 moveCursor catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_onMoveCursor_0250 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_offMoveCursor_0260(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_offMoveCursor_0260 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        inputMethodAbility.off('inputStart');
        console.info(TAG + '====>receive SUB_Misc_inputMethod_offMoveCursor_0260 success inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_offMoveCursor_0260 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_offMoveCursor_0260 first');
              await this.sleep(100);
              await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_offMoveCursor_0260 second');
            } catch (err) {
              console.debug(TAG + '====>SUB_Misc_inputMethod_offMoveCursor_0260 moveCursor catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_offMoveCursor_0260 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_insertText_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 InputClient.insertText: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_insertText_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 InputClient.insertText: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_insertText_Async_0900(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0900 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0900 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0900 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.insertText('insert');
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0900 InputClient.insertText: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_insertText_Async_0900 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_insertText_Async_0900 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 InputClient.deleteForward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 deleteForward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 InputClient.deleteForward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteForward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 InputClient.deleteForward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 insertText catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteLeft_Async_0700 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteRight_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 InputClient.deleteBackward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 deleteBackward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteRight_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 InputClient.deleteBackward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteBackward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_deleteRight_Async_0700(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteBackward(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 InputClient.deleteBackward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 deleteBackward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_deleteRight_Async_0700 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendKeyFunction(0);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendKeyFunction(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendKeyFunction(1);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_moveCursor_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 InputClient.moveCursor success');
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 moveCursor catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_moveCursor_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 InputClient.moveCursor success');
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_moveCursor_Async_0700(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.moveCursor(inputMethodEngine.CURSOR_RIGHT);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 InputClient.moveCursor: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 moveCursor catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0700 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.sendExtendAction(0);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 InputClient.sendExtendAction success');
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 sendExtendAction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200v InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              await InputClient.sendExtendAction(0);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 InputClient.sendExtendAction success');
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 sendExtendAction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendExtendAction(0);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 InputClient.sendExtendAction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 sendExtendAction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0700 catch error: ' + JSON.stringify(error));
    }
  }

  private SUB_inputMethod_IMF_InputMethodSettings_1000(): void {
    console.info(TAG + '====>receive SUB_inputMethod_IMF_InputMethodSettings_1000 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_inputMethod_IMF_InputMethodSettings_1000 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_inputMethod_IMF_InputMethodSettings_1000 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.deleteForward(1);
              console.info(TAG + '====>SUB_inputMethod_IMF_InputMethodSettings_1000 InputClient.deleteForward: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_inputMethod_IMF_InputMethodSettings_1000 deleteForward catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_inputMethod_IMF_InputMethodSettings_1000 catch error: ' + JSON.stringify(error));
    }
  }
}