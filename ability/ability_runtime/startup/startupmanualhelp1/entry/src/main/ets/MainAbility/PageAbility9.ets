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
let customConfig = false;

export default class PageAbility9 extends UIAbility {
  onCreate(want:Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility9', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility9 keepAlive = true');
      keepAlive = true;
    }
    if (want.parameters && want.parameters?.customConfig) {
      console.info('StartupTest PageAbility9 customConfig = true');
      customConfig = true;
    }

    uiContext = this.context;

    console.log('StartupTest startupManager run');
    setTimeout(()=>{
      if (!customConfig) {
        startupManager.run(['Sample_017']).then(()=>{
          let result = startupManager.isStartupTaskInitialized('Sample_017');
          console.info(
            '默认配置 StartupTest PageAbility9 Sample_017 线程等待收到加载完毕，查询加载结果 result = ' + result);
          commonEventManager.publish('show_msg', {
            parameters:{
              msg: '默认配置 线程等待收到加载完毕，查询加载结果 result = ' + result
            }
          },()=>{
            console.info('StartupTest PageAbility9 send msg');
          })
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'result': result
                  }
                }
              })
            }, 2000)
          }
        })
      } else {
        let onCompletedCallback = (error: BusinessError) => {
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
        startupManager.run(['Sample_017'], config).then(()=>{
          let result = startupManager.isStartupTaskInitialized('Sample_017');
          console.info('StartupTest PageAbility9 Sample_017 线程等待收到加载完毕，查询加载结果 result = ' + result);
          commonEventManager.publish('show_msg', {
            parameters:{
              msg: '自定义配置 线程等待收到加载完毕，查询加载结果 result = ' + result
            }
          },()=>{
            console.info('StartupTest PageAbility9 send msg');
          })
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    'result': result
                  }
                }
              })
            }, 2000);
          }
        })
      }
    }, 1500);
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest PageAbility9', '%{public}s', 'Ability onDestroy');
    onAbiltiyDestory = true;
    if (subscriber) {
      console.info('StartupTest PageAbility9 unsubscribe');
      commonEventManager.unsubscribe(subscriber);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility9', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility9', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility9', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground(){
    hilog.info(0x0000, 'StartupTest PageAbility9', '%{public}s', 'Ability onForeground');
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility9', '%{public}s', 'Ability onBackground');
  }
}
