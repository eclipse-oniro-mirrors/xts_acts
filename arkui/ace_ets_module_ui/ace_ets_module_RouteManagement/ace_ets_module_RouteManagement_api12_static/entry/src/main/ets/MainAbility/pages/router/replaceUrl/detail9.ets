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

@Entry
@Component
struct detail9 {
  @State str:string = 'detail9'
  @State pageIndex: number = 0

  build() {
    Column({space:5} as ColumnOptions) {
      Text(this.str + ' index' + this.pageIndex ).id('detail9_text')

      Button('getIndex')
        .id('detail9_btn')
        .onClick((e:ClickEvent)=>{
          let page = this.getUIContext().getRouter().getState();
          console.log('current index = ' + page.index);
          console.log('current name = ' + page.name);
          console.log('current path = ' + page.path);
          this.pageIndex = page.index
        })
    }.width('100%').height('100%')


  }
}