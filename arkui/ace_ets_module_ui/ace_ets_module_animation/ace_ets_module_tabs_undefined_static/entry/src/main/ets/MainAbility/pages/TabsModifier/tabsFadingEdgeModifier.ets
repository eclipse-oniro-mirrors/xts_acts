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
  TabsAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyFadingEdgeModifier implements AttributeModifier<TabsAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TabsAttribute): void {
    if (this.isChange) {
      instance.fadingEdge(false)
    } else {
      instance.fadingEdge(undefined)
    }
  }
}

@Entry
@Component
struct tabsFadingEdgeTest {
  @State modifier: MyFadingEdgeModifier = new MyFadingEdgeModifier();
  private controller: TabsController = new TabsController();

  build() {
    Row() {
      Column() {
        Tabs({ controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('20%').backgroundColor('#E67C92')
          }.tabBar('Pink')

          TabContent() {
            Column().width('100%').height('20%').backgroundColor('#FFBF00')
          }.tabBar('Yellow')
        }
        .vertical(false)
        .scrollable(true)
        .id('tabsFadingEdgeModifier')
        .attributeModifier(this.modifier)
        .height('100%')
        .width('100%')

        Button('点击切换Undefined').id('buttonFadingEdgeModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}