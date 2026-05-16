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

const TEST_TAG: string = 'FrameNode '

// 继承NodeController实现自定义UI控制器
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

  adoptChild() {
    try {
      this.rootNode?.adoptChild(null);
      console.info(`win6 adoptChild null success`);
    } catch (e) {
      console.info(`win6 adoptChild null fail: ${JSON.stringify(e)}`);
      AppStorage.SetOrCreate('AdoptChildNull', e.code);
    }

    try {
      this.rootNode?.adoptChild(undefined);
      console.info(`win6 adoptChild undefined success`);
    } catch (e) {
      console.info(`win6 adoptChild undefined fail: ${JSON.stringify(e)}`);
      AppStorage.SetOrCreate('AdoptChildUndefined', e.code);
    }
  }

  removeAdoptedChild() {
    try {
      this.rootNode?.removeAdoptedChild(null);
      console.info(`win6 removeAdoptedChild null success`);
    } catch (e) {
      console.info(`win6 removeAdoptedChild null fail: ${JSON.stringify(e)}`);
      AppStorage.SetOrCreate('RemoveAdoptedChildNull', e.code);
    }

    try {
      this.rootNode?.removeAdoptedChild(undefined);
      console.info(`win6 removeAdoptedChild undefined success`);
    } catch (e) {
      console.info(`win6 removeAdoptedChild undefined fail: ${JSON.stringify(e)}`);
      AppStorage.SetOrCreate('RemoveAdoptedChildUndefined', e.code);
    }
  }
}

@Entry
@Component
struct AdoptChildNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 8 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('100%')
        .height('30%')
      Button(`adoptChild null undefined`)
        .id('btn_adoptChild__null_id')
        .height('10%')
        .width(300)
        .onClick(() => {
          this.myNodeController.adoptChild();
        })
      Button(`removeAdoptedChild null undefined`)
        .id('btn_removeAdoptedChild_null_id')
        .height('10%')
        .width(300)
        .onClick(() => {
          this.myNodeController.removeAdoptedChild();
        })
    }
  }
}