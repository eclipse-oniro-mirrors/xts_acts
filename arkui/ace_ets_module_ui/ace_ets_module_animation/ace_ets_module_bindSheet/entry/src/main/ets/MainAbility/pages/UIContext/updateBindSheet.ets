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
import { FrameNode, ComponentContent } from "@ohos.arkui.node";

class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text;
  }
}

let contentNode: ComponentContent<Params>;
let gUIContext: UIContext;

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
    Button('Update BindSheet')
      .fontSize(20)
      .onClick(() => {
        gUIContext.updateBindSheet(contentNode, {
          backgroundColor: Color.Pink,
        }, true)
          .then(() => {
            console.info('updateBindSheet success');
          })
      })

    Button('Close BindSheet')
      .id('close')
      .fontSize(20)
      .onClick(() => {
        gUIContext.closeBindSheet(contentNode)
          .then(() => {
            console.info('closeBindSheet success');
          })
      })
  }
}

@Entry
@Component
struct UIContextBindSheet {
  @State message: string = 'BindSheet';
  @State updateBindSheet: string = 'init';

  aboutToAppear() {
    gUIContext = this.getUIContext();
    contentNode = new ComponentContent(this.getUIContext(), wrapBuilder(buildText), new Params(this.message));
  }

  build() {
    RelativeContainer() {
      Row() {
        Column() {
          Text(this.updateBindSheet)
            .id('updateBindSheet')
          Button('Open BindSheet')
            .id('btn')
            .fontSize(20)
            .onClick(() => {
              let uiContext = this.getUIContext();
              let uniqueId = this.getUniqueId();
              let frameNode: FrameNode | null = uiContext.getFrameNodeByUniqueId(uniqueId);
              let targetId = frameNode?.getFirstChild()?.getUniqueId();
              uiContext.openBindSheet(contentNode, {
                height: SheetSize.MEDIUM,
                backgroundColor: Color.Green,
                title: { title: "Title", subtitle: "subtitle" }
              }, targetId)
                .then(() => {
                  console.info('openBindSheet success');
                })
              setTimeout(() => {
                gUIContext.updateBindSheet(contentNode, {
                  backgroundColor: Color.Pink,
                }, true)
                  .then(() => {
                    this.updateBindSheet = 'updateBindSheet'
                    console.info('updateBindSheet success');
                  })
              }, 2000);
              setTimeout(() => {
                gUIContext.closeBindSheet(contentNode)
              }, 3000); //3秒后自动关闭
            })
        }.width('100%')
      }.height('100%')
    }
    .height('100%')
    .width('100%')
  }
}