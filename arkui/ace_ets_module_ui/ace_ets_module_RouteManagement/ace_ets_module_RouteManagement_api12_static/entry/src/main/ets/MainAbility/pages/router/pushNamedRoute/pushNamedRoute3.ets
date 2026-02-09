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

import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import { Entry, Column, Component,Button,Text,Row,Color,ColumnOptions,ClickEvent } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry({ routeName: 'pushNamedRoute3' })
@Component
struct pushNamedRoute3 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushNamedRoute3').id('pushNamedRoute3_text1')
      Text(this.text1).id('pushNamedRoute3_text2')
      Button('pushNamedRoute').onClick((event: ClickEvent) => {
        for(let i=0;i<33;i++){
          try {
            this.getUIContext().getRouter().pushNamedRoute({
              name: 'pushNamedRoute3'
            }).then(){}
              .catch((err:Error) => {
                this.text1 = '' +  (err as Error).code
              })
          } catch (err) {
            console.error(`pushNamedRoute failed, code is ${(err as Error).code}, message is ${(err as Error).message}`);
          }
        }
      })
        .id('pushNamedRoute3_btn1')
    }
  }
}