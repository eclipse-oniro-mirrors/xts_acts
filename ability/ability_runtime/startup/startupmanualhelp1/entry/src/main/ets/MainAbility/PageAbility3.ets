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
let startupSampleInit1:boolean = false;
let startupSampleInit4:boolean = false;
let startupSampleInit5:boolean = false;
let startupSampleInit6:boolean = false;
let startupSampleInit7:boolean = false;
let startupSampleInit8:boolean = false;
let startupDefaultConfig:boolean = false;
let onAbiltiyDestory = false;
let keepAlive = false;
let startOrder:string[][] = [];
let customConfig = false;

export default class PageAbility3 extends UIAbility {

  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility3', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility3 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest PageAbility3 customConfig = true');
      customConfig = true;
    }

    uiContext = this.context;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupSample_001', 'StartupSample_004', 'StartupSample_005', 'StartupSample_006',
        'StartupSample_007', 'StartupSample_008', 'StartupTestDefaultConfig'],
    };
    commonEventManager.createSubscriber(subscribeInfo).then(data => {
      console.info('StartupTest PageAbility3 createSubscriber success');
      subscriber = data;
      commonEventManager.subscribe(subscriber, (err, data)=>{
        console.info('StartupTest PageAbility3 receive event, data = ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'StartupSample_001') {
          startupSampleInit1 = true;
          startOrder.push(['startupSampleInit1']);
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:'StartupSample_001加载完毕'
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupSample_004') {
          startupSampleInit4 = true;
          startOrder.push(['startupSampleInit4']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_004加载完毕';
          } else {
            message = '自定义配置 StartupSample_004加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupSample_005') {
          startupSampleInit5 = true;
          startOrder.push(['startupSampleInit5']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_005加载完毕';
          } else {
            message = '自定义配置 StartupSample_005加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupSample_006') {
          startupSampleInit6 = true;
          startOrder.push(['startupSampleInit6']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_006加载完毕';
          } else {
            message = '自定义配置 StartupSample_006加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupSample_007') {
          startupSampleInit7 = true;
          startOrder.push(['startupSampleInit7']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_007加载完毕';
          } else {
            message = '自定义配置 StartupSample_007加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupSample_008') {
          startupSampleInit8 = true;
          startOrder.push(['startupSampleInit8']);
          let message: string;
          if (!customConfig) {
            message = '默认配置 StartupSample_008加载完毕';
          } else {
            message = '自定义配置 StartupSample_008加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (event === 'StartupTestDefaultConfig') {
          startupDefaultConfig = true;
          let message: string;
          if (!customConfig) {
            message = '默认配置 监听到测试框架加载完毕';
          } else {
            message = '自定义配置 监听到测试框架加载完毕';
          }
          commonEventManager.publish('show_msg', {
            parameters:{
              msg:message
            }
          },()=>{
            console.info('StartupTest PageAbility3 send msg');
          })
        }
        if (startupSampleInit1 &&
            startupSampleInit4 &&
            startupSampleInit5 &&
            startupSampleInit6 &&
            startupSampleInit7 &&
            startupSampleInit8 &&
            startupDefaultConfig) {
          console.info('StartupTest PageAbility3 terminateSelfWithResult , result = true');
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
      console.info('StartupTest PageAbility3 createSubscriber failed, error=' + JSON.stringify(error));
    })
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest PageAbility3 ', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest PageAbility3 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility3 ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(){
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'StartupTest PageAbility3 ', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(){
    // Ability has brought to foreground
    // Sample_004 -> Sample_005 -> Sample_006
    //            -> Sample_007 -> Sample_008
    //                          -> Sample_001
    hilog.info(0x0000, 'StartupTest PageAbility3 ', '%{public}s', 'Ability onForeground');
    console.log('StartupTest startupManager run')
    setTimeout(()=>{
      if (customConfig) {
        console.log('StartupTest PageAbility3 startupManager run defaultConfig');
        startupManager.run(['Sample_004']);
      } else {
        console.log('StartupTest PageAbility3 startupManager run with custom Config');
        let onCompletedCallback = (error: BusinessError) => {
          let initValue1: string = AppStorage.get('Sample_001_init') as string;
          if (initValue1 == 'Sample_001_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_001', (err, data)=>{
              console.log('StartupTest Sample_001 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_001 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
          }
          let initValue8: string = AppStorage.get('Sample_008_init') as string;
          if (initValue8 == 'Sample_008_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_008', (err, data)=>{
              console.log('StartupTest Sample_008 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_008 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
          }
          let initValue6: string = AppStorage.get('Sample_006_init') as string;
          if (initValue6 == 'Sample_006_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_006', (err, data)=>{
              console.log('StartupTest Sample_006 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_006 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
          }
          let initValue5: string = AppStorage.get('Sample_005_init') as string;
          if (initValue5 == 'Sample_005_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_005', (err, data)=>{
              console.log('StartupTest Sample_005 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_005 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
          }
          let initValue7: string = AppStorage.get('Sample_007_init') as string;
          if (initValue7 == 'Sample_007_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_007', (err, data)=>{
              console.log('StartupTest Sample_007 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_007 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
          }
          let initValue4: string = AppStorage.get('Sample_004_init') as string;
          if (initValue4 == 'Sample_004_init') {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get success');
            commonEventManager.publish('StartupSample_004', (err, data)=>{
              console.log('StartupTest Sample_004 init, publish msg, err=' + JSON.stringify(err));
              console.log('StartupTest Sample_004 init, publish msg, data=' + JSON.stringify(data));
            })
          } else {
            console.log('Custom StartupTest PageAbility3 startupManager AppStorage.get error');
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
        startupManager.run(['Sample_004'], config);
      }
    }, 1500)
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility3 ', '%{public}s', 'Ability onBackground');
  }
}
