/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import windowManager from '@ohos.window';
import promptAction from '@ohos.promptAction';
import commoneventmanager from '@ohos.commonEventManager';

let inputMethodAbility = inputMethodEngine.getInputMethodAbility();

const SOFT_KEYBOARD = 0;
const FLG_FLOATING = 1;

const TAG = 'KeyboardDelegate';
let panelInfo = {
  type: SOFT_KEYBOARD,
  flag: FLG_FLOATING
};

export class KeyboardDelegate {
  mContext;
  WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
  windowName = 'inputApp';
  private softKeyboardPanel: inputMethodEngine.Panel = null;

  constructor(context) {
    this.mContext = context;
  }
  public onCreate(): void {
    let subscriber;
    inputMethodAbility.createPanel(this.mContext, panelInfo, (err, panel) => {
      if (err !== undefined) {
        console.info(TAG + '====>Failed to create panel, err: ' + JSON.stringify(err));
        return;
      }
      this.softKeyboardPanel = panel;
      this.softKeyboardPanel.setUiContent('testability/pages/Second').then(async (err) => {
        console.info(TAG + '====>softKeyboardPanel setUiContent err:' + JSON.stringify(err));
      }).catch((error)=>{
        console.error(TAG + '====>Failed to softKeyboardPanel.setUiContent:', error);
      });
      try{
        let commonEventSubscribeInfo = {
          events: ['InputMethodWindManageTest']
        };
        
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          try{
            commoneventmanager.subscribe(subscriber, subscriberCallback)
          }catch(error){
            console.error(TAG + '====>Failed to subscribe in KeyboardDelegate:', error);
          }
          console.info(TAG + '====>scene subscribe finish====');
        }).catch((error)=>{
            console.error(TAG + '====>Failed to createSubscriber in KeyboardDelegate:', error);
          })
      }catch(err){
        console.info(TAG + '====>createSubscriber err:' + JSON.stringify(err.message));
      }
    });
    let that = this;
    inputMethodAbility.on("inputStop", () => {
      inputMethodAbility.off("inputStop", () => {
        console.log('====>inputMethodEngine delete inputStop notification.');
      });
      try {
        that.mContext.destroy().then((err) => {
          console.info(TAG + '====>inputMethodAbility destroy err:' + JSON.stringify(err));
        }).catch((error)=>{
            console.error(TAG + '====>Failed to destroy in KeyboardDelegate:', error);
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
          console.debug(TAG + '====>onSubmitTest_0010 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100();
          break;
        case 20:
          console.debug(TAG + '====>onSubmitTest_0020 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200();
          break;
        case 30:
          console.debug(TAG + '====>onSubmitTest_0030 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300();
          break;
         case 40:
          console.debug(TAG + '====>onSubmitTest_0040 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400();
          break;
      }
    }
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
              let bool = await InputClient.sendKeyFunction(2);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 catch error: ' + JSON.stringify(error));
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
              let bool = await InputClient.sendKeyFunction(2);
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
  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendKeyFunction(3);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 catch error: ' + JSON.stringify(error));
    }
  }
  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400(): void {
    console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 success');
    try {
      inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
        console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 success inputStart');
        inputMethodAbility.off('inputStart');
        if (InputClient == null) {
          console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 InputClient is null');
        } else {
          let t = setTimeout(async () => {
            clearTimeout(t);
            try {
              let bool = await InputClient.sendKeyFunction(3);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0400 catch error: ' + JSON.stringify(error));
    }
  }
  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0500(): void {
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
              let bool = await InputClient.sendKeyFunction(6);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }
  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0600(): void {
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
              let bool = await InputClient.sendKeyFunction(7);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }
  private SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0700(): void {
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
              let bool = await InputClient.sendKeyFunction(8);
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 InputClient.sendKeyFunction: ' + bool);
            } catch (err) {
              console.info(TAG + '====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendKeyFunction catch err:' + JSON.stringify(err));
            }
          }, 500);
        }
      });
    } catch (error) {
      console.info(TAG + '====>receive SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 catch error: ' + JSON.stringify(error));
    }
  }
}