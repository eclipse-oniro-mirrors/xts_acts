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

@Entry
@Component
struct RichEditorSetStyledString012 {
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State onSelectCallBack: boolean = false;
  @State onSelectionChangeCall: boolean = false;
  @State aboutToIMEInputCall: boolean = false;
  @State onIMEInputCompleteCall: boolean = false;
  @State aboutToDeleteCall: boolean = false;
  @State onDeleteCompleteCall: boolean = false;
  @State message: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })

  styledString: StyledString = new StyledString('ab',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
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
      }).id('image_top')

      Text('onSelectCallBack:' + this.onSelectCallBack).id('onSelectCallBack')
      Text('onSelectionChangeCall:' + this.onSelectionChangeCall).id('onSelectionChangeCall')
      Text('aboutToIMEInputCall:' + this.aboutToIMEInputCall).id('aboutToIMEInputCall')
      Text('onIMEInputCompleteCall:' + this.onIMEInputCompleteCall).id('onIMEInputCompleteCall')
      Text('aboutToDeleteCall:' + this.aboutToDeleteCall).id('aboutToDeleteCall')
      Text('onDeleteCompleteCall:' + this.onDeleteCompleteCall).id('onDeleteCompleteCall')
      Text('message:' + this.message).id('message')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.styledString);
        })
        .onSelectionChange((value: RichEditorRange) => {
          this.onSelectionChangeCall = true;
          console.log('RichEditorController value:' + JSON.stringify(value));
          this.message = JSON.stringify(value);
        })
        .onSelect((value: RichEditorSelection) => {
          this.onSelectCallBack = true;
          let start = value.selection[0];
          let end = value.selection[1];
          this.message = '[' + start + ', ' + end + ']';
          console.log('RichEditorController message:' + this.message);
        })
        .aboutToIMEInput((value: RichEditorInsertValue) => {
          this.aboutToIMEInputCall = true;
          return true;
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          this.onIMEInputCompleteCall = true;
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          this.aboutToDeleteCall = true;
          return true;
        })
        .onDeleteComplete(() => {
          this.onDeleteCompleteCall = true;
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorSetStyledString012')
    }
  }
}