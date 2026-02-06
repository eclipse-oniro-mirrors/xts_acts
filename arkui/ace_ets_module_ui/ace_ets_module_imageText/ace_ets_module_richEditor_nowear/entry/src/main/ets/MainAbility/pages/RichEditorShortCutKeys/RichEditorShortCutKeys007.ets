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
struct RichEditorShortCutKeys007 {
  controller: RichEditorController = new RichEditorController();
  @State style: string = '';
  build() {

    Column() {

      Row(){
        Button('get spans').onClick(() => {
          this.style = '';
          this.controller.getSpans({
            start: 0,
            end: 6
          }).forEach(item => {
            this.style = JSON.stringify(item);
            console.log('RichEditorController  item:' +  JSON.stringify(item));
          })
        }).id('get_content').width('50%')
        Button('select')
          .id('select')
          .margin(15)
          .backgroundColor(Color.Blue)
          .onClick(() => {
            let options: SelectionOptions = {
              menuPolicy: MenuPolicy.SHOW
            };
            this.controller.setSelection(1, 2, options);
          }).width('50%')
      }.height('5%')
      Text('style:' + this.style).id('style').height('5%').clip(true)
      RichEditor({ controller: this.controller })
        .padding('10px')
        .height(300)
        .width(200)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady(() => {
          this.controller.addTextSpan('abc123', {
            style: {
              fontSize: 35,
              fontWeight: FontWeight.Bold
            }
          });
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['25px', '25px']
                }
              });
        })
        .id('RichEditorShortCutKeys007')
    }
  }
}