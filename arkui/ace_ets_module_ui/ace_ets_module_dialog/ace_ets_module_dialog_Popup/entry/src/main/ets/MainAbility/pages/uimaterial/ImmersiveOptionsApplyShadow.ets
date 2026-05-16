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
struct ImmersiveOptionsApplyShadow {
  build() {
    Column({ space: 10 }) {
      Text('ImmersiveOptions.applyShadow Test')
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
          style: uiMaterial.ImmersiveStyle.THICK,
          applyShadow: undefined
        }))

        Column() {
          Text('true')
        }
        .id('true')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THICK,
          applyShadow: true
        }))
      }

      Row({ space: 10 }) {
        Column() {
          Text('false')
        }
        .id('false')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THICK,
          applyShadow: false
        }))

        Column() {
          Text('no applyShadow')
        }
        .id('default')
        .width('45%')
        .height('10%')
        .borderRadius(20)
        .justifyContent(FlexAlign.Center)
        .systemMaterial(new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THICK
        }))
      }

      Column() {
        Text('empty options')
      }
      .id('empty')
      .width('45%')
      .height('10%')
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .systemMaterial(new uiMaterial.ImmersiveMaterial())
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#E0E0E0')
  }
}