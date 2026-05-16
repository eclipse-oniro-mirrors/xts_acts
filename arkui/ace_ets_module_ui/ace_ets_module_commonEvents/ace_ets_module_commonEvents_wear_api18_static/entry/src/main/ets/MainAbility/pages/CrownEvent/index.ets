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
import {
  Entry,
  Component,
  Column,
  Text,
  List,
  CrownEvent,
  CrownAction,
  TextAlign,
  Row,
  Stack,
  Callback
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct CityList {
  @State message: string = "onDigitalCrown";
  @State  value:string = ''
  @State  value1:string = ''
  @State  value2:string = ''
  build() {
    Column() {
      Row(){
        Stack() {
        Text(this.value)
         Text(this.value)
          Text(this.value)
          Text(this.message)
            .textAlign(TextAlign.Center)
            .focusable(true)
            .focusOnTouch(true)
            .defaultFocus(true)
            .id('onDigitalCrown')
            .onDigitalCrown((event: CrownEvent) => {
              // event.stopPropagation();
              if(event.action == CrownAction.BEGIN){
                 this.value='BEGIN'
              }else if(event.action == CrownAction.UPDATE){
                this.value='UPDATE'
              }else if(event.action == CrownAction.END){
                this.value='END'
              }
              this.message = "CrownEvent\n\n" + JSON.stringify(event);
              console.debug("action:%d, angularVelocity:%f, degree:%f, timestamp:%f",
                event.action, event.angularVelocity, event.degree, event.timestamp);
            })
        }.width("100%").height("100%")
      }.width("100%").height("100%")
    }
  }
}