'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  Scroll,
  Flex,
  ButtonAttribute,
  AttributeModifier,
  Margin,
  Color,
  $r,
  ButtonType,
  ButtonRole,
  ButtonLabelStyle,
  ControlSize,
  ButtonStyleMode,
  FontStyle
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  public isMaxFontScaleModifier: Boolean = false
  public isMinFontScaleModifier: Boolean = false
  public isLabelStyleModifier: Boolean = false
  public isControlSizeModifier: Boolean = false
  public isButtonStyleModifier: Boolean = false
  public isButtonRoleModifier: Boolean = false
  public isStateEffectModifier: Boolean = false
  public isTypeModifier: Boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .maxFontScale(this.isMaxFontScaleModifier ? undefined : 1.5)
      .minFontScale(this.isMinFontScaleModifier ? undefined : 0.7)
      .labelStyle(this.isLabelStyleModifier ? undefined : { maxLines: 3 } as ButtonLabelStyle)
      .controlSize(this.isControlSizeModifier ? undefined : ControlSize.SMALL)
      .buttonStyle(this.isButtonStyleModifier ? undefined : ButtonStyleMode.NORMAL)
      .role(this.isButtonRoleModifier ? undefined : ButtonRole.ERROR)
      .stateEffect(this.isStateEffectModifier ? undefined : false)
      .type(this.isTypeModifier ? undefined : ButtonType.Circle)
  }
}

@Observed
export class MyButtonFontModifier implements AttributeModifier<ButtonAttribute> {
  public isFontFamilyModifier: Boolean = false
  public isFontStyleModifier: Boolean = false
  public isFontWeightModifier: Boolean = false
  public isFontSizeModifier: Boolean = true
  public isFontSizeModifier1: Boolean = false
  public isFontColorModifier: Boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .fontFamily(this.isFontFamilyModifier ? undefined : 'serif')
      .fontStyle(this.isFontStyleModifier ? undefined : FontStyle.Italic)
      .fontWeight(this.isFontWeightModifier ? undefined : 100)
      .fontSize(this.isFontSizeModifier ? undefined : 30.0)
      .fontColor(this.isFontColorModifier ? undefined : Color.Red)
  }
}

@Observed
export class MyButtonFontSizeModifier implements AttributeModifier<ButtonAttribute> {
  public isFontSizeModifier1: Boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.fontSize(this.isFontSizeModifier1 ? undefined : 8.0)
  }
}

@Entry
@Component
struct CheckboxExample {
  @State maxFontScaleModifier: MyButtonModifier = new MyButtonModifier()
  @State minFontScaleModifier: MyButtonModifier = new MyButtonModifier()
  @State labelStyleModifier: MyButtonModifier = new MyButtonModifier()
  @State controlSizeModifier: MyButtonModifier = new MyButtonModifier()
  @State buttonStyleModifier: MyButtonModifier = new MyButtonModifier()
  @State buttonRoleModifier: MyButtonModifier = new MyButtonModifier()
  @State stateEffectModifier: MyButtonModifier = new MyButtonModifier()
  @State typeModifier: MyButtonModifier = new MyButtonModifier()
  @State fontFamilyModifier: MyButtonFontModifier = new MyButtonFontModifier()
  @State fontStyleModifier: MyButtonFontModifier = new MyButtonFontModifier()
  @State fontWeightModifier: MyButtonFontModifier = new MyButtonFontModifier()
  @State fontSizeModifier: MyButtonFontModifier = new MyButtonFontModifier()
  @State fontColorModifier: MyButtonFontModifier = new MyButtonFontModifier()
  @State fontSizeModifier1: MyButtonFontSizeModifier = new MyButtonFontSizeModifier()

  build() {
    Scroll() {
      Column() {
        Row() {
          Button('maxFontScale')
            .margin(10)
            .attributeModifier(this.maxFontScaleModifier)
            .id('button_maxFontScaleModifier')

          Button('改变maxFontScale-modifier state: ' + JSON.stringify(this.maxFontScaleModifier.isMaxFontScaleModifier))
            .onClick(() => {
              this.maxFontScaleModifier.isMaxFontScaleModifier = !this.maxFontScaleModifier.isMaxFontScaleModifier
            })
            .id('button_maxFontScaleModifier2')
        }

        Row() {
          Button('minFontScale')
            .margin(10)
            .attributeModifier(this.minFontScaleModifier)
            .id('button_minFontScaleModifier')

          Button('改变minFontScale-modifier state: ' + JSON.stringify(this.minFontScaleModifier.isMinFontScaleModifier))
            .onClick(() => {
              this.minFontScaleModifier.isMinFontScaleModifier = !this.minFontScaleModifier.isMinFontScaleModifier
            })
            .id('button_minFontScaleModifier2')
        }

        Column() {
          Button('\'labelStyle设置Button组件label文本和字体的样式,设置label文本的最大行数。如果指定此参数，则文本最多不会超过指定的行。如果有多余的文本，可以通过overflow来指定截断方式。\' +\n' +
            '    \'默认值：1\'')
            .margin(10)
            .attributeModifier(this.labelStyleModifier)
            .id('button_labelStyleModifier')

          Button('改变labelStyle-modifier state: ' + JSON.stringify(this.labelStyleModifier.isLabelStyleModifier))
            .onClick(() => {
              this.labelStyleModifier.isLabelStyleModifier = !this.labelStyleModifier.isLabelStyleModifier
            })
            .id('button_labelStyleModifier2')
        }

        Row() {
          Button('ControlSize')
            .margin(10)
            .attributeModifier(this.controlSizeModifier)
            .id('button_controlSizeModifier')

          Button('改变ControlSize-modifier state: ' + JSON.stringify(this.controlSizeModifier.isControlSizeModifier))
            .onClick(() => {
              this.controlSizeModifier.isControlSizeModifier = !this.controlSizeModifier.isControlSizeModifier
            })
            .id('button_controlSizeModifier2')
        }

        Row() {
          Button('ButtonStyle')
            .margin(10)
            .attributeModifier(this.buttonStyleModifier)
            .id('button_buttonStyleModifier')

          Button('改变ButtonStyle-modifier state: ' + JSON.stringify(this.buttonStyleModifier.isButtonStyleModifier))
            .onClick(() => {
              this.buttonStyleModifier.isButtonStyleModifier = !this.buttonStyleModifier.isButtonStyleModifier
            })
            .id('button_buttonStyleModifier2')
        }

        Row() {
          Button('ButtonRole')
            .margin(10)
            .attributeModifier(this.buttonRoleModifier)
            .id('button_roleModifier')

          Button('改变ButtonRole-modifier state: ' + JSON.stringify(this.buttonRoleModifier.isButtonRoleModifier))
            .onClick(() => {
              this.buttonRoleModifier.isButtonRoleModifier = !this.buttonRoleModifier.isButtonRoleModifier
            })
            .id('button_roleModifier2')
        }

        Row() {
          Button('fontFamily')
            .margin(10)
            .attributeModifier(this.fontFamilyModifier)
            .id('button_fontFamilyModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontFamilyModifier.isFontFamilyModifier))
            .onClick(() => {
              this.fontFamilyModifier.isFontFamilyModifier = !this.fontFamilyModifier.isFontFamilyModifier
            })
            .id('button_fontFamilyModifier2')
        }

        Row() {
          Button('fontStyle')
            .margin(10)
            .attributeModifier(this.fontStyleModifier)
            .id('button_fontStyleModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontStyleModifier.isFontStyleModifier))
            .onClick(() => {
              this.fontStyleModifier.isFontStyleModifier = !this.fontStyleModifier.isFontStyleModifier
            })
            .id('button_fontStyleModifier2')
        }

        Row() {
          Button('fontWeight')
            .margin(10)
            .attributeModifier(this.fontWeightModifier)
            .id('button_fontWeightModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontWeightModifier.isFontWeightModifier))
            .onClick(() => {
              this.fontWeightModifier.isFontWeightModifier = !this.fontWeightModifier.isFontWeightModifier
            })
            .id('button_fontWeightModifier2')
        }

        Row() {
          Button('fontSize')
            .margin(10)
            .controlSize(ControlSize.NORMAL)
            .attributeModifier(this.fontSizeModifier)
            .id('button_fontSizeModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontSizeModifier.isFontSizeModifier))
            .onClick(() => {
              this.fontSizeModifier.isFontSizeModifier = !this.fontSizeModifier.isFontSizeModifier
            })
            .id('button_fontSizeModifier2')
        }

        Row() {
          Button('fontSize')
            .margin(10)
            .controlSize(ControlSize.SMALL)
            .attributeModifier(this.fontSizeModifier1)
            .id('button_fontSizeModifier3')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontSizeModifier1.isFontSizeModifier1))
            .onClick(() => {
              this.fontSizeModifier1.isFontSizeModifier1 = !this.fontSizeModifier1.isFontSizeModifier1
            })
            .id('button_fontSizeModifier4')
        }

        Row() {
          Button('fontColor')
            .margin(10)
            .attributeModifier(this.fontColorModifier)
            .id('button_fontColorModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.fontColorModifier.isFontColorModifier))
            .onClick(() => {
              this.fontColorModifier.isFontColorModifier = !this.fontColorModifier.isFontColorModifier
            })
            .id('button_fontColorModifier2')
        }

        Row() {
          Button('stateEffect')
            .margin(10)
            .attributeModifier(this.stateEffectModifier)
            .id('button_stateEffectModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.stateEffectModifier.isStateEffectModifier))
            .onClick(() => {
              this.stateEffectModifier.isStateEffectModifier = !this.stateEffectModifier.isStateEffectModifier
            })
            .id('button_stateEffectModifier2')
        }

        Row() {
          Button('type')
            .margin(10)
            .attributeModifier(this.typeModifier)
            .id('button_typeModifier')

          Button('改变fontFamily-modifier state: ' + JSON.stringify(this.typeModifier.isTypeModifier))
            .onClick(() => {
              this.typeModifier.isTypeModifier = !this.typeModifier.isTypeModifier
            })
            .id('button_typeModifier2')
        }
      }
    }
  }
}