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
let startupSampleInit12:boolean = false;
let startupSampleInit13:boolean = false;
let startupSampleInit14:boolean = false;
let startupSampleInit15:boolean = false;
let startupDefaultConfig:boolean = false;
let onAbiltiyDestory = false;
let keepAlive = false;
let startOrder:string[][] = [];
let customConfig = false;

export default class PageAbility5 extends UIAbility {

  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility5', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility5 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest PageAbility5 customConfig = true');
      customConfig = true;
    }

    uiContext = this.context;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupSample_012', 'StartupSample_013', 'StartupSample_014',
      'StartupSample_015', 'StartupTestDefaultConfig'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest PageAbility5 createSubscriber success');
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest PageAbility5 receive event, data = ' + JSON.stringify(data))
        let event = data.event;
        if (event === 'StartupSample_012') {
          startupSampleInit12 = true;
          startOrder.push(['startupSampleInit12']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_012加载完毕';
          } else {
            message = '自定义配置 StartupSample_012加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility5 send msg');
          })
        }
        if (event === 'StartupSample_013') {
          startupSampleInit13 = true;
          startOrder.push(['startupSampleInit13'])
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_013加载完毕';
          } else {
            message = '自定义配置 StartupSample_013加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility5 send msg');
          })
        }
        if (event === 'StartupSample_014') {
          startupSampleInit14 = true;
          startOrder.push(['startupSampleInit14']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_014加载完毕';
          } else {
            message = '自定义配置 StartupSample_014加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility5 send msg');
          })
        }
        if (event === 'StartupSample_015') {
          startupSampleInit15 = true;
          startOrder.push(['startupSampleInit15']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_015加载完毕';
          } else {
            message = '自定义配置 StartupSample_015加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility5 send msg')
          })
        }
        if (event === 'StartupTestDefaultConfig') {
          startupDefaultConfig = true;
          let message: string;
          if (!customConfig) {
            message = '默认配置 配置监听到测试框架加载完毕';
          } else {
            message = '自定义配置 配置监听到测试框架加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility5 send msg');
          })
          console.info('StartupTest PageAbility5 terminateSelfWithResult , result = true');
          if (!keepAlive) {
            let startResult = false;
            if (startupSampleInit12 || startupSampleInit13 || startupSampleInit14 || startupSampleInit15) {
              startResult = true;
            }
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'startResult': startResult,
                    'startOrder': startOrder,
                    'code' :data.parameters?.error.code // 28800002
                  }
                }
              })
            }, 2000)
          }
        }
      })
    }).catch((error: BusinessError)=>{
      console.info('StartupTest PageAbility5 createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest PageAbility5 ', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest PageAbility5 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility5 ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility5 ', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility5 ', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(){
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(){
    // Ability has brought to foreground
    // Sample_012 -> Sample_013 -> Sample_014 -> Sample_015
    //            -> Sample_015 -> Sample_013
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onForeground');
    console.log('StartupTest startupManager run');
    setTimeout(()=>{
      if (customConfig) {
        console.log('StartupTest PageAbility5 startupManager run defaultConfig');
        try {
          startupManager.run(['Sample_012']);
        }catch(error){
          console.log('StartupTest startupManager run error: catch error = ' + JSON.stringify(error));
        }
      } else {
        console.log('StartupTest PageAbility5 startupManager run with custom Config');
        let onCompletedCallback = (error: BusinessError) => {
          let initValue13: string = AppStorage.get('Sample_013_init') as string;
          if (initValue13 == 'Sample_013_init') {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_013', (err, data)=>{
              console.log('StartupTest Sample_013 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_013 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
          }
          let initValue14: string = AppStorage.get('Sample_014_init') as string;
          if (initValue14 == 'Sample_014_init') {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_014', (err, data)=>{
              console.log('StartupTest Sample_014 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_014 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
          }
          let initValue15: string = AppStorage.get('Sample_015_init') as string;
          if (initValue15 == 'Sample_015_init') {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_015', (err, data)=>{
              console.log('StartupTest Sample_015 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_015 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility5 startupManager AppStorage.get error');
          }
          let initValue12: string = AppStorage.get('Sample_012_init') as string;
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
          }, 500)
        }
        let startupListener: StartupListener = {
          'onCompleted': onCompletedCallback
        }
        let config: StartupConfig = {
          'timeoutMs': 5000,
          'startupListener': startupListener
        }
        try {
          startupManager.run(['Sample_012'], config);
        }catch(error){
          console.log('StartupTest startupManager run error: catch error = ' + JSON.stringify(error));
        }
      }
    }, 1500);
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onBackground');
  }
}
