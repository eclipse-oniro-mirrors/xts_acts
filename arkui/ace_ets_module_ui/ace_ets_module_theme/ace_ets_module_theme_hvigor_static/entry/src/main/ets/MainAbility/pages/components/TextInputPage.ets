'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  AlphabetIndexer,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  InputType,
  ItemAlign,
  Margin,
  ResourceColor,
  Row,
  Text,
  TextInput,
  TextInputStyle,
  WithTheme
} from '@ohos.arkui.component'
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme1'
import { StorageLink } from '@ohos.arkui.stateManagement'
import { CustomTheme } from '@ohos.arkui.theme';

export const textInputThemeProperty: string = `TextInputThemeProperty`

export const textInputThemeSetProperty: string = `TextInputThemeSetProperty`

export const textInputBackgroundColor: ResourceColor | undefined = brownCustomTheme.colors?.backgroundPrimary

export const textInputPlaceholderColor: ResourceColor | undefined = brownCustomTheme.colors?.fontOnPrimary

export class TextInputKeys {
  public static readonly textInputOthersSystem = 'TextInput_Others_System'
  public static readonly textInputPasswordSystem = `TextInput_Password_System`
  public static readonly textInputInlineSystem = `TextInput_Inline_System`
  public static readonly textInputOthersSystemCustomAttrs = 'TextInput_Others_System_CustomAttrs'
  public static readonly textInputPasswordSystemCustomAttrs = `TextInput_Password_System_CustomAttrs`
  public static readonly textInputInlineSystemCustomAttrs = `TextInput_Inline_System_CustomAttrs`
  public static readonly textInputOthersWithTheme = `TextInput_Others_WithTheme`
  public static readonly textInputPasswordWithTheme = `TextInput_Password_WithTheme`
  public static readonly textInputInlineWithTheme = `TextInput_Inline_WithTheme`
  public static readonly textInputOthersWithThemeCustomAttrs = `TextInput_Others_WithTheme_CustomAttrs`
  public static readonly textInputPasswordWithThemeCustomAttrs = `TextInput_Password_WithTheme_CustomAttrs`
  public static readonly textInputInlineWithThemeCustomAttrs = `TextInput_Inline_WithTheme_CustomAttrs`
}

@Entry
@Component
struct TextInputPage {
  @StorageLink(textInputThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme
  @StorageLink(textInputThemeSetProperty) themeSet: boolean = true

  build() {
    Column() {
      TextInput({ placeholder: 'Type text here' })
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .key(TextInputKeys.textInputOthersSystem)
      TextInput({ placeholder: 'Type text here' })
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .type(InputType.Password)
        .key(TextInputKeys.textInputPasswordSystem)
      TextInput({ placeholder: 'Type text here' })
        .style(TextInputStyle.Inline)
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .key(TextInputKeys.textInputInlineSystem)
      TextInput({ placeholder: 'Type text here' })
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .backgroundColor(textInputBackgroundColor)
        .placeholderColor(textInputPlaceholderColor)
        .key(TextInputKeys.textInputOthersSystemCustomAttrs)
      TextInput({ placeholder: 'Type text here' })
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .type(InputType.Password)
        .backgroundColor(textInputBackgroundColor)
        .placeholderColor(textInputPlaceholderColor)
        .key(TextInputKeys.textInputPasswordSystemCustomAttrs)
      TextInput({ placeholder: 'Type text here' })
        .style(TextInputStyle.Inline)
        .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
        .backgroundColor(textInputBackgroundColor)
        .placeholderColor(textInputPlaceholderColor)
        .key(TextInputKeys.textInputInlineSystemCustomAttrs)
      WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
        Column() {
          TextInput({ placeholder: 'Type text here' })
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .key(TextInputKeys.textInputOthersWithTheme)
          TextInput({ placeholder: 'Type text here' })
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .type(InputType.Password)
            .key(TextInputKeys.textInputPasswordWithTheme)
          TextInput({ placeholder: 'Type text here' })
            .style(TextInputStyle.Inline)
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .key(TextInputKeys.textInputInlineWithTheme)
          TextInput({ placeholder: 'Type text here' })
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .backgroundColor(textInputBackgroundColor)
            .placeholderColor(textInputPlaceholderColor)
            .key(TextInputKeys.textInputOthersWithThemeCustomAttrs)
          TextInput({ placeholder: 'Type text here' })
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .type(InputType.Password)
            .backgroundColor(textInputBackgroundColor)
            .placeholderColor(textInputPlaceholderColor)
            .key(TextInputKeys.textInputPasswordWithThemeCustomAttrs)
          TextInput({ placeholder: 'Type text here' })
            .style(TextInputStyle.Inline)
            .margin({ left: '20vp', right: '20vp', top: '10vp' } as Margin)
            .backgroundColor(textInputBackgroundColor)
            .placeholderColor(textInputPlaceholderColor)
            .key(TextInputKeys.textInputInlineWithThemeCustomAttrs)
        }.width('100%')
      }
    }
  }
}