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
@Entry
@Component
struct checkBoxTest {
  
  aboutToAppear(){
  }

  build() {
    Row() {
      Column() {

            Checkbox({name: 'checkbox1',  group: 'checkboxGroup1'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0100")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(0x00ff00)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox2',  group: 'checkboxGroup1'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0200")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor("#fffd0000")
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox3',  group: 'checkboxGroup1'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0300")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor("rgb(138,43,226)")
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox4',  group: 'checkboxGroup2'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0400")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox5',  group: 'checkboxGroup2'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0500")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor($r("app.color.checkbox_Color"))
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox6',  group: 'checkboxGroup2'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0600")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor("")
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox7',  group: 'checkboxGroup3'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0700")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox8',  group: 'checkboxGroup3'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0800")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(undefined)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox9',  group: 'checkboxGroup3'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_0900")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .unselectedColor("#FFFD0000")
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox10',  group: 'checkboxGroup13'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_1000")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .unselectedColor(undefined)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox11',  group: 'checkboxGroup13'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_1100")
              .backgroundColor($r("sys.color.ohos_id_color_switch_outline_off"))
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor('bgr(138,43,226)')
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox12',  group: 'checkboxGroup13'})
              .key("ArkUX_Stage_Checkbox_unselectedColor_1200")
              .select(false)
              .selectedColor(0xed6f21)
              .unselectedColor(0x00ff00)
              .backgroundColor(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox13',  group: 'checkboxGroup14'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0100")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:0x00ff00})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox14',  group: 'checkboxGroup14'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:"#fffd0000"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox15',  group: 'checkboxGroup14'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0300")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:"rgb(138,43,226)"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox16',  group: 'checkboxGroup15'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0400")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox17',  group: 'checkboxGroup15'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0500")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:$r("app.color.checkbox_Color")})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox18',  group: 'checkboxGroup15'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0600")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:""})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox19',  group: 'checkboxGroup25'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0700")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:null})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox20',  group: 'checkboxGroup25'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0800")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:undefined})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox21',  group: 'checkboxGroup25'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_0900")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .mark({strokeColor:"#FFFD0000"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox22',  group: 'checkboxGroup26'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_1000")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:Color.Pink})
              .mark({strokeColor:'bgr(138,43,226)'})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox23',  group: 'checkboxGroup26'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_1100")
              .backgroundColor($r("sys.color.ohos_id_color_foreground_contrary"))
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:'bgr(138,43,226)'})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox24',  group: 'checkboxGroup26'})
              .key("ArkUX_Stage_Checkbox_CheckMarkColor_1200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeColor:0x00ff00})
              .backgroundColor(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox25',  group: 'checkboxGroup27'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0100")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:0})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox26',  group: 'checkboxGroup27'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:1})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox27',  group: 'checkboxGroup27'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0300")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:"60px"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })
 
            Checkbox({name: 'checkbox28',  group: 'checkboxGroup38'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0400")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:"120%"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox29',  group: 'checkboxGroup38'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0500")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:$r("app.string.Check_Mark_Size_test")})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox30',  group: 'checkboxGroup38'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0600")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:""})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox31',  group: 'checkboxGroup39'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0700")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:null})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox32',  group: 'checkboxGroup39'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0800")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:undefined})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox33',  group: 'checkboxGroup39'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_0900")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:10})
              .mark({size:"40fp"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox34',  group: 'checkboxGroup40'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_1000")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:10})
              .mark({size:undefined})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox35',  group: 'checkboxGroup40'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_1100")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:"asdf#$8"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox36',  group: 'checkboxGroup40'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_1200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size: "10lpx" })
              .size(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox36',  group: 'checkboxGroup40'})
              .key("ArkUX_Stage_Checkbox_CheckMarkSize_1300")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({size:-10})
              .size(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox37',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0100")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:0})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox38',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:1})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox39',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0300")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"60px"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox40',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0400")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"120%"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })
 
            Checkbox({name: 'checkbox41',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0500")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:$r("app.string.Check_Mark_Size_test")})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox42',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0600")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:""})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox43',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0700")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:null})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox44',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0800")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:undefined})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox45',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_0900")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:10})
              .mark({strokeWidth:"5fp"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox46',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_1000")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:10})
              .mark({strokeWidth:undefined})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox47',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_1100")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"asdf#$8"})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox48',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_1200")
              .select(true)
              .selectedColor(0xed6f21)
              .mark({strokeWidth:"40lpx"})
              .width(null)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox49',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_1300")
              .select(true)
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .mark({strokeWidth:-1})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })

            Checkbox({name: 'checkbox49',  group: 'checkboxGroup'})
              .key("ArkUX_Stage_Checkbox_CheckMarkWidth_1400")
              .select(true)
              .selectedColor(0xed6f21)
              .unselectedColor(Color.Pink)
              .mark({strokeColor:0x00ff00, size:40, strokeWidth:40})
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is'+ value)
              })
        }
      .width('100%')
    }
    .height('100%')
  }
}
