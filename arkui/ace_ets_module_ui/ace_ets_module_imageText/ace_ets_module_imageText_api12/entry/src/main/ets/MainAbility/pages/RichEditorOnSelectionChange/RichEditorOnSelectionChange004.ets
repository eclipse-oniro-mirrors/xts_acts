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
struct RichEditorOnSelectionChange004 {
  controller: RichEditorController = new RichEditorController();
  @State onSelectCallBack: boolean = false;
  @State message: string = '';

  build() {

    Column() {

      Text('onSelectCallBack:' + this.onSelectCallBack).id('onSelectCallBack')
      Text('message:' + this.message).id('message')

      Button('setSelection (1 4)').onClick(() => {
        this.controller.setSelection(1, 4);
      }).id('set1')

      Button('setSelection (2, 12)').onClick(() => {
        this.controller.setSelection(2, 12);
      }).id('set2')

      Button('setSelection (-1, -1)').onClick(() => {
        this.controller.setSelection(-1, -1);
      }).id('set3')

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
        })
        .onSelectionChange((value: RichEditorRange) => {
          this.onSelectCallBack = true;
          console.log('RichEditorController value:' + JSON.stringify(value));
          if('{"start":5,"end":5}' !== JSON.stringify(value)){
            this.message += JSON.stringify(value);
          }
        })
        .id('rich_struct')

    }
  }
}