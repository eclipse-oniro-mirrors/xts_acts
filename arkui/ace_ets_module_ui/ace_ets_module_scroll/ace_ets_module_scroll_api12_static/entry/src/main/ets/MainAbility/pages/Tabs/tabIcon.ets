'use static';
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  BottomTabBarStyle,
  Text,
  Tabs,
  BarPosition,
  TabContent,
  BarMode,
  Color,
  $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TabIconStyleExample {
  @State message1: string = 'message1'
  @State message2: string = 'message2'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message1).id('tabIcon_mess1')
      Text(this.message2).id('tabIcon_mess2')

      Column() {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.id('tabBar_iconStyle')
          .tabBar(new BottomTabBarStyle($r("sys.media.ohos_app_icon"), 'pink')
            .labelStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
            .iconStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
          )
          .onWillShow((): void => {
            console.info("Pink will show")
          })
          .onWillHide((): void => {
            this.message1 = 'onWillHide'
            console.info("Pink will hide")
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Yellow)
          }.tabBar(new BottomTabBarStyle($r("sys.media.ohos_app_icon"), 'Yellow')
            .labelStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
            .iconStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
          )
          .onWillShow((): void => {
            this.message2 = 'onWillShow'
            console.info("Yellow will show")
          })
          .onWillHide((): void => {
            console.info("Yellow will hide")
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar(new BottomTabBarStyle($r("sys.media.ohos_app_icon"), 'Blue')
            .labelStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
            .iconStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
          )
          .onWillShow((): void => {
            console.info("Blue will show")
          })
          .onWillHide((): void => {
            console.info("Blue will hide")
          })

          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar(new BottomTabBarStyle($r("sys.media.ohos_app_icon"), 'Green')
            .labelStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
            .iconStyle({ unselectedColor: Color.Red, selectedColor: Color.Green })
          )
          .onWillShow((): void => {
            console.info("Green will show")
          })
          .onWillHide((): void => {
            console.info("Green will hide")
          })
        }
        .id('tabs_iconStyle')
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .onChange((index: int): void => {
          console.info(index.toString())
        })
        .width('100%')
        .backgroundColor(0xF1F3F5)
      }.width('100%').height(250)
    }
  }
}