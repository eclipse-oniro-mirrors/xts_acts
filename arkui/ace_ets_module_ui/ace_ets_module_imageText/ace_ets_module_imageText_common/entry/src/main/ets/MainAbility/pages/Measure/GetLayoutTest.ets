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
@Entry
@Component
struct getLayout {
  build() {
    Column() {
      CustomLayout()
    }
  }
}

@Builder
function columnChildren() {
  ForEach([1, 2, 3], (index: number) => { //暂不支持lazyForEach的写法
    Text('S' + index)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .offset({ x: 10, y: 20 })
  })
}

@Component
struct CustomLayout {
  @State getMargin: string = ''
  @State getMargin2: string = ''
  @State getPadding: string = ''
  @State getPadding2: string = ''
  @State getBorderWidth: string = ''
  @State getBorderWidth2: string = ''
  @Builder
  doNothingBuilder() {
    Text(this.getMargin)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout1')
    Text(this.getPadding)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout2')
    Text(this.getBorderWidth)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout3')
    Text(this.getMargin2)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout4')
    Text(this.getPadding2)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout5')
    Text(this.getBorderWidth2)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .key('getLayout6')
  };

  @BuilderParam builder: () => void = this.doNothingBuilder;
  @State startSize: number = 100;
  result: SizeResult = {
    width: 0,
    height: 0
  };

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    let startPos = 300;

    children.forEach((child) => {
      this.getMargin = JSON.stringify(child.getMargin().top)
      this.getPadding = JSON.stringify(child.getPadding().top)
      this.getBorderWidth = JSON.stringify(child.getBorderWidth().top)
      let pos = startPos - child.measureResult.height;
      child.layout({ x: pos, y: pos })
    })
  }

  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    let size = 50;
    children.forEach((child) => {
      this.getMargin2 = JSON.stringify(child.getMargin().top)
      this.getPadding2 = JSON.stringify(child.getPadding().top)
      this.getBorderWidth2 = JSON.stringify(child.getBorderWidth().top)
      let result: MeasureResult = child.measure({ minHeight: size, minWidth: size, maxWidth: size, maxHeight: size })
      size += 40
      ;
    })
    return this.result;
  }

  build() {
    this.builder()
  }
}