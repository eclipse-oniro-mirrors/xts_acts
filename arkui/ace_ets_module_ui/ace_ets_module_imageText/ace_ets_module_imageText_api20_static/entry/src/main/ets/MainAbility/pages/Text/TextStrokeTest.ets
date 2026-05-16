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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  Entry,
  Component,
  $r,
  Text,
  Row,
  Column,
  Color,
  ClickEvent,
  Search,
  TextInput,
  TextArea,
  Button,
  Resource,
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct TextStrokeTest {
  @State isStrokeWidth: (null | undefined | LengthMetrics)[] =
    [null, undefined, LengthMetrics.percent(5),
      LengthMetrics.percent(-5),
      LengthMetrics.lpx(5), LengthMetrics.lpx(-5)] as (null | undefined | LengthMetrics)[]
  @State isStrokeWidthIndex: number = 1
  @State isStrokeColor: (Color | number | string | Resource | null | undefined)[] = [null, undefined, Color.Pink, 10, '#FF125AD6', $r('app.color.red')] as (Color | number | string | Resource | null | undefined)[]
  @State isStrokeColorIndex: number = 1
  build() {
    Column() {
      Search({ value:'这是测试文本', placeholder: '请输入'})
        // .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex as int])
        // .strokeColor(this.isStrokeColor[this.isStrokeColorIndex as int])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('Search')
      TextInput({ text:'这是测试文本', placeholder: '请输入'})
        // .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex])
        // .strokeColor(this.isStrokeColor[this.isStrokeColorIndex])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('TextInput')
      TextArea({ text:'这是测试文本', placeholder: '请输入'})
        // .strokeWidth(this.isStrokeWidth[this.isStrokeWidthIndex])
        // .strokeColor(this.isStrokeColor[this.isStrokeColorIndex])
        .fontColor(Color.Pink)
        .height('5%')
        .clip(true)
        .id('TextArea')
      Button('changeStroke').onClick((e: ClickEvent)=>{
        this.isStrokeWidthIndex ++
        this.isStrokeColorIndex ++
      })
        .id('changeStroke')
      Button('getStroke').onClick((e: ClickEvent)=>{
        let textInputJson = inspector.getInspectorByKey('TextInput');
        let textInputObj = JSON.parseJsonElement(textInputJson);
        AppStorage.setOrCreate<string>('TextInputStrokeWidth',textInputObj.getElement('$attrs').getString("strokeWidth"))
        AppStorage.setOrCreate<string>('TextInputStrokeColor',textInputObj.getElement('$attrs').getString("strokeColor"))
        console.log('textInputObj--StrokeWidth:' + textInputObj.getElement('$attrs').getString("strokeWidth"));
        console.log('textInputObj--StrokeColor:' + textInputObj.getElement('$attrs').getString("strokeColor"));
        let textAreaJson = inspector.getInspectorByKey('TextArea');
        let textAreaObj = JSON.parseJsonElement(textAreaJson);
        AppStorage.setOrCreate<string>('TextAreaStrokeWidth',textAreaObj.getElement('$attrs').getString("strokeWidth"))
        AppStorage.setOrCreate<string>('TextAreaStrokeColor',textAreaObj.getElement('$attrs').getString("strokeColor"))
        console.log('textAreaObj--StrokeWidth:' + textAreaObj.getElement('$attrs').getString("strokeWidth"));
        console.log('textAreaObj--StrokeColor:' + textAreaObj.getElement('$attrs').getString("strokeColor"));
        let searchJson = inspector.getInspectorByKey('Search');
        let searchObj = JSON.parseJsonElement(searchJson);
        AppStorage.setOrCreate<string>('SearchStrokeWidth',searchObj.getElement('$attrs').getString("strokeWidth"))
        AppStorage.setOrCreate<string>('SearchStrokeColor',searchObj.getElement('$attrs').getString("strokeColor"))
        console.log('searchObj--StrokeWidth:' + searchObj.getElement('$attrs').getString("strokeWidth"));
        console.log('searchObj--StrokeColor:' + searchObj.getElement('$attrs').getString("strokeColor"));
      })
        .id('getStroke')
    }
  }
}