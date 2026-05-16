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
import {
  Entry,
  Component,
  List,
  ColumnOptions,
  ListItem,
  Text,
  Column,
  Button,
  Margin,
  ForEach,
  ClickEvent,
  Color,
  Axis,
  BarState,
  ColumnOptions,
  ScrollSource,
  Padding,
  ScrollState
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
@Entry
@Component
struct ListAddApi {
  @State text: string = ''
  @State text2: string = ''

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.text2).width('90%').fontColor(0xCCCCCC).key('ListAddApiText1')
      Text(this.text).width('90%').fontColor(0xCCCCCC).key('ListAddApiText2')
      List(){}
      .key('ListAddApi')
      .backgroundBrightness({rate: 0, lightUpDegree:0})
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        if (scrollSource == ScrollSource.OTHER_USER_INPUT) {
          this.text = 'true'
        }
      })

      Button('next page')
        .key('ListAddApiBt')
        .onClick(() => { // 点击后滑到下一页
          let strJson = inspector.getInspectorByKey('ListAddApi');
          if (JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('BackgroundBrightness')) {
            this.text2 = 'true'
          }
        })
    }
    .width('100%').height('100%').padding({ top: 5 } as Padding)
  }
}