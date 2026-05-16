/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { uiObserver } from '@kit.ArkUI';

function callbackFunc(info: uiObserver.TabContentInfo) {
  console.info('tabContentUpdate', JSON.stringify(info));
  console.info('tabContentUpdate id', JSON.stringify(info.id));
  console.info('tabContentUpdate uniqueId', JSON.stringify(info.uniqueId));
  console.info('tabContentUpdate tabContentId', JSON.stringify(info.tabContentId));
  console.info('tabContentUpdate tabContentUniqueId', JSON.stringify(info.tabContentUniqueId));
  console.info('tabContentUpdate index', JSON.stringify(info.index));
  console.info('tabContentUpdate state', JSON.stringify(info.state));
}

@Entry
@Component
struct TabsUIOptionsExample {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  @State index1:number = -1

  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.on('tabContentUpdate', { id: 'tabsId_uiUpdate' }, callbackFunc);
  }

  aboutToDisappear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.off('tabContentUpdate', { id: 'tabsId_uiUpdate' }, callbackFunc);
  }

  build() {
    Column() {
      Button('index=1')
        .id('change_index_uiId')
        .height('5%')
        .onClick(()=>{
          this.currentIndex = 1
        })
      Text('index: ' + this.index1).id('text_index_uiId')
      Tabs({ index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar('green').id('tabContentId0')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar('blue').id('tabContentId1')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar('yellow').id('tabContentId2')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar('pink').id('tabContentId3')
      }
      .width('90%')
      .height('60%')
      .backgroundColor('#F1F3F5')
      .id('tabsId_uiUpdate')
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false
        }
        return true
      })
      .onChange((index: number) => {
        console.info('onChange index: '+ index)
        this.index1 = index
      })
    }.width('100%')
  }
}