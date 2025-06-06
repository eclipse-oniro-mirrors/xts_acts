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
import {BusinessError} from '@ohos.base';
import { AbilityConstant} from '@kit.AbilityKit';

let subscriber:commonEventManager.CommonEventSubscriber | undefined = undefined;
let uiContext:common.UIAbilityContext | undefined = undefined;
let startupSampleInit:boolean = false;
let startupDefaultConfig:boolean = false;
let onAbiltiyDestory = false;
let keepAlive = false;
let customConfig = true;

export default class SingleStartAbility extends UIAbility {

  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest SingleStartAbility', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest SingleStartAbility keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest SingleStartAbility customConfig = true');
      customConfig = false;
    }

    uiContext = this.context;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupSample_001', 'StartupTestDefaultConfig'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest SingleStartAbility createSubscriber success');
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest SingleStartAbility receive event, data = ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'StartupSample_001') {
          startupSampleInit = true;
          let msg = '';
          if (customConfig) {
            msg = '自定义配置config StartupSample_001加载完毕';
          } else {
            msg = '默认配置 StartupSample_001加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              'msg': msg
            }
          },()=>{
            console.info('StartupTest SingleStartAbility send msg');
          })
        }
        if (event === 'StartupTestDefaultConfig') {
          startupDefaultConfig = true;
          let msg = '';
          if (customConfig) {
            msg = '自定义配置config 配置监听到测试框架加载完毕';
          } else {
            msg = '默认配置监听到测试框架加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              'msg':msg
            }
          },()=>{
            console.info('StartupTest SingleStartAbility send msg');
          })
        }
        if (startupSampleInit && startupDefaultConfig) {
          console.info('StartupTest SingleStartAbility terminateSelfWithResult , result = true');
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'startResult': true
                  }
                }
              })
            }, 2000);
          }
        }
      })
    }).catch((error: BusinessError)=>{
      console.info('StartupTest SingleStartAbility createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest SingleStartAbility ', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest SingleStartAbility unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest SingleStartAbility ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest SingleStartAbility ', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest SingleStartAbility ', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground(){
    // Ability has brought to foreground
    hilog.info(0x0000, 'StartupTest SingleStartAbility ', '%{public}s', 'Ability onForeground');
    console.log('StartupTest startupManager run');
    setTimeout(()=>{
      if (!customConfig) {
        console.log('StartupTest SingleStartAbility startupManager run with defaultConfig');
        startupManager.run(['Sample_001']);
      } else {
        console.log('Custom StartupTest SingleStartAbility startupManager run with custom Config');
        let onCompletedCallback = (error: BusinessError) => {
          let initValue1:string = AppStorage.get('Sample_001_init') as string;
          if (initValue1 == 'Sample_001_init') {
            console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_001', (err, data)=>{
              console.log('StartupTest Sample_001 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_001 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest SingleStartAbility startupManager AppStorage.get error');
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
    hilog.info(0x0000, 'StartupTest SingleStartAbility ', '%{public}s', 'Ability onBackground');
  }
}
