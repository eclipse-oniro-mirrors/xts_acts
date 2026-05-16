/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import commonEvent from '@ohos.commonEventManager'

class MyParcelAble {
  num: number = 0;
  str: String = '';
  result: boolean = false;

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  MyParcelAble(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeBoolean(this.result);
    return true;
  }

  unmarshalling(messageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readBoolean();
    return true;
  }
}

var message;
var commonEventData = {
  parameters:{
    message:message,
  }
}
var actionStr;
var accountId;
export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    actionStr = want.parameters.action;
    accountId = want.parameters.accountId;
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');

    globalThis.terminate = () => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info("====>EntryAbility terminateSelf end");
        }).catch((err) => {
          console.info("====>EntryAbility terminateSelf err:" + JSON.stringify(err));
        });
      }, 50)
    };

    if (actionStr === 'Acts_CrossUserCall_0100' || actionStr === 'Acts_CrossUserCall_0300') {
      this.context.startAbilityByCallWithAccount({
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
      }, accountId).then((data) => {
        console.info('====>' + actionStr + ' startAbilityByCall data:' + JSON.stringify(data));
        commonEventData.parameters.message = data;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + ' publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      }).catch((err) => {
        console.info('====>' + actionStr + ' startAbilityByCall err:' + JSON.stringify(err));
        commonEventData.parameters.message = err;
        commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + ' publish err:' + JSON.stringify(err));
          globalThis.terminate();
        })
      })
    }

    if (actionStr === 'Acts_CrossUserCall_2900') {
      var caller;
      function releaseCallback(data) {
        console.info('====>' + actionStr + ' releaseCallBack:' + data);
        commonEventData.parameters.message = data;
        commonEvent.publish('ACTS_CROSS_RELEASE_EVENT', commonEventData, (err) => {
          console.info('====>' + actionStr + '  onRelease event publish err:' + JSON.stringify(err));
        })
      }
      this.context.startAbilityByCallWithAccount({
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
      }, accountId).then((data) => {
        caller = data;
        caller.onRelease(releaseCallback);
        let param = new MyParcelAble(2900, 'Acts_CrossUserCall_2900', false);
        caller.callWithResult('call', param).then((data) => {
          var result = new MyParcelAble(0, '', false);
          data.readParcelable(result);
          console.info('====>' + actionStr + '  callWithResult result:' + JSON.stringify(result));
          commonEventData.parameters.message = result;
          commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
            console.info('====>' + actionStr + '  call event publish err:' + JSON.stringify(err));
            globalThis.terminate();
          })
          caller.release();
        })
      }).catch((err) => {
        console.info('====>' + actionStr + '  startAbilityByCall err:' + JSON.stringify(err));
      })
    }
  }

  onDestroy() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
