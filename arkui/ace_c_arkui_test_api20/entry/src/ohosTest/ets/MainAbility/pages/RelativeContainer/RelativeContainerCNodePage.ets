/*
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
import nativeNode from 'libnativerender.so'
import {NodeContent, typeNode} from '@kit.ArkUI'

@Entry
@Component
struct RelativeContainerCNodePage {
  private nodeContent: NodeContent | undefined = new NodeContent();

  aboutToAppear() {
    // 通过C-API创建节点，并添加到管理器nodeContent上
    nativeNode.createCrossLanguageRelativeContainerNode(this.nodeContent, 'RelativeContainer');
  }

  build() {
    Column() {
      Button('CAPINode_C侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('RelativeContainerCNodePage_capiNode');
        console.info('RelativeContainerCNodePage capiNode isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('RelativeContainerCNodePage capiNode is exist')
          const attrs = typeNode.getAttribute(node, 'RelativeContainer');
          if (attrs != undefined) {
            console.info('RelativeContainerCNodePage capiNode backgroundColor Color.Yellow')
            attrs.backgroundColor(Color.Yellow);
            attrs.size({width: 150, height: 150})
          }
        } else {
          console.info('RelativeContainerCNodePage capiNode is null')
        }
      }).id('RelativeContainerCNodePage_Btn')

      ContentSlot(this.nodeContent)
    }
    .width('100%')
    .height('100%')
  }
}