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
@Component
struct ReuseComponentLifecycle {
  @State message: string = 'Hello World';
  @State aaa: boolean = false;
  @State activeMessage: string = '';
  @State inactiveMessage: string = '';

  build() {
    Column() {
      if (this.aaa) {
        ReuseChild({ activeMessage: $activeMessage, inactiveMessage: $inactiveMessage })
      }
      Text(this.message)
        .id('mainText')
        .height('5%')
      Button(`change`)
        .id('changeBtn')
        .onClick(() => {
          this.aaa = !this.aaa;
        })
        .height('5%')
      Text(`Active: ${this.activeMessage}`)
        .id('activeText')
        .height('5%')
      Text(`Inactive: ${this.inactiveMessage}`)
        .id('inactiveText')
        .height('5%')
    }
    .height('100%')
    .width('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

@Reusable
@Component({ freezeWhenInactive: true })
struct ReuseChild {
  @Link activeMessage: string;
  @Link inactiveMessage: string;

  @ComponentActive
  myActive(): void {
    this.activeMessage = 'Active';
  }

  @ComponentInactive
  myInActive(): void {
    this.inactiveMessage = 'Inactive';
  }

  build() {
    Column() {
      Text('Child Component')
        .id('childText')
        .height('5%')
    }
  }
}