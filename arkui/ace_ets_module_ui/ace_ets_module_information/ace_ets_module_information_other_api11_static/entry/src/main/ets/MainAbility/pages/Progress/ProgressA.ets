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
import { Entry, Component, ProgressMask, Row, Column, List, ListItem, Image, $r, Color, ClickEvent, Button, HorizontalAlign, Flex, FlexDirection, ItemAlign, FontWeight,
  FlexAlign, Alignment, TextOverflow, ProgressType, RowOptions, ColumnOptions, Text, Progress, Margin, ProgressStyle
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct progress_testcase {
  onPageShow() {
    console.info('Progress page show called');
  }

  onBuildDone() {
    console.info('Progress page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Progress page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Progress({ value: 20, total: 40, type: ProgressType.Linear } )
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress')

        Progress({ value: 20, total: 40, type: ProgressType.Eclipse } )
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress2')

        Progress({ value: 20, total: 40, type: ProgressType.Ring })
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress3')

        Progress({ value: 20, total: 40, type: ProgressType.ScaleRing })
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress4')

        Progress({ value: 20, total: 40, type: ProgressType.Capsule })
          .value(3)
          .color(Color.Blue)
          .width(50)
          .height(70)
          .key('progress5')

      }
      .width(400)
      .height(400)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

