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
@Entry
@Component
struct tabsOpacityExample {
  private controller: TabsController = new TabsController()

  build() {
    Column({ space: 2 }) {
      Button('setTabBarTranslate')
        .id('bar_translate')
        .onClick(() => {
          this.controller.setTabBarTranslate({ x: -10, y: -20 })
        })

      Button('setTabBarOpacity')
        .id('bar_opacity')
        .onClick(() => {
          this.controller.setTabBarOpacity(0.5)
        })

      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(BottomTabBarStyle.of($r('app.media.icon'), 'green'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar(BottomTabBarStyle.of($r('app.media.icon'), 'pink'))
        .id('tabContent_bar_2')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(BottomTabBarStyle.of($r('app.media.icon'), 'yellow'))

      }
      .width('90%')
      .height('50%')
      .barBackgroundColor('#F1F3F5')
    }
    .width('100%')
    .height('100%')
  }
}