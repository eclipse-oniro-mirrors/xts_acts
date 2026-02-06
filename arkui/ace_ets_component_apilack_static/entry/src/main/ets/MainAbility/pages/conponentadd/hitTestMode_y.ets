'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Button, Color, Column, Component, Entry, HitTestMode, Stack, Text } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct HitTestMode1 {
  build() {
    Column() {
      // outer stack 1
      Stack() {
        Button('outer button')
          .onTouch((event) => {
            console.info('HitTestMode outer button touched type: ' + event.type)
          })
        // inner stack
        Stack() {
          Button('inner button')
            .key("innnerButton")
            .onTouch((event) => {
              console.info('HitTestMode inner button touched type: ' + event.type)
            })
        }
        .key("Block")
        .width("100%")
        .height("100%")
        .hitTestBehavior(HitTestMode.Block)
        .onTouch((event) => {
          console.info('HitTestMode inner stack touched type: ' + event.type)
        })

        Text('Transparent')
          .key("Transparent")
          .width("100%")
          .hitTestBehavior(HitTestMode.Transparent)
          .height("50%")
          .onTouch((event) => {
            console.info('HitTestMode text touched type: ' + event.type)
            let strJson = inspector.getInspectorByKey('Transparent');
            let obj = JSON.parseJsonElement(strJson);
            console.info("HitTestMode hitTestBehavior is " + obj.getElement('$attrs').getString('hitTestBehavior'));
            let strJson2 = inspector.getInspectorByKey('Block');
            let obj2 = JSON.parseJsonElement(strJson2);
            console.info("HitTestMode hitTestBehavior is " +
            JSON.parseJsonElement(strJson2).getElement('$attrs').getString('hitTestBehavior'));
          })
      }.width(300).height(300).backgroundColor(Color.Gray)
    }.width('100%').height('100%')
  }
}

