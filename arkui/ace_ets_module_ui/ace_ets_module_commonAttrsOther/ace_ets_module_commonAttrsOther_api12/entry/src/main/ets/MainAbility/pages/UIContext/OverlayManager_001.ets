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
import { OverlayManager } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@ohos.arkui.node';

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
struct OverlayExample_001 {
  @State message: string = 'ComponentContent';
  private uiContext: UIContext = this.getUIContext()
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager()
  @StorageLink('contentArray') contentArray: ComponentContent<Params>[] = []
  @StorageLink('componentContentIndex') componentContentIndex: number = 0
  @StorageLink('arrayIndex') arrayIndex: number = 0
  @StorageLink("componentOffset") componentOffset: Position = {x: 0, y: 80}

  build() {
    Column({ space: 10 }) {
      Button("增加ComponentContent" + this.contentArray.length)
        .id('addComponentContent')
        .onClick(()=>{
          let componentContent = new ComponentContent(
            this.uiContext, wrapBuilder<[Params]>(builderText),
            new Params(this.message + (this.contentArray.length), this.componentOffset)
          )
          this.contentArray.push(componentContent)
          this.overlayNode.addComponentContent(componentContent, this.componentContentIndex)
        })
      Button("删除ComponentContent" + this.arrayIndex)
        .id('removeComponentContent')
        .onClick(()=>{
          if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
            let componentContent = this.contentArray.splice(this.arrayIndex, 1)
            this.overlayNode.removeComponentContent(componentContent.pop())
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