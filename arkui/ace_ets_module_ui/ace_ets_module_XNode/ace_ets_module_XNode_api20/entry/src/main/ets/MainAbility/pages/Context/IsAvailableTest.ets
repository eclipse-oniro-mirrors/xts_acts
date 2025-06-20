/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct IsAvailableIndex {
  @State isAvailable1: string = '5';
  @State isAvailable2: string = '5';

  build() {
    Column() {
      Button('test isAvailable')
        .id('btn_isAvailable')
        .onClick(() => {
          const uiContext1 = this.getUIContext();
          const uiContext2 = new UIContext();
          console.log(`jerry uiContext1.isAvailable=${uiContext1.isAvailable()}`);
          console.log(`jerry uicontext2.isAvailable=${uiContext2.isAvailable()}`);
          this.isAvailable1 = uiContext1.isAvailable() + '';
          this.isAvailable2 = uiContext2.isAvailable() + '';
        })
      Text(`${this.isAvailable1}`).height('5%').id('isAvailable1_id')
      Text(`${this.isAvailable2}`).height('5%').id('isAvailable2_id')
    }
    .height('100%')
  }
}