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
import uiObserver from '@ohos.arkui.observer';
import common from '@ohos.app.ability.common';
import router from '@ohos.router';
import { Entry, Component, Column, Text, Image, Color, Padding, Button, ClickEvent, ColumnOptions} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ObserverApiTest {
  @State text1 :string = '1'
  @State text2 :string = '2'
  private context:UIContext = this.getUIContext()


  testFunc(info:uiObserver.RouterPageInfo){
    if(info) {
      if(info.context) { // info.context null
        if (info.state == uiObserver.RouterPageState.ABOUT_TO_APPEAR){
          AppStorage.setOrCreate<string>('Observer_APPEAR', 'Appear')
        } else if (info.state == uiObserver.RouterPageState.ABOUT_TO_DISAPPEAR){
          AppStorage.setOrCreate<string>('Observer_DISAPPEAR', 'Disappear')
        } else if (info.state == uiObserver.RouterPageState.ON_PAGE_SHOW){
          AppStorage.setOrCreate<string>('Observer_SHOW', 'Show')
        } else if (info.state == uiObserver.RouterPageState.ON_PAGE_HIDE){
          AppStorage.setOrCreate<string>('Observer_HIDE', 'Hide')
        } else if (info.state == uiObserver.RouterPageState.ON_BACK_PRESS){
          AppStorage.setOrCreate<string>('Observer_BACK', 'Back')
        }
      }
    }

  }

  build() {
    Column({ space: 5 } as ColumnOptions){

      Text(this.text1).id('ObserverApi_text1')
      Text(this.text2).id('ObserverApi_text2')

      Button('getText1')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          this.text1 = (AppStorage.get<string>('Observer_DISAPPEAR') as string ) + ''
        })
        .id('ObserverApi_getText1')

      Button('getText2')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          this.text2 = (AppStorage.get<string>('Observer_BACK') as string) + ''
        })
        .id('ObserverApi_getText2')

      Button('ObserverOn')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          uiObserver.onRouterPageUpdate(this.context, this.testFunc)
        })
        .id('ObserverApi_ObserverOn')

      Button('ObserverOff')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          uiObserver.offRouterPageUpdate(this.context, this.testFunc)
        })
        .id('ObserverApi_ObserverOff')

      Button('pushToPageTwo')
        .fontSize(14)
        .onClick((e: ClickEvent)=>{
          this.context.getRouter().pushUrl({url: "MainAbility/pages/observer/ObserverApi2"})
        })
        .id('ObserverApi_pushToPageTwo')


    }.width('100%')
  }
}
