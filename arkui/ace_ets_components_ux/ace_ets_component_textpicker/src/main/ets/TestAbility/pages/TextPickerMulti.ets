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
//@ts-nocheck
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct TextPickerMultiTest {
  aboutToAppear() {
  }

  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]
  private cascade: TextCascadePickerRangeContent[] = [
    { text: '辽宁省', children: [{ text: '沈阳市', children: [{ text: '沈河区' }, { text: '和平区' }, { text: '浑南区' }] },
      { text: '大连市', children: [{ text: '中山区' }, { text: '金州区' }, { text: '长海县' }] }] },
    { text: '吉林省', children: [{ text: '长春市', children: [{ text: '南关区' }, { text: '宽城区' }, { text: '朝阳区' }] },
      { text: '四平市', children: [{ text: '铁西区' }, { text: '铁东区' }, { text: '梨树县' }] }] },
    { text: '黑龙江省', children: [{ text: '哈尔滨市', children: [{ text: '道里区' }, { text: '道外区' }, { text: '南岗区' }] },
      { text: '牡丹江市', children: [{ text: '东安区' }, { text: '西安区' }, { text: '爱民区' }] }] }
  ]

  build() {
    Row() {
      Column() {
            TextPicker({ range: this.multi })
              .key('textpicker_1')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade })
              .key('textpicker_2')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade, selected: [1, 1, 2] })
              .key('textpicker_3')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade, value: ["辽宁省", "大连市", "中山区"] })
              .key('textpicker_4')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade })
              .key('textpicker_5')
              .selectedIndex([2, 1, 2])
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade, value: ["辽宁省", "大连市", "中山区"], selected: [1, 1, 1] })
              .key('textpicker_6')
              .selectedIndex([0, 1, 2])
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade })
              .key('textpicker_7')
              .selectedIndex([null, 1, 1])
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade })
              .key('textpicker_8')
              .selectedIndex([1, undefined, 1])
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade })
              .key('textpicker_9')
              .selectedIndex([1, 1, ''])
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade, selected: [1, 0, ] })
              .key('textpicker_10')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
            TextPicker({ range: this.cascade, value: ['辽宁省', '大连市', ] })
              .key('textpicker_11')
              .width('300')
              .onChange((value: string | string[], index: number | number[]) => {
                console.info('Picker item changed1, value: ' + JSON.stringify(value))
              })
      }
      .width('100%')
    }
    .height('100%')
  }
}
