/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct KeyframeDemo {
  @State myScale: number = 1.0;
  @State message: string = 'hello';
  @State DragPreviewMode1: DragPreviewMode = DragPreviewMode.DISABLE_SCALE
  uiContext: UIContext | undefined = undefined;
  aboutToAppear() {
    this.uiContext = this.getUIContext?.();
  }
  build() {
    Column() {
      Text('message:'+`${this.message}`).key('keyframe_0')
      Circle()
        .key('keyframe_1')
        .width(100)
        .height(100)
        .fill("#46B1E3")
        .margin(100)
        .scale({ x: this.myScale, y: this.myScale })
        .onClick(() => {
          if (!this.uiContext) {
            console.info("no uiContext, keyframe failed");
            return;
          }
          this.myScale = 1;
          this.uiContext.keyframeAnimateTo({ iterations: 3 }, [
            {
              duration: 800,
              event: () => {
                this.myScale = 1.5;
                this.message = 'world'
              }
            },
            {
              duration: 500,
              event: () => {
                this.myScale = 1;
              }
            }
          ]);
        })
    }.width('100%').margin({ top: 5 })
  }
}