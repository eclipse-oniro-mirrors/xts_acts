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
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions, NavPathStack, Builder, NavDestination, NavPathInfo,
  NavDestinationContext, Navigation } from '@ohos.arkui.component'
import { State, AppStorage, Link } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ObserverApi1 {
  @State str:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State navIdValue: string | undefined = ''
  @State navDestinationParamValue: string | undefined = ''

  aboutToAppear() {
    let uniqueId: number = this.getUniqueId();
  }

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions ) {
        CustomCom({navIdValue:this.navIdValue, navDestinationParamValue:this.navDestinationParamValue})
      }
    }.title('pageOne')
    .onReady((context: NavDestinationContext) => {
      if(context){
        this.str = String(context.navDestinationId)
      }
    })
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({space:5} as ColumnOptions){
      Text(this.navIdValue).id('ObserverApi1_text1')
      Text(this.navDestinationParamValue).id('ObserverApi1_text2')

      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {

          Button('pushPath pageOne' ,)
            .onClick((e: ClickEvent) => {
              this.pageInfos.pushPath(new NavPathInfo('pageOne', 'mes'))
            })
            .id('ObserverApi1_btn1')
        }
      }
      .id('ObserverApi1_navId')
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}


@Component
struct CustomCom {
  navInfo: observer.NavigationInfo | undefined
  @Link navIdValue: string | undefined;

  navDesInfo: observer.NavDestinationInfo | undefined
  @Link navDestinationParamValue: string | undefined;

  aboutToAppear() {
    this.navInfo = this.queryNavigationInfo();//这个得到的是空
    this.navIdValue = this.navInfo?.navigationId
    console.log('+++++++++++++navIdValue',this.navIdValue)
    this.navDesInfo = this.queryNavDestinationInfo(); //这个得到的param是undefined
    console.log('+++++++++++++++++++++++++++'+JSON.stringify(this.navDesInfo))
    this.navDestinationParamValue = String(this.navDesInfo?.param) // 没有param参数 {"navDestinationId":"","navigationId":"","state":{},"index":0,"name":""}
    console.log('this.navDestinationParamValue',this.navDesInfo?.param)
  }

  build() {
    Column(){
      Text('queryNavigationInfo')
    }.width('100%')
  }
}