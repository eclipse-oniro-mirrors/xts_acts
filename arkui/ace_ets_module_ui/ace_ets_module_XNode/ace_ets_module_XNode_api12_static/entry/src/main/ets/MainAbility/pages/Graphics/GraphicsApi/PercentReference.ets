'use static';
/*
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
import {
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, ResourceColor,Position
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { DrawContext, FrameNode, NodeController, LayoutConstraint, Size ,NodePosition} from '@ohos.arkui.node';
import drawing from '@ohos.graphics.drawing';

let bgColor: ResourceColor = Color.Green

function GetChildLayoutConstraint(constraint: LayoutConstraint, child: FrameNode): LayoutConstraint {
  const size = child.getUserConfigSize();
  const width = Math.max(
    Math.min(constraint.maxSize.width, size.width.value),
    constraint.minSize.width
  );
  const height = Math.max(
    Math.min(constraint.maxSize.height, size.height.value),
    constraint.minSize.height
  );
  const finalSize: Size = { width, height };
  const res: LayoutConstraint = {
    maxSize: finalSize,
    minSize: finalSize,
    percentReference: finalSize
  };

  return res;
}

class MyFrameNode extends FrameNode {
  public width: number = 10;
  private space: number = 1;

  constructor(context: UIContext) {
    super(context);
  }

  onMeasure(constraint: LayoutConstraint): void {
    let sizeRes: Size = { width: 100, height: 100 };
    for (let i = 0;i < this.getChildrenCount();i++) {
      let child = this.getChild(i);
      if (child) {
        let childConstraint = GetChildLayoutConstraint(constraint, child);
        child.measure(childConstraint);
        let size = child.getMeasuredSize();
        sizeRes.height += size.height + this.space;
        sizeRes.width = Math.max(sizeRes.width, size.width);
      }
    }
    this.setMeasuredSize(sizeRes);
  }

  onLayout(position: NodePosition): void {
    let y = 0;
    for (let i = 0;i < this.getChildrenCount();i++) {
      let child = this.getChild(i);
      if (child) {
        child.layout({
          x: 20,
          y: y
        });
        y += child.getMeasuredSize().height + this.space;
      }
    }
    this.setLayoutPosition(position);
  }

  onDraw(context: DrawContext) {
    const canvas = context.canvas;
    const pen = new drawing.Pen();
    // pen.setStrokeWidth(5);
    // pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
    // canvas.attachPen(pen);
    // canvas.drawRect({ left: 0, right: this.width, top: 0, bottom: this.width });
    // canvas.detachPen();
  }

  addWidth() {
    this.width += 10;
  }
}

class MyNodeController extends NodeController {
  public rootNode: MyFrameNode | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new MyFrameNode(context);
    this.rootNode?.commonAttribute?.size({ width: 100, height: 100 }).backgroundColor(bgColor);
    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private nodeController: MyNodeController = new MyNodeController();
  @State text1: string = ""

  build() {
    Row() {
      Column({ space: 12 } as ColumnOptions) {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('30%')
          .backgroundColor('#FFF0F0F0')
        Text(this.text1).margin(20).id("percentReference").height('5%')
        Button('Invalidate').height('5%')
          .id("btn")
          .onClick((e:ClickEvent) => {
            this.nodeController?.rootNode?.addWidth();
            this.nodeController?.rootNode?.invalidate();
            bgColor = Color.Pink
          })
        Button('UpdateLayout').height('5%')
          .onClick((e:ClickEvent) => {
            this.nodeController?.rootNode?.setNeedsLayout();
          })
        Button("click to show").height('5%')
          .id("show")
          .onClick((e:ClickEvent) => {
            if (bgColor == Color.Pink) {
              this.text1 = "percentReference"
            }
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}