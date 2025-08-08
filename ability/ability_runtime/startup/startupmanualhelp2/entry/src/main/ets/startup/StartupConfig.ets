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

import StartupConfig from '@ohos.app.appstartup.StartupConfig'
import StartupConfigEntry from '@ohos.app.appstartup.StartupConfigEntry'
import StartupListener from '@ohos.app.appstartup.StartupListener'
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import {BusinessError} from '@ohos.base';

export default class MyStartupConfigEntry extends StartupConfigEntry {
  onConfig() {
    hilog.info(0x000, 'StartupTest MyStartupConfigEntry TAG ', 'onConfig');
    console.log('StartupTest MyStartupConfigEntry onConfig');
    let onCompletedCallback = (error:BusinessError) => {
      let initValue1: string = AppStorage.get('Sample_001_init') as string;
      let Sample_103_init: string = AppStorage.get('Sample_103_init') as string;
      if (Sample_103_init == 'Sample_103_init') {
        console.log('Custom StartupTest Sample_103 startupManager AppStorage.get success');
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': error?.code,
          }
        }
        commonEventManager.publish('Sample_103_init', commonEventData, (err, data)=>{
          console.info('StartupTest Sample_103_init init, publish msg, err=' + JSON.stringify(err));
          console.info('StartupTest Sample_103_init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
          console.log('Custom StartupTest  Sample_103_init startupManager AppStorage.get error');
      }
      let onCompletedCallbackfeature: string = AppStorage.get('Sample_002_onDependencyCompleted') as string;
      if (onCompletedCallbackfeature == 'Sample_001') {
        console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ');
        commonEventManager.publish('Sample_002_onDependencyCompleted', {
          parameters: {
            'name': onCompletedCallbackfeature
          }
        }, (err, data) => {
          console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
      }
      console.log('StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
      if (error) {
        hilog.info(0x000, 'MyStartupConfigEntry TAG ', ' onCompletedCallback: %{public}d, mssage: %{public}s',
          error.code, error.message);
      } else {
        hilog.info(0x000, 'MyStartupConfigEntry TAG ', ' onCompletedCallback: success');
      }
      setTimeout(()=>{
        commonEventManager.publish('StartupTestDefaultConfig', {
          parameters: {
            'error': error
          }
        }, (err, data) => {
          console.log('StartupTest onCompletedCallback end, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest onCompletedCallback end, publish msg, data=' + JSON.stringify(data));
        });
      }, 500);
    }
    let startupListener: StartupListener = {
      'onCompleted': onCompletedCallback
    }
    let config: StartupConfig = {
      'timeoutMs': 5000,
      'startupListener': startupListener
    }
    return config;
  }
  onRequestCustomMatchRule(want: Want): string {
    console.log('testTag StartupTest onRequestCustomMatchRule_running want =' + JSON.stringify(want));
    if (want?.parameters?.customParam == 'param1') {
      console.log('testTag StartupTest onRequestCustomMatchRule_running customRule1');
      commonEventManager.publish('onRequestCustomMatchRule_running', {
        parameters: {
          'result': 'customRule1'
        }
      }, (err, data) => {
        console.log('testTag StartupTest   end, publish msg, err=' + JSON.stringify(err));
        console.log('testTag StartupTest onRequestCustomMatchRule_running end, publish msg, data=' + JSON.stringify(data));
      });
      return 'customRule1';
    }
    return '';
  }
}