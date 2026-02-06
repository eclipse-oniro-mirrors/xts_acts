/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
@Entry
@Component
struct ExcludeFromRenderGroupDemo {
  readonly color1: ResourceColor = '#2787d9';
  readonly color2: ResourceColor = '#ffc000';
  @State myColor: ResourceColor = this.color1;
  @State isExcluded: boolean = false;
  animationCnt: number = 0;

  build() {
    Column() {
      Column({ space: 10 }) {
        Column()
          .width('20%')
          .height('20%')
          .backgroundColor(this.myColor)
          .excludeFromRenderGroup(false)
          .id('space1')
          .onClick(() => {
            this.isExcluded = true; // 在播放动画前，修改节点组剔除属性为true
            this.animationCnt++;
            this.getUIContext().animateTo({
              duration: 600,
              onFinish: () => {
                this.animationCnt--;
                if (this.animationCnt == 0) { // animationCnt变为0表示所有动画都结束
                  this.isExcluded = false; // 在组件动画结束后，组件上不再发生属性变化时，可以重置节点组剔除属性
                }
              }
            }, () => {
              this.myColor = (this.myColor === this.color1) ? this.color2 : this.color1;
            })
          })
        Column()
          .width('20%')
          .height('20%')
          .backgroundColor(this.myColor)
          .excludeFromRenderGroup(true)
          .id('space2')
          .onClick(() => {
            this.isExcluded = true; // 在播放动画前，修改节点组剔除属性为true
            this.animationCnt++;
            this.getUIContext().animateTo({
              duration: 600,
              onFinish: () => {
                this.animationCnt--;
                if (this.animationCnt == 0) { // animationCnt变为0表示所有动画都结束
                  this.isExcluded = false; // 在组件动画结束后，组件上不再发生属性变化时，可以重置节点组剔除属性
                }
              }
            }, () => {
              this.myColor = (this.myColor === this.color1) ? this.color2 : this.color1;
            })
          })
        Column()
          .width('20%')
          .height('20%')
          .backgroundColor(this.myColor)
          .excludeFromRenderGroup(undefined)
          .id('space3')
          .onClick(() => {
            this.isExcluded = true; // 在播放动画前，修改节点组剔除属性为true
            this.animationCnt++;
            this.getUIContext().animateTo({
              duration: 600,
              onFinish: () => {
                this.animationCnt--;
                if (this.animationCnt == 0) { // animationCnt变为0表示所有动画都结束
                  this.isExcluded = false; // 在组件动画结束后，组件上不再发生属性变化时，可以重置节点组剔除属性
                }
              }
            }, () => {
              this.myColor = (this.myColor === this.color1) ? this.color2 : this.color1;
            })
          })
      }.renderGroup(true)
      .width('100%')
      .height('70%')
    }
    .height('100%')
    .width('100%')
  }
}