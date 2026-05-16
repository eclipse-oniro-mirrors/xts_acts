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
  ClickEvent,
  Scroll,
  ButtonLabelStyle,
  ControlSize,
  TextOverflow,
  ButtonStyleMode,
  ButtonConfiguration,
  ButtonRole,
  TextHeightAdaptivePolicy,
  CommonAttribute,
  ButtonAttribute,
  ContentModifier,
  Color,
  WrappedBuilder,
  FontStyle,
  FontWeight,
  ButtonType,
  $r,
  TextInput
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'


@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State isUndefinedMaxFontScale: Boolean = false
  @State isUndefinedMinFontScale: Boolean = false
  @State isUndefinedFontFamily: Boolean = false
  @State isUndefinedFontStyle: Boolean = false
  @State isUndefinedFontWeight: Boolean = false
  @State isUndefinedFontSize: Boolean = true
  @State isUndefinedFontSize1: Boolean = false
  @State isUndefinedFontColor: Boolean = false
  @State isUndefinedStateEffect: Boolean = false
  @State isUndefinedType: Boolean = false
  @State isUndefinedLabelStyleList: Boolean = false
  @State isUndefinedControlSize: Boolean = false
  @State isUndefinedButtonStyle: Boolean = false
  @State isUndefinedButtonRole: Boolean = false
  message1: string = 'maxFontScale';
  message2: string = 'minFontScale';
  message3: string =
    'labelStyle设置Button组件label文本和字体的样式,设置label文本的最大行数。如果指定此参数，则文本最多不会超过指定的行。如果有多余的文本，可以通过overflow来指定截断方式。' +
      '默认值：1';
  message4: string = 'controlSize';
  message5: string = 'buttonStyle';
  message6: string = 'role';
  message7: string = 'contentModifier';
  message8: string = 'fontFamily';
  message9: string = 'FontStyle';
  message10: string = 'fontWeight';
  message11: string = 'fontSize';
  message12: string = 'fontColor'
  message13: string = 'stateEffect'
  message14: string = 'type'

  build() {
    Scroll() {
      Column(undefined) {
        Row() {
          Button(this.message1)
            .margin(10)
            .maxFontScale(this.isUndefinedMaxFontScale ? undefined : 1.5)
            .id('button_maxFontScale')

          Button('改变maxFontScale')
            .width('40%')
            .height(30)
            .margin(10)
            .onClick(() => {
              this.isUndefinedMaxFontScale = !this.isUndefinedMaxFontScale
            })
            .id('button_maxFontScale2')
        }

        Row() {
          Button(this.message2)
            .margin(10)
            .minFontScale(this.isUndefinedMinFontScale ? undefined : 0.7)
            .id('button_minFontScale')

          Button('改变minFontScale')
            .width('40%')
            .height(30)
            .margin(10)
            .onClick(() => {
              this.isUndefinedMinFontScale = !this.isUndefinedMinFontScale
            })
            .id('button_minFontScale2')
        }

        Column() {
          Button(this.message3)
            .margin(10)
            .labelStyle(this.isUndefinedLabelStyleList ? undefined : { maxLines: 3 } as ButtonLabelStyle)
            .id('button_labelStyle')

          Button('改变labelStyle行数').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedLabelStyleList = !this.isUndefinedLabelStyleList
            })
            .id('button_labelStyle2')
        }

        Row() {
          Button(this.message4)
            .margin(10)
            .controlSize(this.isUndefinedControlSize ? undefined : ControlSize.SMALL)
            .id('button_controlSize')

          Button('改变按钮的尺寸').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedControlSize = !this.isUndefinedControlSize
            })
            .id('button_controlSize2')
        }

        Row() {
          Button(this.message5)
            .margin(10)
            .buttonStyle(this.isUndefinedButtonStyle ? undefined : ButtonStyleMode.NORMAL)
            .id('button_buttonStyle')

          Button('改变按钮的角色。').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedButtonStyle = !this.isUndefinedButtonStyle
            })
            .id('button_buttonStyle2')
        }

        Row() {
          Button(this.message6)
            .margin(10)
            .role(this.isUndefinedButtonRole ? undefined : ButtonRole.ERROR)
            .id('button_role')

          Button('改变按钮的重要程度').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedButtonRole = !this.isUndefinedButtonRole
            })
            .id('button_role2')
        }

        Row() {
          Button(this.message8)
            .margin(10)
            .fontFamily(this.isUndefinedFontFamily ? undefined : 'serif')
            .id('button_fontFamily')

          Button('改变fontFamily')
            .width('40%')
            .height(30)
            .margin(10)
            .fontFamily('Sans')
            .onClick(() => {
              this.isUndefinedFontFamily = !this.isUndefinedFontFamily
            })
            .id('button_fontFamily2')
        }

        Row() {
          Button(this.message9)
            .margin(10)
            .fontStyle(this.isUndefinedFontStyle ? undefined : FontStyle.Italic)
            .id('button_fontStyle')

          Button('改变FontStyle').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedFontStyle = !this.isUndefinedFontStyle
            })
            .id('button_fontStyle2')
        }

        Row() {
          Button(this.message10)
            .margin(10)
            .fontWeight(this.isUndefinedFontWeight ? undefined : 100)
            .id('button_fontWeight')

          Button('改变fontWeight').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedFontWeight = !this.isUndefinedFontWeight
            })
            .id('button_fontWeight2')
        }

        Row() {
          Button(this.message11)
            .margin(10)
            .controlSize(ControlSize.NORMAL)
            .fontSize(this.isUndefinedFontSize ? undefined : 30.0)
            .id('button_fontSize')

          Button('改变fontSize').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedFontSize = !this.isUndefinedFontSize
            })
            .id('button_fontSize2')
        }

        Row() {
          Button(this.message11)
            .margin(10)
            .controlSize(ControlSize.SMALL)
            .fontSize(this.isUndefinedFontSize1 ? undefined : 8.0)
            .id('button_fontSize3')

          Button('改变fontSize').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedFontSize1 = !this.isUndefinedFontSize1
            })
            .id('button_fontSize4')
        }

        Row() {
          Button(this.message12)
            .margin(10)
            .fontColor(this.isUndefinedFontColor ? undefined : '#FFFF00FF')
            .id('button_fontColor')

          Button('改变fontColor')
            .width('40%')
            .height(30)
            .margin(10)
            .fontColor('#FFFF00FF')
            .onClick(() => {
              this.isUndefinedFontColor = !this.isUndefinedFontColor
            })
            .id('button_fontColor2')

        }

        Row() {
          Button(this.message13)
            .margin(10)
            .stateEffect(this.isUndefinedStateEffect ? undefined : false)
            .id('button_stateEffect')

          Button('改变stateEffect').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedStateEffect = !this.isUndefinedStateEffect
            })
            .id('button_stateEffect2')
        }

        Row() {
          Button(this.message14)
            .margin(10)
            .type(this.isUndefinedType ? undefined : ButtonType.Circle)
            .id('button_type')

          Button('改变type').width('40%').height(30).margin(10)
            .onClick(() => {
              this.isUndefinedType = !this.isUndefinedType
            })
            .id('button_type2')
        }
      }
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}
