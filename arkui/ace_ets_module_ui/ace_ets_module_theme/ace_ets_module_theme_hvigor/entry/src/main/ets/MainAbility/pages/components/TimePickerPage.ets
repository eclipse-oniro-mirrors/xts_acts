/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const timePickerThemeProperty: string = `timePickerThemeProperty`;
export const timePickerIsMilitaryProperty: string = `timePickerIsMilitaryProperty`;
export class TimePickerKeys {
  public static readonly timePickerSystem = `TimePicker_System`;
  public static readonly timePickerWithTheme = `TimePicker_WithTheme`;
}

@Entry
@Component
struct TimePickerPage {
  @StorageProp(timePickerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(timePickerIsMilitaryProperty) isMilitary: boolean = false;

  build() {
    Column() {
      TimePicker()
        .useMilitaryTime(this.isMilitary)
        .key(TimePickerKeys.timePickerSystem)
      WithTheme({ theme: this.localTheme }) {
        TimePicker()
          .useMilitaryTime(this.isMilitary)
          .key(TimePickerKeys.timePickerWithTheme)
      }
    }
  }
}
