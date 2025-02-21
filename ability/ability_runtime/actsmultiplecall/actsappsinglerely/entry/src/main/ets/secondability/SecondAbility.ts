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
import Ability from '@ohos.app.ability.UIAbility';
import type Window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';

const TIME_OUT = 50;

class MyParcelable {
  num: number = 0;
  str: String = "";
  result: boolean = false;

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  MyParcelable(num, string, result) {
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

function sendMsgCallback(data): MyParcelable {
  console.log('====>Callee sendMsgCallback called');
  let receivedData = new MyParcelable(0, '', false);
  data.readParcelable(receivedData);
  receivedData.MyParcelable(receivedData.num + 1, `${receivedData.str}`, true);
  return receivedData;
}

export default class SecondAbility extends Ability {
  onCreate(want, launchParam) {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    console.info('====>single second onCreate');

    let context = this.context;

    function sendMsgCallbackFromCallee(data): MyParcelable {
      console.log('====>Callee sendMsgCallbackFromCallee called');
      let receivedData = new MyParcelable(0, '', false);
      data.readParcelable(receivedData);
      receivedData.num += 1;
      return receivedData;
    }

    globalThis.multipleAndSingleCallFunction_0100 = () => {
      console.info('====> secondAbility');
      this.callee.on('call', sendMsgCallback);
    };

    globalThis.Acts_SingleInstanceCallFunction_1000 = () => {
      console.info('====>single second Acts_SingleInstanceCallFunction_1000');
      context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_1000 multiple startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_1000 multiple', false);
        caller.callWithResult('call', param).then((data) => {
          let receivedData = new MyParcelable(0, '', false);
          data.readParcelable(receivedData);
          let commonEventData = {
            parameters: {
              num: receivedData.num,
              str: receivedData.str,
            }
          };
          commonEvent.publish('ACTS_RELEASE_EVENT', commonEventData, (err) => {
            console.log('====>Acts_SingleInstanceCallFunction_1000 multyple publish err:' +
            JSON.stringify(err));
            this.terminate();
          });
        }).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_1000 callWithResult err:' + JSON.stringify(err));
        });
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_1000 startAbilityByCall err:' + JSON.stringify(err));
      });
    };

    globalThis.Acts_SingleInstanceCallFunction_1100 = () => {
      this.callee.on('call', sendMsgCallbackFromCallee);
      context.startAbilityByCall({
        bundleName: 'com.acts.thirdpartyapprely',
        abilityName: 'SecondAbility',
      }).then((caller) => {
        console.info('====>Acts_SingleInstanceCallFunction_1100 callappreply startAbilityByCall caller:' +
        JSON.stringify(caller));
        let param = new MyParcelable(0, 'Acts_SingleInstanceCallFunction_1100', false);
        caller.callWithResult('call', param).then((data) => {
          console.info('====>Acts_SingleInstanceCallFunction_1100 callappreply callWithResult data:' +
          JSON.stringify(data));
          let receivedData2 = new MyParcelable(0, '', false);
          data.readParcelable(receivedData2);
          let commonEventData = {
            parameters: {
              num: receivedData2.num,
              str: receivedData2.str,
            }
          };
          commonEvent.publish('ACTS_SECOND_CALL_EVENT', commonEventData, (err) => {
            console.log('====>Acts_SingleInstanceCallFunction_1100 multyple publish err:' +
            JSON.stringify(err));
            this.terminate();
          });
        }).catch((err) => {
          console.info('====>Acts_SingleInstanceCallFunction_1100 callappreply callWithResult err:' +
          JSON.stringify(err));
        });
      }).catch((err) => {
        console.info('====>Acts_SingleInstanceCallFunction_1100 callappreply startAbilityByCall err:' +
        JSON.stringify(err));
      });
    };

    if (want.action === 'multipleAndSingleCallFunction_0100') {
      globalThis.multipleAndSingleCallFunction_0100();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_1000') {
      globalThis.Acts_SingleInstanceCallFunction_1000();
    }
    if (want.action === 'Acts_SingleInstanceCallFunction_1100') {
      globalThis.Acts_SingleInstanceCallFunction_1100();
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

  terminate(): void {
    setTimeout(() => {
      this.context.terminateSelf().then(() => {
        console.debug('====>terminateSelf end');
      }).catch((err) => {
        console.debug('====>terminateSelf err:' + JSON.stringify(err));
      });
    }, TIME_OUT);
  }
}
