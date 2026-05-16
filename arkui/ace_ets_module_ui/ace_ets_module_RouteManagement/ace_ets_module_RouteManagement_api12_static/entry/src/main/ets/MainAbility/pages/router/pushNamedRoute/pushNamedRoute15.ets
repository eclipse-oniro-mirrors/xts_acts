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
@Entry({ routeName: 'pushNamedRoute15' })
@Component
struct pushNamedRoute15 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushNamedRoute15').id('pushNamedRoute15_text1')
      Text(this.text1).id('pushNamedRoute15_text2')
      Button('pushNamedRoute').onClick((event: ClickEvent) => {
        for(let i=0;i<33;i++){
          try {
            this.getUIContext().getRouter().pushNamedRoute({
              name: 'pushNamedRoute15'
            }, (err) => {
              if (err) {
                this.text1 = '' +  (err as BusinessError).code
                return;
              }
            })
          } catch (err) {
            console.error(`pushNamedRoute failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);

          }
        }
      })
        .id('pushNamedRoute15_btn1')
    }
  }
}