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
let hasInit001:boolean = false;
let hasInit003:boolean = false;
let onAbiltiyDestory = false;
let keepAlive = false;
let customConfig = false;

export default class PageAbility6 extends UIAbility {

  // Sample_002 -> Sample_003 -> Sample_001
  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility6 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest PageAbility6 customConfig = true');
      customConfig = true;
    }

    uiContext = this.context;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupSample_002_onDependencyCompleted', 'StartupSample_003_onDependencyCompleted'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest PageAbility6 createSubscriber success');
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest PageAbility6 receive event, data = ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'StartupSample_003_onDependencyCompleted') {
          if (data.parameters?.name == 'Sample_001') {
            hasInit001 = true;
          }
          let message: string;
          if (!customConfig) {
            message = '默认配置 Sample_003收到StartupSample_001加载完毕';
          } else {
            message = '自定义配置 Sample_003收到StartupSample_001加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility6 send msg');
          })
        }
        if (event === 'StartupSample_002_onDependencyCompleted') {
          if (data.parameters?.name == 'Sample_003') {
            hasInit003 = true;
          }
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_002收到Sample_003加载完毕';
          } else {
            message = '自定义配置 StartupSample_002收到Sample_003加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility6 send msg');
          })
        }
        if (hasInit001 && hasInit003) {
          console.info('StartupTest PageAbility6 terminateSelfWithResult , result = true');
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'hasInit001': hasInit001,
                    'hasInit003':hasInit003
                  }
                }
              })
            }, 2000)
          }
        }
      })
    }).catch((error: BusinessError)=>{
      console.info('StartupTest PageAbility6 createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest PageAbility6 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility6',
          'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility6 onBackground',
        'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(){
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(){
    // Ability has brought to foreground
    // Sample_002 -> Sample_003 -> Sample_001
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onForeground');
    console.log('StartupTest startupManager run');
    setTimeout(()=>{
      if (customConfig) {
        console.log('StartupTest PageAbility6 startupManager run defaultConfig');
        startupManager.run(['Sample_002']);
      } else {
        console.log('StartupTest PageAbility6 startupManager run with custom Config');
        let onCompletedCallback = (error: BusinessError) => {
          let initValue2: string= AppStorage.get('Sample_002_onDependencyCompleted') as string;
          if (initValue2 == 'Sample_003') {
            console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get success ' + initValue2);
            commonEventManager.publish('StartupSample_002_onDependencyCompleted', {
              parameters: {
                'name': initValue2
              }
            }, (err, data) => {
              console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_002 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get error');
          }
          let initValue3: string = AppStorage.get('Sample_003_onDependencyCompleted') as string;
          if (initValue3 == 'Sample_001') {
            console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get success ' + initValue3);
            commonEventManager.publish('StartupSample_003_onDependencyCompleted', {
              parameters: {
                'name': initValue3
              }
            }, (err, data) => {
              console.log('StartupTest Sample_003 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_003 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility6 startupManager AppStorage.get error');
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
        startupManager.run(['Sample_002'], config);
      }
    }, 1500);
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility6', '%{public}s', 'Ability onBackground');
  }
}
