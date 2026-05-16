/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct TextPickerDialogBGBlurStyle {
  showDialog(style: BlurStyle | null | undefined) {
    TextPickerDialog.show({
      // 建议使用 this.getUIContext().showTextPickerDialog()接口
      range: ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'],
      defaultPickerItemHeight: 40,
      backgroundBlurStyle: style,
    })
  }
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Button('Thin')
        .onClick(() => {
          this.showDialog(BlurStyle.Thin)
        })
        .id('ThinID')
      Button('Regular')
        .onClick(() => {
          this.showDialog(BlurStyle.Regular)
        })
        .id('RegularID')
      Button('Thick')
        .onClick(() => {
          this.showDialog(BlurStyle.Thick)
        })
        .id('ThickID')
      Button('BACKGROUND_THIN')
        .onClick(() => {
          this.showDialog(BlurStyle.BACKGROUND_THIN)
        })
        .id('BACKGROUND_THIN_ID')
      Button('BACKGROUND_REGULAR')
        .onClick(() => {
          this.showDialog(BlurStyle.BACKGROUND_REGULAR)
        })
        .id('BACKGROUND_REGULAR_ID')
      Button('BACKGROUND_THICK')
        .onClick(() => {
          this.showDialog(BlurStyle.BACKGROUND_THICK)
        })
        .id('BACKGROUND_THICK_ID')
      Button('BACKGROUND_ULTRA_THICK')
        .onClick(() => {
          this.showDialog(BlurStyle.BACKGROUND_ULTRA_THICK)
        })
        .id('BACKGROUND_ULTRA_THICK_ID')
      Button('NONE')
        .onClick(() => {
          this.showDialog(BlurStyle.NONE)
        })
        .id('NONE_ID')
      Button('COMPONENT_ULTRA_THIN')
        .onClick(() => {
          this.showDialog(BlurStyle.COMPONENT_ULTRA_THIN)
        })
        .id('COMPONENT_ULTRA_THIN_ID')
      Button('COMPONENT_THIN')
        .onClick(() => {
          this.showDialog(BlurStyle.COMPONENT_THIN)
        })
        .id('COMPONENT_THIN_ID')
      Button('COMPONENT_REGULAR')
        .onClick(() => {
          this.showDialog(BlurStyle.COMPONENT_REGULAR)
        })
        .id('COMPONENT_REGULAR_ID')

      Button('COMPONENT_THICK')
        .onClick(() => {
          this.showDialog(BlurStyle.COMPONENT_THICK)
        })
        .id('COMPONENT_THICK_ID')
      Button('COMPONENT_ULTRA_THICK')
        .onClick(() => {
          this.showDialog(BlurStyle.COMPONENT_ULTRA_THICK)
        })
        .id('COMPONENT_ULTRA_THICK_ID')
      Button('null')
        .onClick(() => {
          this.showDialog(null)
        })
        .id('nullID')
      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')
      Button('100')
        .onClick(() => {
          this.showDialog(100)
        })
        .id('100ID')
      Button('-100')
        .onClick(() => {
          this.showDialog(-100)
        })
        .id('-100ID')
    }.width('100%')
  }
}