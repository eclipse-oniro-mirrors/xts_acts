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
import observer from '@ohos.arkui.observer';

@Entry
@Component
struct observerTabsExample {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State uniqueId: number = 0
  @State uniqueId1: number = 0
  @State text1:string = '1'

  build() {
    Column() {
      Tabs({ index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green').id('tabContent01')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue').id('tabContent02')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow').id('tabContent03')
      }
      .id('tabsId2')
      .width(360)
      .height(296)
      .backgroundColor('#F1F3F5')
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false
        }
        return true
      })
      .onChange((index: number) => {
        console.info('onChange index: '+ index)
        this.currentIndex = index
      })

      Row(){
        Button('observer on')
          .id('observer_tabOn')
          .onClick(()=>{
            observer.on('tabContentUpdate', { id: 'tabsId2' }, (info: observer.TabContentInfo) => {
              this.uniqueId = info.uniqueId
              this.uniqueId1 = info.tabContentUniqueId
              this.text1 = info.tabContentId
              console.info('on tabContentUpdate with id', JSON.stringify(info));
            })
          })
          Button('observer off')
            .id('observer_tabOff')
            .onClick(()=>{
              observer.off('tabContentUpdate', { id: 'tabsId2' }, (info: observer.TabContentInfo) => {
                console.info('off tabContentUpdate with id', JSON.stringify(info));
              })
          })
      }

      Text('uniqueId: ' + this.uniqueId).id('tabs_uniqueId')

      Text('tabContentUniqueId: ' + this.uniqueId1).id('tabs_tabUniqueId')

      Text('tabContentId: ' + this.text1).id('tabs_tabContentId')

      Button('index=1')
      .id('change_index')
      .onClick(()=>{
        this.currentIndex = 1
      })
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}