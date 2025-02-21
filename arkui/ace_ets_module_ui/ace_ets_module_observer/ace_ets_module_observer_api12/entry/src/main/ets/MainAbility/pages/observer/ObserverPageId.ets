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
import observer  from '@ohos.arkui.observer';

@Entry
@Component
struct ObserverPageId {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State pageIdValue: string | undefined = ''

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate('Observer_pageId', info.pageId)
    }
  }

  aboutToAppear(): void {
    observer.on('routerPageUpdate', this.getUIContext(), this.testFunc)
  }

  aboutToDisappear(): void {
    observer.off('routerPageUpdate', this.getUIContext(), this.testFunc)
  }


  build() {
    Column({space:5}){
      Text(this.str).id('ObserverPageId_text1')
      Text(this.pageIdValue).id('ObserverPageId_text2')

      Button('get pageId')
        .fontSize(14)
        .onClick(() => {
          this.str = AppStorage.get('Observer_pageId') + ''
        })
        .id('ObserverPageId_getPageId')

      CustomCom({pageIdValue: this.pageIdValue})
    }
  }
}


@Component
struct CustomCom {
  pageInfo: observer.RouterPageInfo | undefined
  @Link pageIdValue: string | undefined;

  aboutToAppear() {
    this.pageInfo  = this.queryRouterPageInfo();
    this.pageIdValue = this.pageInfo?.pageId
  }

  build() {
    Column(){
      Text('queryRouterPageInfo')
    }.width('100%')
  }
}