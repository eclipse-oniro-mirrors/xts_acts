/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
'use static';

import StartupConfig from '@ohos.app.appstartup.StartupConfig'
import StartupConfigEntry from '@ohos.app.appstartup.StartupConfigEntry'
import StartupListener from '@ohos.app.appstartup.StartupListener'
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { AppStorage, PersistentStorage, StorageLink } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';

export default class MyStartupConfigEntry extends StartupConfigEntry {
  onConfig(): StartupConfig {
    hilog.info(0x000, 'StartupTest MyStartupConfigEntry TAG ', 'onConfig');
    console.log('StartupTest MyStartupConfigEntry onConfig');
    let onCompletedCallback = (error: BusinessError) => {
      console.log('StartupTest MyStartupConfigEntry onConfig');
      let initValue1: string | undefined = AppStorage.get<string>('Sample001_init');
      if (initValue1 == 'Sample001_init') {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample001', (err, data) => {
          console.log('StartupTest Sample001 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample001 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get error');
      }
      let initValue2: string | undefined = AppStorage.get<string>('Sample002_init') as string;
      if (initValue2 == 'Sample002_init') {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample002', (err, data)=>{
          console.log('StartupTest Sample002 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample002 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get error');
      }
      let initValue3: string | undefined = AppStorage.get<string>('Sample003_init') as string;
      if (initValue3 == 'Sample003_init') {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample003', (err, data)=>{
        console.log('StartupTest Sample003 init, publish msg, err=' + JSON.stringify(err));
        console.log('StartupTest Sample003 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get error');
      }
    }
    let startupListener: StartupListener = {
      onCompleted: onCompletedCallback
    }
    let config: StartupConfig = {
      timeoutMs: 5000,
      startupListener: startupListener
    }
    return config;
  }

  onRequestCustomMatchRule(want: Want): string {
    console.log('testTag StartupTest onRequestCustomMatchRule_running want =' + JSON.stringify(want));
    let param: string | undefined = want?.parameters?.get('customParam') as string;
    if (param == 'param1') {
      console.log('testTag StartupTest onRequestCustomMatchRule_running customRule1');
      commonEventManager.publish('onRequestCustomMatchRule_running', {
        parameters: {
          'result': 'customRule1'
        }
      }, (err, data) => {
        console.log('testTag StartupTest   end, publish msg, err=' + JSON.stringify(err));
        console.log('testTag StartupTest onRequestCustomMatchRule_running end, publish msg, data=' +
        JSON.stringify(data));
      });
      return 'customRule1';
    }
    return '';
  }
}