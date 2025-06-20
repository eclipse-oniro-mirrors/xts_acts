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

export const radioThemeProperty: string = `RadioThemeProperty`;
export const radioThemeSetProperty: string = `RadioThemeSetProperty`;

export class RadioKeys {
  public static readonly radioSystem = `Radio_System`;
  public static readonly radioSystemCustomAttrs = `Radio_System_CustomAttrs`;
  public static readonly radioWithTheme = `Radio_WithTheme`;
  public static readonly radioWithThemeCustomAttrs = `Radio_WithTheme_CustomAttrs`;
}
@Entry
@Component
struct RadioPage {
  @StorageLink(radioThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(radioThemeSetProperty) themeSet: boolean | undefined = true;

  build() {
    Column() {
        Radio({ value: 'Radio1', group: 'radioGroup1' })
          .key(RadioKeys.radioSystem)
          .checked(true)

        Radio({ value: 'Radio2', group: 'radioGroup2' })
        .key(RadioKeys.radioSystemCustomAttrs)
        .radioStyle({
          checkedBackgroundColor: brownCustomTheme.colors?.compBackgroundEmphasize,
          uncheckedBorderColor: brownCustomTheme.colors?.iconFourth,
          indicatorColor: brownCustomTheme.colors?.iconOnPrimary
        })
        .checked(true)

        WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
          Column() {
            Radio({ value: 'Radio3', group: 'radioGroup3' })
              .key(RadioKeys.radioWithTheme)
              .checked(true)

          Radio({ value: 'Radio4', group: 'radioGroup4' })
            .key(RadioKeys.radioWithThemeCustomAttrs)
            .radioStyle({
              checkedBackgroundColor: brownCustomTheme.colors?.compBackgroundEmphasize,
              uncheckedBorderColor: brownCustomTheme.colors?.iconFourth,
              indicatorColor: brownCustomTheme.colors?.iconOnPrimary
            })
            .checked(true)  
          }
        }
    }
    .height('100%')
  }
}