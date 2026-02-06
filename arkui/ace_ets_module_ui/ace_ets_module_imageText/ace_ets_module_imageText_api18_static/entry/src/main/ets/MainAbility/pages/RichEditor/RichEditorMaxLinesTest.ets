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
import { Entry, Component, Column,RichEditor, RichEditorTextSpanOptions,Text,
  MutableStyledString,TextInputController,RichEditorController,RichEditorStyledStringController,RichEditorOptions,Row,Button,ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '../../common/MessageManager'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RichEditorMaxLinesTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '+'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '
  @State maxLineList: (number | int | undefined)[] = [-1,2.5, 6, undefined]
  @State maxLineIndex: Int = 0
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  controller2: TextInputController = new TextInputController()
  controller3: RichEditorController = new RichEditorController()
  controller4: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller: RichEditorController = new RichEditorController();
  option: RichEditorOptions = { controller: this.controller } as RichEditorOptions;


  build() {
    Column() {
      Row(){
        Button('setMaxLine1').onClick((e:ClickEvent)=>{
          this.maxLineIndex =1
        })
          .id('setMaxLine1')
          .width('33%')
        Button('setMaxLine2').onClick((e:ClickEvent)=>{
          this.maxLineIndex =2
        })
          .id('setMaxLine2')
          .width('33%')
        Button('setMaxLine3').onClick((e:ClickEvent)=>{
          this.maxLineIndex =3
        })
          .id('setMaxLine3')
          .width('33%')
      }.height('5%')
      RichEditor({ controller: this.controller3 } as RichEditorOptions)
        .onReady((): void => {
          this.controller3.addTextSpan(this.text,
            {
              style:
              {
                fontColor: 'rgb(0,74,175)'
              }
            } as RichEditorTextSpanOptions)
        })
        .margin(10)
        .width('95%')
        .maxLines((this.maxLineList[this.maxLineIndex])?.toInt())
        .backgroundColor('rgb(240,250,255)')
        .id('RichEditorMaxLines')
    }
    .height('100%')
  }
}