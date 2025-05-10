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
struct tabsCallBack3Example {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State message1: string = 'tabs: '

  build() {
    Column({ space: 5 }) {
      Text(this.message1).id('tabs_callback_3')
        .width('90%')
        .height('15%')

      Column() {
        Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }
          .tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'pink')
          )
          .onWillShow(() => {
            this.message1 +='onWillShow1-'
            console.info('Pink will show')
          })
          .onWillHide(() => {
            this.message1 +='onWillHide1-'
            console.info('Pink will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Yellow')
          )
          .onWillShow(() => {
            this.message1 +='onWillShow2-'
            console.info('Yellow will show')
          })
          .onWillHide(() => {
            this.message1 +='onWillHide2-'
            console.info('Yellow will hide')
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
        }
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .onChange((index: number) => {
          this.message1 +='onChange-'
          console.info(index.toString())
        })
        .onTabBarClick((index: number) => {
          this.message1 +='onTabBarClick-'
          console.info('onTabBarClick index: ' + index)
        })
        .onContentWillChange((currentIndex, comingIndex) => {
          if (comingIndex == 2) {
            return false
          }
          this.message1 +='onContentWillChange-'
          return true
        })
        .onAnimationStart((index: number) => {
          this.message1 +='onAnimationStart-'
          console.info(index.toString())
        })
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }
      .width('100%')
      .height('40%')

      Button('changeIndex')
        .id('tabs_callback_index_3')
        .width('50%')
        .margin(5)
        .onClick(()=>{
          this.controller.changeIndex(1)
        })

    }.width('100%')
    .height('100%')
  }
}