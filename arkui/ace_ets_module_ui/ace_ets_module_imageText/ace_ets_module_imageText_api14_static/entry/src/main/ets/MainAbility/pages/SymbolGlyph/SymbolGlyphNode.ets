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
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent,Image,ImageFit,ColumnOptions,HorizontalAlign,
  Color, NodeContainer } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null{
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let symbolGlyph = typeNode.createSymbolGlyphNode(uiContext)
    symbolGlyph.initialize(undefined)
    symbolGlyph.initialize()
      .width('90%')
      .height('50%')
      .backgroundColor('#182431')
      .id('SymbolGlyph_Node_id')
    col.appendChild(symbolGlyph)
    node.appendChild(col)
    console.log('SymbolGlyph: page' + new Date().getTime())
    return node
  }
}
@Entry
@Component
struct SymbolGlyphNode {
  private myNodeController: MyNodeController = new MyNodeController()
  build(){
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}