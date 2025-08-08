/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import observer from '@ohos.arkui.observer';

@Entry
@Component
struct observerIndexTabsExample {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State index1: number = -1

  build() {
    Column() {
      Row(){
        Button('observer on')
          .id('observer_tabs_on')
          .height('5%')
          .onClick(()=>{
            observer.on('tabContentUpdate', { id: 'tabsIdIndex' }, (info: observer.TabContentInfo) => {
              this.index1 = info.index
              console.info('on tabContentUpdate', JSON.stringify(info));
              console.info('on tabContentUpdate id', JSON.stringify(info.id));
              console.info('on tabContentUpdate uniqueId', JSON.stringify(info.uniqueId));
              console.info('on tabContentUpdate tabContentId', JSON.stringify(info.tabContentId));
              console.info('on tabContentUpdate with id', JSON.stringify(info.tabContentUniqueId));
              console.info('on tabContentUpdate with id', JSON.stringify(info.state));
              console.info('on tabContentUpdate with id', JSON.stringify(info.index));
            })
          })
        Button('observer off')
          .id('observer_tabs_off')
          .height('5%')
          .onClick(()=>{
            observer.off('tabContentUpdate', { id: 'tabsIdIndex' }, (info: observer.TabContentInfo) => {
              console.info('off tabContentUpdate with id', JSON.stringify(info));
            })
          })
      }
      Text('index: ' + this.index1).id('tabs_tabIndex')

      Button('index=1')
        .id('change_index_obs')
        .height('5%')
        .onClick(()=>{
          this.currentIndex = 1
        })
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
      .id('tabsIdIndex')
      .width('90%')
      .height('60%')
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
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}