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
import { typeNode, FrameNode, NodeController, BuilderNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
struct TestComponent {
  build() {
    Swiper() {
      Text('Swiper')
        .fontSize(18)
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
  private uiContext: UIContext | null = null;
  private swiperController: SwiperController = new SwiperController()

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 50 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 50 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }

  bindControllerSwiper10023(): string {
    let errorSwiper100023: string = '';
    let textNode = typeNode.createNode(this.uiContext, 'Text');
    try {
      typeNode.bindController(textNode, this.swiperController, 'Swiper');
    } catch (e) {
      errorSwiper100023 =  'Error: ' + (e as BusinessError).code;
    }
    return errorSwiper100023
  }

  bindControllerSwiper100021(): string {
    let errorSwiper100021: string = '';
    try {
      typeNode.bindController(this.builderNode?.getFrameNode()?.getFirstChild(), this.swiperController, 'Swiper');
    } catch (e) {
      errorSwiper100021 = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorSwiper100021
  }
}

@Entry
@Component
struct BindControllerSwiperTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorSwiper100023: string = 'Swiper';
  @State errorSwiper100021: string = 'Swiper';

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
      Text(`${this.errorSwiper100023}`).id('error_swiper_100023')
      Text(`${this.errorSwiper100021}`).id('error_swiper_100021')
      Button('Swiper checkError 100023')
        .id('swiper_btn_100023')
        .onClick(() => {
          this.errorSwiper100023 = this.myNodeController.bindControllerSwiper10023();
        })
      Button('Swiper checkError 100021')
        .id('swiper_btn_100021')
        .onClick(() => {
          this.errorSwiper100021 = this.myNodeController.bindControllerSwiper100021();
        })
    }
    .width('90%')
  }
}