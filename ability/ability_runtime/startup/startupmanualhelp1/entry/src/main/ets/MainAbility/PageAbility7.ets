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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import startupManager from '@ohos.app.appstartup.startupManager'
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import StartupConfig from '@ohos.app.appstartup.StartupConfig'
import StartupListener from '@ohos.app.appstartup.StartupListener'
import { AbilityConstant} from '@kit.AbilityKit';
import {BusinessError} from '@ohos.base';

let subscriber:commonEventManager.CommonEventSubscriber | undefined = undefined;
let uiContext:common.UIAbilityContext | undefined = undefined;
let onAbiltiyDestory = false;
let keepAlive = false;
let startOrder:string[][] = [];
let customConfig = false;
export default class PageAbility7 extends UIAbility {
  // Sample_004 -> Sample_005 -> Sample_006
  //            -> Sample_007 -> Sample_008
  //                          -> Sample_001
  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility7', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility7 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest PageAbility7 customConfig = true');
      customConfig = true;
    }

    uiContext = this.context;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupSample_005_onDependencyCompleted',
        'StartupSample_007_onDependencyCompleted',
        'StartupSample_004_onDependencyCompleted',
        'StartupTestDefaultConfig'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest PageAbility7 createSubscriber success');
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest PageAbility7 receive event, data = ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'StartupSample_005_onDependencyCompleted') {
          if (data.parameters?.name == 'Sample_006') {
            startOrder.push(['Sample_006']);
          }

          commonEventManager.publish('show_msg', {
            parameters:{
              msg: 'StartupSample_006加载完毕 customConfig = ' + customConfig
            }
          },()=>{
            console.info('StartupTest PageAbility7 send msg');
          })
        }
        if (event === 'StartupSample_007_onDependencyCompleted') {
          let name: string = data.parameters?.name as string;
          startOrder.push([name]);
          commonEventManager.publish('show_msg', {
            parameters:{
              msg: name + '加载完毕 customConfig = ' + customConfig
            }
          },()=>{
            console.info('StartupTest PageAbility7 send msg');
          })
        }
        if (event === 'StartupSample_004_onDependencyCompleted') {
          let name: string = data.parameters?.name as string;
          startOrder.push([name]);
          commonEventManager.publish('show_msg', {
            parameters:{
              msg: name + '加载完毕 customConfig = ' + customConfig
            }
          },()=>{
            console.info('StartupTest PageAbility7 send msg');
          })
        }
        if (event == 'StartupTestDefaultConfig') {
          console.info('StartupTest PageAbility7 terminateSelfWithResult , result = true');
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'startResult': true,
                    'startOrder': startOrder
                  }
                }
              })
            }, 2000)
          }
        }
      })
    }).catch((error: BusinessError)=>{
      console.info('StartupTest PageAbility7 createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest PageAbility7', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest PageAbility7 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility7', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility7', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(){
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'StartupTest PageAbility7', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(){
    // Ability has brought to foreground
    // Sample_004 -> Sample_005 -> Sample_006
    //            -> Sample_007 -> Sample_008
    //                          -> Sample_001
    hilog.info(0x0000, 'StartupTest PageAbility7', '%{public}s', 'Ability onForeground');
    console.log('StartupTest startupManager run');
    setTimeout(()=>{
      if (customConfig) {
        console.log('StartupTest PageAbility7 startupManager run defaultConfig');
        startupManager.run(['Sample_004']);
      } else {
        console.log('StartupTest PageAbility7 startupManager run with custom Config')
        let onCompletedCallback = (error: BusinessError) => {
          let initValue4: string = AppStorage.get('Sample_004_onDependencyCompleted') as string;
          if (initValue4 == 'Sample_005' || initValue4 == 'Sample_007') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + initValue4);
            commonEventManager.publish('StartupSample_004_onDependencyCompleted', {
              parameters: {
                'name': initValue4
              }
            }, (err, data) => {
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_004 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback4: string = AppStorage.get('Sample_004_onDependencyCompleted2') as string;
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
          let initValue5: string = AppStorage.get('Sample_005_onDependencyCompleted')as string ;
          if (initValue5 == 'Sample_006') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + initValue5);
            commonEventManager.publish('StartupSample_005_onDependencyCompleted', {
              parameters: {
                'name': initValue5
              }
            }, (err, data) => {
              console.log('StartupTest Sample_005 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_005 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let initValue7: string = AppStorage.get('Sample_007_onDependencyCompleted') as string;
          if (initValue7 == 'Sample_008' || initValue7 == 'Sample_001') {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get success ' + initValue7);
            commonEventManager.publish('StartupSample_007_onDependencyCompleted', {
              parameters: {
                'name': initValue7
              }
            }, (err, data) => {
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_007 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility7 startupManager AppStorage.get error');
          }
          let onCompletedCallback7: string= AppStorage.get('Sample_007_onDependencyCompleted2') as string;
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

          console.log('Custom StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
          if (error) {
            hilog.info(0x000, 'Custom MyStartupConfigEntry TAG ',
              ' onCompletedCallback: %{public}d, mssage: %{public}s', error.code, error.message);
          } else {
            hilog.info(0x000, 'Custom MyStartupConfigEntry TAG ', ' onCompletedCallback: success');
          }
          setTimeout(()=>{
            commonEventManager.publish('StartupTestDefaultConfig', {
              parameters: {
                'error': error
              }
            }, (err, data) => {
              console.log('Custom StartupTest onCompletedCallback end, publish msg, err=' + JSON.stringify(err));
              console.log('Custom StartupTest onCompletedCallback end, publish msg, data=' + JSON.stringify(data));
            })
          }, 500);
        }
        let startupListener: StartupListener = {
          'onCompleted': onCompletedCallback
        }
        let config: StartupConfig = {
          'timeoutMs': 5000,
          'startupListener': startupListener
        }
        startupManager.run(['Sample_004'], config);
      }
    }, 1500);
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility7', '%{public}s', 'Ability onBackground');
  }
}
