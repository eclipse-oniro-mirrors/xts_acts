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

import { ComponentActive, ComponentInactive } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ReuseV2ComponentLifecycle {
  @Local message: string = 'Hello World';
  @Local aaa: boolean = true;
  @Local activeMessage: string = '';
  @Local inactiveMessage: string = '';

  build() {
    Column() {
      if (this.aaa) {
        ReuseV2Child()
      }
      Text(this.message)
        .id('mainTextV2')
        .height('5%')
      Button(`change`)
        .id('changeBtnV2')
        .onClick(() => {
          this.aaa = !this.aaa;
        })
        .height('5%')

    }
    .height('100%')
    .width('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

@ReusableV2
@ComponentV2({ freezeWhenInactive: true })
struct ReuseV2Child {
  @Local activeMessage: string = '';
  @Local inactiveMessage: string = '';

  @ComponentActive
  myActive(): void {
    this.activeMessage = 'Active';
    AppStorage.setOrCreate<string>('ReuseV2ActiveKey', 'Active');
  }

  @ComponentInactive
  myInActive(): void {
    this.inactiveMessage = 'Inactive';
    AppStorage.setOrCreate<string>('ReuseV2InactiveKey', 'Inactive');
  }

  build() {
    Column() {
      Text('Child Component V2')
        .id('childTextV2')
        .height('5%')
    }
  }
}