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


import { Router, UIContext } from '@ohos.arkui.UIContext';
import { FrameNode } from '@ohos.arkui.node';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Optional,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

interface Inter1 {
  name: string
  value: number
}

interface Inter2 {
  number1: number
  string1: string
  bool: boolean
  object1: Inter1
}

@Entry
@Component
struct CustomProperty111 {
  @State myString: string = "start"

  build() {
    Column() {
      Button(this.myString).id("CustomProperty1_button")
        .onClick(() => {
          console.log('test start click');
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            console.log('test start uiContext');
            const node: FrameNode | null = uiContext.getFrameNodeById("customProperty_colum") || null;
            if (node) {
              console.log('test start node');
              const property: Inter2 = node.getCustomProperty('customProperty1') as Inter2;
              console.log('test start node end');
              console.log('customProperty1', property.string1);
              this.myString = "" +
                `{"number":${property.number1},"string":"${property.string1}","bool":${property.bool},"object":{"name":"${property.object1.name}","value":${property.object1.value}}}`
            }
          }
        })
    }
    .id("customProperty_colum")
    .customProperty('customProperty1', {
      number1: 10,
      string1: 'this is a string',
      bool: true,
      object1: {
        name: 'name',
        value: 100
      }
    } as Inter2)
    .customProperty('customProperty2', {})
    .customProperty('customProperty2', undefined)
    .width('100%')
    .height('100%')
  }
}
