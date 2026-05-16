/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct RichEditorOnSelectionChange009 {
  controller: RichEditorController = new RichEditorController();
  @State onSelectCallBack: boolean = false;
  @State message: string = '';

  build() {

    Column() {

      Text('onSelectCallBack:' + this.onSelectCallBack).id('onSelectCallBack')
      Text('message:' + this.message).id('message')
      Button('setCaretOffset 2').onClick(() => {
        this.controller.setCaretOffset(2);
      }).id('setCaretOffset')

      Button('setCaretOffset begin').onClick(() => {
        this.controller.setCaretOffset(0);
      }).id('setCaretOffset_begin')

      Button('setCaretOffset end').onClick(() => {
        this.controller.setCaretOffset(11);
      }).id('setCaretOffset_end')

      Button('set int').onClick(() => {
        this.onSelectCallBack = false;
        this.message = '';
      }).id('set1')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['57px', '57px']
              }
            })
          this.controller.addTextSpan('\nabcde',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onSelectionChange((value: RichEditorRange) => {
          this.onSelectCallBack = true;
          console.log('RichEditorController value:' + JSON.stringify(value));
          this.message = JSON.stringify(value);
        })
        .id('rich_struct')

    }
  }
}