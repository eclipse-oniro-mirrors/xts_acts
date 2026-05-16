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

import { LengthMetrics } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'

@Entry
@Component
struct RichEditorSetStyledString016 {
  @State content: string = '';
  @State isEditing: boolean = false;
  imagePixelMap: image.PixelMap | undefined = undefined;
  richEditorStyledString: MutableStyledString = new MutableStyledString('');

  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })

  styledString: StyledString = new StyledString('test',
    [{ start: 0, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};

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
      Row(){
        Button('image Center').onClick(() => {
          if (this.imagePixelMap !== undefined) {
            let imageStyledString = new MutableStyledString(new ImageAttachment({
              value: this.imagePixelMap,
              size: { width: 30, height: 30 },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: ImageSpanAlignment.CENTER,
              objectFit: ImageFit.Contain
            }))
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.appendStyledString(imageStyledString);
            this.controller.setStyledString(this.richEditorStyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }
        }).id('image_center').width('20%')
        Button('setSelection').onClick(() => {
          this.controller.setSelection(-1, -1);
        }).id('setSelection').width('20%')
        Button('getSelection').onClick(() => {
          let select = this.controller.getSelection();
          this.content = 'start:' + select.start + ';end:' + select.end;
        }).id('getSelection').width('20%')
        Button('stopEditing').onClick(() => {
          this.controller.stopEditing();
        }).id('stopEditing').width('20%')
      }.height('5%')
      Row(){
        Text('content:' + this.content).id('content').width('50%')
        Text('isEditing:' + this.isEditing).id('isEditing').width('50%')
      }.height('5%')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.styledString)
        })
        .onEditingChange((isEditing: boolean) => {
          this.isEditing = isEditing;
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorSetStyledString016')
    }
  }
}