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
import router from '@ohos.router'
import { BusinessError } from '@ohos.base'
import { Entry, Column, Component,Button,Text,Row,Color,ColumnOptions,ClickEvent } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
initModule('./nameDetail9');

class routerParams26 {
  data1:string

  constructor(str:string) {
    this.data1 = str
  }
}


@Entry({ routeName: 'replaceNamedRoute12' })
@Component
struct replaceNamedRoute12 {
  @State str:string = 'replaceNamedRoute12'
  @State code:string = ''
  @State text:string = '123'


  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('replaceNamedRoute12_mes', AppStorage.get<string>('replaceNamedRoute12_mes') + ';replaceNamedRoute12_aboutToAppear')
  }

  build() {
    Column({space:5} as ColumnOptions) {

      Text(this.str).id('replaceNamedRoute12_text')

      Text(this.text).id('replaceNamedRoute12_text2')

      Button('getText')
        .id('replaceNamedRoute12_get')
        .fontSize(14)
        .onClick(() => {
          this.text = AppStorage.get<string>('replaceNamedRoute12_mes') + ''
        })

      Button('replaceNamedRoute12')
        .id('replaceNamedRoute12_btn')
        .onClick((e:ClickEvent)=>{
          initModule('./nameDetail9');
          this.getUIContext().getRouter().replaceUrl({
            url: 'replaceNamedRoute12',
            params: new routerParams26('message')
          }, router.RouterMode.Single)
            .then(() => {
              console.log('replaceNamedRoute12 success');
            })
            .catch((err:Error) => {
              this.code = '' + err.code
              console.error(`replaceNamedRoute12 failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%').height('100%')


  }
}