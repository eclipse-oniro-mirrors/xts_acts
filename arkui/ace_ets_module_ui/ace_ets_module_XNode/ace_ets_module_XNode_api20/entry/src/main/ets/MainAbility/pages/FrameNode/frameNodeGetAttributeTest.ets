/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

class MyProgressNodeController extends NodeController {
  public uiContext: UIContext | null = null;
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    let node = typeNode.createNode(uiContext, 'Progress');
    node.initialize({
      value: 15,
      total: 200,
      type: ProgressType.ScaleRing
    }).width(100)
      .height(100)

    typeNode.getAttribute(node, 'Progress');
    AppStorage.SetOrCreate('getAttributeProgress', typeNode.getAttribute(null, 'Progress'));
    AppStorage.SetOrCreate('getAttributeLoadingProgress', typeNode.getAttribute(null, 'LoadingProgress'));
    AppStorage.SetOrCreate('getAttributeImage', typeNode.getAttribute(null, 'Image'));
    AppStorage.SetOrCreate('getAttributeButton', typeNode.getAttribute(null, 'Button'));
    AppStorage.SetOrCreate('getAttributeCheckbox', typeNode.getAttribute(null, 'Checkbox'));
    AppStorage.SetOrCreate('getAttributeRadio', typeNode.getAttribute(null, 'Radio'));
    AppStorage.SetOrCreate('getAttributeSlider', typeNode.getAttribute(null, 'Slider'));
    AppStorage.SetOrCreate('getAttributeToggle', typeNode.getAttribute(null, 'Toggle'));
    this!.rootNode!.appendChild(node);
    return this.rootNode;
  }
}

@Entry
@Component
struct Sample {
  build() {
    Column({ space: 10 }) {
      NodeContainer(new MyProgressNodeController()).margin(5)
    }.width('100%').height('100%')
  }
}