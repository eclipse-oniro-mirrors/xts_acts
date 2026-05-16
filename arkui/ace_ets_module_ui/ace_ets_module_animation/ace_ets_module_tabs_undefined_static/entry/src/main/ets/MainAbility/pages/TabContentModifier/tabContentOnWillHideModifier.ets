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
  TabContent,
  AttributeModifier,
  TabContentAttribute,
  Tabs,
  Text
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyTabContentAttributeModifier implements AttributeModifier<TabContentAttribute> {
  public isChange: boolean = false;
  public tabContentOnWillHideContent : string = 'undefined onWillHide';

  applyNormalAttribute(instance: TabContentAttribute): void {
    if (this.isChange) {
      instance.onWillHide(() => {
        this.tabContentOnWillHideContent = 'onWillHide successfully';
      })
    } else {
      instance.onWillHide(undefined);
    }
  }
}

@Entry
@Component
struct tabContentOnWillHideModifierTest {
  @State isChange: boolean = true
  @State modifier: MyTabContentAttributeModifier = new MyTabContentAttributeModifier();

  @Builder tabBuilderOne() {
    Column() {
      Text('test')
        .fontSize(16)
        .id('taberTextOnWillHideModifierOne')
    }.width('100%')
  }
  @Builder tabBuilderTwo() {
    Column() {
      Text('test')
        .fontSize(16)
        .id('taberTextOnWillHideModifierTwo')
    }.width('100%')
  }

  build() {
    Row() {
      Column() {
        Text(this.modifier.tabContentOnWillHideContent)
          .id('onWillHideModifierText')
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFFFFF')
          }
          .tabBar(this.tabBuilderOne)
          .attributeModifier(this.modifier)
          .height('100%')
          .width('100%')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#000000')
          }
          .tabBar(this.tabBuilderTwo)
        }

        Button('点击切换Undefined').id('buttonOnWillHideModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}