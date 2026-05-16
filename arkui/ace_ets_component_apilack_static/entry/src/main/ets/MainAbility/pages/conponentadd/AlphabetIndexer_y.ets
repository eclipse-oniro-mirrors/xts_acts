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
  AlphabetIndexer,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontStyle,
  FontWeight,
  IndexerAlign,
  ItemAlign,
  Margin,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct alphabetIndexer {
  @State active: boolean = false
  @State selectIndex1: Int = 0
  @State selectIndex2: Int = 0
  private value: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']
  private value1: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']
  private content: string = "AlphabetIndexer Page"

  onPageShow(): void {
    console.info('alphabetIndexer page show called');
  }

  onBuildDone(): void {
    console.info('alphabetIndexer page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Text("AlphabetIndexer0")
      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .color('#FF00DDDD')
        .selectedColor(0xffffff)
        .key('alphabetIndexer')
        .popupColor('#FF737373')
        .selectedBackgroundColor('#FF0000E6')
        .popupBackground('#FF00DDDD')
        .usingPopup(true)
        .popupPosition({ x: 90.0, y: 50.0 })
        .selectedFont({ size: 16, weight: FontWeight.Regular })
        .popupFont({ size: 30, weight: FontWeight.Bolder, style: FontStyle.Normal })
        .itemSize(28)
        .alignStyle(IndexerAlign.Left)
        .onSelect((index: int) => {
          this.selectIndex1 = index.toInt()
          console.info(this.value[this.selectIndex1] + ' on selected')
        })
      Text("AlphabetIndexer1")
      AlphabetIndexer({ arrayValue: this.value1, selected: 0 })
        .selectedColor(0xffffff)
        .key('alphabetIndexer1')
        .popupColor('#FF737373')
        .selectedBackgroundColor('#FF0000E6')
        .popupBackground('#FF00DDDD')
        .usingPopup(false)
        .popupPosition({ x: 90.0, y: 50.0 })
        .selectedFont({ size: 16, weight: FontWeight.Lighter })
        .popupFont({ size: 30, weight: FontWeight.Bold, style: FontStyle.Italic })
        .itemSize(28)
        .alignStyle(IndexerAlign.Right)
        .margin({ left: 50 } as Margin)
        .onSelect((index: int) => {
          this.selectIndex2 = index.toInt()
          console.info(this.value[this.selectIndex2] + ' on selected')
        })
    }
  }
}
