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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Stack,
  Scroller,
  ObscuredReasons,
  BarState,
  ScrollDirection,
  ScrollBar,
  ScrollBarDirection
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct imageObscuredTest {
  private scroller: Scroller = new Scroller()

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {

            Row() {
              Image($r('app.media.icon'))
                .width('400px')
                .height('400px')
                .obscured([ObscuredReasons.PLACEHOLDER])
                .borderRadius('20vp')
                .key('ArkUX_Redacted_Image_0150')
            }.margin({ bottom: 50 } as Margin)

            Row() {
              Image($r('app.media.icon'))
                //.obscured(null)
                .key('ArkUX_Redacted_Image_0160')
            }.margin({ bottom: 50 } as Margin)


            Row() {
              Image($r('app.media.icon'))
                .width('700px')
                .height('200px')
                .obscured([ObscuredReasons.PLACEHOLDER])
                // .borderRadius(null)
                .key('ArkUX_Redacted_Image_0170')
            }.margin({ bottom: 50 } as Margin)

            Row() {
              Image($r('app.media.play'))
                .width(30)
                .height(40)
                .obscured([ObscuredReasons.PLACEHOLDER])
                // .borderRadius(null)
                .key('ArkUX_Redacted_Image_0180')
            }.margin({ bottom: 50 } as Margin)

            Row() {
              Image($r('app.media.play'))
                .width(30)
                .height(40)
                .obscured([ObscuredReasons.PLACEHOLDER])
                .borderRadius('20vp')
                .key('ArkUX_Redacted_Image_0190')
            }.margin({ bottom: 50 } as Margin)

          }.margin({ left: 52 } as Margin)
        }
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
          Text()
            .width(30)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .width(30)
        .backgroundColor('#ededed')
      }
    }
  }
}

