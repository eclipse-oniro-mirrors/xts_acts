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
        { duration: 3000, curve: Curve.Linear, iterations: -1 });

      let ret1: boolean = this.rootNode.createAnimation(null, [0, 0, 0], [0, 0, 360],
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 1 success:' + ret1);
      AppStorage.SetOrCreate('createAnimation1Null', ret1);

      let ret2: boolean = this.rootNode.createAnimation(undefined, [0, 0, 0], [0, 0, 360],
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 2 success:' + ret2);
      AppStorage.SetOrCreate('createAnimation2Null', ret2);

      let ret3: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, null, [0, 0, 360],
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 3 success:' + ret3);
      AppStorage.SetOrCreate('createAnimation3Null', ret3);

      let ret4: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, undefined, [0, 0, 360],
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 4 success:' + ret4);
      AppStorage.SetOrCreate('createAnimation4Null', ret4);

      let ret5: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], null,
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 5 success:' + ret5);
      AppStorage.SetOrCreate('createAnimation5Null', ret5);

      let ret6: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], undefined,
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 6 success:' + ret6);
      AppStorage.SetOrCreate('createAnimation6Null', ret6);

      let ret7: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], [0, 0, 360], null);
      console.info('createAnimation null 7 success:' + ret7);
      AppStorage.SetOrCreate('createAnimation7Null', ret7);

      let ret8: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], [0, 0, 360], undefined);
      console.info('createAnimation null 8 success:' + ret8);
      AppStorage.SetOrCreate('createAnimation8Null', ret8);

      let ret9: boolean = this.rootNode.createAnimation(AnimationPropertyType.ROTATION, [0, 0, 0], [],
        { duration: 3000, curve: Curve.Linear, iterations: -1 });
      console.info('createAnimation null 9 success:' + ret9);
      AppStorage.SetOrCreate('createAnimation9Null', ret9);

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

      let ret1: boolean = this.rootNode.cancelAnimations(null);
      let ret2: boolean = this.rootNode.cancelAnimations(undefined);
      let ret3: boolean = this.rootNode.cancelAnimations([]);

      console.info('cancelAnimations null 1 success:' + ret1);
      console.info('cancelAnimations null 2 success:' + ret2);
      console.info('cancelAnimations null 3 success:' + ret3);

      AppStorage.SetOrCreate('cancelAnimations1Null', ret1);
      AppStorage.SetOrCreate('cancelAnimations2Null', ret2);
      AppStorage.SetOrCreate('cancelAnimations3Null', ret3);
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
      this.cancelAnimation(1);
    });
    return this.rootNode;
  }
}

@Entry
@Component
struct CreateAnimationNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .id('btn_cancelAnimation_id')
    }.width('100%')
  }
}