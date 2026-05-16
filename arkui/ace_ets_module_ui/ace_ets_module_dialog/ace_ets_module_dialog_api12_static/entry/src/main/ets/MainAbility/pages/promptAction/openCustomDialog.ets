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
  Column, ColumnOptions, Color, FontWeight,
  Text, Button, ClickEvent, Margin, Row, Builder, CustomBuilderT,wrapBuilder,
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
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({bottom: 36} as Margin)
  }.backgroundColor('#FFF0F0F0')
}

@Entry
@Component
struct Index {
  @State message: string = "hello"
  @State openCustomDialogMessage: string = "openCustomDialog"

  build() {
    Row() {
      Column() {
        Text(this.openCustomDialogMessage).fontSize(20).margin(20).id("openCustomDialogMessage")
        Button("click me")
          .id("openCustomDialogXTS")
          .onClick((e:ClickEvent) => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent<Params>(uiContext, wrapBuilder<CustomBuilderT<Params>>(buildText), new Params(this.message));
            try {
              this.openCustomDialogMessage = 'openCustomDialog success'
              promptAction.openCustomDialog(contentNode);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
            };
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}