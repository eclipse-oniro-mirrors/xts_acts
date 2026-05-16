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
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct ImmersiveOptionsMaterialColor {
  build() {
    Column({ space: 10 }) {
      Text('ImmersiveOptions.materialColor Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Row({ space: 10 }) {
        Column() {
          Text('undefined')
        }
        .id('undefined')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: undefined
        }))

        Column() {
          Text('Transparent')
        }
        .id('transparent')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: Color.Transparent
        }))
      }

      Row({ space: 10 }) {
        Column() {
          Text('string #80FF0000')
        }
        .id('string_red')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: '#80FF0000'
        }))

        Column() {
          Text('string rgba')
        }
        .id('string_rgba')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: 'rgba(0,255,0,0.5)'
        }))
      }

      Row({ space: 10 }) {
        Column() {
          Text('number 0x80')
        }
        .id('number_color')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: 0x800000FF
        }))

        Column() {
          Text('Color.Blue')
        }
        .id('color_enum')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: Color.Blue
        }))
      }

      Column() {
        Text('Color.White with alpha')
      }
      .id('color_white')
      .width('45%')
      .height('10%')
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .systemMaterial(new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN,
        materialColor: '#80FFFFFF'
      }))

      Column() {
        Text('no materialColor')
      }
      .id('default_info')
      .width('45%')
      .height('10%')
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .systemMaterial(new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN
      }))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#E0E0E0')
  }
}