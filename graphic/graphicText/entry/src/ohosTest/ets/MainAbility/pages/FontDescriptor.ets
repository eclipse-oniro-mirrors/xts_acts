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
import { text } from '@kit.ArkGraphics2D'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct FontDescriptor {
  @State message: string | undefined = ''
  @State message1: string | undefined = ''
  @State message2: number | undefined = 0
  @State message3: boolean | undefined = true
  @State message4: boolean | undefined = true

  build() {
    Row() {
      Column() {
        Text('postScriptName:' + this.message).key('FontDescriptor_1')
        Text('fontFamily:' + this.message1).key('FontDescriptor_2')
        Text('italic:' + this.message2).key('FontDescriptor_3')
        Text('monoSpace:' + this.message3).key('FontDescriptor_4')
        Text('symbolic:' + this.message4).key('FontDescriptor_5')
        Button('font descriptor')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .width(300)
          .height(80)
          .key('FontDescriptor_6')
          .onClick(() => {
            console.info(`Get font descriptor start`)
            let promise = text.matchFontDescriptors({
              weight: text.FontWeight.W400,
            })
            promise.then((data) => {
              console.info(`Font descriptor array size: ${data.length}`);
              console.info(`Font descriptor result: ${JSON.stringify(data)}`)
              data[0].postScriptName = 'NotoSansMyanmar-Regular'
              data[0].fontFamily = 'Noto Sans Myanmar'
              data[0].italic = 0
              data[0].monoSpace = false
              data[0].symbolic = false
              this.message = data[0].postScriptName
              this.message1 = data[0].fontFamily
              this.message2 = data[0].italic
              this.message3 = data[0].monoSpace
              this.message4 = data[0].symbolic

            }).catch((error: BusinessError) => {
              console.error(`Failed to match the font descriptor, error: ${JSON.stringify(error)}`);
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}