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
import events_emitter from '@ohos.events.emitter';
import {
  Alignment,
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
  Text
} from '@ohos.arkui.component';
import { State, StorageLink, AppStorage } from '@ohos.arkui.stateManagement';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AlphabetIndexerOnSelect {
  @StorageLink('onSelectStatus') onSelectStatus: boolean = false;
  @StorageLink('onRequestPopupDataStatus') onRequestPopupDataStatus: boolean = false;
  @State selectIndex: Int = 0
  @State popIndex: Int = 0
  @State RequestIndex: Int = 0
  private value: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N']
  private content: string = "AlphabetIndexer Page"

  aboutToAppear(): void {
    Log.showInfo(TAG, `aboutToAppear AlphabetIndexerOnSelect start`)
  }

  aboutToDisappear(): void {
    Log.showInfo(TAG, `aboutToDisAppear AlphabetIndexerOnSelect end`)
  }

  onPageShow() {
    AppStorage.setOrCreate<boolean>('onRequestPopupDataStatus', false);
    AppStorage.setOrCreate<boolean>('onSelectStatus', false);
  }

  showToast(message: string) {
    this.getUIContext().getPromptAction().showToast({
      message: message,
      duration: 2000
    });
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(20)
        .align(Alignment.Center)
        .fontWeight(FontWeight.Bold)
      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .color('#FFFF0000')
        .selectedColor(0xffffff)
        .key('alphabetIndexer')
        .popupColor('#FF48D1CC')
        .selectedBackgroundColor('#FF0000E6')
        .popupBackground('#FF00DDDD')
        .usingPopup(true)
        .selectedFont({ size: 16, weight: FontWeight.Regular })
        .popupFont({ size: 30, weight: FontWeight.Bolder, style: FontStyle.Normal })
        .itemSize(28)
        .width(100)
        .height(300)
        .alignStyle(IndexerAlign.Left)
        .onSelect((index: int) => {
          this.selectIndex = index.toInt()
          console.info(this.value[this.selectIndex] + 'on onSelect')
          this.showToast("onSelect() " + index)
          this.onSelectStatus = true;
        })
        .onPopupSelect((index: int) => {
          this.popIndex = index.toInt()
          console.info(this.value[this.popIndex] + 'on onPopupSelect')
          this.showToast("onPopupSelect() " + index)
        })
        .onRequestPopupData((index: int) => {
          this.RequestIndex = index.toInt()
          console.info(this.value[this.RequestIndex] + 'on onRequestPopupData')
          this.showToast("onRequestPopupData() " + index)
          console.info('test: on onRequestPopupData01')
          this.onRequestPopupDataStatus = true
          console.info('test: on onRequestPopupData02')
          return ['1', '2', '3', '4', '5']

        })
    }.width("100%").height("100%")
  }
}

