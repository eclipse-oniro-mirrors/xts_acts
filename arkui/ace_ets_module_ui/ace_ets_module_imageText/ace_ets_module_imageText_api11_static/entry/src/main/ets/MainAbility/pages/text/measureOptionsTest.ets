'use static';
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
import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  $r,
  SizeOptions,
  Button,
  ClickEvent,
  FontStyle,
  TextAlign,
  TextOverflow,
  TextCase,
  FontWeight,
  Length
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router,  MeasureUtils } from '@ohos.arkui.UIContext'
@Entry
@Component
struct measureOptionsTest {
  @State uiContext: UIContext = this.getUIContext();
  @State uiContextMeasure: MeasureUtils = this.uiContext.getMeasureUtils();
  @State textStyle1: SizeOptions = this.uiContextMeasure.measureTextSize({
    textContent: '测试文本',
    fontStyle:1,
    fontWeight:100,
    fontFamily:'HarmonyOS Sans',
    letterSpacing:1,
    textAlign:1,
    overflow:1,
    lineHeight:10,
    baselineOffset:10,
    textCase:1
  })
  @State textStyle2: SizeOptions = this.uiContextMeasure.measureTextSize({
    textContent: '测试文本',
    fontStyle:FontStyle.Normal,
    fontWeight:'200',
    fontFamily:'HarmonyOS Sans',
    letterSpacing:'2',
    textAlign:TextAlign.Center,
    overflow:TextOverflow.Clip,
    lineHeight:'20',
    baselineOffset:'20',
    textCase:TextCase.UpperCase
  })
  @State textStyle3: SizeOptions = this.uiContextMeasure.measureTextSize({
    textContent: '测试文本',
    fontStyle:FontStyle.Italic,
    fontWeight:FontWeight.Bold,
    fontFamily:$r('app.string.fontFamily'),
    letterSpacing:'3vp',
    textAlign:TextAlign.JUSTIFY,
    overflow:TextOverflow.MARQUEE,
    lineHeight:$r('app.string.lineHeight'),
    baselineOffset:'20vp',
    textCase:TextCase.Normal
  })
  build() {
    Row() {
      Column() {
        Text(`The width of '测试文本': ${this.textStyle1.width}`).height('5%')
        Text(`The height of '测试文本': ${this.textStyle1.height}`).height('5%')
        Text(`The width of '测试文本': ${this.textStyle2.width}`).height('5%')
        Text(`The height of '测试文本': ${this.textStyle2.height}`).height('5%')
        Text(`The width of '测试文本': ${this.textStyle3.width}`).height('5%')
        Text(`The height of '测试文本': ${this.textStyle3.height}`).height('5%')
        Button('getWidthAndHeight').onClick((e:ClickEvent)=>{
          AppStorage.setOrCreate<number>('textStyle1Width',this.textStyle1.width! as number)
          AppStorage.setOrCreate<number>('textStyle1Height',this.textStyle1.height! as number)
          AppStorage.setOrCreate<number>('textStyle2Width',this.textStyle2.width! as number )
          AppStorage.setOrCreate<number>('textStyle2Height',this.textStyle2.height! as number)
          AppStorage.setOrCreate<number>('textStyle3Width',this.textStyle3.width! as number)
          AppStorage.setOrCreate<number>('textStyle3WHeight',this.textStyle3.height! as number)
        }).id('getWidthAndHeight').height('5%')
      }
      .width('100%')
    }
    .height('100%')
  }
}