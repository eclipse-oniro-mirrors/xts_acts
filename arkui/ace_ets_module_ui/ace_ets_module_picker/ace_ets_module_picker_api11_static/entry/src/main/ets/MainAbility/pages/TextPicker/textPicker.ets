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

import Log from '../../common/Log';
import { Entry, Component, Column, Text, Rating, Margin, Row, TextPickerResult, Flex,FlexDirection, ItemAlign, FlexAlign, TextPicker } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct TextPickerDefaultPickerItemHeight {
  private select: int = 1
  private fruits: string[] = ['1.apple', '2.orange', '3.peach', '4.grape']

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear TextPickerDefaultPickerItemHeight start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear TextPickerDefaultPickerItemHeight end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      TextPicker({ range: this.fruits, selected: this.select })
        .onChange((value: string|string[], index: int|int[]):void => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index)
        })
        .defaultPickerItemHeight('80px')
        .key("defaultPickerItemHeightText")

    }.width("100%").height("100%")
  }
}

