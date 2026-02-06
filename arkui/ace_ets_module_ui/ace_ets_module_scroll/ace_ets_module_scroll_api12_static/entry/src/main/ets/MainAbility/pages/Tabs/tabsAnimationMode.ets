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
  TabsController,
  Text,
  Divider,
  Tabs,
  BarPosition,
  TabContent,
  BarMode,
  AnimationMode,
  Builder,
  Margin
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct animationModeTabs {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: int = 0
  private controller: TabsController = new TabsController()

  @Builder tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Column() {
        Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          } //.tabBar(this.tabBuilder(0, 'green'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          } //.tabBar(this.tabBuilder(1, 'blue'))
        }
        .id('animationMode_1')
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth(360)
        .barHeight(56)
        .animationDuration(400)
        .onChange((index: int): void => {
          this.currentIndex = index
        })
        .animationMode(AnimationMode.CONTENT_FIRST)
        .width(360)
        .height('30%')
        .backgroundColor('#F1F3F5')
      }

      Column() {
        Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          } //.tabBar(this.tabBuilder(0, 'green'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          } //.tabBar(this.tabBuilder(1, 'blue'))
        }
        .id('animationMode_2')
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth(360)
        .barHeight(56)
        .animationDuration(400)
        .onChange((index: int): void => {
          this.currentIndex = index
        })
        .animationMode(AnimationMode.ACTION_FIRST)
        .width(360)
        .height('30%')
        .margin(10)
        .backgroundColor('#F1F3F5')
      }

      Column() {
        Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          } //.tabBar(this.tabBuilder(0, 'green'))

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          } //.tabBar(this.tabBuilder(1, 'blue'))
        }
        .id('animationMode_3')
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth(360)
        .barHeight(56)
        .animationDuration(400)
        .onChange((index: int): void => {
          this.currentIndex = index
        })
        .animationMode(AnimationMode.NO_ANIMATION)
        .width(360)
        .height('30%')
        .backgroundColor('#F1F3F5')
      }
    }.width('100%')
  }
}