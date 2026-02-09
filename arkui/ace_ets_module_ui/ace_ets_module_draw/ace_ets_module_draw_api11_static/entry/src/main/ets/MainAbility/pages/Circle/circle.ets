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
  $rawfile,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Circle,
  TextOverflow,
  Image,
  Alignment,
  TextAlign
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CircleNe {
  @State w: string = "100px";
  @State h: string = "100px";

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CircleNew end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("circle-New")
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

      Circle()
        .width(`${this.w}`)
        .height(`${this.h}`)
        .key('circle')

      Image($rawfile('test.png'))
        // .mask(new Circle({ width: '150px', height: '150px' }).fill(Color.Gray))
        // .width('500px').height('280px')

    }.width("100%").height("100%")
  }
}

