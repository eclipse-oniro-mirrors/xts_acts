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
initModule('./nameDetail13');

class routerParams27 {
  data1:string

  constructor(str:string) {
    this.data1 = str
  }
}

@Entry
@Component
struct replaceNamedRoute13 {
  @State str:string = 'replaceNamedRoute13'
  @State code:string = ''

  build() {
    Column({space:5} as ColumnOptions) {

      Text(this.str).id('replaceNamedRoute13_text')

      Button('replaceNamedRoute13')
        .id('replaceNamedRoute13_btn')
        .onClick((e:ClickEvent)=>{
          initModule('./nameDetail13');
          this.getUIContext().getRouter().replaceNamedRoute({
            name: 'nameDetail13',
            params: new routerParams27('message')
          })
            .then(() => {
              console.log('replaceNamedRoute13 success');
            })
            .catch((err:Error) => {
              this.code = '' + err.code
              console.error(`replaceNamedRoute13 failed, code is ${err.code}, message is ${err.message}`);
            });
        })

    }.width('100%').height('100%')


  }
}