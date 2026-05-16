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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  ColumnOptions,
  ClickEvent
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
initModule('./nameDetail9');

class routerParams23 {
  data1:string

  constructor(str:string) {
    this.data1 = str
  }
}


@Entry
@Component
struct replaceNamedRoute9 {
  @State str:string = 'replaceNamedRoute9'
  @State code:string = ''

  build() {
    Column({space:5} as ColumnOptions) {

      Text(this.str).id('replaceNamedRoute9_text')

      Button('replaceNamedRoute9')
        .id('replaceNamedRoute9_btn')
        .onClick((e:ClickEvent)=>{
          initModule('./nameDetail9');
          this.getUIContext().getRouter().replaceNamedRoute({
            name: 'nameDetail9',
            params: new routerParams23('message')
          })
            .then(() => {
              console.log('replaceNamedRoute success');
            })
            .catch((err:Error) => {
              this.code = '' + err.code
              console.error(`replaceNamedRoute failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%').height('100%')


  }
}