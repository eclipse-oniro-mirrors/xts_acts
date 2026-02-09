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
 
@Entry
@Component
struct Tabs_undefined {
  @State text: string = '';
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController();

  build() {
    Column() {
      Button('change:' + this.currentIndex)
        .id('onClick02')
        .onClick(() => {
          this.currentIndex = (this.currentIndex + 1) % 4;
          this.controller.changeIndex(this.currentIndex);
        })
      Text(this.text)
        .id('Text02')
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }.tabBar('green')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }.tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar('yellow')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }.tabBar('pink')
      }
      .width('60%')
      .height('40%')
      .animationDuration(600)
      .animationMode(AnimationMode.ACTION_FIRST_WITH_JUMP )
      .onContentDidScroll(undefined)
      // 监听Tabs页面滑动事件，在该回调中可以实现自定义导航点切换动画等
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        this.text = 'no_ContentDidScroll'
      })

    }.width('100%')
  }
}