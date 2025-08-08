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
import { ComponentContent, FrameNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class Params {
  private text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(param?: Params) {
  Column() {
    Text('popup').fontSize(24)
  }.width(100).height(50).padding(5)
}

@Entry
@Component
struct Index {
  @State updatePopup: string = 'init'
  build() {
    Column() {
      Text(this.updatePopup)
        .id('updatePopup')
      Button('updatePopup')
        .id('btn')
        .fontSize(20)
        .onClick(() => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId();
          promptAction.openPopup(contentNode, { id: targetId })
          setTimeout(() => {
            promptAction.updatePopup(contentNode, { radius: 0 })
              .then(() => {
                this.updatePopup = 'updatePopup'
                console.info('updatePopup success');
              })
          }, 2000);  //2秒后自动更新弹窗位置
          setTimeout(() => {
            promptAction.closePopup(contentNode)
          }, 4000); //4秒后自动关闭
        })
    }
  }
}