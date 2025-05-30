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
import { FrameNode, NodeController } from '@ohos.arkui.node'

class NodeControllerOnHover extends NodeController {
  public rootNode: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    this.addCommonEvent(this.rootNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnHover(((isHover: boolean, event: HoverEvent): void => {
      console.log(`isHover FrameNode: ${isHover}`);
      console.log(`isHover FrameNode: ${JSON.stringify(event)}`);
      event.stopPropagation();
    }))
  }
}

@Entry
@Component
struct setOnHoverTest {
  @State isHover1: string = 'start';
  @State color: ResourceColor = Color.Blue
  private NodeControllerOnHover: NodeControllerOnHover = new NodeControllerOnHover();

  onPageShow() {
    this.NodeControllerOnHover!.addCommonEvent(this.NodeControllerOnHover!.rootNode!.getParent()!.getPreviousSibling() !)
  }

  build() {
    Column({ space: 5 }) {
      Column({ space: 5 }) {
        Text(this.isHover1)
          .id('setOnHover_1')
          .fontSize(50)
          .backgroundColor(this.color)
          .position({ x: 0, y: 0 })
          .hoverEffect(HoverEffect.Highlight)
          .onHover(((isHover: boolean, event: HoverEvent): void => {
            if(isHover){
              this.isHover1 = 'setOnHover'
              this.color = Color.Pink
            }
            console.log(`isHover Text: ${isHover}`);
            console.log(`isHover Text: ${JSON.stringify(event)}`);
          }))
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('40%').border({ width: 1 })

      NodeContainer(this.NodeControllerOnHover)
        .borderWidth(1)
        .width(100)
        .height(50)

    }.width("100%")
    .height('100%')
  }
}