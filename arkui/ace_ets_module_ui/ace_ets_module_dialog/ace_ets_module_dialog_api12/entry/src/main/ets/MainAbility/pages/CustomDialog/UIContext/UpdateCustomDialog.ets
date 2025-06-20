/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct updateCustomDialog {
  @State message: string = "hello"
  @State change: string = ""
  @State alignmentStatus: DialogAlignment = DialogAlignment.Center

  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.change) // CenterEnd = 7
          .id('UpdateCustomDialog')
        Button("click me")
          .id('btn')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            promptAction.openCustomDialog(contentNode, { alignment: this.alignmentStatus });
            this.alignmentStatus = DialogAlignment.CenterEnd
            setTimeout(() => {
              promptAction.updateCustomDialog(contentNode, { alignment: this.alignmentStatus });
              this.change = this.alignmentStatus + ''
            }, 1000);   //2秒后自动更新弹窗位置
          })
      }
      .width('100%')
    }
    .id('row')
    .height('100%')
  }
}