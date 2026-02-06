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
import router from '@ohos.router'
import { Entry,Component,Column,Text, Button, ButtonType, ClickEvent, ColumnOptions } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
class innerParams {
  data3: number[]

  constructor(tuple: number[]) {
    this.data3 = tuple
  }
}

class routerParams {
  data1: string
  data2: innerParams

  constructor(str: string, tuple: number[]) {
    this.data1 = str
    this.data2 = new innerParams(tuple)
  }
}

@Entry
@Component
struct RouterUrlError {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('start').id('RouterUrlErrorText')
      Button("跳转pageB--参数异常")
        .type(ButtonType.Capsule)
        .id("RouterUrlErrorButton")
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'ERROR',
            params: new routerParams('message', [123, 456, 789])
          })
        })
    }.width('100%').height('100%')

  }
}