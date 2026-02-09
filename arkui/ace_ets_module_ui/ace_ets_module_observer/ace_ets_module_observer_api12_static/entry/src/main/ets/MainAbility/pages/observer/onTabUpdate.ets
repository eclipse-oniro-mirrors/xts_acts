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
import observer from '@ohos.arkui.observer';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, TextAlign, ClickEvent, ColumnOptions, Scroller, Scroll,
  TabsController, ForEach, Margin, Row, TabContent, Tabs} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'

function callbackFunc(info: observer.TabContentInfo) {
  console.info('tabContentUpdate', JSON.stringify(info));
}

@Entry
@Component
struct callbackFuncTabsExample {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State index1: number = -1

  aboutToAppear(): void {
    observer.onTabContentUpdate(callbackFunc);//master22 导致白屏
  }

  aboutToDisappear(): void {
    observer.offTabContentUpdate(callbackFunc);//master22 导致白屏
  }

  build() {
    Column() {
      Button('changeIndex')
        .id('change_index_1')
        .height('5%')
        .onClick((e: ClickEvent) =>{
          this.currentIndex = 1
        })
      Text('index: ' + this.index1).id('tab_Index_1')
      Tabs({ index: this.currentIndex as int, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green').id('tabContentId_0')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue').id('tabContentId_1')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow').id('tabContentId_2')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar('pink').id('tabContentId_3')
      }
      .width('80%')
      .height('60%')
      .backgroundColor('#F1F3F5')
      .id('tabs_nId')
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false
        }
        return true
      })
      .onChange((index: int) => {
        console.info('onChange index: '+ index)
        this.index1 = index
      })
    }.width('100%')
  }
}