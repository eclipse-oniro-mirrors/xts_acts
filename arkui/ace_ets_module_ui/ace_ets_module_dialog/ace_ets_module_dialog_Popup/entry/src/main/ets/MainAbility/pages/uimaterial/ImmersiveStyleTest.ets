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
struct ImmersiveStyleTest {
  build() {
    Column({ space: 10 }) {
      Text('ImmersiveStyle Test')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Row({ space: 10 }) {
        Column() {
          Text('ULTRA_THIN')
        }
        .id('ultra_thin')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THIN
        }))

        Column() {
          Text('THIN')
        }
        .id('thin')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN
        }))
      }

      Row({ space: 10 }) {
        Column() {
          Text('REGULAR')
        }
        .id('regular')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.REGULAR
        }))

        Column() {
          Text('THICK')
        }
        .id('thick')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THICK
        }))
      }

      Column() {
        Text('ULTRA_THICK')
      }
      .id('ultra_thick')
      .width('45%')
      .height('10%')
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .systemMaterial(new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THICK
      }))

      Text('ImmersiveStyle Enum Values:')
        .fontSize(16)
        .margin({ top: 20 })

      Text('ULTRA_THIN=' + uiMaterial.ImmersiveStyle.ULTRA_THIN)
        .id('enum_ultra_thin')
        .fontSize(14)

      Text('THIN=' + uiMaterial.ImmersiveStyle.THIN)
        .id('enum_thin')
        .fontSize(14)

      Text('REGULAR=' + uiMaterial.ImmersiveStyle.REGULAR)
        .id('enum_regular')
        .fontSize(14)

      Text('THICK=' + uiMaterial.ImmersiveStyle.THICK)
        .id('enum_thick')
        .fontSize(14)

      Text('ULTRA_THICK=' + uiMaterial.ImmersiveStyle.ULTRA_THICK)
        .id('enum_ultra_thick')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#F0F0F0')
  }
}