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

function callbackFunc(info: observer.TabContentInfo) {
  console.info('tabContentUpdate', JSON.stringify(info));
  if(info.id) {
    if (info.state == observer.TabContentState.ON_SHOW){
      AppStorage.setOrCreate('Observer_SHOW', 'Show')
    } else if (info.state == observer.TabContentState.ON_HIDE){
      AppStorage.setOrCreate('Observer_HIDE', 'Hide')
    }
  }
}

@Entry
@Component
struct TabsStateExample {
  @State text:string = '1'

  aboutToAppear(): void {
    observer.on('tabContentUpdate', { id: 'tabsId' }, callbackFunc);
  }

  aboutToDisappear(): void {
    observer.off('tabContentUpdate', { id: 'tabsId' }, callbackFunc);
  }

  build() {
    Column() {
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
      .width(360)
      .height(296)
      .backgroundColor('#F1F3F5')
      .id('tabsId')
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false
        }
        return true
      })

      Text(this.text)
        .id('tabs_state')

      Button('getText')
        .id('observer_getState')
        .fontSize(14)
        .onClick(()=>{
          this.text = AppStorage.get('Observer_HIDE') as string + AppStorage.get('Observer_SHOW') as string + ''
        })
    }.width('100%')
  }
}