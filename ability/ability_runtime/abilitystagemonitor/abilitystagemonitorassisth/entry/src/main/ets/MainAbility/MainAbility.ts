/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    console.info('MainAbility7Monitor onCreate')
  }

  onDestroy() {
    console.info('MainAbility7Monitor onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.info('MainAbility7Monitor onWindowStageCreate')
    windowStage.setUIContent(this.context, 'MainAbility/pages/index', null)

    globalThis.abilityContext = this.context;
  }

  onWindowStageDestroy() {
    console.info('MainAbility7Monitor onWindowStageDestroy')
  }

  onForeground() {
    console.info('MainAbility7Monitor onForeground')
    setTimeout(() => {
      this.context.terminateSelf()
    }, 500)
  }

  onBackground() {
    console.info('MainAbility7Monitor onBackground')
  }
};