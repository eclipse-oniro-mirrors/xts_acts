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
struct RichEditorLineMetrics023 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetricsOnCut: string = '';
  @State lineMetricsOnPaste: string = '';
  build() {

    Column() {
      Text('lineMetricsOnCut' + this.lineMetricsOnCut).id('lineMetricsOnCut')
      Text('lineMetricsOnPaste:' + this.lineMetricsOnPaste).id('lineMetricsOnPaste')
      Button('select')
        .id('select')
        .margin(15)
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller.setSelection(1, 2, options);
        })
      Button('set end')
        .id('set_end')
        .margin(15)
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          this.controller.setCaretOffset(5);
        })
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abcdef',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onCut((event:CutEvent) => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController lineMetricsOnCut:' +  JSON.stringify(lineMetrics));
          this.lineMetricsOnCut = JSON.stringify(lineMetrics);
        })
        .onPaste(()=>{
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController lineMetricsOnPaste:' +  JSON.stringify(lineMetrics));
          this.lineMetricsOnPaste = JSON.stringify(lineMetrics);
        })
        .id('RichEditorLineMetrics023')
    }
  }
}