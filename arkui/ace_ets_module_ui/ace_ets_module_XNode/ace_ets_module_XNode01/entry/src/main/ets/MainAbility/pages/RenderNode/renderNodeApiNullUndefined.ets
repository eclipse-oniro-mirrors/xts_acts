/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
import { RenderNode, FrameNode, NodeController } from '@kit.ArkUI';

const renderNode = new RenderNode();
renderNode.size = { width: 100, height: 100 };
for (let i = 0; i < 10; i++) {
  let childNode = new RenderNode();
  childNode.size = { width: i * 10, height: i * 10 };
  childNode.position = { x: i * 10, y: i * 10 };
  childNode.backgroundColor = 0xFF0000FF - 0X11 * i;
  try {
    renderNode.appendChild(childNode);
  } catch (error) {
    console.info('error code is error')
  }
}

try {
  renderNode.appendChild(null);
} catch (error) {
  console.info('error code is error')
}
try {
  renderNode.appendChild(undefined);
} catch (error) {
  console.info('error code is error')
}

try {
  renderNode.insertChildAfter(null, null);
} catch (error) {
  console.info('error code is error')
}
try {
  renderNode.insertChildAfter(undefined, undefined);
} catch (error) {
  console.info('error code is error')
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      try {
        rootRenderNode.appendChild(renderNode);
      } catch (error) {
        console.info('error code is error')
      }
    }
    return this.rootNode;
  }
}

renderNode.removeChild(null);
renderNode.removeChild(undefined);

@Entry
@Component
struct renderNodeApiNullUndefined {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({space:3}) {
      Row({space:3}){
        NodeContainer(this.myNodeController).id('renderNodeApiNullUndefined')
      }
      Row({space:3}){
        Button('getChildNull')
          .onClick(() => {
            for (let i = 0; i < 11; i++) {
              let childNode: RenderNode | null = renderNode.getChild(null);
              if (childNode == null) {
                console.error(`the ${i} of renderNode's childNode is null`);
              } else {
                console.info(`the ${i} of renderNode's childNode has a size of {${childNode.size.width},${childNode.size.height}}`);
              }
            }
          })
          .id('renderNodeGetChildNull').width(70).height(20)
        Button('getChildUndefined')
          .onClick(() => {
            for (let i = 0; i < 11; i++) {
              let childNode: RenderNode | null = renderNode.getChild(undefined);
              if (childNode == null) {
                console.error(`the ${i} of renderNode's childNode is undefined`);
              } else {
                console.info(`the ${i} of renderNode's childNode has a size of {${childNode.size.width},${childNode.size.height}}`);
              }
            }
          })
          .id('renderNodeGetChildUndefined').width(70).height(20)
      }

    }.width('100%').height('100%')
  }
}