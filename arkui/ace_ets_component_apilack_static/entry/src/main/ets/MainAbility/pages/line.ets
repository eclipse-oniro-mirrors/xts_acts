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

import Log from '../common/Log';
import {
  Entry,
  Component,
  Flex,
  Text,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Line,
  TextOverflow,
  TextAlign,
  Alignment
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

const TAG = 'ets_apiLack_add';


@Entry
@Component
struct LineNe {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear LineNe start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear LineNe end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("line-Ne")
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
      Line({ width: 50, height: 100 }).startPoint([0, 0]).endPoint([50, 100]).key("line1")
      Line()
        .width(200)
        .height(200)
        .startPoint([50, 50])
        .endPoint([150, 400])
        .key("line2")
    }.width("100%").height("100%")
  }
}

