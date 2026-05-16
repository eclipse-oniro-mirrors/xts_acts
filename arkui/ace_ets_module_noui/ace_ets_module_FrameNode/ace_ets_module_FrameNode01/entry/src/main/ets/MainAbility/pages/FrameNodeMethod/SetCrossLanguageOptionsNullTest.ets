/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: FrameNode[] = [];
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;

    this.frameNode = new FrameNode(uiContext);
    this.frameNode.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode.commonAttribute.size({ width: 100, height: 100 });

    this.rootNode.appendChild(this.frameNode);
    this.childrenCount = this.childrenCount + 1;
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode.appendChild(childNode);
    }
    return this.rootNode;
  }

  setCrossLanguageOptions() {
    try {
      this.frameNode?.setCrossLanguageOptions(null);
      console.log('win6' + ' setCrossLanguageOptions success.');
    } catch (e) {
      console.log('win6' + (e as BusinessError).code + ' : ' + (e as BusinessError).message);
      AppStorage.SetOrCreate('SetCrossLanguageOptionsNull', 'null');
    }

    try {
      this.frameNode?.setCrossLanguageOptions(undefined);
      console.log('win6' + ' setCrossLanguageOptions success.');
    } catch (e) {
      console.log('win6' + (e as BusinessError).code + ' : ' + (e as BusinessError).message);
      AppStorage.SetOrCreate('SetCrossLanguageOptionsUndefined', 'undefined');
    }
  }
}

@Entry
@Component
struct SetCrossLanguageOptionsNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .height('30%')
        Button('setCrossLanguageOptions')
          .id('btn_setCrossLanguageOptions_null_id')
          .height('10%')
          .onClick(() => {
            this.myNodeController.setCrossLanguageOptions();
          })
      }
      .width('100%')
      .height('100%')
    }
    .scrollable(ScrollDirection.Vertical)
  }
}