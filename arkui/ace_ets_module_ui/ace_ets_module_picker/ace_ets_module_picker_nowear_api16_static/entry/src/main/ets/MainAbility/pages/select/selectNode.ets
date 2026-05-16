'use static';
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
import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
import { MenuItemModifier, SymbolGlyphModifier } from '@ohos.arkui.modifier'
import { Entry, Component, Column, $r, Color, Margin, NodeContainer } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';

let symbolModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontColor([Color.Gray]);
let symbolModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.exposure')).fontColor([Color.Gray]);

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize()
    let select = typeNode.createSelectNode(uiContext)
    select.initialize([{ value: 'item1', icon: $r('app.media.icon'), symbolIcon: symbolModifier1 },
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: symbolModifier2 },
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: undefined } ,
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: undefined }])
      .key('key_Select_001')
    node.appendChild(col)
    col.appendChild(select)
    return node
  }
}

@Entry
@Component
struct SelectExample {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column() {
      NodeContainer(this.myNodeController).margin({top:50} as Margin)
    }
  }
}
