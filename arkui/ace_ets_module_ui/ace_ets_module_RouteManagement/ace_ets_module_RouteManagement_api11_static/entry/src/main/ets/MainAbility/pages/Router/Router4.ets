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
// 在second页面中接收传递过来的参数
import router from '@ohos.router'
import { Entry,Component,Column,Text } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
class routerParams {
  data1:string
  data2:number[]

  constructor(data1:string, data2:number[]) {
    this.data1 = data1
    this.data2 = data2
  }
}

@Entry
@Component
struct Second4 {
  private content: string = "这是第二页"
  @State data1: string = ''
  @State data2: number = 0

  onPageShow() {
    console.info('align page show called ')
    const params = JSON.parseJsonElement(JSON.stringify(this.getUIContext().getRouter().getParams()))
    console.info('params: ' + params)
    this.data1 = params.getString('data1')
    this.data2 = params.getArray('data2')[0].asDouble()
  }
  build() {
    Column() {
      Text('' + this.content)
      Text('' + this.data1).id('arrayData1')
      Text('' + this.data2).id('arrayData2')
    }.width('100%')


  }
}