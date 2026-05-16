'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  Flex,
  Text,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Image,
  Path,
  TextOverflow,
  TextAlign,
  Alignment,
  $rawfile,
  ClickEvent,
  RectAttribute,
  Rect,
  RectOptions,
  ProgressMask,
  Optional,
  Color
} from '@ohos.arkui.component';

import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct RectNe {

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear RectNe start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear RectNe end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("rect-Ne")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("neText")

      Rect({ width: '90%', height: "50px" } as RectOptions).radiusHeight(20).radiusWidth(20)
        .key("Rect")

      Image($rawfile('test.png'))
        .mask(new ProgressMask(150, 150, Color.Gray))
        .width('500px').height('280px')

    }.width("100%").height("100%")
  }
}

