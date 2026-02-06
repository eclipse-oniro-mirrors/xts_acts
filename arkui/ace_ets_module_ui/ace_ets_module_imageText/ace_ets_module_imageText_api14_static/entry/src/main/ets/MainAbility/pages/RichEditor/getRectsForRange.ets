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
import { Entry, Component, Column, RichEditor, Button, TextAlign, BorderOptions, Color, FontWeight, LayoutManager, ClickEvent, RichEditorController,RichEditorOptions, LayoutManager } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import text from '@ohos.graphics.text.d'
@Entry
@Component
struct getRectsForRange {
  controller: RichEditorController = new RichEditorController();
  @State str: string = ''
  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady(():void => {
          this.controller.addTextSpan("1234567890", {
            style: {
              fontColor: Color.Pink,
              fontSize: "30vp",
              fontWeight: FontWeight.Normal,
              letterSpacing: '20vp'
            },
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 20
            }
          })
        })
        .width("100%")
        .height("20%")
        .border({ width: 1, radius: 5 } as BorderOptions)
        .draggable(false)

      Button(this.str)
        .key("getRectsForRange_Key")
        .onClick((e:ClickEvent) => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager()!
          if(layoutManager){
            let boxes = layoutManager.getRectsForRange({start:0,end:4}, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT)
            if (boxes) {
              this.str = "getRectsForRange successful"
            }
          }
        })
    }
  }
}