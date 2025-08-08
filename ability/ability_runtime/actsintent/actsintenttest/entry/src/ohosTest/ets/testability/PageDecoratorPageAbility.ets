/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { UIAbility } from '@kit.AbilityKit';

export default class PageDecoratorPageAbility extends UIAbility {

  onCreate(): void {
    console.log('PageDecoratorPageAbility onCreate')
  }

  onDestroy() {
    hilog.info(0x0000, 'PageDecoratorPageAbility', '%{public}s', 'PageDecoratorPageAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'PageDecoratorPageAbility', '%{public}s', 'PageDecoratorPageAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/PageDecoratorPage', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'PageDecoratorPageAbility', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        AppStorage.setAndProp('InsightIntentLinkFlag', false)
        return;
      }
      AppStorage.setAndProp('InsightIntentPageFlag', true)
      console.log('PageDecoratorPageAbility' + AppStorage.get('InsightIntentPageFlag'))
      hilog.info(0x0000, 'PageDecoratorPageAbility', 'PageDecoratorPageAbility Succeeded in loading the content.');
    });
  }
}