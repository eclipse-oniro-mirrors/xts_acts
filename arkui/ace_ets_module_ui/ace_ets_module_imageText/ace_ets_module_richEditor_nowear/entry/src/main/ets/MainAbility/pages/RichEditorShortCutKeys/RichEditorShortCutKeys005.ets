/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct RichEditorShortCutKeys005 {
  controller: RichEditorController = new RichEditorController();
  private myOffset: number | undefined = undefined;
  private myBuilder: CustomBuilder = undefined;
  @State positionNum: number = -1;
  @State selection: string = '';
  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {

    Column() {
      Row(){
        Text('positionNum:' + this.positionNum).id('positionNum').width('50%').clip(true)
        Text('selection:' + this.selection).id('selection').width('50%').clip(true)
      }.height('5%')
      Row(){
        Button('get position')
          .id('get_position')
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.positionNum = this.controller.getCaretOffset();
          }).width('50%')
        Button('set position')
          .id('set_position')
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.controller.setCaretOffset(3);
          }).width('50%')
      }.height('5%')
      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(300)
        .width(200)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addTextSpan('abc123');
            this.myBuilder = () => {
              this.placeholderBuilder();
            }
            this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
          this.controller.addTextSpan('abc123');
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['25px', '25px']
                }
              });
          this.controller.addTextSpan('abc123');
            this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
              {
                style:
                {
                  fontSize: 30
                }
              });
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController onSelectionChange:' + JSON.stringify(value));
          this.selection = JSON.stringify(value);
        })
        .id('RichEditorShortCutKeys005')
    }
  }
}