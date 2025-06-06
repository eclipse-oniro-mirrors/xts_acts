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

export const dividerThemeProperty: string = `DividerThemeProperty`;

export class DividerKeys {
  public static readonly dividerSystem = `Divider_System`;
  public static readonly dividerWithTheme = `Divider_WithTheme`;
  public static readonly dividerWithRedTheme = `Divider_WithRedTheme`;
}
@Entry
@Component
struct DividerPage {
  @StorageLink(dividerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(dividerThemeProperty) redTheme: CustomTheme | undefined = redCustomTheme;
  buttonWidth: number = 200;

  build() {
    Row() {
      Column({ space: '100vp' }) {
        Column({ space: '8vp' }) {
          Button('Orange')
            .width(this.buttonWidth)
          Divider()
            .width(this.buttonWidth)
            .key(DividerKeys.dividerSystem)
          Button('Peach')
            .width(this.buttonWidth)

          Button('Orange')
            .width(this.buttonWidth)
          WithTheme({ theme: this.localTheme }) {
            Divider()
              .width(this.buttonWidth)
              .key(DividerKeys.dividerWithTheme)
          }
          Button('Peach')
            .width(this.buttonWidth)

         Column() {
          Button('Orange')
            .width(this.buttonWidth)
          WithTheme({ theme: this.redTheme }) {
            Divider()
              .width(this.buttonWidth)
              .key(DividerKeys.dividerWithRedTheme)
          }
          Button('Peach')
            .width(this.buttonWidth)
         }
        }
        .width('100%')
      }
    }
    .alignItems(VerticalAlign.Center)
    .height('100%')
  }
}