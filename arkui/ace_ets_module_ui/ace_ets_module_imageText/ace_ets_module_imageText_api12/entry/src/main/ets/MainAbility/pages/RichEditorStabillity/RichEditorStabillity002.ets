/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorStabillity002 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State pointPosition: number = -1;
  @State style: string = '';

  build() {
    Column() {

      Column() {
        Text('' + this.pointPosition).id('pointPosition');
        Text('style:' + this.style).id('style');
        Button('get Point Position').onClick(() => {
          this.pointPosition = this.controller.getCaretOffset();
          console.log('this.pointPosition:' + this.pointPosition);
        }).id('getPosition')
        Button('get spans').onClick(() => {
          this.style = '';
          this.controller.getSpans({
            start: -1,
            end: -1
          }).forEach(item => {
            this.style = JSON.stringify((item as RichEditorTextSpanResult));
            console.log('RichEditorController  this.style:' +  JSON.stringify(this.style));
          })
        }).id('getSpans')
        Button('UpdateSpanStyles').onClick(() => {
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Brown,
                fontSize: 20
              }
            })
          }, 200)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Red,
                fontSize: 20
              }
            })
          }, 400)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40
              }
            })
          }, 600)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40,
                fontWeight: FontWeight.Bolder
              }
            })
          }, 800)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 30,
                fontWeight: FontWeight.Bolder,
                fontFamily: Utils.FONT_FAMILY
              }
            })
          }, 1000)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Green,
                fontSize: 40,
                fontWeight: FontWeight.Bolder,
                fontFamily: Utils.FONT_FAMILY,
                fontStyle: FontStyle.Italic
              }
            })
          }, 1200)
          setTimeout(() => {
            this.controller.updateSpanStyle({ start: -1, end: -1,
              textStyle: {
                fontColor: Color.Blue,
                fontSize: 30,
                fontWeight: FontWeight.Bolder,
                fontFamily: Utils.FONT_FAMILY,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.LineThrough,
                  color: Color.Black, style: TextDecorationStyle.SOLID }
              }
            })
          }, 1400)
        }).id('UpdateSpanStyles')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('abc',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('RichEditorStabillity002')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}