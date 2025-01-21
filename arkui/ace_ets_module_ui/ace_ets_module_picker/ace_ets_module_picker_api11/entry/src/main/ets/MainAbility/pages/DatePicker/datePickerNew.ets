/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct DatePickerLunar {
  private selectedDate: Date = new Date('2021-08-08')

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear DatePickerLunar start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear DatePickerLunar end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("datePicker-Lunar")
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
        .key("lunarText")

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate,
      })
        .key("DatePicker")
        .lunar(true)
        .onChange((date: DatePickerResult) => {
          Log.showInfo(TAG, 'select current date is: ' + JSON.stringify(date))
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate,
      })
        .lunar(false)
        .onChange((date: DatePickerResult) => {
          Log.showInfo(TAG, 'select current date is: ' + JSON.stringify(date))
        })
    }
    .width("100%")
    .height("100%")
  }
}

