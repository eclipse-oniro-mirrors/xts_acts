/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';


@Entry
@Component
struct ImageExample2 {
  @State renderMode:ImageRenderMode = ImageRenderMode.Original
  @State widthS:number = 75;
  @State heightS:number = 75
  @State interpolation:ImageInterpolation = ImageInterpolation.None
  @State fillColor:Color = Color.Red
  @State copyOption:CopyOptions = CopyOptions.None
  @State is_draggable:boolean = false
  
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('Image2 onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'renderMode') {
          this.renderMode = message.value
      }
      if (message.name == 'widthS') {
          this.widthS = message.value
      }
      if (message.name == 'heightS') {
          this.heightS = message.value
      }
      if (message.name == 'interpolation') {
          this.interpolation = message.value
      }
      if (message.name == 'fillColor') {
          this.fillColor = message.value
      }
      if (message.name == 'draggable') {
          this.is_draggable = message.value
      }
      if (message.name == 'copyOption') {
          this.copyOption = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 }) {
      Text('renderMode').fontSize(12).fontColor(0xcccccc).width('96%').height(30)
      Row({ space: 50 }) {
        Image($rawfile('bm.jpg'))
          .renderMode(this.renderMode).width(100).height(100)
          .border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .interpolation(this.interpolation)
          .matchTextDirection(false)
          .fitOriginalSize(false)
          .fillColor(this.fillColor)
          .autoResize(true)
          .syncLoad(false)
          .copyOption(CopyOptions.InApp)
          .colorFilter([2,4,5])
          .overlay('Original', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .draggable(this.is_draggable)
          .key("image1")
        Image($rawfile('bm.jpg'))
          .renderMode(ImageRenderMode.Template).width(100).height(100)
          .border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .overlay('Template', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }

      Text('alt').fontSize(12).fontColor(0xcccccc).width('96%').height(30)
      Image('')
        .alt($rawfile('bm.jpg'))
        .width(100).height(100).border({ width: 1 }).borderStyle(BorderStyle.Dashed)

      Text('sourceSize').fontSize(12).fontColor(0xcccccc).width('96%')
      Row({ space: 50 }) {
        Image($rawfile('bm.jpg'))
          .sourceSize({
            width: 75,
            height: 75
          })
          .objectFit(ImageFit.ScaleDown).width('25%').aspectRatio(1)
          .border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .overlay('w:150 h:150', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .sourceSize({
            width: 200,
            height: 200
          })
          .objectFit(ImageFit.ScaleDown).width('25%').aspectRatio(1)
          .border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .overlay('w:200 h:200', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }

      Text('objectRepeat').fontSize(12).fontColor(0xcccccc).width('96%').height(30)
      Row({ space: 5 }) {
        Image($rawfile('bm.jpg'))
          .width(120).height(125).border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.XY).objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.XY', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .width(110).height(125).border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.Y).objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.Y', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        Image($rawfile('bm.jpg'))
          .width(110).height(125).border({ width: 1 }).borderStyle(BorderStyle.Dashed)
          .objectRepeat(ImageRepeat.X).objectFit(ImageFit.ScaleDown)
          .overlay('ImageRepeat.X', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
      }
    }.height(150).width('100%').padding({ right: 10 })
  }
}