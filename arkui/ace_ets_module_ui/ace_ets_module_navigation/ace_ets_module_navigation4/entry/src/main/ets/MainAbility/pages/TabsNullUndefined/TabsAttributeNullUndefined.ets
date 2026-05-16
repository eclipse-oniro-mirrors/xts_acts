/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TabsAttributeNullUndefined {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Column({ space: 5 }) {
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'pink')
          )
          .onWillShow(() => {
            console.info('Pink will show')
          })
          .onWillHide(() => {
            console.info('Pink will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Yellow')
          )
          .onWillShow(() => {
            console.info('Yellow will show')
          })
          .onWillHide(() => {
            console.info('Yellow will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
        }
        .vertical(false)
        .scrollable(true)
        .id('tabs0Id')
      }
      .width('100%')
      .height('30%')
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'pink')
          )
          .onWillShow(() => {
            console.info('Pink will show')
          })
          .onWillHide(() => {
            console.info('Pink will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Yellow')
          )
          .onWillShow(() => {
            console.info('Yellow will show')
          })
          .onWillHide(() => {
            console.info('Yellow will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
        }
        .vertical(false)
        .scrollable(true)
        .barMode(null)
        .barMode(null, null)
        .barMode(null, {
          nonScrollableLayoutStyle: LayoutStyle.SPACE_BETWEEN_OR_CENTER
        })
        .barWidth(null)
        .barHeight(null)
        .barHeight(null, undefined)
        .animationCurve(null)
        .animationDuration(null)
        .animationMode(null)
        .edgeEffect(null)
        .divider(null)
        .barBackgroundColor(null)
        .barGridAlign(null)
        .barBackgroundBlurStyle(null, undefined)
        .pageFlipMode(null)
        .barBackgroundBlurStyle(null)
        .barBackgroundEffect(null)
        .cachedMaxCount(null, TabsCacheMode.CACHE_LATEST_SWITCHED)
        .onContentDidScroll(null)
        .backgroundColor(0xF1F3F5)
        .id('tabs1Id')
      }
      .width('100%')
      .height('30%')
      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'pink')
          )
          .onWillShow(() => {
            console.info('Pink will show')
          })
          .onWillHide(() => {
            console.info('Pink will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Yellow')
          )
          .onWillShow(() => {
            console.info('Yellow will show')
          })
          .onWillHide(() => {
            console.info('Yellow will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
        }
        .vertical(false)
        .scrollable(true)
        .barMode(undefined)
        .barMode(undefined, undefined)
        .barMode(undefined, {
          nonScrollableLayoutStyle: LayoutStyle.ALWAYS_AVERAGE_SPLIT
        })
        .barWidth(undefined)
        .barHeight(undefined)
        .barHeight(undefined, null)
        .animationCurve(undefined)
        .animationDuration(undefined)
        .animationMode(undefined)
        .edgeEffect(undefined)
        .divider(undefined)
        .barBackgroundColor(undefined)
        .barGridAlign(undefined)
        .barBackgroundBlurStyle(undefined, null)
        .pageFlipMode(undefined)
        .barBackgroundBlurStyle(undefined)
        .barBackgroundEffect(undefined)
        .cachedMaxCount(undefined, TabsCacheMode.CACHE_BOTH_SIDE)
        .onContentDidScroll(undefined)
        .width('100%')
        .id('tabs2Id')
      }
      .width('100%')
      .height('30%')
    }.width('100%')
    .height('100%')
  }
}