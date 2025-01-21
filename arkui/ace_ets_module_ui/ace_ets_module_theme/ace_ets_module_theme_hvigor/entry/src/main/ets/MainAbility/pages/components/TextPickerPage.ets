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

export const textPickerThemeProperty: string = `TextPickerThemeProperty`;

export class TextPickerKeys {
  public static readonly textPickerSingleSystem = `TextPicker_Single_System`;
  public static readonly textPickerMultiSystem = `TextPicker_Single_System`;
  public static readonly textPickerCascadeSystem = `TextPicker_Single_System`;
  public static readonly textPickerSingleWithTheme = `TextPicker_Single_WithTheme`;
  public static readonly textPickerMultiWithTheme = `TextPicker_Single_WithTheme`;
  public static readonly textPickerCascadeWithTheme = `TextPicker_Single_WithTheme`;
}
@Entry
@Component
struct TextPickerPage {
  apples: string[] = ['apple1', 'apple2', 'apple3', 'apple4'];
  oranges: string[] = ['orange1', 'orange2', 'orange3', 'orange4'];
  peaches: string[] = ['peach1', 'peach2', 'peach3', 'peach4'];
  multi: string[][] = [this.apples, this.oranges, this.peaches];
  cascade: TextCascadePickerRangeContent[] = [
    {
      text: 'Main1',
      children: [
        {
          text: 'child11',
          children: [
            {
              text: 'child111'
            },
            {
              text: 'child112'
            },
            {
              text: 'child113'
            }
          ]
        }
      ]
    }
  ];

  @StorageLink(textPickerThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;

  build() {
    Column() {
      TextPicker({ range: this.apples })
        .key(TextPickerKeys.textPickerSingleSystem)
      TextPicker({ range: this.multi })
        .key(TextPickerKeys.textPickerMultiSystem)
      TextPicker({ range: this.cascade })
        .key(TextPickerKeys.textPickerCascadeSystem)

      WithTheme({ theme: this.localTheme }) {
        Column() {
          TextPicker({ range: this.apples })
            .key(TextPickerKeys.textPickerSingleWithTheme)
          TextPicker({ range: this.multi })
            .key(TextPickerKeys.textPickerMultiWithTheme)
          TextPicker({ range: this.cascade })
            .key(TextPickerKeys.textPickerCascadeWithTheme)
        }
      }
    }
  }
}
