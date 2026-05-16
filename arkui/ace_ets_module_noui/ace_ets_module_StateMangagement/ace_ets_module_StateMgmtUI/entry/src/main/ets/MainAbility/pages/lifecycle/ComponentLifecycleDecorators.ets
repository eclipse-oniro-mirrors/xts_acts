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

import { ComponentActive, ComponentInactive } from '@kit.ArkUI'

@Entry
@Component
struct ComponentLifecycleDecorators {
  @State activeText: string = '';
  @State inactiveText: string = '';
  @State data: Array<string> = [];
  private scroller: Scroller = new Scroller();

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.push(`Item${i}`);
    }
  }

  build() {
    Column({ space: 3 }) {
      Text(`Active: ${this.activeText}`)
        .id('activeText')
        .height('5%')

      Text(`Inactive: ${this.inactiveText}`)
        .id('inactiveText')
        .height('5%')
      Button('scrollToIndex6')
        .id('scrollToIndexBtn')
        .height('5%')
        .onClick(() => {
          this.scroller.scrollToIndex(6);
        })
      List({ space: 3, scroller: this.scroller }) {
        Repeat(this.data)
          .each((repeatItem: RepeatItem<string>) => {
            ListItem() {
              Column() {
                LifecycleChild({
                  index: repeatItem.item,
                  item: repeatItem.item,
                  activeText: $activeText,
                  inactiveText: $inactiveText
                })
                  .height('100%')
              }
            }
          })
          .key((item: string) => item)
      }.cachedCount(0)
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}

@Component({ freezeWhenInactive: true })
struct LifecycleChild {
  @Prop index: string = '';
  @Prop item: string = '';
  @Link activeText: string;
  @Link inactiveText: string;

  @ComponentActive
  myActive(): void {
    this.activeText = 'Active' + this.index;
    AppStorage.setOrCreate<string>('ComponentActiveKey', 'Active' + this.index);
  }

  @ComponentInactive
  myInactive(): void {
    this.inactiveText = 'Inactive' + this.index;
    AppStorage.setOrCreate<string>('ComponentInactiveKey', 'Inactive' + this.index);
  }

  build() {
    Column() {
      Text(`Item ${this.item}`)
        .id('childText_' + this.index)
    }
  }
}
