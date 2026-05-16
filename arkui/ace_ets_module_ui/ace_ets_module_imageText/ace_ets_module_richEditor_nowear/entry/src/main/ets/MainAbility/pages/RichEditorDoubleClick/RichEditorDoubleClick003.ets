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
import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct RichEditorDoubleClick003 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  imagePixelMap: image.PixelMap | undefined = undefined;

  @State message: string = '';
  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap');
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
      Text('message:' + this.message).id('message')
      Button('add image').onClick(() => {
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
      }).id('addImage')
      Button('set center').onClick(() => {
        this.controller.setCaretOffset(2);
      }).id('setCenter')
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('abc 123 test select',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .transform(matrix4.identity().translate({ x: 50, y: 50 }).scale({ x: 1.5, y: 1 }).rotate({
            x: 0,
            y: 0,
            z: 1,
            angle: 50
          }))
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('30%')
          .height('80')
          .id('RichEditorDoubleClick003')
      }
      .margin(50)
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}