/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { FrameNode, NodeController, BuilderNode, UIContext} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}

@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  public childrenCount: number = 0;
  private uiContext: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 100, height: 50 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 100, height: 100 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }

  createUIContextWithoutWindow(): string {
    let resultStr: string = '';
    let uiContext : UIContext | undefined = globalThis.uiContext;
    let context : common.UIAbilityContext = this.uiContext?.getHostContext() as common.UIAbilityContext;
    try {
      uiContext = UIContext.createUIContextWithoutWindow(context);
      console.log('sally----- content1',JSON.stringify(uiContext)) //{"instanceId_":900000}
      resultStr = JSON.stringify(uiContext);
    } catch (e) {
      resultStr = (e as BusinessError).code + '';
    }
    return resultStr
  }

  createUIContextWithoutWindow401(): string {
    let errorStr: string = '';
    try {
      UIContext.createUIContextWithoutWindow(null);
    } catch (e) {
      errorStr = (e as BusinessError).code + '';
    }
    return errorStr
  }

  destroyUIContextWithoutWindow(): string {
    let resultStr: string = '';
    UIContext.destroyUIContextWithoutWindow();
    resultStr = 'UIContext destroyed'
    return resultStr;
  }
}

@Entry
@Component
struct UIContextWithoutWindowTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State createStr: string = '5';
  @State errorStr: string = '1';
  @State destroyStr: string = '9';

  build() {
    Column() {
      NodeContainer(this.myNodeController).height('30%')
      Text(`${this.createStr}`).height('5%').id('create_str_id')
      Text(`${this.errorStr}`).height('5%').id('check_str_id')
      Text(`${this.destroyStr}`).height('5%').id('destroy_str_id')
      Button('create UIContext').height('5%')
        .id('create_context_id')
        .onClick(() => {
          this.createStr = this.myNodeController.createUIContextWithoutWindow();
        })
      Button('checkError').height('5%')
        .id('check_error_id')
        .onClick(() => {
          this.errorStr = this.myNodeController.createUIContextWithoutWindow401();
        })
      Button('destroy UIContext').height('5%')
        .id('destroy_context_id')
        .onClick(() => {
          this.destroyStr = this.myNodeController.destroyUIContextWithoutWindow();
        })
    }
    .height('100%')
  }
}