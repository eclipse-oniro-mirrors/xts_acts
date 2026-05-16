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

 import {
  CustomLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute, LayoutAlgorithm} from '@kit.ArkUI';
import { LayoutConstraint } from '@ohos.arkui.node';

class WaterfallLayout extends CustomLayoutAlgorithm {
  private columnCount: number = 2;
  private columnGap: number = 10;
  private rowGap: number = 10;

  onMeasure(self: FrameNode, constraint: LayoutConstraint): void {
    const childCount = self.getChildrenCount();
    const columnWidth = (constraint.maxSize.width - (this.columnCount - 1) * this.columnGap) / this.columnCount;
    const columnHeights: number[] = new Array(this.columnCount).fill(0);

    for (let i = 0; i < childCount; i++) {
      const child = self.getChild(i);
      if (child) {
        const childConstraint: LayoutConstraint = {
          maxSize: {
            width: columnWidth,
            height: constraint.maxSize.height
          },
          minSize: {
            width: columnWidth,
            height: 0
          },
          percentReference: constraint.percentReference
        };

        child.measure(childConstraint);
        const minColumn = columnHeights.indexOf(Math.min(...columnHeights));
        columnHeights[minColumn] += child.getMeasuredSize().height + this.rowGap;
      }
    }

    const maxHeight = Math.max(...columnHeights);
    self.setMeasuredSize({
      width: constraint.maxSize.width,
      height: maxHeight
    });
  }

  onLayout(self: FrameNode): void {
    const childCount = self.getChildrenCount();
    const measuredSize = self.getMeasuredSize();
    const columnWidth = (measuredSize.width - (this.columnCount - 1) * this.columnGap) / this.columnCount;

    const columnYs: number[] = new Array(this.columnCount).fill(0);

    for (let i = 0; i < childCount; i++) {
      const child = self.getChild(i);
      if (child) {
        const childSize = child.getMeasuredSize();
        const minColumn = columnYs.indexOf(Math.min(...columnYs));
        const x = minColumn * (columnWidth + this.columnGap);
        const y = columnYs[minColumn];

        child.layout({ x, y });

        columnYs[minColumn] += childSize.height + this.rowGap;
      }
    }

  }
}

@Entry
@ComponentV2
struct DynamicLayoutCustom {
  @Local algorithm: LayoutAlgorithm = new WaterfallLayout();

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(this.algorithm) {
          Text()
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
          Text()
            .backgroundColor(Color.Blue)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutCustom')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row(){
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutCustom');
            console.info('hello:'+JSON.parse(strJson1).$type);

          })
          .width(80)
          .height(20)
      }
      
    }
    .width('100%')
    .width('100%')
  }
}