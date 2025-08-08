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
struct RichEditorLineMetrics010 {
  controller: RichEditorController = new RichEditorController();
  @State topHeight: number = 0
  @State baseLine: number = 0
  build() {

    Column() {
      Text(this.topHeight + '').id('topHeight')
      Text(this.baseLine + '').id('baseLine')
      Button('get lineMetrics(0)').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController lineMetrics:' + JSON.stringify(lineMetrics));
          this.topHeight = lineMetrics.topHeight;
          this.baseLine = lineMetrics.baseline;
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .padding(10)
        .borderWidth(1)
        .borderColor(Color.Red)
        .height(100)
        .width(200)
        .onReady(() => {
          this.controller.addTextSpan('011\n');
          this.controller.addTextSpan('012\n');
          this.controller.addTextSpan('013\n');
          this.controller.addTextSpan('014\n');
          this.controller.addTextSpan('015\n');
          this.controller.addTextSpan('016\n');
          this.controller.addTextSpan('017\n');
        })
        .barState(BarState.On)
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics010')
    }
  }
}