/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class ProgressModifier1 implements AttributeModifier<ProgressAttribute> {
  applyNormalAttribute(instance: ProgressAttribute): void {
    instance
      .color('#FF123456')
      .value(12)
      .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 })
  }
}

@Entry
@Component
struct ProgressExample {
  @State progressModifier: ProgressModifier1 = new ProgressModifier1()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('Log Json Data')
        .onClick(() => {
          console.log(getInspectorByKey('ProgressKey1'))
        })
      Text("progress-Style")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("styleText")
      Row({ space: 40 }) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .width(100)
          .key("ProgressKey1")
          .attributeModifier(this.progressModifier)
      }
    }.width("100%").height("100%")
  }
}

