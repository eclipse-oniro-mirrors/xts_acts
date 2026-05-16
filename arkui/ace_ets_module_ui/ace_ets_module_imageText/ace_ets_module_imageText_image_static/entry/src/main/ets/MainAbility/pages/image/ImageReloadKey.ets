'use static'
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  Image,
  ImageAttribute,
  AttributeModifier,
  $r,
  Resource,
  PixelMap,
  FontWeight,
  FlexAlign,
  HorizontalAlign,
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

export class MyReloadKeyModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
  }
}

@Entry
@Component
struct ImageReloadKey {
  @State reloadKey1: string = 'key1'
  @State reloadKey2: string = 'key2'
  @State reloadKey3: string = ''
  @State reloadKey4: string = 'key4'
  @State reloadKey5: string = 'key5'
  modifier1: MyReloadKeyModifier1 = new MyReloadKeyModifier1()

  build() {
    Scroll() {
      Column() {
        Text('Image reloadKey Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Row() {
          // Test case 1: Image with reloadKey constructor param
          Image($r('app.media.startIcon'), this.reloadKey1)
            .width('10%')
            .height(35)
            .key('reloadKeyImage1')
        }.width('80%')

        Row() {
          // Test case 2: Image with different reloadKey
          Image($r('app.media.startIcon'), this.reloadKey2)
            .width('10%')
            .height(35)
            .key('reloadKeyImage2')
        }.width('80%')

        Row() {
          // Test case 3: Image with empty string reloadKey
          Image($r('app.media.startIcon'), this.reloadKey3)
            .width('10%')
            .height(35)
            .key('reloadKeyImage3')
        }.width('80%')

        Row() {
          // Test case 4: Image with reloadKey, button to change reloadKey
          Image($r('app.media.startIcon'), this.reloadKey4)
            .width('10%')
            .height(35)
            .key('reloadKeyImage4')
          Button('changeKey4')
            .id('changeKey4Btn')
            .onClick(() => {
              this.reloadKey4 = 'key4_new'
            })
        }.width('80%')

        Row() {
          // Test case 5: Image with AttributeModifier
          Image($r('app.media.startIcon'), this.reloadKey5)
            .width('10%')
            .height(35)
            .key('reloadKeyImage5')
            .attributeModifier(this.modifier1)
          Button('changeKey5')
            .id('changeKey5Btn')
            .onClick(() => {
              this.reloadKey5 = 'key5_new'
            })
        }.width('80%')

        Row() {
          // Test case 6: Image without reloadKey (for comparison)
          Image($r('app.media.startIcon'))
            .width('10%')
            .height(35)
            .key('reloadKeyImage6')
        }.width('80%')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }.width('100%').height('100%')
  }
}