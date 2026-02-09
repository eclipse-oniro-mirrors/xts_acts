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
import { State, AppStorage } from '@ohos.arkui.stateManagement'

function callbackFunc(info: observer.TabContentInfo) {
  if(info.id) {
    if (info.state == observer.TabContentState.ON_SHOW){
      AppStorage.setOrCreate<string>('Observer_SHOW', 'Show')
    } else if (info.state == observer.TabContentState.ON_HIDE){
      AppStorage.setOrCreate<string>('Observer_HIDE', 'Hide')
    }
  }
}

@Entry
@Component
struct TabsStateExample {
  @State text:string = '1'

  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.onTabContentUpdate({ id: 'tabsId' }, callbackFunc);
  }

  aboutToDisappear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.onTabContentUpdate( { id: 'tabsId' }, callbackFunc);
  }

  build() {
    Column() {
      Text(this.text)
        .id('tabs_state')

      Button('getText')
        .id('observer_getState')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          let text1=AppStorage.get<string>('Observer_HIDE')
          let text2=AppStorage.get<string>('Observer_SHOW')
          this.text =`${text1}${text2}`
          console.log('+++++++++++++++++++++++++++++4 ' + this.text)
        })
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green').id('tabContentId1')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue').id('tabContentId2')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow').id('tabContentId3')

      }
      .width('90%')
      .height('60%')
      .backgroundColor('#F1F3F5')
      .id('tabsId')
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false
        }
        return true
      })

    }.width('100%')
  }
}