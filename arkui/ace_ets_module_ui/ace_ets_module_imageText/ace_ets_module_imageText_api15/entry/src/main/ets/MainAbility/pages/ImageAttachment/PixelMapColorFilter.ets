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
import { LengthMetrics } from '@ohos.arkui.node'
import { image } from '@kit.ImageKit'
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct PixelMapColorFilter {
  private ColorFilterMatrix: number[] = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
  private color: common2D.Color = { alpha: 125, red: 125, green: 125, blue: 255 };
  @State DrawingColorFilterFirst: ColorFilter | DrawingColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString("Init");
  @State syncLoadValue: boolean = false
  @State resourceValue: string = ''
  @State ColorFilter: string = ''
  @State imagePixelMap: image.PixelMap | undefined = undefined
  @State imagePixelMap3: image.PixelMap | undefined = undefined
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

  async aboutToAppear() {
    console.info("aboutToAppear initial imagePixelMap")
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
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

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }

  build() {
    Column({ space: 1 }) {
      RichEditor( this.options ).width('100%')
        .height('10%')
      Row() {
        Button('append pixelmap1').height('5%').id('set_colorFilter_append_pixelmap1')
          .onClick(()=>{
            if (this.imagePixelMap) {
              this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: '100px', height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Auto,
                colorFilter: this.DrawingColorFilterFirst,
              })))
              this.update()
            }
          })
        Button('append pixelmap2').height('5%').id('set_colorFilter_append_pixelmap2')
          .onClick(()=>{
            if (this.imagePixelMap) {
              this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: '100px' },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Auto,
                colorFilter: drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.DST_OVER)
              })))
              this.update()
            }
          })
      }
      Row() {
        Button('append resource').height('5%').id('set_colorFilter_append_resource')
          .onClick(()=>{
            this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
              resourceValue: $r('app.media.icon'),
              size: { width: '100px', height: 50 },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: ImageSpanAlignment.TOP,
              objectFit: ImageFit.Auto,
              colorFilter: this.DrawingColorFilterFirst,
              syncLoad: this.syncLoadValue,
            })))
            this.update()
          })
        Button('append string').height('5%').id('set_colorFilter_append_str')
          .onClick(()=>{
            this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
              resourceValue: 'resource/base/media/icon.png',
              size: { width: 50, height: 50 },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: ImageSpanAlignment.CENTER,
              objectFit: ImageFit.Fill,
              colorFilter: this.DrawingColorFilterFirst,
              syncLoad: !this.syncLoadValue,
            })))
            this.update()
          })
      }
      Button('getStyles').height('5%').id('get_styles')
        .onClick(() => {
          let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
          for (let i = 0; i < imageArray.length; ++i) {
            if (imageArray[i].styledKey === 300) {
              let attachment = imageArray[i].styledValue as ImageAttachment
              console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
              console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
              console.info('ImageAttachment verticalAlign  ' + JSON.stringify(attachment.verticalAlign))
              console.info('ImageAttachment objectFit  ' + JSON.stringify(attachment.objectFit))
              console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
              if (attachment.colorFilter) {
                this.DrawingColorFilterFirst = attachment.colorFilter
                console.info('ImageAttachment colorFilter1  ' + JSON.stringify(attachment.colorFilter))
                this.ColorFilter = '' + JSON.stringify(attachment.colorFilter)
              } else {
                console.info('ImageAttachment colorFilter2  ' + JSON.stringify(attachment.colorFilter))
                this.ColorFilter = 'undefined'
              }
            }
          }
        })
      Text(this.ColorFilter).id('ColorFilter_content').height('5%')
    }.width('100%')
  }
}