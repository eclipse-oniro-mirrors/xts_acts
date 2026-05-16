/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct HitTestMode {
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
            .key('innnerButton')
            .onTouch((event) => {
              console.info('HitTestMode inner button touched type: ' + event.type)
            })
        }
        .key('Block')
        .width('100%')
        .height('100%')
        //        .hitTestBehavior(HitTestMode.Block)
        .onTouch((event) => {
          console.info('HitTestMode inner stack touched type: ' + event.type)
        })

        Text('Transparent')
          .key('Transparent')//          .hitTestBehavior(HitTestMode.Transparent)
          .width('100%')
          .height('50%')
          .onTouch((event) => {
            console.info('HitTestMode text touched type: ' + event.type)
            let strJson = getInspectorByKey('Transparent');
            console.info('HitTestMode hitTestBehavior is ' + JSON.parse(strJson).$attrs.hitTestBehavior);
            let strJson2 = getInspectorByKey('Block');
            console.info('HitTestMode hitTestBehavior is ' + JSON.parse(strJson2).$attrs.hitTestBehavior);
          })
      }
      .width(300)
      .height(300)
      .backgroundColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
  }
}

