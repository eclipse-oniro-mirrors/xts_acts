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
import {NodeController, FrameNode, UIContext} from '@kit.ArkUI';
const TEST_TAG: string = 'FrameNode '

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.frameNode = new FrameNode(uiContext);
    this.addCommonEvent(this.frameNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`${TEST_TAG} Click FrameNode: ${JSON.stringify(event)}`);
    })
  }

  adoptChild100026() {
    try {
      this.rootNode?.dispose();
      this.rootNode?.adoptChild(this.frameNode);
      console.info(`${TEST_TAG} adoptChild success`);
    } catch (e) {
      AppStorage.SetOrCreate('AdoptChildErrorCode100026', (e as BusinessError).code);
      console.info(`${TEST_TAG} adoptChild fail: ${JSON.stringify(e)}`);
    }
  }

  removeAdoptedChild100026() {
    try {
      this.rootNode?.dispose();
      this.rootNode?.removeAdoptedChild(this.frameNode);
      console.info(`${TEST_TAG} removeAdoptedChild success`);
    } catch (e) {
      AppStorage.SetOrCreate('RemoveAdoptedChildErrorCode100026', (e as BusinessError).code);
      console.info(`${TEST_TAG} removeAdoptedChild fail: ${JSON.stringify(e)}`);
    }
  }
}

@Entry
@Component
struct AdoptChild100026 {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 8 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('80%')
        .height('30%')
      Button(`adoptChild 100026`)
        .id('btn_adoptChild_100026')
        .width('100%')
        .height('10%')
        .onClick(() => {
          this.myNodeController.adoptChild100026();
        })
      Button(`removeAdoptedChild 100026`)
        .id('btn_removeAdoptedChild_100026')
        .width('100%')
        .height('10%')
        .onClick(() => {
          this.myNodeController.removeAdoptedChild100026();
        })
    }
  }
}