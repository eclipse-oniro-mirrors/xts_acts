'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Row,
  Text,
  Button,
  FontWeight,
  ClickEvent,
  Margin
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RouterErrCodeRecoverableTest {

  build(){
    Column() {
      Button('getStateByUrl')
        .id('getStateByUrl_empty')
        .height('5%')
        .onClick((e:ClickEvent)=>{
          this.getUIContext().getRouter().getStateByUrl('')
        })
      Button('pushUrl')
        .id('pushUrl_err')
        .height('5%')
        .onClick((e:ClickEvent)=>{
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/Index111' }
          ).catch ((err) =>{
            AppStorage.setOrCreate('pushUrl_err', err.code)
            console.log(`xgf pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        })
      Button('replaceUrl')
        .id('replaceUrl_err')
        .height('5%')
        .margin({ bottom: 5 } as Margin)
        .onClick((e:ClickEvent)=>{
          this.getUIContext().getRouter().replaceUrl({
            url: 'pages/Index111' }
          ).catch ((err) =>{
            AppStorage.setOrCreate('replaceUrl_err', err.code)
            console.log(`xgf replaceUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        })
      Row(){
        Button('replaceUrl_re1')
          .id('replaceUrl_re1')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().replaceUrl({
              url: 'MainAbility/pages/RouterPage2',
              params: 'message',
              recoverable:true
            })
          })
        Button('replaceUrl_re2')
          .id('replaceUrl_re2')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().replaceUrl({
              url: 'MainAbility/pages/RouterPage2',
              params: 'message',
              recoverable:false
            })
          })
      }
      .height('5%')

      Row(){
        Button('replaceNamedRoute_re1')
          .id('replaceNamedRoute_re1')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().replaceNamedRoute({
              name: 'replaceNamedRoute',
              params: 'message',
              recoverable:true
            })
          })
        Button('replaceNamedRoute_re2')
          .id('replaceNamedRoute_re2')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().replaceNamedRoute({
              name: 'replaceNamedRoute',
              params: 'message',
              recoverable:false
            })
          })
      }
      .height('5%')

      Row(){
        Button('pushNamedRoute_re1')
          .id('pushNamedRoute_re1')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushNamedRoute({
              name: 'pushNamedRoute',
              params: 'message',
              recoverable:true
            })
          })
        Button('pushNamedRoute_re2')
          .id('pushNamedRoute_re2')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushNamedRoute({
              name: 'pushNamedRoute',
              params: 'message',
              recoverable:false
            })
          })
      }
      .height('5%')

      Row(){
        Button('back_re1')
          .id('back_re1')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().back({
              url: 'MainAbility/pages/RouterPage2',
              params: 'message',
              recoverable:true
            })
          })
        Button('back_re2')
          .id('back_re2')
          .margin({ bottom: 5 } as Margin)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().back({
              url: 'MainAbility/pages/RouterPage2',
              params: 'message',
              recoverable:false
            })
          })
      }
      .height('5%')

    }
    .width('100%')
    .height('100%')
  }
}
