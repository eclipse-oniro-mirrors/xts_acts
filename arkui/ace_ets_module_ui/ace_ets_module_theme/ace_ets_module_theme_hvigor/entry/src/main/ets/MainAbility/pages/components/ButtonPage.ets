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

export const buttonThemeProperty = 'ButtonThemeProperty';

export class ButtonKeys {
  public static readonly buttonSystemNormalNormalNormal:string = `Button_System_normal_normal_normal`;
  public static readonly buttonSystemNormalEmphasizedNormal:string = `Button_System_normal_emphasized_normal`;
  public static readonly buttonSystemNormalTextualNormal:string = `Button_System_normal_textual_normal`;
  public static readonly buttonSystemNormalNormalSmall:string = `Button_System_normal_normal_small`;
  public static readonly buttonSystemNormalEmphasizedSmall:string = `Button_System_normal_emphasized_small`;
  public static readonly buttonSystemNormalTextualSmall:string = `Button_System_normal_textual_small`;
  public static readonly buttonSystemErrorNormalNormal:string = `Button_System_error_normal_normal`;
  public static readonly buttonSystemErrorEmphasizedNormal:string = `Button_System_error_emphasized_normal`;
  public static readonly buttonSystemErrorTextualNormal:string = `Button_System_error_textual_normal`;
  public static readonly buttonSystemErrorNormalSmall:string = `Button_System_error_normal_small`;
  public static readonly buttonSystemErrorEmphasizedSmall:string = `Button_System_error_emphasized_small`;
  public static readonly buttonSystemErrorTextualSmall:string = `Button_System_error_textual_small`;
  public static readonly buttonWithThemeNormalNormalNormal:string = `Button_WithTheme_normal_normal_normal`;
  public static readonly buttonWithThemeNormalEmphasizedNormal:string = `Button_WithTheme_normal_emphasized_normal`;
  public static readonly buttonWithThemeNormalTextualNormal:string = `Button_WithTheme_normal_textual_normal`;
  public static readonly buttonWithThemeNormalNormalSmall:string = `Button_WithTheme_normal_normal_small`;
  public static readonly buttonWithThemeNormalEmphasizedSmall:string = `Button_WithTheme_normal_emphasized_small`;
  public static readonly buttonWithThemeNormalTextualSmall:string = `Button_WithTheme_normal_textual_small`;
  public static readonly buttonWithThemeErrorNormalNormal:string = `Button_WithTheme_error_normal_normal`;
  public static readonly buttonWithThemeErrorEmphasizedNormal:string = `Button_WithTheme_error_emphasized_normal`;
  public static readonly buttonWithThemeErrorTextualNormal:string = `Button_WithTheme_error_textual_normal`;
  public static readonly buttonWithThemeErrorNormalSmall:string = `Button_WithTheme_error_normal_small`;
  public static readonly buttonWithThemeErrorEmphasizedSmall:string = `Button_WithTheme_error_emphasized_small`;
  public static readonly buttonWithThemeErrorTextualSmall:string = `Button_WithTheme_error_textual_small`;
}

@Entry
@Component
struct ButtonPage {
  @StorageLink(buttonThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  count = 0;

  build() {
    Column() {
      Column({ space: '8vp' }) {
        Button('Normal Button with System Theme',
          { buttonStyle: ButtonStyleMode.NORMAL })
          .key(ButtonKeys.buttonSystemNormalNormalNormal)
        Button('Emphasized Button with System Theme',
          { buttonStyle: ButtonStyleMode.EMPHASIZED })
          .key(ButtonKeys.buttonSystemNormalEmphasizedNormal)
        Button('Textual Button with System Theme',
          { buttonStyle: ButtonStyleMode.TEXTUAL })
          .key(ButtonKeys.buttonSystemNormalTextualNormal)
        Button('Small Normal Button with System Theme',
          { buttonStyle: ButtonStyleMode.NORMAL, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemNormalNormalSmall)
        Button('Small Emphasized Button with System Theme',
          { buttonStyle: ButtonStyleMode.EMPHASIZED, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemNormalEmphasizedSmall)
        Button('Small Textual Button with System Theme',
          { buttonStyle: ButtonStyleMode.TEXTUAL, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemNormalTextualSmall)
        WithTheme({ theme: this.localTheme }) {
          Column({ space: '8vp' }) {
            Button('Normal Button with Custom Theme',
              { buttonStyle: ButtonStyleMode.NORMAL, controlSize: ControlSize.NORMAL })
              .key(ButtonKeys.buttonWithThemeNormalNormalNormal)
            Button('Emphasized Button with Custom Theme',
              { controlSize: ControlSize.NORMAL })
              .key(ButtonKeys.buttonWithThemeNormalEmphasizedNormal)
            Button('Textual Button with Custom Theme',
              { buttonStyle: ButtonStyleMode.TEXTUAL, controlSize: ControlSize.NORMAL })
              .key(ButtonKeys.buttonWithThemeNormalTextualNormal)
            Button('Small Normal Button with Custom Theme',
              { buttonStyle: ButtonStyleMode.NORMAL, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeNormalNormalSmall)
            Button('Small Emphasized Button with Custom Theme',
              { buttonStyle: ButtonStyleMode.EMPHASIZED, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeNormalEmphasizedSmall)
            Button('Small Textual Button with Custom Theme',
              { buttonStyle: ButtonStyleMode.TEXTUAL, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeNormalTextualSmall)
            Button('Error Normal Button',
              { buttonStyle: ButtonStyleMode.NORMAL, role: ButtonRole.ERROR })
              .key(ButtonKeys.buttonWithThemeErrorNormalNormal)
            Button('Error Emphasized Button',
              { role: ButtonRole.ERROR, buttonStyle: ButtonStyleMode.EMPHASIZED })
              .key(ButtonKeys.buttonWithThemeErrorEmphasizedNormal)
            Button('Error Textual Button',
              { buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR })
              .key(ButtonKeys.buttonWithThemeErrorTextualNormal)
            Button('Error Small Normal Button',
              { buttonStyle: ButtonStyleMode.NORMAL, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeErrorNormalSmall)
            Button('Error Small Emphasized Button',
              { buttonStyle: ButtonStyleMode.EMPHASIZED, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeErrorEmphasizedSmall)
            Button('Error Small Textual Button',
              { buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
              .key(ButtonKeys.buttonWithThemeErrorTextualSmall)
          }
          .width('100%')
        }

        Button('Error Normal Button',
          { buttonStyle: ButtonStyleMode.NORMAL, role: ButtonRole.ERROR })
          .key(ButtonKeys.buttonSystemErrorNormalNormal)
        Button('Error Emphasized Button',
          { buttonStyle: ButtonStyleMode.EMPHASIZED, role: ButtonRole.ERROR })
          .key(ButtonKeys.buttonSystemErrorEmphasizedNormal)
        Button('Error Textual Button',
          { buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR })
          .key(ButtonKeys.buttonSystemErrorTextualNormal)
        Button('Error Small Normal Button',
          { buttonStyle: ButtonStyleMode.NORMAL, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemErrorNormalSmall)
        Button('Error Small Emphasized Button',
          { buttonStyle: ButtonStyleMode.EMPHASIZED, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemErrorEmphasizedSmall)
        Button('Error Small Textual Button',
          { buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR, controlSize: ControlSize.SMALL })
          .key(ButtonKeys.buttonSystemErrorTextualSmall)
      }
      .width('100%')
    }
    .height('100%')
  }
}