'use static';
/*
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

import {MessageManager,Callback} from '../../common/MessageManager';
import{TextPickerModifier} from '@ohos.arkui.modifier'

import {
  Entry, Component, Builder,NodeContainer, TextCascadePickerRangeContent, TextPickerRangeContent,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, $r,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, TextPicker, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class Bottom {
  public bottom:number = 50
}
let bott:Bottom = new Bottom()
// class CustomModifier extends TextPickerModifier {
//   applyNormalAttribute(instance: TextPickerAttribute): void {
//     super.applyNormalAttribute?.(instance);
//   }
//   resetOnChange(){
//     this.onChange(null);
//   }
// }
@Entry
@Component
struct TimePickerPage {
  @State isLunar: boolean = false
  @State onChangeOff: string = 'false'
  @State onDateChangeOff: string = 'false'
  @State modifier:TextPickerModifier = new TextPickerModifier()
    .onChange((value: string | string[], index: int | int[]) => {  //SDK12.15 onChange回调未执行
      console.info('check003 TextPickerOnChangeModifier 单列 Picker item changed, value: ' + value + ', index: ' + index)
      this.onChangeOff = 'true'
  })

  @State modifier1:TextPickerModifier = new TextPickerModifier()
    .onScrollStop((value: string | string[], index: int | int[]) => {
      console.info('check003 TextPickerOnScrollStopeModifier Picker item changed, value: ' + value + ', index: ' + index)
      this.onDateChangeOff = 'true'
  })
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4']
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4']
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits]
  private cascade: TextCascadePickerRangeContent[] = [
    {
      text: '辽宁省',
      children: [{ text: '沈阳市', children: [{ text: '沈河区' }, { text: '和平区' }, { text: '浑南区' }] },
        { text: '大连市', children: [{ text: '中山区' }, { text: '金州区' }, { text: '长海县' }] }]
    } as TextCascadePickerRangeContent,
    {
      text: '吉林省',
      children: [{ text: '长春市', children: [{ text: '南关区' }, { text: '宽城区' }, { text: '朝阳区' }] },
        { text: '四平市', children: [{ text: '铁西区' }, { text: '铁东区' }, { text: '梨树县' }] }]
    } as TextCascadePickerRangeContent,
    {
      text: '黑龙江省',
      children: [{ text: '哈尔滨市', children: [{ text: '道里区' }, { text: '道外区' }, { text: '南岗区' }] },
        { text: '牡丹江市', children: [{ text: '东安区' }, { text: '西安区' }, { text: '爱民区' }] }]
    } as TextCascadePickerRangeContent
  ]
  private efgbhmn: TextPickerRangeContent[] = [
    {
      icon:'RangeContent',
      text:'11111'
    } as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_video'),
      text:'video'
    }as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_phone'),
      text:'phone'
    }as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_more'),
      text:$r('sys.string.ohos_lab_write_imagevideo')
    }as TextPickerRangeContent
  ]
  private picture: TextPickerRangeContent[] = [
    {
      icon:'RangeContent'
    } as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_video')
    } as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_phone')
    } as TextPickerRangeContent,
    {
      icon:$r('sys.media.ohos_ic_public_more')
    } as TextPickerRangeContent
  ]
  private select: number = 1


  build() {
    Column() {
      Button('切换公历农历')
        .margin({ top: 30, bottom: 30 } as Margin)
        .onClick((e:ClickEvent) => {
          this.isLunar = !this.isLunar
        }).id('LunarBtn')
      TextPicker({ range: this.apfruits, selected: this.select as int})
      .attributeModifier(this.modifier as TextPickerModifier)
      .attributeModifier(this.modifier1 as TextPickerModifier)
      .margin(50)
      .id('TextPicker')
      Text(this.onChangeOff.toString()).key('onChangeOff')
      Text(this.onDateChangeOff.toString()).key('onScrollStopOff')
    }
  }
}
