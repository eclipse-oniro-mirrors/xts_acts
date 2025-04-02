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
struct FontDescriptor1 {
  @State message: string | undefined = ''
  @State message1: text.FontWeight | undefined = 0

  build() {
    Row() {
      Column() {
        Text('fontSubfamily:' + this.message).key('FontDescriptor1_1')
        Text('weight:' + this.message1).key('FontDescriptor1_3')
        Button('font descriptor')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .width(300)
          .height(80)
          .key('FontDescriptor1_2')
          .onClick(() => {
            console.info(`Get font descriptor start`)
            let fontType: text.SystemFontType = text.SystemFontType.GENERIC
            let promise: Promise<text.FontDescriptor> = text.getFontDescriptorByFullName('Noto Sans Deseret Regular', fontType)
            promise.then((data: text.FontDescriptor) => {
              data.fontSubfamily = 'Regular'
              data.weight = 3
              this.message = data.fontSubfamily
              this.message1 = data.weight
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