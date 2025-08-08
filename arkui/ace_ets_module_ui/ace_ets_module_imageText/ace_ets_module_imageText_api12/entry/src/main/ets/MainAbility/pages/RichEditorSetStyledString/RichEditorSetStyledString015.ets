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
struct RichEditorSetStyledString015 {
  @State onWillChangeCall: boolean = false;
  @State careNum: number = 0;
  @State textStyle: string = '';
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
      Button('image Top').onClick(() => {
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
      }).id('image_top')

      Button('set care').onClick(() => {
        this.controller.setCaretOffset(2);
      }).id('set_care')

      Button('get care').onClick(() => {
        this.careNum =  this.controller.getCaretOffset();
      }).id('get_care')

      Button('setTypingStyle')
        .fontSize(10)
        .onClick(() => {
          this.controller.setTypingStyle(
            {
              fontWeight: 'medium',
              fontFamily: 'MiSans-Bold',
              fontColor: Color.Blue,
              fontSize: 50,
              fontStyle: FontStyle.Italic,
              decoration: { type: TextDecorationType.Underline, color: Color.Green }
            })
        }).id('setTypingStyle')

      Button('getTypingStyle').onClick(() => {
        let richEditorTextStyle = this.controller.getTypingStyle();
        this.textStyle = JSON.stringify(richEditorTextStyle);
        console.log('RichEditor getTypingStyle:' + JSON.stringify(richEditorTextStyle));
      }).id('getTypingStyle')

      Button('close menu').onClick(() => {
        this.controller.closeSelectionMenu();
      }).id('close_menu')

      Text('careNum:' + this.careNum).id('careNum')
      Text('textStyle:' + this.textStyle).id('textStyle')
      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.styledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorSetStyledString015')

    }
  }
}