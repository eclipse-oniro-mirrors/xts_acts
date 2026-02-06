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



import { MessageManager, Callback, Message } from './../../../common/MessageManager';
import { Entry, Component, Column,AlignRuleOption, HorizontalAlign, Row, RelativeContainer, Button, Text, Color, VerticalAlign } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RelativeContainer_Level {
  @State addalign: HorizontalAlign = HorizontalAlign.Start;
  messageManager: MessageManager<HorizontalAlign> = new MessageManager<HorizontalAlign>();

  onPageShow() {
    console.info('RelativeContainer_Level onPageShow');
    AppStorage.setOrCreate<MessageManager<HorizontalAlign>>("messageManager",  this.messageManager);
    let callback: Callback<HorizontalAlign> = (message: Message<HorizontalAlign>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addalign') {
        this.addalign = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Row() {
      RelativeContainer() {
        Button("Button1")
          .width(120)
          .height(30)
          .alignRules({
            middle: { anchor: "__container__", align: HorizontalAlign.Center }
          } as AlignRuleOption)
          .key("RelativeContainer_Level_bt1")
          .id("RelativeContainer_Level_bt1")
          .borderWidth(5)
          .borderColor(Color.Black)

        Text("This is text")
          .fontSize(20)
          .padding(10)
          .alignRules({
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom } ,
            top: { anchor: "RelativeContainer_Level_bt1", align: VerticalAlign.Bottom } ,
            right: { anchor: "RelativeContainer_Level_bt1", align: this.addalign }
          } as AlignRuleOption)
          .key("RelativeContainer_Level_bt1")
          .id("RelativeContainer_Level_tx2")
          .borderWidth(2)
          .borderColor(Color.Green)
          .width(250)
      }
      .width(300).height(300)
      .border({ width: 2, color: "#6699FF" })
    }
    .height('100%')
  }
}