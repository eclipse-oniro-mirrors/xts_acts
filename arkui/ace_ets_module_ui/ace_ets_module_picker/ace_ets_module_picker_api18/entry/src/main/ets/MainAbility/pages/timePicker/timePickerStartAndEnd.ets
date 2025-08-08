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
import {MessageManager,Callback} from '../../common/MessageManager';

@Entry
@Component
struct TimePickerStartAndEnd {
  @State selectedTime: Date = new Date('2022-07-22 06:00:00');
  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime,
        start: new Date('2022-07-22 08:00:00'),
        end: new Date('2022-07-22  10:00:00')
      })
      .id('TimePicker')

      TimePicker({
        selected: this.selectedTime,
        start: undefined,
        end: undefined
      })
      .id('TimePicker2')

      TimePicker({
        selected: this.selectedTime,
        start: null,
        end: null
      })
      .id('TimePicker3')
    }
  }
}
