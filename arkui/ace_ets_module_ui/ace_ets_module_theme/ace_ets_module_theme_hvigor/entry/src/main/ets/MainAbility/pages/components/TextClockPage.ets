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

import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const textClockThemeProperty = 'TextClockThemeProperty';
export const textClockThemeSetProperty: string = `TextClockThemeSetProperty`

export const textClockFontColor: ResourceColor | undefined = brownCustomTheme.colors?.fontEmphasize

export class TextClockKeys {
  public static readonly textClockSystem = `TextClock_System`;
  public static readonly textClockWithTheme = `TextClock_WithTheme`;
  public static readonly textClockSystemCustomAttrs = `TextClock_System_CustomAttrs`
  public static readonly textClockWithThemeCustomAttrs = `TextClock_WithTheme_CustomAttrs`
}

@Entry
@Component
struct TextClockPage {
  @StorageLink(textClockThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(textClockThemeSetProperty) themeSet: boolean = true
  textClockController: TextClockController = new TextClockController();
  timeZoneOffset: number = 1;

  build() {
    Column({ space: '8vp' }) {
      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.textClockController })
        .key(TextClockKeys.textClockSystem)

      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.textClockController })
        .fontColor(textClockFontColor)
        .key(TextClockKeys.textClockSystemCustomAttrs)

      WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
        Column({ space: '8vp' }) {
          TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.textClockController })
            .key(TextClockKeys.textClockWithTheme)

          TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.textClockController })
            .fontColor(textClockFontColor)
            .key(TextClockKeys.textClockWithThemeCustomAttrs)
        }
      }
    }
    .width('100%')
  }
}