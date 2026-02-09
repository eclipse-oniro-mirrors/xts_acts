'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import Log from '../../common/Log';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Select,
  OnSelectCallback,
  FontStyle
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SelectOnSelect {
  @State selectIndex: number = 1

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SelectOnSelect start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SelectOnSelect end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Select([{ value: 'aaa', icon: "/common/1.png" },
          { value: 'bbb', icon: "/common/2.png" },
          { value: 'ccc', icon: "/common/3.png" },
          { value: 'ddd', icon: "/common/4.png" }])
          .key("Select")
          .selected(2)
          .value('TTT')
          .font({
            size: 30,
            weight: 400,
            family: 'serif',
            style: FontStyle.Normal
          })
          .selectedOptionFont({
            size: 40,
            weight: 500,
            family: 'serif',
            style: FontStyle.Normal
          })
          .optionFont({
            size: 30,
            weight: 400,
            family: 'serif',
            style: FontStyle.Normal
          })
          .onSelect((index: int, text?: string | undefined) => {
            console.info("Select:" + index)
            this.selectIndex = index
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "selectIndex": this.selectIndex
                } as Record<String,RecordData>
              } as events_emitter.EventData
              let backEvent: events_emitter.InnerEvent = {
                eventId: 60222,
                priority: events_emitter.EventPriority.LOW
              } as events_emitter.InnerEvent
              console.info("SelectOnSelect start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("SelectOnSelect emit action state err: " + JSON.stringify((err as Error).message))
            }
          } as OnSelectCallback)
      }
    }.width("100%").height("100%")
  }
}

