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
import { image } from '@kit.ImageKit';
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct APIUIContextGetSync {
  @State pixmap: image.PixelMap | undefined = undefined
  @State text: string = 'start'

  build() {
    Scroll(){
      Column() {
            Row() {
              Column(){
                Image(this.pixmap)
              }
              .width(10).height(10).border({ color: Color.Black, width: 2 }).margin(5)
              Image($r('app.media.icon')).autoResize(true).width('100px').height('100px').margin(5).id("APIUIContextGetSync_root")
            }
            Text(this.text).fontSize(26).id('APIUIContextGetSync_text')
            Button("click to generate UI snapshot").id('APIUIContextGetSync_button')
              .onClick(() => {
                try {
                  let pixelmap = this.getUIContext().getComponentSnapshot().getSync("APIUIContextGetSync_root", {scale : 2, waitUntilRenderFinished : true})
                  this.pixmap = pixelmap
                  if(this.pixmap !== undefined){
                    this.text = 'end'
                  }
                } catch (error) {
                  console.error("getSync errorCode: " + error.code + " message: " + error.message)
                }
              }).margin(10)
          }
          .width('100%')
          .height('100%')
          .alignItems(HorizontalAlign.Center)
    }
    
  }
}