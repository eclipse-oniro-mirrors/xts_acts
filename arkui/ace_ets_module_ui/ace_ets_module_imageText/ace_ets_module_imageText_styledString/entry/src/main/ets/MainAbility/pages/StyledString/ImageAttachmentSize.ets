/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct ImageAttachmentSizeTest {
  @State message: string ='Image 日志: \n'
  imagePixelMap: image.PixelMap | undefined = undefined
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  fontStyleAttr2: DecorationStyle =
    new DecorationStyle({ type: TextDecorationType.Underline, color: Color.Blue, style: TextDecorationStyle.DOUBLE });
  @State mutableStr: MutableStyledString = new MutableStyledString('');
  controller: TextController = new TextController();

  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap')
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
  }

  private async updateImageInfoStr() {
    let imageArray = this.mutableStr.getStyles(0, this.mutableStr.length, StyledStringKey.IMAGE)
    for (let i = 0; i < imageArray.length; ++i) {
      if (imageArray[i].styledKey === StyledStringKey.IMAGE) {
        let attachment = imageArray[i].styledValue as ImageAttachment
        if (attachment.size !== undefined) {
          let w: number = attachment.size.width as number
          let h: number = attachment.size.height as number
          this.message = 'px size width:' + w.toFixed(2) + 'height:' + h.toFixed(2)
        }
        if (attachment.sizeInVp !== undefined) {
          let w: number = attachment.sizeInVp.width as number
          let h: number = attachment.sizeInVp.height as number
          this.message = 'sizeInVp width:' + w.toFixed(2) + 'height:' + h.toFixed(2)
        }
      }
    }
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
    Scroll() {
      Row() {
        Column({ space: 5 }) {
          Text(this.message).width('100%').backgroundColor('#ffffe6e6').id('textIdImageAttachmentSize')
          Button('设置图片size： 50vp x 50vp')
            .id('button50vp')
            .width('100%')
            .height('5%')
            .backgroundColor('#df57b0fd')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Button('设置图片size： 50px x 50px' + '(' + this.getUIContext().px2vp(50) + 'vp)')
            .id('button50px')
            .width('100%')
            .height('5%')
            .backgroundColor('#dfa6d46c')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: '50px', height: '50px' },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Button('设置图片size：0')
            .id('button0')
            .width('100%')
            .height('5%')
            .backgroundColor('#dff8af7f')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: 0, height: 0 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Button('设置图片size：-50')
            .id('button50')
            .width('100%')
            .height('5%')
            .backgroundColor('#c9ff73d6')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: -50, height: -50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Button('设置图片size：undefined')
            .id('buttonUndefined')
            .width('100%')
            .height('5%')
            .backgroundColor('#d5646569')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: undefined, height: undefined },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Button('设置图片size：null')
            .id('buttonNull')
            .width('100%')
            .height('5%')
            .backgroundColor('#dfffabd9')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  value: this.imagePixelMap,
                  size: { width: null, height: null },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.TOP,
                  objectFit: ImageFit.Contain,
                })))
                this.controller.setStyledString(this.mutableStr)
                this.updateImageInfoStr();
              }
            })
          Text(undefined, { controller: this.controller })
            .copyOption(CopyOptions.InApp)
            .draggable(true)
            .fontSize(30)
        }
        .width('100%')
        .padding(15)
      }
      .width('100%')
    }
    .height('100%')
    .onAppear(() => {
      let str = new StyledString('abc123文本', [
        {
          styledKey: StyledStringKey.FONT,
          styledValue: this.fontStyleAttr1
        },
        { styledKey: StyledStringKey.DECORATION, styledValue: this.fontStyleAttr2 }
      ])
      this.mutableStr.appendStyledString(str)
      this.controller.setStyledString(this.mutableStr)
    })
  }
}