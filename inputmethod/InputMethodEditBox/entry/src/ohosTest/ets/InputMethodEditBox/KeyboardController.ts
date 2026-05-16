/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import display from '@ohos.display';
import commoneventmanager from '@ohos.commonEventManager';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { InputMethodExtraConfig } from '@kit.IMEKit';

let inputMethodAbility = inputMethodEngine.getInputMethodAbility();
const TAG = 'keyboardController';
const SOFT_KEYBOARD = 0;
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

  private softKeyboardPanel: inputMethodEngine.Panel = null;
  private windowHeight: number = 0;
  private windowWidth: number = 0;
  private keyboardController: inputMethodEngine.KeyboardController;
  private InputClient: inputMethodEngine.InputClient;
  private display_info = display.getDefaultDisplaySync();
  private extraConfig: InputMethodExtraConfig;

  constructor(context) {
    this.storage = new LocalStorage();
    this.storage.setOrCreate('storageSimplePorp', 121);
    this.mContext = context;
    this.windowWidth = this.display_info.width;
    this.windowHeight = this.display_info.height * 0.45;
  }

  public onCreate(): void {
    let that = this; 
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
          events: ['InputMethodEditBoxTest']
        };
        
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info(TAG + '====>scene subscribe finish====');
        })
      } catch (err) {
        console.info(TAG + '====>createSubscriber err:' + JSON.stringify(err.message));
      }
    });

    inputMethodAbility.on('inputStop', async() => {
      console.info(TAG + '====>on_inputStop callback')
      inputMethodAbility.off('inputStart');
      inputMethodEngine.getKeyboardDelegate().off('editorAttributeChanged');
      inputMethodAbility.off('inputStop',()=>{});
      inputMethodAbility.destroyPanel(this.softKeyboardPanel);
      await that.mContext.destroy();   
      await commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
    });

    inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
      this.keyboardController = keyboardController;
      this.InputClient = InputClient;
      console.info(TAG + '====>inputMethodAbility inputStart into'); 
    });

    inputMethodEngine.getKeyboardDelegate().on('editorAttributeChanged', (attr:inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback, extraConfig = ${attr.extraConfig}`);
      this.extraConfig = attr.extraConfig;
    });
    
    let subscriberCallback = (err, data) => {
      console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
      console.info(TAG + '====>receive event data ' + JSON.stringify(data));
      switch (data.code) {
        case 10:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0800 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0800();
          break;
        case 20:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0900 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0900();
          break;
        case 30:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0700 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0700();
          break;
        case 40:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_1000 event:' + data.event);
          that.Sub_InputMethod_extraConfig_1000();
          break;
        case 50:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0500 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0500();
          break;
        case 60:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0600 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0600();
          break;
        case 70:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0100 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0100();
          break;
        case 80:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0300 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0300();
          break;
        case 90:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0200 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0200();
          break;
        case 100:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0400 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0400();
          break;
      }
    }

    let unSubscriberCallback = (err) => {
      console.info(TAG + '====>unSubscriberCallback start');
      if (err) {
        console.error(TAG + '====>unSubscriberCallback failed: ' + JSON.stringify(err));
      } else {
        console.info(TAG + '====>unSubscriberCallback finsh');
      }
    }  
  }

  private publishCallback(err): void {
    if (err) {
      console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
    } else {
      console.log(TAG + '====>publish');
    }
  }

  private async Sub_InputMethod_extraConfig_0800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0800 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0800 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.bbb === true) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0800 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0800', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0800 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0800', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0900 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0900 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.aaa === 'AAA') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0900 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0900', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0900 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0900', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0700 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0700 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.name === 123) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0700 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0700', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0700 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0700', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_1000 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_1000 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.bbb === true && mode.customSettings.aaa === 'AAA' && mode.customSettings.name === 123) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_1000 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_1000', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_1000 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_1000', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0500 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0500 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0500 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0500', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0500 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0600 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0600 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0600 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0600', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0600 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0100 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0100 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) !== '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0100 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0100', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0100 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0300 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0300 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0300 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0300', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0300 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0200 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0200 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) !== '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0200 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0200', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0200 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0400 data');
    let commonEventPublishData = {
        data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0400 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0400 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0400', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0400 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0400', commonEventPublishData, this.publishCallback);
    }
  }

}