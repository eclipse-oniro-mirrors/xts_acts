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
import { ComponentContent } from "@ohos.arkui.node";

import {
  Entry, Component,
  Column, ColumnOptions, Color, Row, Builder,
  Text, Button, ClickEvent, Margin, FontWeight, CustomBuilderT, wrapBuilder,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction, DialogAlignment,
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
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 36} as Margin)
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct Index {
  @State message: string = "hello"
  @State updateCustomDialog: string = "init"

  build() {
    Row() {
      Column() {
        Text(this.updateCustomDialog)
          .margin(20)
          .id('updateCustomDialog')
        Button("click me")
          .id('btn')
          .onClick((e:ClickEvent) => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent<Params>(uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText), new Params(this.message));
            promptAction.openCustomDialog(contentNode);

            setTimeout(() => {
              promptAction.updateCustomDialog(contentNode, { alignment: DialogAlignment.CenterEnd })
                .then(() => {
                  this.updateCustomDialog = 'updateCustomDialog'
                  console.info('updateCustomDialog success');
                })
            }, 2000);   
            setTimeout(() => {
              promptAction.closeCustomDialog(contentNode);
            }, 3000);     
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}