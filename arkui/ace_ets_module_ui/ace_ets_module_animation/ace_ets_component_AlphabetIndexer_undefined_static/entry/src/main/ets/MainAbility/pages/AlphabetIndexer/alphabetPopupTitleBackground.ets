'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  ClickEvent,
  AlphabetIndexer,
  IndexerAlign,
  ColumnOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct AlphabetPopupTitleBackground {
  private arrayA: string[] = ['安'];
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  private arrayC: string[] = ['曹', '成', '陈', '催'];
  private arrayJ: string[] = ['嘉', '贾'];
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];
  @State isShow: boolean | undefined = true;

  build() {
    Column({ space: 2 } as ColumnOptions) {
      AlphabetIndexer({ arrayValue: this.value, selected: 1 })
        .width(100)
        .height(100)
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left, 16.0)
        .onRequestPopupData(
          (index: Int) => {
            if (this.value[index as Int] == 'A') {
              return this.arrayA;
            } else if (this.value[index as Int] == 'B') {
              return this.arrayB;
            } else if (this.value[index as Int] == 'C') {
              return this.arrayC;
            } else if (this.value[index as Int] == 'J') {
              return this.arrayJ;
            } else {
              return [];
            }
          }
        )
        .popupTitleBackground(this.isShow ? ('#FF33FF') : undefined)
        .id('AlphabetPopupTitleBackground')
      Button('change_popupTitleBackground')
        .id('AlphabetIndexer_change')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })

      AlphabetIndexer({ arrayValue: this.value, selected: 1 })
        .width(100)
        .height(100)
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left, 16.0)
        .onRequestPopupData(
          (index: Int) => {
            if (this.value[index as Int] == 'A') {
              return this.arrayA;
            } else if (this.value[index as Int] == 'B') {
              return this.arrayB;
            } else if (this.value[index as Int] == 'C') {
              return this.arrayC;
            } else if (this.value[index as Int] == 'J') {
              return this.arrayJ;
            } else {
              return [];
            }
          }
        )
        .id('AlphabetPopupTitleBackgroundUndefined')
    }.width(300)
    .height(300)
  }
}