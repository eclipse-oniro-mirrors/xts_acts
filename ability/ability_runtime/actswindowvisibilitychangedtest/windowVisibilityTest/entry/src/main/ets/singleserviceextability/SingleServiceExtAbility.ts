/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import display from '@ohos.display';
import window from '@ohos.window';
import rpc from '@ohos.rpc';

globalThis.GetApplicationState1 = async () => {
  console.info(TAG, 'GetApplicationState Start!');
  let processInfo = await globalThis.singleExtApplicationContext.getRunningProcessInformation();
  console.info(TAG, processInfo[0].pid + processInfo[0].uid + processInfo[0].processName + processInfo[0].bundleNames + processInfo[0].state);
};

globalThis.createWindow1 = async (name, windowType, rect) => {
  let win;
  console.info(TAG, 'Start creating window.');
  let configuration = {
    name: name,
    windowType: windowType,
    ctx: globalThis.singleExtAbilityContext
  };
  try {
    win = await window.createWindow(configuration);
    await win.moveTo(rect.left, rect.top);
    await win.resetSize(rect.width, rect.height);
    await win.loadContent('pages/uiPage');
    await win.setBackgroundColor('#ffeae6e6');
    await win.show();
    console.info(TAG, 'Start creating window successfully!');
  } catch {
    console.error('Window create failed!');
  }
};

const TAG: string = 'ServiceExtAbilityTAG';

class StubTest extends rpc.RemoteObject {
  // ...
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.info(TAG, `onCreate, want: ${want.abilityName}`);
    globalThis.singleExtAbilityContext = this.context;
    globalThis.singleExtApplicationContext = this.context.getApplicationContext();
  }

  onRequest(want, startId) {
    console.info(TAG, `onRequest, want: ${JSON.stringify(want)}`);
    globalThis.abilityWant = want;
    display.getDefaultDisplay().then((dis) => {
      let navigationBarRect = {
        left: 400,
        top: 200,
        width: 200,
        height: 600
      };
      globalThis.createWindow1('uiPages', window.WindowType.TYPE_FLOAT, navigationBarRect);
    });
  }

  onConnect(want) {
    console.info(TAG, `onConnect, want: ${want.abilityName}`);
    return new StubTest('test');
  }

  onDisconnect(want) {
    console.info(TAG, `onDisconnect, want: ${want.abilityName}`);
  }

  onDestroy() {
    console.info(TAG, 'onDestroy');
  }
}