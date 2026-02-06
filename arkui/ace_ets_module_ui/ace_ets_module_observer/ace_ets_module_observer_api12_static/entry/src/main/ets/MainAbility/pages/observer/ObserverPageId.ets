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
import observer  from '@ohos.arkui.observer';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions, NavPathStack} from '@ohos.arkui.component'
import { State, Link, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct ObserverPageId {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State pageIdValue: string | undefined = ''

  testFunc(info: observer.RouterPageInfo) {
    if (info) {
      AppStorage.setOrCreate<string>('Observer_pageId', info.pageId)
    }
  }

  aboutToAppear(): void {
    observer.onRouterPageUpdate( this.getUIContext(), this.testFunc)
  }

  aboutToDisappear(): void {
    observer.offRouterPageUpdate( this.getUIContext(), this.testFunc)
  }


  build() {
    Column({space:5} as ColumnOptions){
      Text(this.str).id('ObserverPageId_text1')
      Text(this.pageIdValue).id('ObserverPageId_text2')

      Button('get pageId')
        .fontSize(14)
        .onClick((e: ClickEvent) => {
          this.str = AppStorage.get<string>('Observer_pageId') + ''
        })
        .id('ObserverPageId_getPageId')

      CustomCom({pageIdValue: this.pageIdValue} )
    }
  }
}


@Component
struct CustomCom {
  pageInfo: observer.RouterPageInfo | undefined
  @Link pageIdValue: string | undefined;

  aboutToAppear() {
    this.pageInfo  = this.queryRouterPageInfo();  //获取不到pageIde 是空的
    console.log('++++++++++++++++++++this.pageInfo',this.pageInfo )
    this.pageIdValue = this.pageInfo?.pageId
  }

  build() {
    Column(){
      Text('queryRouterPageInfo')
    }.width('100%')
  }
}