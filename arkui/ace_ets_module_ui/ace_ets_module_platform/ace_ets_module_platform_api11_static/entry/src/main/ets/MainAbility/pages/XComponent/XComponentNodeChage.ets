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
import { Entry,Column,Component,Button,XComponent,NodeContainer,Position,Video,XComponentController,XComponentType,Color,TextOverflow,TextAlign,Alignment,VideoController,FlexDirection,Flex,ImageFit,Row,ItemAlign,FlexAlign,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, FrameNode, BuilderNode, NodeRenderType } from '@ohos.arkui.node';
let message: string = 'init'

// class XComponentNodeController extends NodeController {
//   private rootNode: XComponentNode
//
//   constructor(uiContext: UIContext, id: string, type: XComponentType) {
//     super()
//     this.rootNode = new XComponentNode(uiContext, {
//       type: NodeRenderType.RENDER_TYPE_DISPLAY,
//       surfaceId: '12345',
//       selfIdealSize: { width: 300, height: 300 }
//     }, id, type);
//   }
//
//   makeNode(uiContext: UIContext): FrameNode | null {
//     return this.rootNode
//   }
//
//   changeRenderType(type: NodeRenderType) {
//     let flag1 = this.rootNode.changeRenderType(NodeRenderType.RENDER_TYPE_DISPLAY)
//     message = 'changeRenderType'
//   }
// }

@Entry
@Component
struct XComponentNodeIndex {
  @State uiContext: UIContext | undefined = this.getUIContext?.();
  @State type: XComponentType = XComponentType.SURFACE
  @State idText: string = "xcomponentId"
  // private xComponentNodeController: XComponentNodeController = new XComponentNodeController(this.uiContext!, this.idText, this.type)
  @State falg: boolean = false

  build() {
    Row() {
      Column() {
        Button('change render type').key('xComponentNode_change')
          .onClick((e: ClickEvent) => {
            // this.xComponentNodeController.changeRenderType(NodeRenderType.RENDER_TYPE_TEXTURE)
          })
        Text(message).key('xComponent_RenderType')
        if (this.falg) {
          // NodeContainer(this.xComponentNodeController)
          //   .width(400)
          //   .height(400)
          //   .border({ width: 1, color: Color.Green })
        }
      }.height('100%')
    }.height('100%')
  }
}