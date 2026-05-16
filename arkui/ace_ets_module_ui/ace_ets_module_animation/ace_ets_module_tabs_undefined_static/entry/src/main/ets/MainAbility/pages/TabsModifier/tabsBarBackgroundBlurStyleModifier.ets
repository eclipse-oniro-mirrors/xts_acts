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
  Column,
  Component,
  Button,
  ClickEvent,
  BarPosition,
  Tabs,
  TabContent,
  TabsController,
  BarMode,
  Row,
  AttributeModifier,
  TabsAttribute,
  BlurStyle
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyBarBackgroundBlurStyleModifier implements AttributeModifier<TabsAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isChange) {
      instance.barBackgroundBlurStyle(BlurStyle.Regular)
    } else {
      instance.barBackgroundBlurStyle(undefined)
    }
  }
}

@Entry
@Component
struct tabsBarBackgroundBlurStyleModifierTest {
  @State modifier: MyBarBackgroundBlurStyleModifier = new MyBarBackgroundBlurStyleModifier();
  private controller: TabsController = new TabsController();

  build() {
    Row() {
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('20%').backgroundColor('#E67C92')
          }.tabBar('Pink')

          TabContent() {
            Column().width('100%').height('20%').backgroundColor('#FFBF00')
          }.tabBar('Yellow')
        }
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Scrollable)
        .id('tabsBarBackgroundBlurStyleModifier')
        .attributeModifier(this.modifier)
        .height('100%')
        .width('100%')

        Button('点击切换Undefined').id('buttonBarBackgroundBlurStyleModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}