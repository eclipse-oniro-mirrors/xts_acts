/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';


@Entry
@Component
struct ImageExample2 {
  @State renderMode: ImageRenderMode = ImageRenderMode.Original
  @State widthS: number = 75;
  @State heightS: number = 75
  @State interpolation: ImageInterpolation = ImageInterpolation.None
  @State fillColor: Color = Color.Red
  @State isDraggable: boolean = false

  messageManager: MessageManager = new MessageManager()

  onPageShow(){
    console.info('Image2 onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
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
        this.isDraggable = message.value
      }
      if (message.name == 'copyOption') {
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build(){
    Column({ space: 10 }) {
      Row({ space: 50 }) {
        Text() {
          ImageSpan($rawfile('bm.jpg'))
            .colorFilter([2, 4, 5])
            .key('ImageSpanJsunit1')
        }

      }
    }.height(150).width('100%').padding({ right: 10 })
  }
}