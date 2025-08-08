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
import { ComponentContent } from "@ohos.arkui.node";
class Params {
  text: string = ""
  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(params: Params) {
  ReusableChildComponent2({ text: params.text });
}
@Component
struct ReusableChildComponent2 {
  @State text: string = "false";

  aboutToReuse(params: Record<string, object>) {
    console.log("ReusableChildComponent2 Reusable " + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log("ReusableChildComponent2 aboutToRecycle " + this.text);
  }
  build() {
    Column() {
      Text(this.text).id('ComponentContentAPIReuse_Text')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 })
    }.backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct ComponentContentAPIReuse {
  @State message: string = "hello"
  build() {
    Row() {
      Column() {
        Button("click me").id('ComponentContentAPIReuse_Button')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            promptAction.openCustomDialog(contentNode);
            setTimeout(() => {
              contentNode.reuse(new Params("new message"));
            }, 2000); //2秒后自动更新弹窗内容文本
          })
        Button('fdhjkfshfjkfhsd').id('ComponentContentAPIReuse_Button02')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}