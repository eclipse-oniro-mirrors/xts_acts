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
  Text,
  TabContent,
  BarPosition,
  BarMode,
  OnTabsGestureSwipeCallback,
  TabsAnimationEvent,
  AttributeModifier,
  TabsAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyTabsAttributeModifier implements AttributeModifier<TabsAttribute> {
  public isChange: boolean = false;
  public textLabel: string = 'undefined onGestureSwipe';
  private onSwipe: OnTabsGestureSwipeCallback = (index: int, extraInfo: TabsAnimationEvent) => {
    this.textLabel = 'onGestureSwipe successfully';
    console.log(`✅ 触发了滑动中：当前索引=${index}`);
    // 直接访问系统类型的属性，无类型错误
    console.log(`当前位移：${extraInfo.currentOffset ?? '未知'}`);
    console.log(`目标位移：${extraInfo.targetOffset ?? '未知'}`);
    console.log(`离手速度：${extraInfo.velocity ?? '未知'}`);
  }

  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isChange) {
      instance.onGestureSwipe(this.onSwipe)
    } else {
      instance.onGestureSwipe(undefined)
    }
  }
}

@Entry
@Component
struct tabsOnGestureSwipeModifierTest {
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()
  @State isScrollable: boolean = true;
  @State modifier: MyTabsAttributeModifier = new MyTabsAttributeModifier();

  build() {
    Row() {
      Column() {
        Text(this.modifier.textLabel)
          .id('textOnGestureSwipeModifier')
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
        .id('tabsOnGestureSwipeModifier')
        .attributeModifier(this.modifier)
        .height('100%')
        .width('100%')

        Button('点击切换Undefined').id('buttonOnGestureSwipeModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}