'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  AlphabetIndexer,
  Alignment,
  FontWeight,
  FontStyle,
  IndexerAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import Log from '../../common/Log.ets';
import { PromptAction } from "@ohos.arkui.UIContext";
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Component
@Entry
struct AlphabetIndexerOnSelect {
  private value: string[] = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N']
  private content: string = "AlphabetIndexer Page"
  @State onSelectStatus: boolean = false;
  @State onRequestPopupDataStatus: boolean = false;

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear AlphabetIndexerOnSelect start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear AlphabetIndexerOnSelect end`)
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
        .onSelect((index: int): void => {
          console.info(this.value[index.toInt()] + 'on onSelect')
          this.showToast("onSelect() " + index)
          this.onSelectStatus = true;
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": this.onSelectStatus
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60201,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onSelect start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onSelect emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .onPopupSelect((index: int): void => {
          console.info(this.value[index.toInt()] + 'on onPopupSelect')
          this.showToast("onPopupSelect() " + index)
        })
        .onRequestPopupData((index: int): Array<String> => {
          console.info(this.value[index.toInt()] + 'on onRequestPopupData')
          this.showToast("onRequestPopupData() " + index)
          this.onRequestPopupDataStatus = true
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": this.onRequestPopupDataStatus
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60202,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onRequestPopupData start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onRequestPopupData emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          return ['1', '2', '3', '4', '5']

        })
    }.width("100%").height("100%")
  }
}

