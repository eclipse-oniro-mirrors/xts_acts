'use static'

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
  Text,
  Search,
  ClickEvent,
  Row,
  Button,
  TextDecorationType,
  Color,
  TextDecorationStyle,
  TextDecorationOptions
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SearchDecorationTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State option1: TextDecorationOptions = {
    type: TextDecorationType.Underline, color: Color.Red, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions;
  @State option2: TextDecorationOptions = {
    type: TextDecorationType.Overline, color: Color.Blue, style: TextDecorationStyle.DASHED} as TextDecorationOptions;
  @State option3: TextDecorationOptions = {
    type: TextDecorationType.LineThrough, color: Color.Blue, style: TextDecorationStyle.SOLID} as TextDecorationOptions;
  @State option4: TextDecorationOptions = {
    type: undefined, color: Color.Blue, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions;
  @State option5: TextDecorationOptions = {
    type: TextDecorationType.LineThrough, color: undefined, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions;
  @State option6: TextDecorationOptions = {
    type: TextDecorationType.Underline, color: Color.Blue,style: undefined} as TextDecorationOptions;
  @State searchArray: (TextDecorationOptions | undefined)[] = [
    this.option1, undefined, this.option2, this.option3, this.option4, this.option5, this.option6];
  @State searchArrayStr: string[] = ['option1', 'undefined', 'option2', 'option3', 'option4', 'option5', 'option6'];
  @State searchIndex: Int = 0;

  build() {
    Column(undefined) {
      Button('Search Decoration: ' + this.searchArrayStr[this.searchIndex])
        .onClick((e: ClickEvent)=>{
          this.searchIndex = ++this.searchIndex % this.searchArray.length;
        })
        .id('button_decoration')
      Search({value:this.text})
        .height(50)
        .decoration(this.searchArray[this.searchIndex])
        .id('SearchTest')
    }
    .height('100%')
  }
}