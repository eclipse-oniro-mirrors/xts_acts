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

let subscriber = undefined;
let uiContext:common.UIAbilityContext = undefined;
let startupSampleComp:boolean = false;
let startupDefaultConfig:boolean = false;
let onAbiltiyDestory = false;
let keepAlive = false;
let customConfig = true;

export default class SingleStartAbility2 extends UIAbility {

  onCreate(want:Want, launchParam){
    hilog.info(0x0000, 'StartupTest SingleStartAbility2', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters.keepAlive) {
      console.info('StartupTest SingleStartAbility2 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters.defaultConfig) {
      console.info('StartupTest SingleStartAbility defaultConfig = true');
      customConfig = false;
    }

    uiContext = this.context;
    let subscribeInfo = {
      events: ['StartupSample_001', 'StartupTestDefaultConfig', 'StartupSample_001_onDependencyCompleted'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest SingleStartAbility2 createSubscriber success')
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest SingleStartAbility2 receive event, data = ' + JSON.stringify(data))
        let event = data.event;
        if (event === 'StartupSample_001_onDependencyCompleted') {
          startupSampleComp = true;
        }
        if (event === 'StartupTestDefaultConfig') {
          startupDefaultConfig = true;
          let msg = '';
          if (customConfig) {
            msg = '自定义config 配置监听到测试框架加载完毕';
          } else {
            msg = '配置监听到测试框架加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              'msg':msg
            }
          },()=>{
            console.info('StartupTest SingleStartAbility2 send msg');
          })
        }
        if (startupDefaultConfig) {
          console.info('StartupTest SingleStartAbility2 terminateSelfWithResult , result = true');
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'startupDefaultConfig': startupDefaultConfig,
                    'startupSampleComp': startupSampleComp,
                    'startResult': true
                  }
                }
              })
            }, 2000);
          }
        }
      })
    }).catch(error=>{
      console.info('StartupTest SingleStartAbility2 createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest SingleStartAbility2 ', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest SingleStartAbility2 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest SingleStartAbility2 ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest SingleStartAbility2 ', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest SingleStartAbility2 ', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground(){
    // Ability has brought to foreground
    hilog.info(0x0000, 'StartupTest SingleStartAbility2 ' , '%{public}s', 'Ability onForeground');
    setTimeout(()=>{
      console.log('StartupTest SingleStartAbility2 startupManager run Sample_001');
      if (!customConfig) {
        console.log('StartupTest SingleStartAbility2 startupManager run with defaultConfig');
        startupManager.run(['Sample_001']);
      } else {
        console.log('StartupTest SingleStartAbility2 startupManager run with custom Config');
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
          let onDependencyCompletedValue = AppStorage.get('Sample_001_onDependencyCompleted');
          if (onDependencyCompletedValue == 1) {
            commonEventManager.publish('StartupSample_001_onDependencyCompleted', {
              parameters: {
                  'name': onDependencyCompletedValue
              }
              }, (err, data) => {
              console.log('StartupTest Sample_001 onDependencyCompleted, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_001 onDependencyCompleted, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get error');
          }

          console.log('Custom StartupTest MyStartupConfigEntry callback, error=' + JSON.stringify(error));
          if (error) {
            hilog.info(0x000, 'Custom MyStartupConfigEntry TAG ',
              ' onCompletedCallback: %{public}d, mssage: %{public}s', error.code, error.mssage);
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
        startupManager.run(['Sample_001'], config);
      }
    }, 1500);
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest SingleStartAbility2 ', '%{public}s', 'Ability onBackground');
  }
}
