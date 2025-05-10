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
struct RichEditorCustomSpan017 {
  gestureStyleAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      this.onClickFlag = true;
    },
    onLongPress: () => {
      this.onLongPressFlag = true;
    }
  });
  imagePixelMap: image.PixelMap | undefined = undefined;
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80, 50);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  mutableStyledString: MutableStyledString = new MutableStyledString('abc',
    [{
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  @State onClickFlag: boolean = false;
  @State onLongPressFlag: boolean = false;
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
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
      }).id('imageTop')
      Text('onLongPressFlag:' + this.onLongPressFlag).id('onLongPressFlag')
      Text('onClickFlag:' + this.onClickFlag).id('onClickFlag')
      Button('add custom').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.style1.setStyle({ start: 0, length: 1, styledKey: StyledStringKey.GESTURE,
          styledValue: this.gestureStyleAttr });
        this.richEditorStyledString.appendStyledString(this.style1);
        this.controller.setStyledString(this.richEditorStyledString);
        this.controller.setCaretOffset(this.richEditorStyledString.length);
      }).id('addCustom')
      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorCustomSpan017')
    }
  }
}