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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  $r,
  $$,
  SheetType,
  BindOptions,
  SheetOptions,
  Alignment,
  Color,
  Row,
  Stack,
  TouchEvent
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

interface StrJsonObj {
  $attrs: AttrContent
}

interface AttrContent {
  hitTestBehavior: string
}

@Entry
@Component
struct HitTestMode {
  build() {
    Column() {
      // outer stack 1
      Stack() {
        Button('outer button')
          .onTouch((event: TouchEvent) => {
            console.info('HitTestMode outer button touched type: ' + event.type)
          })
        // inner stack
        Stack() {
          Button('inner button')
            .key("innnerButton")
            .onTouch((event: TouchEvent) => {
              console.info('HitTestMode inner button touched type: ' + event.type)
            })
        }
        .key("Block")
        .width("100%")
        .height("100%")
        // .hitTestBehavior(HitTestMode.Block)
        .onTouch((event: TouchEvent) => {
          console.info('HitTestMode inner stack touched type: ' + event.type)
        })

        Text('Transparent')
          .key("Transparent")
          // .hitTestBehavior(HitTestMode.Transparent)
          .width("100%")
          .height("50%")
          .onTouch((event: TouchEvent) => {
            console.info('HitTestMode text touched type: ' + event.type)
            let strJson = inspector.getInspectorByKey('Transparent');
            console.info("HitTestMode hitTestBehavior is " +
            JSON.parseJsonElement(strJson).getElement('$attrs').getString('hitTestBehavior'));
            let strJson2 = inspector.getInspectorByKey('Block');
            console.info("HitTestMode hitTestBehavior is " +
            JSON.parseJsonElement(strJson2).getElement('$attrs').getString('hitTestBehavior'));
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

