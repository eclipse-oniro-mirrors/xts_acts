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

import events_emitter from '@ohos.events.emitter';
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
  ClickEvent,
  ColumnOptions,
  TextAlign,
  $rawfile,Image,Color,Position,Row,Placement,$r,ResourceStr,ArrowPointPosition,RowOptions,Padding,Dimension,PopupOptions
  ,ShadowStyle,BlurStyle
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';


@Entry
@Component
struct PopupArrowExample {
  @State customPopup: boolean = false;

  build() {
    Column() {
      Button("customPopup").key('popup_arrow')
        .margin(10)
        .onClick((e:ClickEvent) => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          message: "this is a popup",
          popupColor: Color.Pink,
          arrowWidth: 20,
          arrowHeight: 20,
          radius: 20,
          shadow: ShadowStyle.OUTER_DEFAULT_XS,
          backgroundBlurStyle: BlurStyle.Thin
        } as PopupOptions)
    }
    .width('100%')
  }
}