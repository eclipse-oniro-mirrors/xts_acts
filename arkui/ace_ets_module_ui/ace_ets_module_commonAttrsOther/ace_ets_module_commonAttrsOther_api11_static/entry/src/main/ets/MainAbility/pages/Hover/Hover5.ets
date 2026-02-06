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
  Position,
  HoverEffect,
  HoverEvent
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct HoverExample5 {
  @State isHoverValA5: boolean = false
  @State isHoverValB5: boolean = false

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column({ space: 5 } as ColumnOptions) {

        Column()
          .width('60%')
          .height('100%')
          .backgroundColor(Color.Green)
          .position({ x: 0, y: 0 } as Position)
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover: boolean, event: HoverEvent): void => {
            console.info('Scale isHover: ' + isHover as String)
            this.isHoverValA5 = isHover as boolean
          })

        Column()
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .position({ x: 150, y: 0 } as Position)
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover: boolean, event: HoverEvent): void => {
            console.info('Scale isHover: ' + isHover as String)
            this.isHoverValB5 = isHover as boolean
          })
          .key('columnBB')
        Text('A' + JSON.stringify(this.isHoverValA5) + 'B' + JSON.stringify(this.isHoverValB5))
          .fontSize(20).margin(15).position({ x: 100, y: 100 } as Position).key('hover5')
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}