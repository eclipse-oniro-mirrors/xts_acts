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
import { NodeController, FrameNode, UIContext } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.frameNode = new FrameNode(uiContext);
    this.frameNode.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode.commonAttribute.size({ width: 100, height: 50 });
    this.rootNode.appendChild(this.frameNode);
    return this.rootNode;
  }

  getGlobalPositionOnDisplay() {
    let positionOnGlobalDisplay:number|undefined = 100001;
    positionOnGlobalDisplay = this.rootNode?.getGlobalPositionOnDisplay().x;
    if (positionOnGlobalDisplay != 100001 && positionOnGlobalDisplay != undefined) {
      console.log('999999999' + JSON.stringify(positionOnGlobalDisplay));
      return 'true';
    }
    return 'false';
  }
}

@Entry
@Component
struct GetGlobalPositionOnDisplayIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();
  @State getGlobalPositionOnDisplayText: string = 'false';

  build() {
    Scroll(this.scroller) {
      Column({ space: 8 }) {
        Column() {
          NodeContainer(this.myNodeController)
            .borderWidth(1)
            .width('100%')
            .height('10%')
        }
        Text(this.getGlobalPositionOnDisplayText).id('text_getGlobalPositionOnDisplay')
        Button('getGlobalPositionOnDisplay')
          .id('btn_getGlobalPositionOnDisplay')
          .width(300)
          .onClick(() => {
            this.getGlobalPositionOnDisplayText = this.myNodeController.getGlobalPositionOnDisplay();
          })

      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
  }
}