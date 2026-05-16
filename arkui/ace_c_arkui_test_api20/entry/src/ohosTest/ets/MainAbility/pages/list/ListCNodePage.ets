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
struct ListCNodePage {
  private nodeContent: NodeContent | undefined = new NodeContent();

  aboutToAppear() {
    // 通过C-API创建节点，并添加到管理器nodeContent上
    nativeNode.createCrossLanguageListNode(this.nodeContent, 'List');
  }

  build() {
    Column() {
      Button('CAPINode_C侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('ListCrossLanguage_capiNode');
        console.info('List isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('List CAPINode is exist')
          const a = typeNode.getAttribute(node, 'List');
          if (a != undefined) {
            console.info('List CAPINode background Yellow')
            a.backgroundColor(Color.Yellow)
            a.size({width: 200, height: 120})
          }
        } else {
          console.info('List CAPINode is null')
        }

        const listItemNode1 = this.getUIContext().getFrameNodeById('listItemNode1');
        console.info('ListItem isModifiable:' + listItemNode1?.isModifiable());
        if (listItemNode1) {
          console.info('ListItem CAPINode is exist')
          const b = typeNode.getAttribute(listItemNode1, 'ListItem');
          if (b != undefined) {
            console.info('ListItem CAPINode backgroundColor Color.Pink')
            b.backgroundColor(Color.Pink);
            b.size({width: 150, height: 100})
          }
        } else {
          console.info('ListItem CAPINode is null')
        }
      }).id('ListCNodePage_Btn')

      ContentSlot(this.nodeContent)
    }
    .width('100%')
    .height('100%')
  }
}