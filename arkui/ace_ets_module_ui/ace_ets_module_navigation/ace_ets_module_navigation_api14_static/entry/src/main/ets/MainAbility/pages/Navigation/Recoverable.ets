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
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,
  NavDestination, FontWeight, ButtonType, NavDestinationMode, LaunchMode, TextInputController, Stack, StackOptions,
  Alignment, NavPathStack, Navigation, Padding, FontStyle, NavPathInfo
} from '@ohos.arkui.component'
@Entry
@Component
struct RecoverableDemo {
  @State navigationOpenReceover:boolean = true
  @State navigationrecstring:string = '可恢复'
  @Provide({alias: 'pageInfos' })pageInfos: NavPathStack = new NavPathStack()
  needRecovery: boolean = false;

  @Builder
  pageMap(name:string){
  }


  build() {
    Column(){
      Navigation(this.pageInfos){
        Scroll(){
          Column(){
            Text('这是NavIndex 首页').fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bolder).padding({top:10,bottom:10} as Padding)
            Button('navigation：'+this.navigationrecstring).onClick((e: ClickEvent)=>{
              if(this.navigationOpenReceover===true){
                this.navigationOpenReceover=false
                this.navigationrecstring='当前页面不可恢复'
              }else{
                this.navigationOpenReceover=true
                this.navigationrecstring='当前页面可恢复'
              }
            }).margin(20)
            Button('push pageOne', { stateEffect: true, type: ButtonType.Capsule })
              .width('80%')
              .height(40)
              .margin({ bottom: 10 } as Margin)
              .onClick((e: ClickEvent) => {
                // this.pageInfos.pushPath({name: 'pageOne'})
                this.pageInfos.pushPath(new NavPathInfo('pageOne',undefined),true)
              })
            Button('routerPage1_recoverable=true', { stateEffect: true, type: ButtonType.Capsule })
              .width('80%')
              .height(40)
              .margin({ bottom: 10 } as Margin)
          }.backgroundColor('#FFFF77')
          .height('100%')
        }
      }.title('NavIndex')
      .recoverable(this.navigationOpenReceover)
      .id('testNavigation')
      .navDestination(this.pageMap)
      .height('50%')

      Button('update recoverable')
        .onClick((e: ClickEvent) => {
          this.navigationOpenReceover = !this.navigationOpenReceover;
        })
        .id('update')

    }
  }
}