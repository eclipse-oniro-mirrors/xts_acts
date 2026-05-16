/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default class StartAbility extends Ability {
  onCreate(want, launchParam) {
    console.log('StartAbility onCreate')
  }

  onDestroy() {
    console.log('StartAbility onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.log('StartAbility onWindowStageCreate')
    windowStage.loadContent("MainAbility/pages/index/second", (err) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
    });

    AppStorage.setOrCreate('windowStageStart',windowStage);
    AppStorage.setOrCreate('contextStart', this.context)
  }

  onWindowStageDestroy() {
    console.log('StartAbility onWindowStageDestroy')
  }

  onForeground() {
    console.log('StartAbility onForeground')
  }

  onBackground() {
    console.log('StartAbility onBackground')
  }
};