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
import { ImageAnimatorModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ImageAnimatorModifier {
  applyImageAnimatorAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.iterations(1)
  }
}

@Entry
@Component
struct ImageAnimatorExample {
  @State customModifier: ImageAnimatorModifier = new CustomModifier()
    .iterations(1)
    .fillMode(FillMode.None)
    .fixedSize(true)
    .reverse(true)
    .duration(2000)
    .state(AnimationStatus.Initial)
    .images([
      {
        src: $r('app.media.blr_1')
      },
      {
        src: $r('app.media.blr_2')
      },
      {
        src: $r('app.media.blr_3')
      },
      {
        src: $r('app.media.blr_4')
      }
    ])


  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column({ space: 10 }) {
        ImageAnimator()
          .width(200)
          .height(150)
          .attributeModifier(this.customModifier as CustomModifier)
          .key('imageAnimator')
      }
    }
    .margin({ top: 5 })
  }
}