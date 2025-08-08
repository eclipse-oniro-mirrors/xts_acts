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

@Entry
@Component
struct OnDoubleClickOnHover {
  @State textFlag: string = 'Init';
  controller: RichEditorController = new RichEditorController()
  options: RichEditorOptions = { controller: this.controller };
  gesture1: RichEditorGesture = {
    onDoubleClick: () => {
      this.textFlag = 'onDoubleClick succ'
    }
  }
  options1: RichEditorImageSpanOptions = {
    imageStyle:
    {
      size: ['600px', '200px'],
      layoutStyle: {
        margin: 1,
        borderRadius: 1
      }
    },
    gesture: this.gesture1,
    onHover : (status) => {
      this.textFlag = 'onHover:' + status
    }
  }

  build() {
    Column() {
      Text(this.textFlag)
        .id('OnDoubleClickOnHover')
        .height('10%')
      RichEditor(this.options)
        .id('RichEditor_OnDoubleClickOnHover')
        .width('25%')
        .height('10%')
        .borderWidth(1)
        .onReady(() => {
          this.controller.addImageSpan($r('app.media.icon'), this.options1)
        })
    }.width('100%')
  }
}