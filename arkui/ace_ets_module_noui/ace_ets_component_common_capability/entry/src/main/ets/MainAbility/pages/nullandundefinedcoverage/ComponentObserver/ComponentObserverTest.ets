/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { inspector } from '@kit.ArkUI';

@Entry
@Component
struct ComponentObserverTest {
  private listener: inspector.ComponentObserver = inspector.createComponentObserver('observer_id');

  build() {
    Column() {
      Text('ComponentObserver Test')
        .id('observer_text')
        .fontSize(30)
        .margin({ top: '5%' })

      Button('off_drawChildren_null_type')
        .id('observer_off_drawChildren_null_type')
        .onClick(() => {
          try {
            this.listener.off('drawChildren', null);
          } catch (err) {
            console.error('off drawChildren null type error: ' + JSON.stringify(err));
          }
        })

      Button('off_drawChildren_undefined_type')
        .id('observer_off_drawChildren_undefined_type')
        .onClick(() => {
          try {
            this.listener.off('drawChildren', undefined);
          } catch (err) {
            console.error('off drawChildren undefined type error: ' + JSON.stringify(err));
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
