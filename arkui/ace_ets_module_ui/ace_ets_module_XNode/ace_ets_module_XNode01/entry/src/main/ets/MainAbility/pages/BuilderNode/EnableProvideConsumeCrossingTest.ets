/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BuilderNode, NodeContent } from '@kit.ArkUI';

@Component
struct ConsumeChild {
  @Consume @Watch('ChangeData') message: string = ''

  ChangeData() {
    console.log(`ChangeData ${this.message}`);
  }

  build() {
    Column() {
      Text(this.message)
        .id('text_change_c')
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
      Button('Click to change message to append C')
        .id('btn_change_c')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = this.message + 'C'
        })
    }
  }
}

@Builder
function createText(textMessage: string) {
  Column() {
    Text(textMessage)
      .fontWeight(FontWeight.Bold)
      .fontSize(20)
    ConsumeChild()
  }
}

@Entry
@Component
struct EnableProvideConsumeCrossingIndex {
  @Provide message: string = 'Hello World';
  private content: NodeContent = new NodeContent();
  private builderNode: BuilderNode<[string]> = new BuilderNode<[string]>(this.getUIContext());

  aboutToAppear(): void {
    this.builderNode.build(wrapBuilder(createText), 'Test Consume', { enableProvideConsumeCrossing: true })
    this.content.addFrameNode(this.builderNode.getFrameNode())
  }

  build() {
    Column() {
      Text(this.message)
        .id('text_change_i')
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
      Button('Click to change message to append I')
        .id('btn_change_i')
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = this.message + 'I';
        })
      Column() {
        ContentSlot(this.content)
      }
    }
    .height('100%')
    .width('100%')
  }
}