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
struct RichEditorSetStyledString019 {
  @State textAlign: number | undefined = -1;
  @State textIndent: number | undefined = -1;
  @State isEditingCall: boolean = false;
  imagePixelMap: image.PixelMap | undefined = undefined;
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  titleParagraphStyleAttr: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Center });
  //第一段落首行缩进15vp
  paragraphStyleAttr1: ParagraphStyle = new ParagraphStyle({ textIndent: LengthMetrics.vp(15) });
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  // 创建有多种样式组合对象mutableStyledString2
  styledString: StyledString = new StyledString('abcd\n12345678', [{
    start: 0,
    length: 4,
    styledKey: StyledStringKey.PARAGRAPH_STYLE,
    styledValue: this.titleParagraphStyleAttr
  },
    {
      start: 0,
      length: 4,
      styledKey: StyledStringKey.LINE_HEIGHT,
      styledValue: new LineHeightStyle(new LengthMetrics(50))
    }, {
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontSize: LengthMetrics.vp(24), fontWeight: FontWeight.Bolder })
    }, {
      start: 5,
      length: 3,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr1
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

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

  async onPageShow() {
    this.controller.setStyledString(this.styledString)
  }

  build() {
    Column() {
      Text('textAlign:' + this.textAlign).id('textAlign')
      Text('textIndent:' + this.textIndent).id('textIndent')
      Text('isEditingCall:' + this.isEditingCall).id('isEditingCall')
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
      }).id('image_center')

      Button('get paragraphStyle')
        .onClick(() => {
          let styles = this.styledString.getStyles(0, this.styledString.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 200) {
                let paraAttr = styles[i].styledValue as ParagraphStyle;
                if(paraAttr.textAlign){
                  this.textAlign = paraAttr.textAlign;
                }
                if(paraAttr.textIndent){
                  this.textIndent = paraAttr.textIndent;
                }
              }
            }
          }
        })
        .id('get_paragraphStyle')
        .margin({ top: 10 })
      RichEditor(this.options)
        .onReady(() => {
        })
        .onEditingChange((isEditing: boolean) => {
          this.isEditingCall = isEditing;
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorSetStyledString019')
    }
  }
}