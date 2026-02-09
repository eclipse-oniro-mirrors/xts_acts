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

import { UIContext } from '@ohos.arkui.UIContext';
import { DrawContext, FrameNode, NodeController, LayoutConstraint, Size, Position } from '@ohos.arkui.node';
import drawing from '@ohos.graphics.drawing';

let para: Record<string, string> = { 'PropAPIonDrow': 'start' };
let storage: LocalStorage = new LocalStorage(para);

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

  onMeasure(constraint: LayoutConstraint): void {
    let sizeRes: Size = { width: 105, height: 105 };
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

  onLayout(position: Position): void {
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
    pen.setStrokeWidth(5);
    pen.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
    canvas.attachPen(pen);
    canvas.drawRect({ left: 0, right: this.width, top: 0, bottom: this.width });
    canvas.detachPen();
    storage.set('PropAPIonDrow', 'onDraw succ');
  }

  addWidth() {
    this.width += 10;
  }
}

class MyNodeController extends NodeController {
  public rootNode: MyFrameNode | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new MyFrameNode(context);
    this.rootNode?.commonAttribute?.size({ width: 100, height: 100 }).backgroundColor(Color.Green);
    return this.rootNode;
  }
}

@Entry
@Component
struct setMeasuredSize1 {
  private nodeController: MyNodeController = new MyNodeController();
  @State myMeasuredSize: string = "Init"
  @State text1: string = 'start';
  @State uiContext:UIContext = this.getUIContext()
  @State drawContext:DrawContext | null= null

  onPageShow(){
    this.nodeController.makeNode(this.uiContext)
  }

  build() {
    Row() {
      Column() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height(100)
          .backgroundColor('#FFF0F0F0')
        Row() {
          Button('OnDraw').width('25%')
            .onClick(() => {
              this.nodeController?.rootNode?.addWidth();
              this.nodeController?.rootNode?.invalidate();
            })
          Button('UpdateLayout').width('25%')
            .onClick(() => {
              this.nodeController?.rootNode?.setNeedsLayout();
            })
          Button(this.myMeasuredSize).id("getMeasuredSize_id").width('25%')
            .onClick(() => {
              this.myMeasuredSize = "" + this.nodeController?.rootNode?.getMeasuredSize().height;
            })

          Button(this.text1).id('APIsetOnDraw').width('25%')
            .onClick(() => {
              if(this.drawContext){
                this.nodeController?.rootNode?.onDraw(this.drawContext);
              }
              this.text1 = storage.get('PropAPIonDrow') as string
            })
        }
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}