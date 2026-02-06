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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct TextStrokeTest {
  @State isStrokeWidth: (null | undefined | LengthMetrics)[] =
    [null, undefined, LengthMetrics.percent(5),
      LengthMetrics.percent(-5),
      LengthMetrics.lpx(5), LengthMetrics.lpx(-5)]
  @State isStrokeWidthIndex: number = 1
  @State isStrokeColor: (Color | number | string | Resource | null | undefined)[] = [null, undefined, Color.Pink, 10, '#FF125AD6', $r('app.color.red')]
  @State isStrokeColorIndex: number = 1
  build() {
    Column() {
      Search({ value:'这是测试文本', placeholder: '请输入'})
        .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex])
        .strokeColor(this.isStrokeColor[this.isStrokeColorIndex])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('Search')
      TextInput({ text:'这是测试文本', placeholder: '请输入'})
        .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex])
        .strokeColor(this.isStrokeColor[this.isStrokeColorIndex])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('TextInput')
      TextArea({ text:'这是测试文本', placeholder: '请输入'})
        .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex])
        .strokeColor(this.isStrokeColor[this.isStrokeColorIndex])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('TextArea')
      Button('changeStroke').onClick(()=>{
        this.isStrokeWidthIndex ++
        this.isStrokeColorIndex ++
      })
        .id('changeStroke')
      Button('getStroke').onClick(()=>{
        let textInputJson = getInspectorByKey('TextInput');
        let textInputObj:ESObject = JSON.parse(textInputJson);
        AppStorage.setOrCreate('TextInputStrokeWidth',textInputObj.$attrs.strokeWidth)
        AppStorage.setOrCreate('TextInputStrokeColor',textInputObj.$attrs.strokeColor)
        console.log('textInputObj--StrokeWidth:' + textInputObj.$attrs.strokeWidth);
        console.log('textInputObj--StrokeColor:' + textInputObj.$attrs.strokeColor);
        let textAreaJson = getInspectorByKey('TextArea');
        let textAreaObj:ESObject  = JSON.parse(textAreaJson);
        AppStorage.setOrCreate('TextAreaStrokeWidth',textAreaObj.$attrs.strokeWidth)
        AppStorage.setOrCreate('TextAreaStrokeColor',textAreaObj.$attrs.strokeColor)
        console.log('textAreaObj--StrokeWidth:' + textAreaObj.$attrs.strokeWidth);
        console.log('textAreaObj--StrokeColor:' + textAreaObj.$attrs.strokeColor);
        let searchJson = getInspectorByKey('Search');
        let searchObj:ESObject = JSON.parse(searchJson);
        AppStorage.setOrCreate('SearchStrokeWidth',searchObj.$attrs.strokeWidth)
        AppStorage.setOrCreate('SearchStrokeColor',searchObj.$attrs.strokeColor)
        console.log('searchObj--StrokeWidth:' + searchObj.$attrs.strokeWidth);
        console.log('searchObj--StrokeColor:' + searchObj.$attrs.strokeColor);
      })
        .id('getStroke')
    }
  }
}