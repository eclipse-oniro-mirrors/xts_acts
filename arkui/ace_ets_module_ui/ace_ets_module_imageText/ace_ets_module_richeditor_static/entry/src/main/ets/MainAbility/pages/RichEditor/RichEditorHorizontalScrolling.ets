'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry, RichEditorController, Column, Row, Component, $r, Color, RichEditor, RowOptions, Scroll, ColumnOptions,
  State
} from '@kit.ArkUI'

@Entry
@Component
struct RichEditorHorizontalScrollingStatic {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();

  build() {
    Scroll(){
      Column() {
        RichEditor({ controller: this.controller1 })
          .width('100%')
          .height('5%')
          .id('richEditor_horizontalScrolling_default_static')
          .borderWidth(1)
          .borderColor(Color.Gray)

        RichEditor({ controller: this.controller2 })
          .width('100%')
          .height('5%')
          .id('richEditor_horizontalScrolling_true_static')
          .horizontalScrolling(true)
          .borderWidth(1)
          .borderColor(Color.Gray)

        RichEditor({ controller: this.controller3 })
          .width('100%')
          .height('5%')
          .id('richEditor_horizontalScrolling_false_static')
          .horizontalScrolling(false)
          .borderWidth(1)
          .borderColor(Color.Gray)


        RichEditor({ controller: this.controller5 })
          .width('100%')
          .height('5%')
          .id('richEditor_horizontalScrolling_undefined_static')
          .horizontalScrolling(undefined)
          .borderWidth(1)
          .borderColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
    }
  }
}