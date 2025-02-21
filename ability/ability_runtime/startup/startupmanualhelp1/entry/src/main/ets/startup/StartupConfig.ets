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

export default class MyStartupConfigEntry extends StartupConfigEntry {
  onConfig() {
    hilog.info(0x000, 'StartupTest MyStartupConfigEntry TAG ', 'onConfig');
    console.log('StartupTest MyStartupConfigEntry onConfig');
    let onCompletedCallback = (error) => {
      let initValue1 = AppStorage.get('Sample_001_init');
      if (initValue1 == 'Sample_001_init') {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_001', (err, data)=>{
          console.log('StartupTest Sample_001 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_001 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get error');
      }
      let initValue2 = AppStorage.get('Sample_002_init');
      if (initValue2 == 'Sample_002_init') {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_002', (err, data)=>{
          console.log('StartupTest Sample_002 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_002 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get error');
      }
      let initValue3 = AppStorage.get('Sample_003_init');
      if (initValue3 == 'Sample_003_init') {
        console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_003', (err, data)=>{
        console.log('StartupTest Sample_003 init, publish msg, err=' + JSON.stringify(err));
        console.log('StartupTest Sample_003 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get error');
      }
      let initValue8 = AppStorage.get('Sample_008_init');
      if (initValue8 == 'Sample_008_init') {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_008', (err, data)=>{
        console.log('StartupTest Sample_008 init, publish msg, err=' + JSON.stringify(err));
        console.log('StartupTest Sample_008 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
      }
      let initValue6 = AppStorage.get('Sample_006_init');
      if (initValue6 == 'Sample_006_init') {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_006', (err, data)=>{
        console.log('StartupTest Sample_006 init, publish msg, err=' + JSON.stringify(err));
        console.log('StartupTest Sample_006 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
      }
      let initValue5 = AppStorage.get('Sample_005_init');
      if (initValue5 == 'Sample_005_init') {
          console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
          commonEventManager.publish('StartupSample_005', (err, data)=>{
          console.log('StartupTest Sample_005 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_005 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
          console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
      }
      let initValue7 = AppStorage.get('Sample_007_init');
      if (initValue7 == 'Sample_007_init') {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_007', (err, data)=>{
          console.log('StartupTest Sample_007 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_007 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
      }
      let initValue4 = AppStorage.get('Sample_004_init');
      if (initValue4 == 'Sample_004_init') {
          console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
          commonEventManager.publish('StartupSample_004', (err, data)=>{
            console.log('StartupTest Sample_004 init, publish msg, err=' + JSON.stringify(err));
            console.log('StartupTest Sample_004 init, publish msg, data=' + JSON.stringify(data));
          })
        } else {
          console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
        }
        let initValue9 = AppStorage.get('Sample_009_init');
      if (initValue9 == 'Sample_009_init') {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_009', (err, data)=>{
          console.log('StartupTest Sample_009 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_009 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get error');
      }
      let initValue10 = AppStorage.get('Sample_010_init');
      if (initValue10 == 'Sample_010_init') {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_010', (err, data)=>{
          console.log('StartupTest Sample_010 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_010 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get error');
      }
      let initValue11 = AppStorage.get('Sample_011_init');
      if (initValue11 == 'Sample_011_init') {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_011', (err, data)=>{
          console.log('StartupTest Sample_011 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_011 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility4 startupManager AppStorage.get error');
      }
      let initValue13 = AppStorage.get('Sample_013_init');
      if (initValue13 == 'Sample_013_init') {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_013', (err, data)=>{
          console.log('StartupTest Sample_013 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_013 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
      }
      let initValue14 = AppStorage.get('Sample_014_init');
      if (initValue14 == 'Sample_014_init') {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_014', (err, data)=>{
          console.log('StartupTest Sample_014 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_014 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
      }
      let initValue15 = AppStorage.get('Sample_015_init');
      if (initValue15 == 'Sample_015_init') {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_015', (err, data)=>{
          console.log('StartupTest Sample_015 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_015 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
      }
      let initValue12 = AppStorage.get('Sample_012_init');
      if (initValue12 == 'Sample_012_init') {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_012', (err, data)=>{
          console.log('StartupTest Sample_012 init, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_012 init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
        console.log('Custom StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
      }
      let completedValue2 = AppStorage.get('Sample_002_onDependencyCompleted');
      if (completedValue2 == 'Sample_003') {
        console.log('Custom StartupTest PageAbility2 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_002_onDependencyCompleted', {
          parameters: {
            'name': completedValue2
          }
        }, (err, data) => {
          console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get error');
      }
      let completedValue3 = AppStorage.get('Sample_003_onDependencyCompleted');
      if (completedValue3 == 'Sample_001') {
        console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get success');
        commonEventManager.publish('StartupSample_003_onDependencyCompleted', {
          parameters: {
            'name': completedValue3
          }
        }, (err, data) => {
          console.log('StartupTest Sample_003 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Sample_003 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get error');
      }
      let onCompletedCallback4 = AppStorage.get('Sample_004_onDependencyCompleted');
          if (onCompletedCallback4 == 'Sample_005' || onCompletedCallback4 == 'Sample_007') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + onCompletedCallback4);
            commonEventManager.publish('StartupSample_004_onDependencyCompleted', {
              parameters: {
                'name': onCompletedCallback4
              }
            }, (err, data) => {
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback04 = AppStorage.get('Sample_004_onDependencyCompleted2');
          if (onCompletedCallback04 == 'Sample_005' || onCompletedCallback04 == 'Sample_007') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + onCompletedCallback04);
            commonEventManager.publish('StartupSample_004_onDependencyCompleted', {
              parameters: {
                'name': onCompletedCallback04
              }
            }, (err, data) => {
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback5 = AppStorage.get('Sample_005_onDependencyCompleted');
          if (onCompletedCallback5 == 'Sample_006') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + onCompletedCallback5);
            commonEventManager.publish('StartupSample_005_onDependencyCompleted', {
              parameters: {
                'name': onCompletedCallback5
              }
            }, (err, data) => {
              console.log('StartupTest Sample_005 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_005 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback7 = AppStorage.get('Sample_007_onDependencyCompleted');
          if (onCompletedCallback7 == 'Sample_008' || onCompletedCallback7 == 'Sample_001') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + onCompletedCallback7);
            commonEventManager.publish('StartupSample_007_onDependencyCompleted', {
              parameters: {
                'name': onCompletedCallback7
              }
            }, (err, data) => {
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback07 = AppStorage.get('Sample_007_onDependencyCompleted2');
          if (onCompletedCallback07 == 'Sample_008' || onCompletedCallback07 == 'Sample_001') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + onCompletedCallback07);
            commonEventManager.publish('StartupSample_007_onDependencyCompleted', {
              parameters: {
                'name': onCompletedCallback07
              }
            }, (err, data) => {
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
        
      console.log('StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
      if (error) {
        hilog.info(0x000, 'MyStartupConfigEntry TAG ', ' onCompletedCallback: %{public}d, mssage: %{public}s',
          error.code, error.mssage);
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
}