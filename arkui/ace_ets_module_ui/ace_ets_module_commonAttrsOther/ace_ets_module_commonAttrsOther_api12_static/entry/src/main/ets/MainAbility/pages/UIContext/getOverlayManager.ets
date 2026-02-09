'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { OverlayManager, Router, UIContext } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@ohos.arkui.node';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilderT,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Position,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  wrapBuilder
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { AppStorage, Link, State, StorageLink } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

class Params {
  text: string = ""
  offset: Position

  constructor(text: string, offset: Position) {
    this.text = text
    this.offset = offset
  }
}

@Builder
function builderText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .id('ParamsText')
      .backgroundColor(Color.Pink)
  }.offset(params.offset).id('Column')
}

@Entry
@Component
struct getOverlayManagerExample {
  @State message: string = 'getOverlayManager';
  @StorageLink('contentArray') contentArray: ComponentContent<Params>[] = []
  @StorageLink('componentContentIndex') componentContentIndex: Int = 0
  @StorageLink('arrayIndex') arrayIndex: Int = 0
  @StorageLink("componentOffset") componentOffset: Position = { x: 0, y: 80 }
  private uiContext: UIContext = this.getUIContext()
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager()

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button("增加ComponentContent" + this.contentArray.length)
        .id('addComponentContent')
        .onClick((e: ClickEvent) => {
          let componentContent = new ComponentContent<Params>(
            this.uiContext, wrapBuilder<CustomBuilderT<Params>>(builderText),
            new Params(this.message + (this.contentArray.length), this.componentOffset)
          )
          this.contentArray.push(componentContent)
          this.overlayNode.addComponentContent(componentContent, this.componentContentIndex)
        })
      Button("删除ComponentContent" + this.arrayIndex)
        .id('removeComponentContent')
        .onClick((e: ClickEvent) => {
          if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
            let componentContent = this.contentArray.splice(this.arrayIndex, 1)
            this.overlayNode.removeComponentContent(componentContent.pop() as ComponentContent<Params>)
          } else {
            console.log("arrayIndex有误")
          }
        })
    }
    .margin(50)
    .width('100%')
    .height('100%')
  }
}