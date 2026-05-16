'use static'
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Button,
  ClickEvent,
  Row,
  Column,
  TabsController,
  Tabs,
  TabContent,
  BarPosition,
  BarMode,
  TabsAnimationEvent,
  AttributeModifier,
  TabsAttribute,
  Text
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyTabsAttributeModifier implements AttributeModifier<TabsAttribute> {
  public isChange: boolean = false;
  public textLabel: string = 'undefined onChange';
  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isChange) {
      instance.onChange((index: int) => {
        this.textLabel = 'onChange successfully';
      })
    } else {
      instance.onChange(undefined)
    }
  }
}

@Entry
@Component
struct tabsOnChangeModifierTest {
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()
  @State isScrollable: boolean = true;
  @State modifier: MyTabsAttributeModifier = new MyTabsAttributeModifier();

  build() {
    Column() {
      Text(this.modifier.textLabel)
        .id('textOnChangeModifier')
      Column() {
        Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }.tabBar('green')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          }.tabBar('blue')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFBF00')
          }.tabBar('yellow')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#E67C92')
          }.tabBar('pink')
        }
        .vertical(false)
        .barMode(BarMode.Scrollable)
        .barWidth(360)
        .barHeight(56)
        .scrollable(this.isScrollable)
        .animationDuration(500)
        .id('tabsOnChangeModifier')
        .attributeModifier(this.modifier)
        .height('100%')
        .width('100%')

        Button('点击切换Undefined').id('buttonOnChangeModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}