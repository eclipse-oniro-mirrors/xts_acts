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
  $rawfile,
  Alignment,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  Image,
  ItemAlign,
  Path,
  Polygon,
  PolygonAttribute,
  PolygonOptions,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PolygonNe {
  private polygon: PolygonOptions = {
    width: "100px",
    height: "100px"
  } as PolygonOptions

  aboutToAppear(): void {
    Log.showInfo(TAG, `aboutToAppear PolygonNe start`)
  }

  aboutToDisappear(): void {
    Log.showInfo(TAG, `aboutToDisAppear PolygonNe end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("polygon-Ne")
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

      Polygon(this.polygon).points([[0, 0], [50, 100], [100, 0]])
        .key("Polygon")

    }.width("100%").height("100%")
  }
}

