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
import { MyCustomSpan } from '../../common/MyCustomSpan'

@Entry
@Component
struct RichEditorCustomSpan006 {
  @State equals: boolean = false;
  @State length: string = '';
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  customSpan2: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  style2: MutableStyledString = new MutableStyledString(this.customSpan2);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  isPageShow: boolean = true;

  async onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;
    this.style1.appendStyledString(this.style2);
    this.controller.setStyledString(this.style1);
  }

  build() {
    Column() {
      Text('equals:' + this.equals).id('equals')
      Text('length:' + this.length).id('length')
      Button('get CustomSpanInfo')
        .onClick(() => {
          this.equals = this.style1.equals(this.style2);
          this.length = this.style1.getString().length + '';
        })
        .id('getCustomSpanInfo')
      RichEditor(this.options)
        .onReady(() => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorCustomSpan006')
    }
  }
}