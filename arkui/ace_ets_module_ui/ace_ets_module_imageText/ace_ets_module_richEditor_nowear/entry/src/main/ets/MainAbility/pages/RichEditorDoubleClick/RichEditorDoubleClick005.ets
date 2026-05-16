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
struct RichEditorDoubleClick005 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State message: string = '';
  private myOffset: number | undefined = undefined
  private myBuilder: CustomBuilder = undefined
  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
  }
  build() {
    Column() {

      Column() {

        Text('message:' + this.message).id('message')
        Button('addBuilder')
          .onClick(() => {
            this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
          }).id('addBuilder')
        Button('builder').onClick(() => {
          this.myBuilder = () => {
            this.placeholderBuilder();
          }
        }).id('builder')
        RichEditor(this.options)
          .onReady(() => {

          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height(80)
          .id('RichEditorDoubleClick005')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}