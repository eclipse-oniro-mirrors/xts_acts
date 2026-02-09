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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BadgeParamWithNumber, BadgeParamWithString, Color, HorizontalAlign, Button,  $r, Entry, Component, Column, ColumnOptions, NodeContainer,
  Text, Badge, Image, $r, Row, QRCode} from '@ohos.arkui.component'
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
let data:(string) =  '123'

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let scroll = typeNode.createScrollNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center).width('50%')
    let text = typeNode.createTextNode(uiContext)
    text.initialize('command')
    let qrcode = typeNode.createQRCodeNode(uiContext)
    qrcode.initialize(data).width(100).color(Color.Blue).contentOpacity(undefined).key('key_QRCode_001')
    
    col.appendChild(qrcode)
    scroll.appendChild(col)
    node.appendChild(scroll)
    return node
  }
}
@Entry
@Component
struct qrcode {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Row() {
      NodeContainer(this.myNodeController)
      Column({space: 10} as ColumnOptions){
        QRCode(data).width(100).color(Color.Blue).backgroundColor(Color.White)

      }.width('50%')
    }.width('100%')

  }
}