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

export const radioThemeProperty: string = `RadioThemeProperty`;

export class RadioKeys {
  public static readonly radioSystem = `Radio_System`;
  public static readonly radioWithTheme = `Radio_WithTheme`;
}
@Entry
@Component
struct RadioPage {
  @StorageLink(radioThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Column() {
        Radio({ value: 'Radio1', group: 'radioGroup1' })
          .key(RadioKeys.radioSystem)
          .checked(true)
        WithTheme({ theme: this.localTheme }) {
          Radio({ value: 'Radio1', group: 'radioGroup2' })
            .key(RadioKeys.radioWithTheme)
            .checked(true)
        }
    }
    .height('100%')
  }
}