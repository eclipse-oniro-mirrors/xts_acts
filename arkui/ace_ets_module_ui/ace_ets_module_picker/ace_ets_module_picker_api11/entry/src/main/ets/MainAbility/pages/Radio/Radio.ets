/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct RadioTest {
  build() {
    Row() {
      Column() {

        Radio({ value: 'Radio1', group: 'radioGroup' })
          .checked(true)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: "#FF000000" })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0100")
          .onChange((isChecked: boolean) => {
            console.log('Radio1 status is' + isChecked)
          })

        Radio({ value: 'Radio2', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: 0xffc0cb })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0200")
          .onChange((isChecked: boolean) => {
            console.log('Radio2 status is' + isChecked)
          })

        Radio({ value: 'Radio3', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: 'rgb(255,0,0)' })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0300")
          .onChange((isChecked: boolean) => {
            console.log('Radio3 status is' + isChecked)
          })

        Radio({ value: 'Radio4', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: Color.Green })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0400")
          .onChange((isChecked: boolean) => {
            console.log('Radio4 status is' + isChecked)
          })

        Radio({ value: 'Radio5', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: $r("app.color.radio_BackgroundColor") })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0500")
          .onChange((isChecked: boolean) => {
            console.log('Radio5 status is' + isChecked)
          })

        Radio({ value: 'Radio6', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: "rgb(138,43,226)" })
          .radioStyle({ checkedBackgroundColor: Color.Gray })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0600")
          .onChange((isChecked: boolean) => {
            console.log('Radio6 status is' + isChecked)
          })

        Radio({ value: 'Radio7', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ checkedBackgroundColor: 0xffff00 })
          .backgroundColor(Color.Pink)
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0700")
          .onChange((isChecked: boolean) => {
            console.log('Radio7 status is' + isChecked)
          })

        Radio({ value: 'Radio8', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .radioStyle({ checkedBackgroundColor: '' })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0800")
          .onChange((isChecked: boolean) => {
            console.log('Radio8 status is' + isChecked)
          })

        Radio({ value: 'Radio9', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .radioStyle({ checkedBackgroundColor: null })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_0900")
          .onChange((isChecked: boolean) => {
            console.log('Radio9 status is' + isChecked)
          })

        Radio({ value: 'Radio10', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .radioStyle({ checkedBackgroundColor: undefined })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_1000")
          .onChange((isChecked: boolean) => {
            console.log('Radio10 status is' + isChecked)
          })

        Radio({ value: 'Radio11', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .radioStyle({ checkedBackgroundColor: "rgb(255,0,0)" })
          .radioStyle({ checkedBackgroundColor: undefined })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_1100")
          .onChange((isChecked: boolean) => {
            console.log('Radio11 status is' + isChecked)
          })

        Radio({ value: 'Radio12', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .radioStyle({ checkedBackgroundColor: 'color' })
          .key("ArkUX_Stage_Radio_CheckedBackgroundColor_1200")
          .onChange((isChecked: boolean) => {
            console.log('Radio12 status is' + isChecked)
          })

        Radio({ value: 'Radio13', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: "#FF00FF00" })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0100")
          .onChange((isChecked: boolean) => {
            console.log('Radio13 status is' + isChecked)
          })

        Radio({ value: 'Radio14', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: 0xffc0cb })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0200")
          .onChange((isChecked: boolean) => {
            console.log('Radio14 status is' + isChecked)
          })

        Radio({ value: 'Radio15', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: 'rgb(255,255,0)' })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0300")
          .onChange((isChecked: boolean) => {
            console.log('Radio15 status is' + isChecked)
          })

        Radio({ value: 'Radio16', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: Color.Blue })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0400")
          .onChange((isChecked: boolean) => {
            console.log('Radio16 status is' + isChecked)
          })

        Radio({ value: 'Radio17', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: $r("app.color.radio_UnBorderColor") })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0500")
          .onChange((isChecked: boolean) => {
            console.log('Radio17 status is' + isChecked)
          })

        Radio({ value: 'Radio18', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: "rgb(138,43,226)" })
          .radioStyle({ uncheckedBorderColor: Color.Black })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0600")
          .onChange((isChecked: boolean) => {
            console.log('Radio18 status is' + isChecked)
          })

        Radio({ value: 'Radio19', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ uncheckedBorderColor: 0xffa500 })
          .backgroundColor(Color.Pink)
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0700")
          .onChange((isChecked: boolean) => {
            console.log('Radio19 status is' + isChecked)
          })

        Radio({ value: 'Radio20', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .radioStyle({ uncheckedBorderColor: '' })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0800")
          .onChange((isChecked: boolean) => {
            console.log('Radio20 status is' + isChecked)
          })

        Radio({ value: 'Radio21', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .radioStyle({ uncheckedBorderColor: null })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_0900")
          .onChange((isChecked: boolean) => {
            console.log('Radio21 status is' + isChecked)
          })

        Radio({ value: 'Radio22', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .radioStyle({ uncheckedBorderColor: undefined })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_1000")
          .onChange((isChecked: boolean) => {
            console.log('Radio22 status is' + isChecked)
          })

        Radio({ value: 'Radio23', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .radioStyle({ uncheckedBorderColor: "rgb(255,0,0)" })
          .radioStyle({ uncheckedBorderColor: undefined })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_1100")
          .onChange((isChecked: boolean) => {
            console.log('Radio23 status is' + isChecked)
          })

        Radio({ value: 'Radio24', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .radioStyle({ uncheckedBorderColor: 'bgr(138,43,226)' })
          .key("ArkUX_Stage_Radio_UncheckedBorderColor_1200")
          .onChange((isChecked: boolean) => {
            console.log('Radio24 status is' + isChecked)
          })

        Radio({ value: 'Radio25', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: "#FF00FFFF" })
          .key("ArkUX_Stage_Radio_IndicatorColor_0100")
          .onChange((isChecked: boolean) => {
            console.log('Radio25 status is' + isChecked)
          })

        Radio({ value: 'Radio26', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: 0xffc0cb })
          .key("ArkUX_Stage_Radio_IndicatorColor_0200")
          .onChange((isChecked: boolean) => {
            console.log('Radio26 status is' + isChecked)
          })

        Radio({ value: 'Radio27', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: 'rgb(255,97,0)' })
          .key("ArkUX_Stage_Radio_IndicatorColor_0300")
          .onChange((isChecked: boolean) => {
            console.log('Radio27 status is' + isChecked)
          })

        Radio({ value: 'Radio28', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: Color.Yellow })
          .key("ArkUX_Stage_Radio_IndicatorColor_0400")
          .onChange((isChecked: boolean) => {
            console.log('Radio28 status is' + isChecked)
          })

        Radio({ value: 'Radio29', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: $r("app.color.radio_IndicatorColor") })
          .key("ArkUX_Stage_Radio_IndicatorColor_0500")
          .onChange((isChecked: boolean) => {
            console.log('Radio29 status is' + isChecked)
          })

        Radio({ value: 'Radio30', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: "rgb(138,43,226)" })
          .radioStyle({ indicatorColor: Color.Black })
          .key("ArkUX_Stage_Radio_IndicatorColor_0600")
          .onChange((isChecked: boolean) => {
            console.log('Radio30 status is' + isChecked)
          })

        Radio({ value: 'Radio31', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({ indicatorColor: 0xffa500 })
          .backgroundColor(Color.Pink)
          .key("ArkUX_Stage_Radio_IndicatorColor_0700")
          .onChange((isChecked: boolean) => {
            console.log('Radio31 status is' + isChecked)
          })

        Radio({ value: 'Radio32', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .radioStyle({ indicatorColor: '' })
          .key("ArkUX_Stage_Radio_IndicatorColor_0800")
          .onChange((isChecked: boolean) => {
            console.log('Radio32 status is' + isChecked)
          })

        Radio({ value: 'Radio33', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .radioStyle({ indicatorColor: null })
          .key("ArkUX_Stage_Radio_IndicatorColor_0900")
          .onChange((isChecked: boolean) => {
            console.log('Radio33 status is' + isChecked)
          })

        Radio({ value: 'Radio34', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .radioStyle({ indicatorColor: undefined })
          .key("ArkUX_Stage_Radio_IndicatorColor_1000")
          .onChange((isChecked: boolean) => {
            console.log('Radio34 status is' + isChecked)
          })

        Radio({ value: 'Radio35', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .radioStyle({ indicatorColor: "rgb(138,43,226)" })
          .radioStyle({ indicatorColor: undefined })
          .key("ArkUX_Stage_Radio_IndicatorColor_1100")
          .onChange((isChecked: boolean) => {
            console.log('Radio35 status is' + isChecked)
          })

        Radio({ value: 'Radio36', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .radioStyle({ indicatorColor: 'bgr(138,43,226)' })
          .key("ArkUX_Stage_Radio_IndicatorColor_1200")
          .onChange((isChecked: boolean) => {
            console.log('Radio36 status is' + isChecked)
          })

        Radio({ value: 'Radio37', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .radioStyle({
            checkedBackgroundColor: "#FFFF0000",
            uncheckedBorderColor: "#FFDB70DB",
            indicatorColor: "#FFFFFF00"
          })
          .key("ArkUX_Stage_Radio_Color_0100")
          .onChange((isChecked: boolean) => {
            console.log('Radio37 status is' + isChecked)
          })

        Radio({ value: 'Radio38', group: 'radioGroup' })
          .checked(false)
          .width(50)
          .height(50)
          .borderColor($r("sys.color.ohos_id_color_emphasize"))
          .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
          .foregroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
          .key("ArkUX_Stage_Radio_0100")
          .onChange((isChecked: boolean) => {
            console.log('Radio38 status is' + isChecked)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}