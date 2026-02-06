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
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import events_emitter from '@ohos.events.emitter';
import {
  $r,
  $rawfile,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DragEvent,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  ResourceStr,
  Scroll,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test'

@Entry
@Component
struct MenuExample {
  @State symbolIconModifier1: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State symbolIconModifier2: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State TextValue: string = 'click for Menu'

  build() {
    Column() {
      Text(this.TextValue).id("symbolIconValue")
    }
    .id("symbolIcon")
    .width('100%')
    .margin({ top: 5 } as Margin)
    .bindMenu([
      {
        value: 'Menu1',
        symbolIcon: this.symbolIconModifier1,
        action: () => {
          this.TextValue = 'set symbolIcon success'
          console.info('handle Menu1 select')
        }
      },
      {
        value: 'Menu2',
        symbolIcon: this.symbolIconModifier2,
        action: () => {
          console.info('handle Menu2 select')
        }
      },
    ])
  }
}