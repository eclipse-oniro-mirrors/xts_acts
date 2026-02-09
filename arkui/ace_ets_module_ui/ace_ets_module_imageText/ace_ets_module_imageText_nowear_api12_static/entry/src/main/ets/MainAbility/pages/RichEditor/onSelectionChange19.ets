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
import { Entry, Column, Component,RichEditorController ,Column,RichEditorOptions,RichEditorRange,
  RichEditor,Text,Color,$r,RichEditorTextSpanOptions,RichEditorImageSpanOptions

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
@Entry
@Component
struct onSelectionChange19 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(():void => {

          this.controller.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ["57px", "57px"]
              }
            } as RichEditorImageSpanOptions)
        })
        .onSelectionChange((event:RichEditorRange):void => {
          this.text1 += 1
          this.text2 = '' +  event?.start
          this.text3 = '' +  event?.end
        })
        .id('onSelectionChange19_RichEditor')
        .width('100%')
        .height('30%')
      Text('' + this.text1).key("onSelectionChange19_text1")
      Text('' + this.text2).key("onSelectionChange19_text2")
      Text('' + this.text3).key("onSelectionChange19_text3")
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}