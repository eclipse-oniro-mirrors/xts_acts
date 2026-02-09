/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
    inputMethodAbility.on('inputStop', () => {
      inputMethodAbility.off('inputStop', () => {
        console.log('====>inputMethodEngine delete inputStop notification.');
      });
      try {
        this.mContext.destroy((err) => {
          console.info(TAG + '====>inputMethodAbility destroy err:' + JSON.stringify(err));
        });
      } catch (err) {
        console.info(TAG + '====>inputMethodAbility destroy catch err:' + JSON.stringify(err));
        console.info(TAG + '====>inputMethodAbility destroy catch err:' + err);
      }
    });

    function subscriberCallback(err, data): void {
      console.debug(TAG + '====>receive event err:' + JSON.stringify(err));
      console.debug(TAG + '====>receive event data:' + JSON.stringify(data));
      switch (data.code) {
        case 10:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 event:' + data.event);
          KeyboardDelegate.SUB_Misc_inputMethod_onHandleExtendAction_0010();
          break;
        case 20:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0020 event:' + data.event);
          KeyboardDelegate.SUB_Misc_inputMethod_onHandleExtendAction_0020();
          break;
        case 30:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0030 event:' + data.event);
          KeyboardDelegate.SUB_Misc_inputMethod_onHandleExtendAction_0030();
          break;
        case 40:
          console.debug(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0040 event:' + data.event);
          KeyboardDelegate.SUB_Misc_inputMethod_onHandleExtendAction_0040();
          break;
      }
    }

    let commonEventSubscribeInfo = {
      events: ['inputMethodDrawnControlTest']
    };

    let subscriber;
    commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
      subscriber = data;
      commoneventmanager.subscribe(subscriber, subscriberCallback);
      console.debug(TAG + '====>scene subscribe finish====');
    });
  }

  public test(win): void {
    win.moveWindowTo(0, this.nonBarPosition).then(() => {
      win.setUIContent('testability/pages/index').then(() => {
      });
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
        this.test(win);
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

  static SUB_Misc_inputMethod_onHandleExtendAction_0010(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 start');
    inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 sendExtendAction start');
        await InputClient.sendExtendAction(0);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0010 sendExtendAction end');
      }, 500);
    });
  }

  static SUB_Misc_inputMethod_onHandleExtendAction_0020(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0020 start');
    inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0020 sendExtendAction start');
        await InputClient.sendExtendAction(3);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0020 sendExtendAction end');
      }, 500);
    });
  }

  static SUB_Misc_inputMethod_onHandleExtendAction_0030(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0030 start');
    inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0030 sendExtendAction start');
        await InputClient.sendExtendAction(4);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0030 sendExtendAction end');
      }, 500);
    });
  }

  static SUB_Misc_inputMethod_onHandleExtendAction_0040(): void {
    console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0040 start');
    inputMethodAbility.on('inputStart', async (KeyboardDelegate, InputClient) => {
      inputMethodAbility.off('inputStart');
      let t = setTimeout(async () => {
        clearTimeout(t);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0040 sendExtendAction start');
        await InputClient.sendExtendAction(5);
        console.info(TAG + '====>SUB_Misc_inputMethod_onHandleExtendAction_0040 sendExtendAction end');
      }, 500);
    });
  }
}