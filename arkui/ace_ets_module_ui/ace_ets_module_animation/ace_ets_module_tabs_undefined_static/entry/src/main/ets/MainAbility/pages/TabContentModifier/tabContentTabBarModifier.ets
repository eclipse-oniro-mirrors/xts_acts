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
  Tabs,
  TabContent,
  AttributeModifier,
  TabContentAttribute,
  SubTabBarStyle
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyTabBarModifier implements AttributeModifier<TabContentAttribute> {
  public isChange: boolean = false;

  applyNormalAttribute(instance: TabContentAttribute): void {
    if (this.isChange) {
      instance.tabBar(new SubTabBarStyle('pink')
        .indicator({
          height: 20,
          width: 50,
        }))
    } else {
      instance.tabBar(undefined)
    }
  }
}

@Entry
@Component
struct tabContentTabBarModifierTest {
  @State modifier: MyTabBarModifier = new MyTabBarModifier();

  build() {
    Row() {
      Column() {
        Tabs() {
          TabContent() {
            Column().width('100%').height('20%').backgroundColor('#FFBF00')
          }
          .id('tabContentTabBarModifier')
          .attributeModifier(this.modifier)
          .height('100%')
          .width('100%')
        }
        Button('点击切换Undefined').id('buttonTabBarModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}