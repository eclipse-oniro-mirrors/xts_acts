/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
let keepAlive = false;
let apiResult:number[];
let timeOutNumber = -1;
let sub:commonEventManager.CommonEventSubscriber;

export default class PageAbility103 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility103', '%{public}s', 'Ability onCreate ' + JSON.stringify(want));
    let onCompletedCallback = (error: BusinessError<void>) => {
      if (error) {
        hilog.error(0x0000, 'testTag', 'onCompletedCallback error: %{public}s', JSON.stringify(error));
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': error?.code,
          }
        }
        commonEventManager.publish('Sample_103_init', commonEventData, (err, data)=>{
          console.info('testTag StartupTest Sample_103_init init, publish msg, err=' + JSON.stringify(err));
          console.info('testTag StartupTest Sample_103_init, publish msg, data=' + JSON.stringify(data));
        })
      } else {
        hilog.info(0x0000, 'testTag', 'onCompletedCallback: success.');
      }
    };
    let startupListener: StartupListener = {
      'onCompleted': onCompletedCallback
    };
    let config: StartupConfig = {
      'timeoutMs': 5000,
      'startupListener': startupListener
    };
    try {
      startupManager.run(["Sample_103"], this.context, config).then(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'startupManager.run success');
        commonEventManager.publish('Start_Run_Sample_103', {
          parameters: {
            'result': "success"
          }
        }, (err, data) => {
          console.log('StartupTest Start_Run_Sample_103 end, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Start_Run_Sample_103 end, publish msg, data=' + JSON.stringify(data));
        });
      }).catch((error: BusinessError<void>) => {
        hilog.error(0x0000, 'testTag', 'startupManager.run promise error: %{public}s', JSON.stringify(error));
        commonEventManager.publish('Start_Run_Sample_103', {
          parameters: {
            'result': error?.code
          }
        }, (err, data) => {
          console.log('StartupTest Start_Run_Sample_103 end, publish msg, err=' + JSON.stringify(err));
          console.log('StartupTest Start_Run_Sample_103 end, publish msg, data=' + JSON.stringify(data));
        });
      })
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'startupManager.run catch error: %{public}s', JSON.stringify(error));
      commonEventManager.publish('Start_Run_Sample_103', {
        parameters: {
          'result': error?.code
        }
      }, (err, data) => {
        console.log('StartupTest Start_Run_Sample_103 end, publish msg, err=' + JSON.stringify(err));
        console.log('StartupTest Start_Run_Sample_103 end, publish msg, data=' + JSON.stringify(data));
      });
    }
  }

  onForeground(){
    hilog.info(0x0000, 'StartupTest PageAbility103', '%{public}s', 'Ability onForeground');
    let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ["Sample_103_terminate"]
    };
    commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
      sub = subscriber;
      console.info("PageAbility103 createSubscriber success");
      commonEventManager.subscribe(sub, (err, commonEventData) => {
        console.info("PageAbility103 the erris " + JSON.stringify(err))
        console.info("PageAbility103 the data " + JSON.stringify(commonEventData))
        this.context.terminateSelf();
        commonEventManager.unsubscribe(subscriber, (err, data) => {
        });
      });
    });
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility103', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility103', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility103', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility103', '%{public}s', 'Ability onBackground');
  }
}
