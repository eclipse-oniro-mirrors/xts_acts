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
let uiContext: common.UIAbilityContext|undefined = undefined;
let keepAlive = false;
let apiResult:number[];
let timeOutNumber = -1;

export default class PageAbility102 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'StartupTest PageAbility102', '%{public}s', 'Ability onCreate');
    uiContext = this.context;
    apiResult = [];
  }

  onForeground(){
    hilog.info(0x0000, 'StartupTest PageAbility102', '%{public}s', 'Ability onForeground');

    try {
      startupManager.run(['Sample_102']).then(() => {
        console.info('StartupTest startupManager run then, startParams = ');
      }).catch((error: BusinessError) => {
        console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
        // 错误码返回
        setTimeout(()=> {
          apiResult.push(error.code)
        }, 1500)
      })

    } catch(err) {
      // 处理入参错误异常
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`startAbility startupManager, code is ${code}, message is ${message}`);
    }
    if (!keepAlive) {
      timeOutNumber = setTimeout(()=>{
        if (!keepAlive) {
          hilog.info(0x0000, 'StartupTest PageAbility102', '%{public}s', ' query api timeout');
          uiContext?.terminateSelfWithResult({
            resultCode: 0,
            want:{
              parameters:{
                'apiResult': apiResult
              }
            }
          })
        }
      }, 10000)
    }
  }

  onDestroy(){
    hilog.info(0x0000, 'StartupTest', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage){
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility102', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest PageAbility102', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest PageAbility102', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onBackground(){
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility102', '%{public}s', 'Ability onBackground');
  }
}
