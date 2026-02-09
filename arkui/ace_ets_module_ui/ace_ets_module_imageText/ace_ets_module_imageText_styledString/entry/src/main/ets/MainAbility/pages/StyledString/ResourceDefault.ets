/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { LengthMetrics } from '@ohos.arkui.node'
import { image } from '@kit.ImageKit'
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ResourceDefaultTest {
  private ColorFilterMatrix: number[] = [0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0];
  @State DrawingColorFilterFirst: ColorFilter | DrawingColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString('Init');
  @State resourceValue: string = 'resourceValue'
  @State size1: string = 'size'
  @State verticalAlign: string = 'verticalAlign'
  @State objectFit: string = 'objectFit'
  @State layoutStyle: string = 'layoutStyle'
  @State colorFilter: string = 'colorFilter'
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column({ space: 1 }) {
      RichEditor( this.options ).width('100%')
        .height('10%')
      Button('append resource').height('5%').id('set_default_append_resource')
        .onClick(()=>{
        this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
          resourceValue: $r('app.media.icon'),
        })))
        this.update()
      })
      Button('append string').height('5%').id('set_colorFilter_append_str')
        .onClick(()=>{
          this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
            resourceValue: 'resource/base/media/icon.png',
            size: undefined,
            verticalAlign: undefined,
            objectFit: undefined,
            layoutStyle: undefined,
            colorFilter: undefined,
          })))
          this.update()
        })
      Row() {
        Button('getStyles').width('50%').height('5%').id('get_default_styles')
          .onClick(() => {
            let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
            for (let i = 0; i < imageArray.length; ++i) {
              if (imageArray[i].styledKey === 300) {
                let attachment = imageArray[i].styledValue as ImageAttachment
                console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
                this.resourceValue = '' + JSON.stringify(attachment.value)
                console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
                this.size1 = '' + JSON.stringify(attachment.size)
                console.info('ImageAttachment verticalAlign  ' + JSON.stringify(attachment.verticalAlign))
                this.verticalAlign = '' + JSON.stringify(attachment.verticalAlign)
                console.info('ImageAttachment objectFit  ' + JSON.stringify(attachment.objectFit))
                this.objectFit = '' + JSON.stringify(attachment.objectFit)
                console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
                this.layoutStyle = '' + JSON.stringify(attachment.layoutStyle)
                if (attachment.colorFilter) {
                  this.DrawingColorFilterFirst = attachment.colorFilter
                  console.info('ImageAttachment colorFilter1  ' + JSON.stringify(attachment.colorFilter))
                  this.colorFilter = '' + JSON.stringify(attachment.colorFilter)
                } else {
                  console.info('ImageAttachment colorFilter2  ' + JSON.stringify(attachment.colorFilter))
                  this.colorFilter = 'undefined'
                }
              }
            }
          }).height(35).padding(8).margin({top:10,right:10})
        Text(this.resourceValue).id('default_resourceValue').height('5%')
      }
      Row() {
        Text(this.size1).id('default_size').height('5%')
        Text(this.verticalAlign).id('default_verticalAlign').height('5%')
      }
      Row() {
        Text(this.objectFit).id('default_objectFit').height('5%')
        Text(this.layoutStyle).id('default_layoutStyle').height('5%')
      }
      Text(this.colorFilter).id('default_colorFilter').height('5%')
    }.width('100%')
  }
}