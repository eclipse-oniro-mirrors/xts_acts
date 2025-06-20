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
import { image } from '@kit.ImageKit'

@Entry
@Component
struct RichEditorAttributeStrings006 {

  @State spans: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  imagePixelMap: image.PixelMap | undefined = undefined;


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

      Button('toStyledString 0,2').onClick(() => {
        let str = this.controller.toStyledString({start: 0,
          end: 2});
        this.spans = str.getString();
      }).id('toStyledString')

      Button('toStyledString 100,200').onClick(() => {
        let str = this.controller.toStyledString({start: 100,
          end: 200});
        this.spans = str.getString();
      }).id('toStyledString100')

      Button('toStyledString -1,-1').onClick(() => {
        let str = this.controller.toStyledString({start: -1,
          end: -1});
        this.spans = str.getString();
      }).id('toStyledString1')

      Button('toStyledString -1,0').onClick(() => {
        let str = this.controller.toStyledString({start: -1,
          end: 0});
        this.spans = str.getString();
      }).id('toStyledString2')

      Button('toStyledString -100,100').onClick(() => {
        let str = this.controller.toStyledString({start: -100,
          end: 100});
        this.spans = str.getString();
      }).id('toStyledString3')

      Text('spans:' + this.spans).id('spans')

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
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings006')
    }
  }
}