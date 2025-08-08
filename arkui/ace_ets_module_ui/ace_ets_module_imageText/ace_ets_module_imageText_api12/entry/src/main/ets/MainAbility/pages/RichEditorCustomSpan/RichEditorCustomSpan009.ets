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
import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorCustomSpan009 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);

  customSpan2: MyCustomSpan = new MyCustomSpan('123', 80);

  imagePixelMap: image.PixelMap | undefined = undefined;
  @State length: string = '';
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
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Red });
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{ start: 0, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);

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
      }).id('imageTop')

      Button('get content').onClick(() => {
        let richEditorStyledString = this.controller.getStyledString();
        this.length = richEditorStyledString.getString().length + '';
      }).id('getContent')
      Button('getStyles')
        .onClick(() => {
          let richEditorStyledString = this.controller.getStyledString();
          let styles = richEditorStyledString.getStyles(0, richEditorStyledString.length);
          this.stylesInfo += JSON.stringify(styles);
          for (let i = 0; i < styles.length; i++) {
            if (styles[i].styledKey === 0) {
              let fontAttr = styles[i].styledValue as TextStyle;
              this.stylesInfo += fontAttr.fontColor;
            }
          }
        })
        .id('getStyles')
      Button('removeString').onClick(() => {
        let richEditorStyledString = this.controller.getStyledString();
        richEditorStyledString.removeString(4, 1);
        richEditorStyledString.removeString(2, 2);
        this.controller.setStyledString(richEditorStyledString);
      }).id('removeString')

      Button('replaceStyle').onClick(() => {
        let richEditorStyledString = this.controller.getStyledString();
        richEditorStyledString.replaceStyle({
          start: 0,
          length: 2,
          styledKey: StyledStringKey.FONT,
          styledValue: this.fontStyleAttr1
        });
        richEditorStyledString.replaceStyle({
          start: 3,
          length: 1,
          styledKey: StyledStringKey.CUSTOM_SPAN,
          styledValue: this.customSpan2
        });
        this.controller.setStyledString(richEditorStyledString);
      }).id('replaceStyle')

      Text('length:' + this.length).id('length')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorCustomSpan009')

      Column() {
        Row() {
          Button('add custom').onClick(() => {
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.appendStyledString(this.style1);
            this.controller.setStyledString(this.richEditorStyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom')
        }

      }
      .width('100%')
    }
  }
}