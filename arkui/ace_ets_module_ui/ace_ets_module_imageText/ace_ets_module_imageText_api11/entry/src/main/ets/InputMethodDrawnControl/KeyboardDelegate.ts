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
      this.softKeyboardPanel.setUiContent('testability/pages/Second', async (err, data) => {        
        console.info(TAG + '====>Succeed in creating panel.' + JSON.stringify(panel));
      });
      try{
        let commonEventSubscribeInfo = {
          events: ['InputMethodWindManageTest']
        };
        
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          commoneventmanager.subscribe(subscriber, subscriberCallback)
          console.info(TAG + '====>scene subscribe finish====');
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
          console.debug(TAG + '====>textInputApi1_001 event:' + data.event);
          that.SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100();
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
}