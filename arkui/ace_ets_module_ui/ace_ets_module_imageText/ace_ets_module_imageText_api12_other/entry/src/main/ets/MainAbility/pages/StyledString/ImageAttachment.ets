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
struct styled_string_imageAttachment {
  @State message: string = 'Hello World';
  imagePixelMap: image.PixelMap | undefined = undefined
  @State imagePixelMap3: image.PixelMap | undefined = undefined
  mutableStr: MutableStyledString = new MutableStyledString('123');
  controller: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();
  mutableStr2: MutableStyledString = new MutableStyledString('This is set decoration line style to the mutableStr2', [{
    start: 0,
    length: 15,
    styledKey: StyledStringKey.DECORATION,
    styledValue: new DecorationStyle({
      type: TextDecorationType.Overline,
      color: Color.Orange,
      style: TextDecorationStyle.DOUBLE
    })
  }])

  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap')
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.app_icon'))
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.uiContext.getHostContext()?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array?.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(undefined, { controller: this.controller })
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .fontSize(30)

        Row(){
          Button('setImage1')
            .id('setImage1')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: LengthMetrics.vp(10), padding: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
          Button('setImage2')
            .id('setImage2')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: LengthMetrics.vp(-10), padding: LengthMetrics.vp(-10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
        }.height('5%')
        Row() {
          Button('setImage3')
            .id('setImage3')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: undefined, padding: undefined },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
          Button('setImage4')
            .id('setImage4')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: {top: 10, right: 10, bottom: 10, left: 10}, padding: {top: 10, right: 10, bottom: 10, left: 10} },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
        }.height('5%')
        Row() {
          Button('setImage5')
            .id('setImage5')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: {top: -10, right: -10, bottom: -10, left: -10}, padding: {top: -10, right: -10, bottom: -10, left: -10} },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
          Button('setImage6')
            .id('setImage6')
            .onClick(() => {
              if (this.imagePixelMap !== undefined) {
                this.mutableStr = new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.icon'), //建议使用自定义的本地图片
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10), margin: {top: undefined, right: undefined, bottom: undefined, left: undefined}, padding: {top: undefined, right: undefined, bottom: undefined, left: undefined} },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  syncLoad: true
                }))
                this.controller.setStyledString(this.mutableStr)
              }
            })
        }.height('5%')

        Button('getImage')
          .id('getImage').height('5%')
          .onClick(() => {
            let imageArray = this.mutableStr.getStyles(0, 1, StyledStringKey.IMAGE)
            for (let i = 0; i < imageArray.length; ++i) {
              console.info('mutableStr start ' + imageArray[i].start + ' length ' + imageArray[i].length + ' type ' +
              imageArray[i].styledKey)
              if (imageArray[i].styledKey === 300) {
                let attachment = imageArray[i].styledValue as ImageAttachment
                this.imagePixelMap3 = attachment.value
                console.info('mutableStr value ' + JSON.stringify(attachment.value))
                if (attachment.size !== undefined) {
                  console.info('mutableStr size width ' + attachment.size.width + ' height ' + attachment.size.height)
                }
                console.info('mutableStr vertical ' + attachment.verticalAlign)
                console.info('mutableStr fit ' + attachment.objectFit)
                if (attachment.layoutStyle !== undefined) {
                  let radius = attachment.layoutStyle.borderRadius as BorderRadiuses
                  console.info('mutableStr radius ' + JSON.stringify(radius))
                  console.log('mutableStr margin ' + JSON.stringify(attachment.layoutStyle.margin));
                  console.log('mutableStr padding ' + JSON.stringify(attachment.layoutStyle.padding));
                  let margin = attachment.layoutStyle.margin as Margin;
                  console.log('mutableStr margin top ' + margin.top)
                  AppStorage.setOrCreate('marginTop', margin.top)
                  console.log('mutableStr margin right ' + margin.right)
                  AppStorage.setOrCreate('marginRight', margin.right)
                  console.log('mutableStr margin bottom ' + margin.bottom)
                  AppStorage.setOrCreate('marginBottom', margin.bottom)
                  console.log('mutableStr margin left ' + margin.left)
                  AppStorage.setOrCreate('marginLeft', margin.left)
                  let padding = attachment.layoutStyle.padding as Padding;
                  console.log('mutableStr padding top ' + padding.top)
                  AppStorage.setOrCreate('paddingTop', padding.top)
                  console.log('mutableStr padding right ' + padding.right)
                  AppStorage.setOrCreate('paddingRight', padding.right)
                  console.log('mutableStr padding bottom ' + padding.bottom)
                  AppStorage.setOrCreate('paddingBottom', padding.bottom)
                  console.log('mutableStr padding left ' + padding.left)
                  AppStorage.setOrCreate('paddingLeft', padding.left)
                }
              }
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}