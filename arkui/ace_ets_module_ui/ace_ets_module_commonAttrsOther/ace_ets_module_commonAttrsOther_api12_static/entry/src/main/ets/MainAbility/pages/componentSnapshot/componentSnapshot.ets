'use static';
/*
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

import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  BorderOptions,
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
  HorizontalAlign,
  Image,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';


@Entry
@Component
struct ComponentSnapshotExample {
  @State pixmap: image.PixelMap | string = "";
  @State waitUntilRenderFinished: boolean = false

  build() {
    Column() {
      Row() {
        Image(this.pixmap).width(20).height(20).border({ color: Color.Black, width: 2 } as BorderOptions).margin(5)
        Image($r('app.media.icon'))
          .autoResize(true)
          .width(20)
          .height(20)
          .margin(5)
          .id("root")
      }

      Button(`${this.waitUntilRenderFinished}`).id('ComponentSnapshot_id')
        .onClick((e: ClickEvent) => {
          this.waitUntilRenderFinished = true
          // try {
          this.getUIContext()
            .getComponentSnapshot()
            .get('root', { scale: 2, waitUntilRenderFinished: this.waitUntilRenderFinished })!
            .then((pixmap: image.PixelMap) => {
              this.pixmap = pixmap
            })
            .catch((err: Error) => {
              console.log('error: ' + err)
            })
          // } catch(err) {
          //   console.log('tset start get error is: ' + err)
          // }

        }).margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}