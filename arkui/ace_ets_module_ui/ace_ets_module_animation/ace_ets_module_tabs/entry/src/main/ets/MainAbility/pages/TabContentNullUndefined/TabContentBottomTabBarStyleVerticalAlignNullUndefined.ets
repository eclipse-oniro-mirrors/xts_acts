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
struct TabBarStyleBottomTabBarStyleVerticalAlignTest {
  build() {
    Column({ space: 5 }) {
      Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .id('tabContentBottomTabBarStyleVerticalAlignDefault')
          .tabBar(new BottomTabBarStyle('app.media.icon','pink'))
        }
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }.width('100%').height(200)

      Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .id('tabContentBottomTabBarStyleVerticalAlignUndefined')
          .tabBar(new BottomTabBarStyle('app.media.icon','pink')
            .verticalAlign(undefined)
          )
        }
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }.width('100%').height(200)

       Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .id('tabContentBottomTabBarStyleVerticalAlignNull')
          .tabBar(new BottomTabBarStyle('app.media.icon','pink')
            .verticalAlign(null)
          )
        }
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }.width('100%').height(200)
    }.margin({ top: 30 })
  }
}