/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// xxx.ets
@Entry
@Component
struct CustomLayoutOnLayoutPage {
  build() {
    Column() {
      CustomLayoutOnLayout() {
        ForEach([1, 2, 3], (index: number) => {
          Text('Sub' + index)
            .fontSize(30)
            .borderWidth(2)
            .id('CustomLayoutOnLayoutText_' + index)
        })
      }
    }
  }
}


@Component
struct CustomLayoutOnLayout {
  @Builder
  doNothingBuilder() {
  };

  @BuilderParam builder: () => void = this.doNothingBuilder;

  onLayout(children: Array<LayoutChild>, constraint: ConstraintSizeOptions) {
    children.forEach((child) => {

      child.layout({ position: child.position, constraint: constraint })
    })
  }

  onMeasure(children: Array<LayoutChild>, constraint: ConstraintSizeOptions) {
    let size = 100;
    let pos = 0;
    children.forEach((child) => {
      child.position = {x: pos, y: pos}
      child.measure({ minHeight: size, minWidth: size, maxWidth: size, maxHeight: size })
      size += 30;
      pos += 20;
    })
  }

  build() {
    this.builder()
  }
}