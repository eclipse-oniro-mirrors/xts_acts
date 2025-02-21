
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
import {MessageManager,Callback} from '../utils/MessageManager';
@Entry
@Component
struct ImageExample3 {
  @State widthValue: number = 0
  @State heightValue: number = 0
  private on: Resource = $rawfile('bm.jpg')
  private off: Resource = $rawfile('img3.png')
  private on2off: Resource = $rawfile('bm.jpg')
  private off2on: Resource = $rawfile('test3.png')
  @State src: Resource = this.on
  @State m1:string = "init"
  @State m2:string = "init"
  @State m3:string = "init"
  @State m4:string = "init"
  @State imageName:string = "img1.png"

  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('ImageThree onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'imageName') {
          this.imageName = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }


  build() {
    Column() {
      Row({ space: 20 }) {
        Column() {
          Image($rawfile(this.imageName))
            .alt($rawfile('img2.png'))
            .key('image1')
            .sourceSize({
              width: 900,
              height: 900
            })
            .syncLoad(true)
            .objectFit(ImageFit.Cover)
            .height(180).width(180)
            // 图片加载完成后，获取图片尺寸。
            .onComplete((msg: { width: number,height: number }) => {
              this.widthValue = msg.width
              this.heightValue = msg.height
              this.m1 = "complete"
            })
            .onError(() => {
              console.log('load image fail')
              this.m2 = "error"
            })
            .overlay('\nwidth: ' + String(this.widthValue) + ' height: ' + String(this.heightValue), {
              align: Alignment.Bottom,
              offset: { x: 0, y: 20 }
            })       

        Text(this.m1).margin({top:40}).key('complete')
        Text(this.m2).margin({top:40}).key('error')
        Text(this.m3).margin({top:40}).key('click')
        Text(this.m4).margin({top:40}).key('Finish')
        
        // 为图片添加点击事件，点击完成后加载特定图片。
        Image(this.src)
          .width(120).height(120)
          .onClick(() => {
            if (this.src == this.on || this.src == this.off2on) {
              this.src = this.on2off
              this.m3 = "click"
            } else {
              this.src = this.off2on
              this.m3 = "click"
            }
          }).key('image2')
          .onFinish(() => {
            if (this.src == this.off2on) {
              this.src = this.on
              this.m4 = "Finish"
            } else {
              this.src = this.off
              this.m4 = "Finish"
            }
          })
        }
      }
    }.width('100%')
  }
}