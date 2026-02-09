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
struct RichEditorCustomSpan014 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  customSpan2: MyCustomSpan = new MyCustomSpan('word', 60);
  customSpan3: MyCustomSpan = new MyCustomSpan('custom', 90);
  style2: MutableStyledString = new MutableStyledString(this.customSpan2);
  style3: MutableStyledString = new MutableStyledString(this.customSpan3);
  @State stylesInfo: string = '';
  @State styleString: string = '';
  imagePixelMap: image.PixelMap | undefined = undefined;
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  fontStyle2: TextStyle = new TextStyle({ fontColor: Color.Red });
  mutableStyledString1: MutableStyledString = new MutableStyledString('1234',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    }]);
  mutableStyledString2: MutableStyledString = new MutableStyledString('hello',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

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
      }).id('imageTop').height('5%')
      Button('getStyles')
        .onClick(() => {
          this.richEditorStyledString = this.controller.getStyledString();
          let styles = this.richEditorStyledString.getStyles(0, this.richEditorStyledString.length);
          this.stylesInfo = JSON.stringify(styles);
        })
        .id('getStyles').height('5%')
      Button('replaceStyledString').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.richEditorStyledString.replaceStyledString(0, 4, this.mutableStyledString1);
        if (this.imagePixelMap !== undefined) {
          let imageStyledString = new MutableStyledString(new ImageAttachment({
            value: this.imagePixelMap,
            size: { width: 30, height: 30 },
            layoutStyle: { borderRadius: LengthMetrics.vp(10) },
            verticalAlign: ImageSpanAlignment.CENTER,
            objectFit: ImageFit.Contain
          }))
          this.richEditorStyledString.replaceStyledString(4, 1, imageStyledString);
        }
        this.richEditorStyledString.replaceStyledString(5, 1, this.style2);
        this.controller.setStyledString(this.richEditorStyledString);
        this.controller.setCaretOffset(this.richEditorStyledString.length);
      }).id('replaceStyledString').height('5%')

      Button('replace String').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.richEditorStyledString.replaceStyledString(0, 4, this.mutableStyledString2);
        this.controller.setStyledString(this.richEditorStyledString);
        this.controller.setCaretOffset(this.richEditorStyledString.length);
      }).id('replaceString').height('5%')

      Button('replace Custom').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.richEditorStyledString.replaceStyledString(6, 1, this.style3);
        this.controller.setStyledString(this.richEditorStyledString);
        this.controller.setCaretOffset(this.richEditorStyledString.length);
      }).id('replaceCustom').height('5%')

      Button('get style String').onClick(() => {
        this.styleString = this.controller.getStyledString().getString();
      }).id('getString').height('5%')
      Column() {
        Row() {
          Button('add custom').onClick(() => {
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.appendStyledString(this.style1);
            this.controller.setStyledString(this.richEditorStyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom').height('5%')
        }
      }
      .width('100%')
      Text('styleString:' + this.styleString).id('styleString')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorCustomSpan014')

    }
  }
}