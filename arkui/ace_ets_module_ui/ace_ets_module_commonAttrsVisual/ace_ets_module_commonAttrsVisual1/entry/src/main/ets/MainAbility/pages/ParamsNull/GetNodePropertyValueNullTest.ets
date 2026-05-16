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

import { FrameNode, NodeController, UIContext } from '@kit.ArkUI';

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private isRunning: boolean = false; // 表示节点上动画是否在运行

  private startInitAnimation() {
    if (this.rootNode) {
      let result: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], [0, 0, 360],
        { duration: 3000, curve: Curve.Linear, iterations: -1 }); // 创建动画，第一次创建时显式指定初值，旋转角从[0,0,0]变成[0,0,360]，无限循环
      if (result) {
        this.isRunning = true;
      } else {
        console.warn('create rotation animation failed');
      }
    }
  }

  cancelAnimation(cnt: number) {
    if (this.rootNode && this.isRunning) {
      let result: boolean = this.rootNode.cancelAnimations([AnimationPropertyType.ROTATION]);
      if (result) {
        this.isRunning = false;
      } else {
        console.warn('cancel rotation animation failed');
        if (cnt < 2) { // cnt为尝试取消的次数
          // 如果取消失败，500ms后再次尝试取消
          setTimeout(() => {
            this.cancelAnimation(cnt + 1);
          }, 500);
        }
      }
    }
  }

  continueAnimation() {
    if (this.rootNode && !this.isRunning) {
      let ret: number[] = this.rootNode.getNodePropertyValue(AnimationPropertyType.ROTATION);
      console.info('getNodePropertyValue undefined 1 success：' + ret.length);
      AppStorage.SetOrCreate('getNodePropertyValue1', ret.length);

      let ret1: number[] = this.rootNode.getNodePropertyValue(null);
      console.info('getNodePropertyValue null 2 success：' + ret1.length);
      AppStorage.SetOrCreate('getNodePropertyValueNull', ret1.length);

      let ret2: number[] = this.rootNode.getNodePropertyValue(undefined);
      console.info('getNodePropertyValue undefined 3 success：' + ret2.length);
      AppStorage.SetOrCreate('getNodePropertyValueUndefined', ret2.length);
    }
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode) {
      return this.rootNode;
    }
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Blue); // 设置节点属性
    this.startInitAnimation();
    this.rootNode.commonEvent.setOnClick(() => {
      if (this.isRunning) {
        this.cancelAnimation(1);
      } else {
        this.continueAnimation();
      }
    });
    return this.rootNode;
  }
}

@Entry
@Component
struct GetNodePropertyValueIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .id('btn_getNodePropertyValue_id')
    }.width('100%').padding({ top: 50 })
  }
}