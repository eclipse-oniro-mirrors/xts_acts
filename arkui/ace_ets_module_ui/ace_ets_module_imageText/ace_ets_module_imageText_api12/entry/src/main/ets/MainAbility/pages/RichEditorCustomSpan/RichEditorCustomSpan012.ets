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
import Utils from '../../common/Utils'
import { MyCustomSpan } from '../../common/MyCustomSpan'
@Entry
@Component
struct RichEditorCustomSpan012 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State stylesInfo: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: Utils.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })
  mutableStyledString: MutableStyledString = new MutableStyledString('abce12',
    [{ start: 0, length: 6, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);
  styledString: StyledString = new StyledString('12345',
    [{ start: 0, length: 5, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
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
            size: { width: 20, height: 20 },
            layoutStyle: { borderRadius: LengthMetrics.vp(10) },
            verticalAlign: ImageSpanAlignment.TOP,
            objectFit: ImageFit.Contain
          }))
          this.richEditorStyledString = this.controller.getStyledString();
          this.richEditorStyledString.appendStyledString(imageStyledString);
          this.controller.setStyledString(this.richEditorStyledString);
          this.controller.setCaretOffset(this.richEditorStyledString.length);
        }
      }).id('image_top').height('5%')
      Button('removeStyle').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.richEditorStyledString.removeStyle(6, 5, StyledStringKey.FONT);
        this.controller.setStyledString(this.richEditorStyledString);
      }).id('removeStyle').height('5%')

      Button('removeStyleAll').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.richEditorStyledString.removeStyles(0, 6);
        this.controller.setStyledString(this.richEditorStyledString);
      }).id('removeStyleAll').height('5%')

      Button('getStylesAll').onClick(() => {
        this.stylesInfo = JSON.stringify(this.richEditorStyledString.getStyles(0 , 6));
      }).id('getStylesAll').height('5%')

      Button('getStyles').onClick(() => {
        this.stylesInfo = JSON.stringify(this.richEditorStyledString.getStyles(6 , 5));
      }).id('getStyles').height('5%')

      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorCustomSpan012')

      Column() {
        Row() {
          Button('add text').onClick(() => {
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.appendStyledString(this.styledString);
            this.controller.setStyledString(this.richEditorStyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('add_text').height('5%')

          Button('add custom').onClick(() => {
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.appendStyledString(this.style1);
            this.controller.setStyledString(this.richEditorStyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom').height('5%')
        }

      }
      .width('100%')
    }
  }
}