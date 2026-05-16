'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
initModule('./pushNamedRoute27')

@Entry({ routeName: 'pushNamedRoute11' })
@Component
struct pushNamedRoute11 {
  @State text1:string = ''

  build() {
    Column() {
      Text('pushNamedRoute11').id('pushNamedRoute11_text1')
      Button('pushNamedRoute').onClick((event: ClickEvent) => {
        initModule('./pushNamedRoute27')
        for(let i=0;i<33;i++){
          try {
            this.getUIContext().getRouter().pushNamedRoute({
              name: 'pushNamedRoute27'
            }, (err) => {
              if (err) {
                this.text1 = '' +  (err as BusinessError).code
                console.log('test pushNamedRoute11 ', this.text1)
                AppStorage.setOrCreate<string>('errcode1', this.text1)
                return;
              }
            })
          } catch (err) {
            console.error(`pushNamedRoute failed, code is ${(err as BusinessError).code}, message is ${(err as BusinessError).message}`);
          }
        }
      })
        .id('pushNamedRoute11_btn1')
    }
  }
}