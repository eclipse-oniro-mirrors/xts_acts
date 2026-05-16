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
import { CustomTheme } from '@ohos.arkui.theme';
import { redCustomTheme } from '../../themes/CustomTheme';
export const checkBoxThemeProperty = 'CheckBoxThemeProperty';

export class CheckBoxKeys {
  public static readonly checkboxGroupSystem = `CheckboxGroup_System;`
  public static readonly checkboxSystem = `Checkbox_System`;
  public static readonly checkboxGroupWithTheme = `CheckboxGroup_WithTheme`;
  public static readonly checkboxWithTheme = `Checkbox_WithTheme`;
}

@Entry
@Component
struct CheckboxPage {
  @StorageLink(checkBoxThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  count: number = 0;
  isSelected: boolean[] = [true];
  groups: string[] = [`Group0`, `Group1`];

  build() {
    Row() {
      Column({ space: '40vp' }) {
        Column({ space: '8vp' }) {
          Text('Checkbox and CheckboxGroup,\nSystem Theme')

          Column() {
            CheckboxGroup({ group: this.groups[0] })
              .key(CheckBoxKeys.checkboxGroupSystem)

            Row() {
              Checkbox({ group: this.groups[0] })
                .select(true)
                .key(CheckBoxKeys.checkboxSystem)
              Text('Apple')
            }
          }
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')

        WithTheme({ theme: this.localTheme }) {
          Column({ space: '8vp' }) {
            Text('Checkbox and CheckboxGroup,\nCustom Theme')

            Column() {
              CheckboxGroup({ group: this.groups[1] })
                .key(CheckBoxKeys.checkboxGroupWithTheme)

              Row() {
                Checkbox({ group: this.groups[1] })
                  .select(this.isSelected[0])
                  .onChange((value: boolean) => {
                    this.isSelected[0] = value
                  })
                  .key(CheckBoxKeys.checkboxWithTheme)
                Text('Apple')
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
        }
      }
    }
    .height('100%')
  }
}