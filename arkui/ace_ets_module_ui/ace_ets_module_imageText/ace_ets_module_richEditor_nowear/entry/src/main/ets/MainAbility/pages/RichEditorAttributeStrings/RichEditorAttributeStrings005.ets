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
import { LengthMetrics } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'
import { MyCustomSpan } from '../../common/MyCustomSpan'

@Entry
@Component
struct RichEditorAttributeStrings005 {

  @State spans: string = '';
  @State imageSpan: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  imagePixelMap: image.PixelMap | undefined = undefined;
  fontStyle: TextStyle = new TextStyle({ fontColor: Color.Blue });
  customSpan: MyCustomSpan = new MyCustomSpan('Hello', 20, 80);
  styleStr: MutableStyledString = new MutableStyledString(this.customSpan);
  mutableStyledString: MutableStyledString = new MutableStyledString('aaa',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle
    }]);

  async aboutToAppear() {
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }

  build() {
    Column() {

      Button('fromStyledString').onClick(() => {
        let array = this.controller.fromStyledString(this.mutableStyledString);
        array.forEach(item => {
          this.spans = (item as RichEditorTextSpanResult).value;
        })
      }).id('fromStyledString')

      Button('image fromStyledString').onClick(() => {
        if (this.imagePixelMap !== undefined) {
          let imageStyledString = new MutableStyledString(new ImageAttachment({
            value: this.imagePixelMap,
            size: { width: '30px', height: '30px' },
            layoutStyle: { borderRadius: LengthMetrics.vp(10) },
            verticalAlign: ImageSpanAlignment.TOP,
            objectFit: ImageFit.Contain
          }))
          let array = this.controller.fromStyledString(imageStyledString);
          array.forEach(item => {
            if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
              this.imageSpan = 'imageSpan index:' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range: ' +
              (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' + (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' +
              (item as RichEditorImageSpanResult).imageStyle.size[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle.size[1];
            }
          })
        }
      }).id('imageFromStyledString')

      Button('cusFromStyledString').onClick(() => {
        let array = this.controller.fromStyledString(this.styleStr);
        this.spans = JSON.stringify(array);
      }).id('cusFromStyledString')

      Button('undefined fromStyledString').onClick(() => {
        let array = this.controller.fromStyledString(undefined);
        this.spans = JSON.stringify(array);
      }).id('undefinedFromStyledString')

      Text('spans:' + this.spans).id('spans')
      Text('' + this.imageSpan).id('imageSpan')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('0123',
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
        .id('RichEditorAttributeStrings005')
    }
  }
}