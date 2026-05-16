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
struct RichEditorLineMetrics009 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = '';
  private myOffset: number | undefined = undefined
  private myBuilder: CustomBuilder = undefined
  @State lineMetrics1: string = ''
  @State lineMetrics2: string = ''

  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {

    Column() {
      Text('lineMetrics(0):' + this.lineMetrics1).id('lineMetrics1')
      Text('lineMetrics(1):' + this.lineMetrics2).id('lineMetrics2')
      Button('get lineMetrics').id('getFirst')
        .onClick(() => {
          let layoutManager: LayoutManager = this.controller.getLayoutManager();
          let lineMetrics = layoutManager.getLineMetrics(0);
          console.log('RichEditorController 0 lineMetrics 0:' +  JSON.stringify(lineMetrics));
          this.lineMetrics1 = JSON.stringify(lineMetrics);

          let lineMetrics1 = layoutManager.getLineMetrics(1);
          console.log('RichEditorController 1 lineMetrics 1:' +  JSON.stringify(lineMetrics1));
          this.lineMetrics2 = JSON.stringify(lineMetrics1);
        })
        .margin({ bottom: 20, top: 10 })
      RichEditor({ controller: this.controller })
        .padding('10px')
        .width(200)
        .onReady(() => {
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics009')

      Button('add builder')
        .onClick(() => {
         this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
          this.controller.addTextSpan('\n');
          this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
        }).id('add_builder1')

      Row() {
        Button('builder').onClick(() => {
          this.myBuilder = () => {
            this.placeholderBuilder();
          }
        }).id('builder1')
      }
    }
  }
}