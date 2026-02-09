/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
@Entry
@Component
struct iconTextTabsExample {
  private controller: TabsController = new TabsController()
  @State currentIndex: number = 0
  @State selectedIndex: number = 0
  @State cachedCount: TabsCacheMode = TabsCacheMode.CACHE_BOTH_SIDE

  build() {
    Column() {
      Text('cachedMaxCount: ' + this.cachedCount )
        .margin(5)
      Button('cachedMaxCount')
        .id('cachedMaxCount_tabs_switched')
        .height('5%')
        .onClick(()=>{
          this.cachedCount = TabsCacheMode.CACHE_LATEST_SWITCHED
        })
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar({ icon: $r('app.media.icon'), text:'green' })
        .id('green_icon_text')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar({ icon: $r('app.media.icon'), text:'pink' })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar({ text:'blue' })

      }
      .id('tabs_icon_text')
      .width('90%')
      .height('60%')
      .edgeEffect(EdgeEffect.Spring)
      .animationMode(AnimationMode.CONTENT_FIRST)
      .cachedMaxCount(2, this.cachedCount)
      .onChange((index: number) => {
        console.log('onChange index:' + index);
        this.currentIndex = index
      })
      .onSelected((index: number) => {
        console.log('onSelected index:' + index);
        this.selectedIndex = index
      })
      .onGestureSwipe((index: number, extraInfo: TabsAnimationEvent) => {
        console.info('onGestureSwipe index: ' + index)
        console.info('onGestureSwipe current offset: ' + extraInfo.currentOffset)
        console.info('onGestureSwipe target offset: ' + extraInfo.targetOffset)
        console.info('onGestureSwipe velocity: ' + extraInfo.velocity)
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: TabsAnimationEvent) => {
        console.info('onAnimationStart index: ' + index)
        console.info('onAnimationStart current offset: ' + extraInfo.currentOffset)
        console.info('onAnimationStart target offset: ' + extraInfo.targetOffset)
        console.info('onAnimationStart velocity: ' + extraInfo.velocity)
        if (index === targetIndex) {
          return
        }
        this.selectedIndex = targetIndex
      })
      .onAnimationEnd((index: number, extraInfo: TabsAnimationEvent) => {
        console.info(index.toString())
        console.info('onAnimationEnd index: ' + index)
        console.info('onAnimationEnd current offset: ' + extraInfo.currentOffset)
        console.info('onAnimationEnd target offset: ' + extraInfo.targetOffset)
        console.info('onAnimationEnd velocity: ' + extraInfo.velocity)
      })

    }.width('100%')
  }
}