/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }
}

@Entry
@Component
struct GetEventUndefined {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Button('undefined').onClick(() => {
        let gridEvent: UIGridEvent | undefined = typeNode.getEvent(undefined, 'Grid');
        AppStorage.SetOrCreate('getEventGridUn', gridEvent);

        let scrollEvent: UIScrollEvent | undefined = typeNode.getEvent(undefined, 'Scroll');
        AppStorage.SetOrCreate('getEventScrollUn', scrollEvent);

        let listEvent: UIListEvent | undefined = typeNode.getEvent(undefined, 'List');
        AppStorage.SetOrCreate('getEventListUn', listEvent);

        let waterFlowEvent: UIWaterFlowEvent | undefined = typeNode.getEvent(undefined, 'WaterFlow');
        AppStorage.SetOrCreate('getEventWaterFlowUn', waterFlowEvent);

      }).id('getEvent_undefined')
        .margin(10)

      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}