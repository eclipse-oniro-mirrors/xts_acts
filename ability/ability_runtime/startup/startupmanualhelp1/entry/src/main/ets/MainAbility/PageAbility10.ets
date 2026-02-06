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
let uiContext: common.UIAbilityContext| undefined = undefined;
let keepAlive = false;
let type: number = 0;
// 0 undefined
// 1 c
// 2 []
// 3 {}
// 4 第一个参数为不存在的启动框架 Sample_100

export default class PageAbility10 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility10', '%{public}s', 'Ability onCreate');

    if (want.parameters && want.parameters?.keepAlive) {
      console.info('StartupTest PageAbility10 keepAlive = true');
      keepAlive = true;
    }
    type = want.parameters?.type as number;
    uiContext = this.context;
  }

  onForeground(){
    hilog.info(0x0000, 'StartupTest PageAbility10', '%{public}s', 'Ability onForeground');
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['StartupTestDefaultConfig'],
    };
    setTimeout(()=>{
      commonEventManager.createSubscriber(subscribeInfo).then(data => {
        console.info('StartupTest PageAbility10 createSubscriber success');
        subscriber = data;
        commonEventManager.subscribe(subscriber, (err, data) => {
          console.info('StartupTest PageAbility10 receive event, data = ' + JSON.stringify(data));
          let event = data.event;
        })
        console.log('StartupTest PageAbility10 startupManager run');
        let startParams: ESObject;
        if (type == 0) {
          startParams = undefined;
        }
        if (type == 1) {
          startParams = null;
        }
        if (type == 2) {
          startParams = [];
        }
        if (type == 3) {
          startParams = {};
        }
        if (type == 4) {
          startParams = 'Sample_100';
        }
        try {
          startupManager.run(startParams).then(() => {
            console.log('StartupTest PageAbility10 startupManager run then, startParams = ' +
              JSON.stringify(startParams));
            commonEventManager.publish('show_msg', {
              parameters: {
                msg: 'StartupTest PageAbility10 run undefined then call, startParams = ' + JSON.stringify(startParams)
              }
            }, () => {
              console.info('StartupTest PageAbility10 send msg');
            })
          }).catch((error:BusinessError) => {
            console.info('StartupTest PageAbility10 promise catch error, error = ' + JSON.stringify(error));
            console.info('StartupTest PageAbility10 promise catch error, startParams = ' +
              JSON.stringify(startParams));
          })
        } catch (error) {
          let errmsg = JSON.stringify(error)
          let errCode: number = error.code
          console.log('StartupTest PageAbility10 catch error , errCode= ' + errCode);
          console.log('StartupTest PageAbility10 catch error ,error= ' + errmsg);
          commonEventManager.publish('show_msg', {
            parameters: {
              msg: 'StartupTest PageAbility10 run undefined with error, error = ' + errmsg + ', startParams = ' +
                JSON.stringify(startParams)
            }
          }, () => {
            console.info('StartupTest PageAbility10 send msg');
          })
          if (!keepAlive) {
            setTimeout(()=>{
              uiContext?.terminateSelfWithResult({
                resultCode: 0,
                want:{
                  parameters:{
                    code: errCode
                  }
                }
              })
            }, 2000)
          }
        }
      })
    }, 1500)
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onDestroy');
    if (subscriber) {
      console.info('StartupTest PageAbility10 unsubscribe');
      commonEventManager.unsubscribe(subscriber)
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility10', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility10', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility10', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility10', '%{public}s', 'Ability onBackground');
  }
}
