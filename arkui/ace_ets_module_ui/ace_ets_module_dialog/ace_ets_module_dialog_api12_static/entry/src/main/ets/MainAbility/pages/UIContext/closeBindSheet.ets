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
import { FrameNode, ComponentContent } from "@ohos.arkui.node";

import {
  Entry, Component,
  Column, ColumnOptions, Color, SheetSize,
  Text, Button, ClickEvent, Margin, Row, Builder, CustomBuilderT,wrapBuilder,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction, RelativeContainer,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text;
  }
}

@Entry
@Component
struct UIContextBindSheet {
  @State message: string = 'BindSheet';
  @State closeBindSheet: string = 'init';
  contentNode: ComponentContent<Params> = 
  new ComponentContent<Params>(
    this.getUIContext(), 
    wrapBuilder<CustomBuilderT<Params>>(this.buildText), 
    new Params(this.message));

  @Builder
  buildText(params: Params) {
  Column() {
    Text(params.text)
    Button('Update BindSheet')
      .fontSize(20)
      .onClick((e:ClickEvent) => {
        this.getUIContext().updateBindSheet(this.contentNode, {
          backgroundColor: Color.Pink,
        }, true)
          .then(() => {
            console.info('updateBindSheet success');
          })
      })

    Button('Close BindSheet')
      .id('close')
      .fontSize(20)
      .onClick((e:ClickEvent) => {
        this.getUIContext().closeBindSheet(this.contentNode)
          .then(() => {
            console.info('closeBindSheet success');
          })
      })
  }
}



  build() {
    RelativeContainer() {
      Row() {
        Column() {
          Text(this.closeBindSheet)
            .id('closeBindSheet')
          Button('Open BindSheet')
            .id('btn')
            .fontSize(20)
            .onClick((e:ClickEvent) => {
              let uiContext = this.getUIContext();
              let uniqueId = this.getUniqueId();
              console.log('11111-------' + uniqueId)
              let frameNode: FrameNode | null = uiContext.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
              console.log('11111-------')
              uiContext.openBindSheet(this.contentNode, {
                height: SheetSize.MEDIUM,
                backgroundColor: Color.Green,
                title: { title: "Title", subtitle: "subtitle" }
              }, targetId)
                .then(() => {
                  console.info('openBindSheet success');
                })
              setTimeout(() => {
                uiContext.closeBindSheet(this.contentNode)
                  .then(() => {
                    this.closeBindSheet = 'closeBindSheet'
                    console.info('closeBindSheet success');
                  })
              }, 2000);
            })
        }.width('100%')
      }.height('100%')
    }
    .height('100%')
    .width('100%')
  }
}