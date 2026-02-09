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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle, CalendarAlign, CalendarPicker,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,FlexAlign,Rating
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct rating_testcase {
  @State rating: number = 2
  onPageShow() {
    console.info('Rating page show called');
  }

  onBuildDone() {
    console.info('Rating page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Rating page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Rating({ rating: 2, indicator: false })
          .stepSize(0.5)
          .stars(5)
          .starStyle({
            backgroundUri: '/resources/rawfile/star-1-1.png',
            foregroundUri: '/resources/rawfile/star-1-3.png',
            secondaryUri: '/resources/rawfile/star-1-2.png'
          })
          .onChange((value: number): void => {
            this.rating = value
          })
          .key('rating1')
        Rating({ rating: 2, indicator: true })
          .stepSize(0.5)
          .stars(5)
          .starStyle({
            backgroundUri: '/resources/rawfile/star-1-1.png',
            foregroundUri: '/resources/rawfile/star-1-3.png',
            secondaryUri: '/resources/rawfile/star-1-2.png'
          })
          .key('rating2')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

