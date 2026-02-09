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
import { BusinessError } from '@ohos.base';
import { ComponentContent } from "@ohos.arkui.node";

import {
  Entry, Component,
  Column, ColumnOptions, Color, Builder, wrapBuilder,
  Text, Button, ClickEvent, Margin, FontWeight, Row, CustomBuilderT,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
class Params {
  text: string = ""
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor('#FFF0F0F0').size({ height: 100, width: 100 })
}

@Entry
@Component
struct closeCustomDialog {
  @State message: string = "hello"
  @State change: string = ""

  build() {
    Row() {
      Column({ space: 12 } as ColumnOptions) {
        Text(this.change)
          .id('CloseCustomDialog')
        Button("click me")
          .id('btn')
          .onClick((e:ClickEvent) => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent<Params>(uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText), new Params(this.message));
            promptAction.openCustomDialog(contentNode, { onDidDisappear: () => { this.change = 'CloseCustomDialog' }});
            setTimeout(() => {
              promptAction.closeCustomDialog(contentNode);
            }, 1000);     
          })
      }
      .width('100%')
    }
    .id('row')
    .height('100%')
  }
}