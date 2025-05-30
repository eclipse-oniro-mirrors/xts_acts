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
import { image } from '@kit.ImageKit'
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct StyledStringDemo {
  imagePixelMap: image.PixelMap | undefined = undefined
  @State html : string | undefined = undefined
  @State text : string | undefined = undefined
  @State styledString : StyledString | undefined = undefined
  @State styledString2 : StyledString | undefined = undefined
  controller1 : TextController = new TextController
  controller2 : TextController = new TextController
  controller3 : TextController = new TextController
  mutableStyledString1: MutableStyledString = new MutableStyledString('这是一段测试文字', [{start:0, length:8, styledKey:StyledStringKey.BACKGROUND_COLOR, styledValue: new BackgroundColorStyle({color:Color.Blue, radius: 0}) }]);


  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap')
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

  async onPageShow() {
    this.controller3.setStyledString(this.mutableStyledString1)
  }

  build() {
    Column(){
      Text(undefined, { controller: this.controller1 }).height('10%')
      Text(undefined, { controller: this.controller3 }).height('10%')
      Row(){
        Button('添加属性字符串').onClick(() => {
          let mutableStyledString1: MutableStyledString = new MutableStyledString('属性字符串', [{
            start: 0,
            length: 6,
            styledKey: StyledStringKey.FONT,
            styledValue: new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.vp(50) })
          }]);
          if (this.imagePixelMap !== undefined) {
            let mutableStyledString2 = new MutableStyledString(new ImageAttachment({
              value: this.imagePixelMap,
              size: { width: 50, height: 50 },
            }))
            mutableStyledString1.appendStyledString(mutableStyledString2)
          }
          this.styledString = mutableStyledString1
          this.controller1.setStyledString(mutableStyledString1)
        }).width('50%').id('but1')
        Button('toHtml').onClick(() => {
          this.html = StyledString.toHtml(this.styledString)
        }).width('50%').id('but2')
      }.height('15%')
      Row(){
        Button('getStyles')
          .width('40%')
          .onClick(() => {
            this.text = JSON.stringify(this.mutableStyledString1
              .getStyles(0, 8,StyledStringKey.BACKGROUND_COLOR)[0].styledKey)
          }).margin(5).id('but3')
      }.height('15%')
      Text(undefined, { controller: this.controller2 }).height('10%')
      Text(this.html).id('text').height('10%')
      Text(this.text).id('text2').height('10%')
    }.width('100%').height('100%')
  }
}