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
import { MyCustomSpan } from '../../common/MyCustomSpan'

@Entry
@Component
struct RichEditorFromStyledString {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  styleStr: StyledString = new StyledString('');
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 20, 80);
  styleStr1: MutableStyledString = new MutableStyledString(this.customSpan1);

  build() {
    Column() {
      RichEditor(this.options)
        .height('5%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorFromStyledString_0')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('0123',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height('5%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorFromStyledString_1')

      Button('fromStyledString []').onClick(() => {
        let array: RichEditorSpan[] = this.controller.fromStyledString(this.styleStr);
        console.log('fromStyledString return []:' + array.length)
        AppStorage.setOrCreate('fromStyledString_return_0', array.length)
      }).id('fromStyledString_return_0')

      Button('fromStyledString [1]').onClick(() => {
        let array: RichEditorSpan[] = this.controller1.fromStyledString(this.styleStr1);
        console.log('fromStyledString return [1]:' + array.length)
        AppStorage.setOrCreate('fromStyledString_return_1', array.length)
      }).id('fromStyledString_return_1')
    }
  }
}