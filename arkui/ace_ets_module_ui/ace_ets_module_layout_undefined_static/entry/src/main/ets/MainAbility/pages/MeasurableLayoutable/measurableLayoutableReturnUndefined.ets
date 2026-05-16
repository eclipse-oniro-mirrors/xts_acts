'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Text, Column, Component, Position, Entry, Builder, BuilderParam, ForEach,
  SizeResult, GeometryInfo, Layoutable, ConstraintSizeOptions,Measurable, MeasureResult, CustomLayout, Margin,
  FlexAlign} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Custom1({ builder: columnChildren })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}

@Builder
function columnChildren() {
  ForEach([1, 2, 3], (item: Int, index: Int) => {
    Text('S' + item)
      .fontSize(20)
      .width(60 + 10 * index)
      .height(100)
      .borderWidth(2)
      .margin({ left:10 } as Margin)
      .padding(10)
  })
}
@CustomLayout
@Component
struct Custom1 {
  @State borderWidth1: string = ''
  @State pad: string = ''
  @State strMeasurable: string = 'Hello';
  @State strLayoutable: string = 'Hello';

  @Builder
  doNothingBuilder() {
  };

  @BuilderParam builder: () => void = this.doNothingBuilder;
  result: SizeResult = {
    width: 0,
    height: 0
  } as SizeResult;
  overFlowIndex: number = -1;

  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    let currentX = 0;
    let infinity = 100000;
    if (this.overFlowIndex == -1) {
      this.overFlowIndex = children.length;
    }
    for (let index = 0; index < children.length; ++index) {
      let child = children[index];
      if (index >= this.overFlowIndex) {
        child.layout({x: infinity, y: 0});
        continue;
      }
      child.layout({ x: currentX, y: 0 })
      let margin = child.getMargin();
      this.borderWidth1 = JSON.stringify(child.getBorderWidth()?.top);
      let padding = JSON.stringify(child.getPadding()?.top);

      this.strLayoutable = 'Layoutable';
      if (margin === undefined) {
        currentX += child.measureResult.width;
      } else {
        currentX += child.measureResult.width + margin.start + margin.end;
      }
    }
  }
  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    let width: number = 0;
    let height: number = 0;
    this.overFlowIndex = -1;
    let maxWidth = Math.min(200, constraint.maxWidth as number);
    for (let index = 0; index < children.length; ++index) {
      let child = children[index];
      let childResult: MeasureResult | undefined = child.measure({
        minHeight: constraint.minHeight,
        minWidth: constraint.minWidth,
        maxWidth: constraint.maxWidth,
        maxHeight: constraint.maxHeight
      })
      if (childResult !== undefined) {
        this.strMeasurable = 'Measurable';
        let margin = child.getMargin();
        this.borderWidth1 = JSON.stringify(child.getBorderWidth()?.top);
        let padding = JSON.stringify(child.getPadding()?.top);

        let newWidth: Double = width + childResult.width;
        if (margin !== undefined) {
          newWidth += margin.start + margin.end;
        }
        if (newWidth > maxWidth) {
          this.overFlowIndex = index;
          break;
        }
        width = newWidth;
        if (margin === undefined) {
          height = Math.max(height, childResult.height);
        } else {
          height = Math.max(height, childResult.height + margin.top + margin.bottom);
        }
      }
      this.result.width = width;
      this.result.height = height;
    }
    return this.result;
  }

  build() {
    this.builder()
    Text(this.strMeasurable)
      .id('Text_Measurable')
    Text(this.strLayoutable)
      .id('Text_Layoutable')
  }
}