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
  Text,
  TextArea,
  ClickEvent,
  Row,
  Button,
  WordBreak
} from '@ohos.arkui.component'
import {
  State,
  
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct WordBreakTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '
  @State wordBreakList: WordBreak[] = [WordBreak.NORMAL,WordBreak.BREAK_ALL,WordBreak.BREAK_WORD,WordBreak.HYPHENATION]
  @State wordBreakIndex: Int = 0
  build() {
    Column() {
      Row(){
        Button('setWordBreak1').onClick((e:ClickEvent)=>{
          console.log('onClick button 1')
          this.wordBreakIndex =1
        })
          .id('setWordBreak1')
          .width('33%')
        Button('setWordBreak2').onClick((e:ClickEvent)=>{
          console.log('onClick button 2')
          this.wordBreakIndex =2
        })
          .id('setWordBreak2')
          .width('33%')
        Button('setWordBreak3').onClick((e:ClickEvent)=>{
          console.log('onClick button 3')
          this.wordBreakIndex =3
        })
          .id('setWordBreak3')
          .width('33%')
      }.height('5%')
      console.log('11111----TextArea')
      console.log('11111----TextArea' + this.wordBreakList[this.wordBreakIndex])
      TextArea({text:this.text})
        .wordBreak(this.wordBreakList[this.wordBreakIndex])
        .clip(true)
        .id('wordBreakTest')
    }
    .height('100%')
  }
}