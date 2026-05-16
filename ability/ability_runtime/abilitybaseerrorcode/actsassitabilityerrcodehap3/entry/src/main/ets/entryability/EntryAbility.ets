/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import wantConstant from '@ohos.app.ability.wantConstant';
import { fileUri } from '@kit.CoreFileKit';

import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';

let callerRequestCode:string;
let casezz:string = "";
let tag:string = "";

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('onCreate');

    callerRequestCode = want?.parameters?.[wantConstant.Params.CALLER_REQUEST_CODE] as string;
    casezz = want?.parameters?.case as string;
    tag = want?.parameters?.caseName as string;
    console.info("the callerRequestCode is " + callerRequestCode  + casezz + ".." + tag);
  
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    console.info('Ability onForeground');

     if (casezz == 'start16000075') {
      let uri = "";
      let path = this.context!.filesDir;
      try {
        uri = fileUri.getUriFromPath(path + "text.txt");
        console.info("uri is " + uri);
      } catch (e) {
        console.info("the getUriFromPath eroor" + e)
      }
      let resultCode = 101;
      let abilityResult :common.AbilityResult = {
        want:{
          bundleName:"com.acts.ability.errcode",
          abilityName:"EntryAbility",
          uri:uri,
          flags:wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION
        },
        resultCode,
      }

      try {

        this.context.backToCallerAbilityWithResult(abilityResult, callerRequestCode).then(() => {
          console.info('TAG backToCallerAbilityWithResult succeed');

        }).catch((err: BusinessError) => {
          console.error(`backToCallerAbilityWithResult1 failed, code is ${err.code}, message is ${err.message}`);

          let commonEventData: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': err?.code,
            }
          }
          commonEventManager.publish(tag, commonEventData, (result) => {
            console.info("common event success " + result);
          });


        });
      } catch (err) {
        console.error( `backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);

      };

    }

  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}