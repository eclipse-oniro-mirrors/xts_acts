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
import { ImageSpanModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ImageSpanModifier {
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.objectFit(ImageFit.Contain)
  }
}

@Entry
@Component
struct ImageSpanExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State customModifier: ImageSpanModifier = new CustomModifier()
    .objectFit(ImageFit.Cover)
    .verticalAlign(ImageSpanAlignment.BASELINE)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Text() {
        ImageSpan($r('app.media.icon'))
        .attributeModifier(this.customModifier as CustomModifier)
        .key('imageSpan')
      }.width('100%')
    }
    .margin({ top: 5 })
  }
}