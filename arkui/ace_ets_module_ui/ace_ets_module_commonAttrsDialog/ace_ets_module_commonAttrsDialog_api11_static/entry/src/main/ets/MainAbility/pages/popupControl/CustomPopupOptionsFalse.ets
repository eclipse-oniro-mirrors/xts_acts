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
  $rawfile,Image,Color,Position,Row,Placement,$r,ResourceStr,ArrowPointPosition,RowOptions,Padding,Dimension,Builder,PopupStateChangeParam,CustomPopupOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';


@Entry
@Component
struct CustomPopupOptionsFalseExample {
  @State customPopup: boolean = false;

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Image($r("app.media.icon"))
        .width(24)
        .height(24)
        .margin({ left: -5 } as Margin)
      Text('Custom Popup')
        .fontSize(10)
    }
    .width(100)
    .height(50)
    .padding(5)
  }

  build() {
    Column() {
      Button('CustomPopupOptionsFalse')
        .id("CustomPopupOptionsFalse")
        .onClick((e:ClickEvent) => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Top,
          mask: { color: '#33000000' },
          popupColor: Color.Yellow,
          enableArrow: true,
          showInSubWindow: false,
          onStateChange: (e:PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        } as CustomPopupOptions)
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}