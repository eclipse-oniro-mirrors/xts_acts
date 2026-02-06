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
import { NodeController, FrameNode, XComponentNode, NodeRenderType, UIContext} from '@kit.ArkUI'

class XComponentNodeController extends NodeController {
  private xComponentNode: MyXComponentNode | null = null;

  constructor() {
    super();
  }

  makeNode(context: UIContext): FrameNode | null {
    this.xComponentNode = new MyXComponentNode(context, {
      selfIdealSize: { width: 200, height: 200 }
    }, 'xComponentId', XComponentType.SURFACE);
    return this.xComponentNode;
  }

  changeRenderType(renderType: NodeRenderType): void {
    if (this.xComponentNode) {
      let ret = this.xComponentNode.changeRenderType(renderType);
      AppStorage.setOrCreate('XComponentNodePage_changeRenderType', ret);
    }
  }
}

class MyXComponentNode extends XComponentNode {
  onCreate(event: Object) {
    // do something when XComponentNode has created
    AppStorage.setOrCreate('XComponentNodePage_onCreate', 'onCreate succ');
  }

  onDestroy() {
    // do something when XComponentNode is destroying
    AppStorage.setOrCreate('XComponentNodePage_onDestroy', 'onDestroy succ');
  }
}

@Entry
@Component
struct XComponentNodePage {
  private myNodeController: XComponentNodeController = new XComponentNodeController()
  @State flag:boolean = true

  build() {
    Column() {
      Button('Destroyed').id('XComponentNodePage_btn')
        .onClick(() => {
          this.flag = !this.flag
        })

      Button('changeRenderType:DISPLAY').id('changeRenderType_display')
        .onClick(() => {
          this.myNodeController.changeRenderType(NodeRenderType.RENDER_TYPE_DISPLAY)
        })

      Button('changeRenderType:TEXTURE').id('changeRenderType_texture')
        .onClick(() => {
          this.myNodeController.changeRenderType(NodeRenderType.RENDER_TYPE_TEXTURE)
        })

      if(this.flag) {
        NodeContainer(this.myNodeController)
      }
    }
    .height('100%')
  }
}