'use static';
/*
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
  Margin,
  TabsController,
  Column,
  Text,
  Tabs,
  Button,
  BarPosition,
  TabContent,
  BarMode,
  ClickEvent,
  FlexAlign,
  Builder
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TabsExampleApi14 {
  @State currentIndex: int = 0
  @State clickedContent: string = "";
  private controller: TabsController = new TabsController()

  @Builder tabBuilder(title: string,targetIndex: number) {
    Column(){
      Text(title).fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
  build() {
    Column() {
      Text(this.currentIndex + "").key("currentIndex14x")

      Text(this.clickedContent).margin({ top: 5 } as Margin).key("onTabBarClick14x")

      Tabs({ barPosition: BarPosition.End, controller: this.controller, index: this.currentIndex }) {
        TabContent() {
          Column() {
            Text('首页的内容')
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#00CB87')
          .justifyContent(FlexAlign.Center)
          .key("contentI01")
        } .tabBar(() => {this.tabBuilder('首页',0)})

        TabContent() {
          Column() {
            Text('发现的内容')
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#007DFF')
          .justifyContent(FlexAlign.Center)
          .key("contentI02")
        } .tabBar(() => {this.tabBuilder('发现',1)})

        TabContent() {
          Column() {
            Text('推荐的内容')
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#FFBF00')
          .justifyContent(FlexAlign.Center)
          .key("contentI03")
        } .tabBar(() => {this.tabBuilder('推荐',2)})

        TabContent() {
          Column() {
            Text('我的内容')
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#E67C92')
          .justifyContent(FlexAlign.Center)
          .key("contentI04")
        } .tabBar(() => {this.tabBuilder('我的',3)})

        TabContent() {
          Column() {
            Text('党史1949')
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#E67C92')
          .justifyContent(FlexAlign.Center)
          .key("contentI05")
        } .tabBar(() => {this.tabBuilder('党史1949',3)})
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(60)
      .animationDuration(0)
      .onChange((index: int): void => {
        this.currentIndex = index
      })
      .width('90%')
      .height('60%')
      .backgroundColor('#F1F3F5')
      .scrollable(true)
      .onContentWillChange((currentIndex: int, comingIndex: int): boolean => {
        this.currentIndex = currentIndex
        if (comingIndex == 3) {
          return false
        }
        return true
      })
      .onTabBarClick((index: int): void => {
        this.clickedContent = index + "";
      })

      Button('动态修改index').width('50%')
        .onClick((e: ClickEvent) => {
          this.currentIndex = (this.currentIndex + 1) % 4
        })

      Button('changeIndex').width('50%')
        .onClick((e: ClickEvent) => {
          this.currentIndex = (this.currentIndex + 1) % 4
          this.controller.changeIndex(this.currentIndex)
        })
    }.width('100%')
  }
}