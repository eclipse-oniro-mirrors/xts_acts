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
  $rawfile,Image,Color,Position,Row,Placement,$r,ResourceStr,ArrowPointPosition,RowOptions,Padding,Dimension,PopupOptions,PopupStateChangeParam
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

import hilog from '@ohos.hilog';

@Entry
@Component
struct PopupOptionsFalseExample {
  @State handlePopup: boolean = false;

  build() {
    Flex({ direction: FlexDirection.Column } as FlexOptions) {
      Button('PopupOptionsFalse')
        .margin(100)
        .id("PopupOptionsFalse")
        .onClick((e:ClickEvent) => {
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'This is a popup with PopupOptions',
          // placementOnTop: true,
          mask: true,
          showInSubWindow: false,
          primaryButton: {
            value: 'confirm',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('confirm Button click')
            }
          },
          secondaryButton: {
            value: 'cancel',
            action: () => {
              this.handlePopup = !this.handlePopup
              console.info('cancel Button click')
            }
          },
          onStateChange: (e:PopupStateChangeParam) => {
            console.info(JSON.stringify(e.isVisible))
            if (!e.isVisible) {
              this.handlePopup = false
            }
          }
        } as PopupOptions)
    }
    .height('100%')
    .width('100%')
    .padding({ top: 5 } as Padding)
  }
}