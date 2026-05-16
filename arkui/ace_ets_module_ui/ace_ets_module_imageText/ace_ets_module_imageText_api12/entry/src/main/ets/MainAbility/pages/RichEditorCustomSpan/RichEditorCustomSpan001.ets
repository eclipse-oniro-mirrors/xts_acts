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
import {MyCustomSpan} from '../../common/MyCustomSpan'

@Entry
@Component
struct RichEditorCustomSpan001 {
  @State customSpanInfo: string = '';
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 20, 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  isPageShow: boolean = true;

  async onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;
    this.controller.setStyledString(this.style1)
  }

  build() {
    Column() {
      Text('customSpanInfo:' + this.customSpanInfo).id('customSpanInfo')
      Button('get CustomSpanInfo')
        .onClick(() => {
          let richEditorStyledString = this.controller.getStyledString();
          let styles = richEditorStyledString.getStyles(0, richEditorStyledString.length);
          this.customSpanInfo = JSON.stringify(styles);
        })
        .id('getCustomSpanInfo')
      RichEditor(this.options)
        .onReady(() => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorCustomSpan001')
    }
  }
}