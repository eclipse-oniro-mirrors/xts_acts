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

export const toggleThemeProperty: string = `toggleThemeProperty`;

export class ToggleKeys {
  public static readonly toggleButtonSystem = `toggleButtonSystem`;
  public static readonly toggleSwitchSystem = `toggleSwitchSystem`;
  public static readonly toggleCheckBoxSystem = `toggleCheckBoxMultiSystem`;
  public static readonly toggleButtonWithTheme = `toggleButtonWithTheme`;
  public static readonly toggleSwitchWithTheme = `toggleSwitchWithTheme`;
  public static readonly toggleCheckBoxWithTheme = `toggleCheckBoxWithTheme`;
}
@Entry
@Component
struct TogglePage {
  @StorageProp(toggleThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Row() {
      Scroll() {
        Column({ space: '8vp' }) {
          Toggle({ type: ToggleType.Button })
            .height(`30vp`)
            .width(`30vp`)
            .key(ToggleKeys.toggleButtonSystem)
          Toggle({ type: ToggleType.Switch })
            .key(ToggleKeys.toggleSwitchSystem)
          Toggle({ type: ToggleType.Checkbox })
            .key(ToggleKeys.toggleCheckBoxSystem)
          WithTheme({ theme: this.localTheme }) {
            Column({ space: '8vp' }) {
              Toggle({ type: ToggleType.Button })
                .height(`30vp`)
                .width(`30vp`)
                .key(ToggleKeys.toggleButtonWithTheme)
              Toggle({ type: ToggleType.Switch })
                .key(ToggleKeys.toggleSwitchWithTheme)
              Toggle({ type: ToggleType.Checkbox })
                .key(ToggleKeys.toggleCheckBoxWithTheme)
            }
          }
        }
        .height('100%')
      }
    }
  }
}
