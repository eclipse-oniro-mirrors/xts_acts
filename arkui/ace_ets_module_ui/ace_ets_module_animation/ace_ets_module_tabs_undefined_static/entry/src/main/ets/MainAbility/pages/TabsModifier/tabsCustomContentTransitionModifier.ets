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
  AttributeModifier,
  TabsAttribute,
  TabContentAnimatedTransition,
  TabContentTransitionProxy,
  Text
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyCustomContentTransitionModifier implements AttributeModifier<TabsAttribute> {
  public isChange: boolean = false;
  public textLabel: string = 'undefined customContentTransition';

  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isChange) {
      instance.customContentTransition((from: int, to: int): TabContentAnimatedTransition => {
        this.textLabel = 'customContentTransition successfully';
        return {
          timeout: 0, // 动画超时时间
          transition: (proxy: TabContentTransitionProxy) => {
            console.log(`触发了从标签${from}切换到标签${to}`);
            // 模拟简单的淡入淡出动画（实际可扩展为复杂动画）
            setTimeout(() => {
              proxy.finishTransition(); // 必须调用，通知动画结束
            }, 300);
          }
        };
      }
      )
    } else {
      instance.customContentTransition(undefined)
    }
  }
}

@Entry
@Component
struct tabsCustomContentTransitionTest {
  @State modifier: MyCustomContentTransitionModifier = new MyCustomContentTransitionModifier();
  private controller: TabsController = new TabsController();

  build() {
    Row() {
      Column() {
        Text(this.modifier.textLabel)
          .id('textCustomContentTransitionModifier')
        Tabs({ controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#E67C92')
          }.tabBar('pink')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFBF00')
          }.tabBar('yellow')
        }
        .vertical(false)
        .scrollable(true)
        .id('tabsCustomContentTransitionModifier')
        .attributeModifier(this.modifier)
        .height('100%')
        .width('100%')

        Button('点击切换Undefined').id('buttonCustomContentTransitionModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}