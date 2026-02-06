/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../../test/List.test'
@Entry
@Component
struct checkBoxTest {
  
  aboutToAppear() {
  }

  build() {
    Row() {
      Column() {

            Checkbox({name: 'checkbox1',  group: 'checkboxGroup2'})
              .select(true)
              .selectedColor(0xed6f21)
              .unselectedColor(0x00ff00)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox2',  group: 'checkboxGroup2'})
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor("#fffd0000")
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100")
              .selectAll(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:0x00ff00})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup2'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200")
              .selectedColor(0xed6f21)
              .mark({strokeColor:"#fffd0000"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup3'})
              .selectAll(false)
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300")
              .selectedColor(0xed6f21)
              .mark({strokeColor:"rgb(138,43,226)"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup4'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400")
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup5'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500")
              .selectedColor(0xed6f21)
              .mark({strokeColor:$r("app.color.checkbox_Color")})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup6'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .selectedColor(0xed6f21)
              .mark({strokeColor:""})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup7'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .selectedColor(0xed6f21)
              .mark({strokeColor:null})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup8'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .selectedColor(0xed6f21)
              .mark({strokeColor:undefined})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup9'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900")
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .mark({strokeColor:"#FFFD0000"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup10'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .mark({strokeColor:'bgr(138,43,226)'})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup11'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .selectedColor(0xed6f21)
              .mark({strokeColor:'bgr(138,43,226)'})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup12'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200")
              .selectedColor(0xed6f21)
              .mark({strokeColor:0x00ff00})
              .backgroundColor(null)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup12'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1300")
              .selectedColor(0xed6f21)
              .mark({strokeColor:-1})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup13'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0100")
              .selectedColor(0xed6f21)
              .mark({size:0})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup14'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0200")
              .selectedColor(0xed6f21)
              .mark({size:10})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup15'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0300")
              .selectedColor(0xed6f21)
              .mark({size:"60px"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup16'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0400")
              .selectedColor(0xed6f21)
              .mark({size:"120%"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup17'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0500")
              .selectedColor(0xed6f21)
              .mark({size:$r("app.string.Check_Mark_Size_test")})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup18'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0600")
              .selectedColor(0xed6f21)
              .mark({size:""})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup19'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0700")
              .selectedColor(0xed6f21)
              .mark({size:null})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup20'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0800")
              .selectedColor(0xed6f21)
              .mark({size:undefined})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup21'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_0900")
              .selectedColor(0xed6f21)
              .mark({size:10})
              .mark({size:"40fp"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup22'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1000")
              .selectedColor(0xed6f21)
              .mark({size:10})
              .mark({size:undefined})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup23'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1100")
              .selectedColor(0xed6f21)
              .mark({size:"asdf#$8"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup24'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1200")
              .selectedColor(0xed6f21)
              .mark({size:"10.00lpx"})
              .size(null)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup24'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkSize_1300")
              .selectedColor(0xed6f21)
              .mark({size:-10})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup25'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0100")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:0})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup26'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0200")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:1})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup27'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0300")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"60px"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup28'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0400")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"120%"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup29'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0500")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:$r("app.string.Check_Mark_Size_test")})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup30'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0600")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:""})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup31'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0700")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:null})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup32'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0800")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:undefined})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup33'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_0900")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:10})
              .mark({strokeWidth:"5fp"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup34'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1000")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:10})
              .mark({strokeWidth:undefined})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup35'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1100")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"frgw*&^%"})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup36'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1200")
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"40lpx"})
              .width(null)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup37'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1300")
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .mark({strokeWidth:-1})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup37'})
              .key("ArkUX_Stage_CheckboxGroup_CheckMarkWidth_1400")
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .mark({strokeColor:0x00ff00, size:40, strokeWidth:40})
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup38'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0100")
              .selectedColor(0xed6f21)
              .unselectedColor(0x00ff00)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup39'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0200")
              .selectedColor(0xed6f21)
              .unselectedColor('#fffd0000')
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup40'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0300")
              .selectedColor(0xed6f21)
              .unselectedColor("rgb(138,43,226)")
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup41'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0400")
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup42'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0500")
              .selectedColor(0xed6f21)
              .unselectedColor($r("app.color.checkbox_Color"))
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup43'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0600")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .unselectedColor("")
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup44'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0700")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .unselectedColor(null)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup45'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0800")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .unselectedColor(undefined)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup46'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_0900")
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .unselectedColor("#FFFD0000")
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup47'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_1000")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .unselectedColor(undefined)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup48'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_1100")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .unselectedColor('bgr(138,43,226)')
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup49'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_1200")
              .selectedColor(0xed6f21)
              .unselectedColor(0x00ff00)
              .backgroundColor(null)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroup49'})
              .key("ArkUX_Stage_CheckboxGroup_unselectedColor_1300")
              .selectedColor(0xed6f21)
              .unselectedColor(-1)
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            CheckboxGroup({group: 'checkboxGroupNO'})
              .key("checkboxGroupNO")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .selectedColor(0xed6f21)
              .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .onChange((value: CheckboxGroupResult) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox3',  group: 'checkboxGroupNO'})
              .key("checkboxNO")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .borderColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })
      }
      .width('100%')
    }
    .height('100%')
  }
}
