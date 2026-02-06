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
struct RichEditorAttributeStrings007 {

  @State spans: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
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
     Row(){
        Button('toStyledString 0,500').onClick(() => {
          let str = this.controller.toStyledString({start: 0,
            end: 500});
          this.spans = str.getString();
        }).id('toStyledString').width('30%')
        Button('toStyledString 2,2').onClick(() => {
          let str = this.controller.toStyledString({start: 2,
            end: 2});
          this.spans = str.getString();
        }).id('toStyledString1').width('30%')
        Button('toStyledString 2,1').onClick(() => {
          let str = this.controller.toStyledString({start: 2,
            end: 1});
          this.spans = str.getString();
        }).id('toStyledString2').width('30%')
      }.height('5%')
      Row(){
        Button('toStyledString undefined').onClick(() => {
          let str = this.controller.toStyledString(undefined);
          this.spans = str.getString();
        }).id('toStyledStringUndefined').width('30%')
        Button('builder').onClick(() => {
          this.myBuilder = () => {
            this.placeholderBuilder()
          }
        }).id('builder').width('30%')
        Button('add symbol builder').onClick(() => {
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 30
              }
            })
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 30
              }
            })
          this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
          this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
        }).id('addSpans').width('30%')
      }.height('5%')
      Button('add image').onClick(() => {
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
      }).id('addImage').height('5%')

      Text('spans:' + this.spans).id('spans').height('5%').clip(true)
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
          this.controller.addTextSpan('abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyz',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
          this.controller.addTextSpan('abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyz',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings007')
    }
  }
}