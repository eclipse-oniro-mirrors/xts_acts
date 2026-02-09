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
  ColumnOptions,
  Text,
  Button,
  TextAlign,
  ClickEvent,
  RichEditorController,
  RichEditorParagraphResult,
  RichEditor,
  RichEditorOptions,
  Color
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct RichEditorTest {
  controller: RichEditorController = new RichEditorController();
  private spanParagraphs: Array<RichEditorParagraphResult> = new Array<RichEditorParagraphResult>();
  @State text: string = ''
  build() {
    Column() {
      Text(this.text).id('RichEditor_text').height('10%')
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady(() :void=> {
          this.controller.addTextSpan("0123456789\n", {
            style: {
              fontColor: Color.Pink,
              fontSize: "32",
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 16
            }
          })
        })
        .width("80%")
        .height("30%")
        .border({ width: 1, radius: 5 })
        .draggable(false)

      Column({ space: 5 } as ColumnOptions) {
        Button("段落左对齐").onClick((e:ClickEvent) => {
          this.controller.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Start,
            }
          })
        }).key('RichEditor_Start')
	  .height('10%')

        Button("段落右对齐").onClick((e:ClickEvent) => {
          this.controller.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.End,
            }
          })
        }).key('RichEditor_End')
	  .height('10%')

        Button("段落居中").onClick((e:ClickEvent) => {
          this.controller.updateParagraphStyle({ start: -1, end: -1,
            style: {
              textAlign: TextAlign.Center,
            }
          })
        }).key('RichEditor_Center')
	  .height('10%')
        Button("getParagraphs").onClick((e:ClickEvent) => {
          this.spanParagraphs = this.controller.getParagraphs({ start: -1, end: -1 })!
          console.log("RichEditor getParagraphs:" + JSON.stringify(this.spanParagraphs))
          console.log("RichEditor getParagraphs textAlign:" + String(this.spanParagraphs[0].style.textAlign))
          // let index:number = Number(this.spanParagraphs[0].style.textAlign)
          this.text = String(this.spanParagraphs[0].style.textAlign)

        }).key('RichEditor_get')
	  .height('10%')



      }
    }
      .height('100%')
  }
}