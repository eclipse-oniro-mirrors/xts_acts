/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility extends Ability {

  onCreate(want, launchParam) {
    console.log("MainAbility3 onCreate")
  }

  onDestroy() {
    console.log("MainAbility3 onDestroy")
  }

  onWindowStageCreate(windowStage) {
    console.log("MainAbility3 onWindowStageCreate")
    globalThis.abilityContext3 = this.context
    windowStage.setUIContent(this.context, "pages/index/second", null)
  }

  onWindowStageDestroy() {
    console.log("MainAbility3 onWindowStageDestroy")
  }

  onForeground() {
    console.log("MainAbility3 onForeground");
    let sendMessageTime = 1000;
    setTimeout(()=>{
      globalThis.abilityContext3.terminateSelfWithResult(
        {
          resultCode:1,
          want:{
            action:'ACTION'
          }
        }, (err, data) => {
          console.info("MainAbility3====>terminateSelfWithResult succese err====>" + JSON.stringify(err));
          console.info("MainAbility3====>terminateSelfWithResult succese data====>" + JSON.stringify(data));
        });
      console.info("MainAbility3====>terminateSelf end====>");
    }, sendMessageTime);
  }

  onBackground() {
    console.log("MainAbility3 onBackground")
  }
};
