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

import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

// 继承NodeController实现自定义Swiper控制器
class MySwiperController extends NodeController {
  public swiperController: SwiperController = new SwiperController()

  makeNode(uiContext: UIContext): FrameNode | null {
    // 创建Swiper
    let swiperNode = typeNode.createNode(uiContext, 'Swiper')

    // 创建Text
    let text0 = typeNode.createNode(uiContext, 'Text')
    text0.initialize('0')
      .width('100%')
      .height('100%')
      .textAlign(TextAlign.Center)
    // 向swiper添加text0
    swiperNode.appendChild(text0)
    // 创建另一个Text用于切换
    let text1 = typeNode.createNode(uiContext, 'Text')
    text1.initialize('1')
      .width('100%')
      .height('100%')
      .textAlign(TextAlign.Center)
    // 向swiper添加text1
    swiperNode.appendChild(text1)
    swiperNode.commonAttribute.width('100%')
      .height('20%')
      .backgroundColor(0xAFEEEE)

    try {
      typeNode.bindController(null, this.swiperController, 'Swiper');
    } catch (e) {
      console.info('bindController null 1 success：' + e.code);
      AppStorage.SetOrCreate('bindController1Null', e.code);
    }

    try {
      typeNode.bindController(swiperNode, null, 'Swiper');
    } catch (e) {
      console.info('bindController null 2 success：' + e.code);
      AppStorage.SetOrCreate('bindController2Null', e.code);
    }

    try {
      typeNode.bindController(undefined, this.swiperController, 'Swiper');
    } catch (e) {
      console.info('bindController undefined 1 success：' + e.code);
      AppStorage.SetOrCreate('bindController1Undefined', e.code);
    }

    try {
      typeNode.bindController(swiperNode, undefined, 'Swiper');
    } catch (e) {
      console.info('bindController undefined 2 success：' + e.code);
      AppStorage.SetOrCreate('bindController2Undefined', e.code);
    }

    typeNode.bindController(swiperNode, this.swiperController, 'Swiper');
    typeNode.getAttribute(swiperNode, 'Swiper')?.loop(false);
    return swiperNode;
  }
}

@Entry
@Component
struct BindControllerNullIndex {
  private mySwiperController: MySwiperController = new MySwiperController();

  build() {
    Column({ space: 5 }) {
      NodeContainer(this.mySwiperController);
    }.width('100%')
  }
}