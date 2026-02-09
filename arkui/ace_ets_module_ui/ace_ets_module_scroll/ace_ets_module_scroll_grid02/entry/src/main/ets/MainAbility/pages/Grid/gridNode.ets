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

import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
let scroller: Scroller = new Scroller()
let layoutOptions1: GridLayoutOptions = {
  regularSize: [1, 1],
  irregularIndexes: [0, 8],
  onGetIrregularSizeByIndex: (index: number) => {
    if (index === 0) {
      return [1, 5]
    }
    return [1, index % 6 + 1]
  },
  onGetRectByIndex: (index: number) => {
    if (index == 0){
      return [0, 0, 1, 1]
    }else if(index==1){
      return [0, 1, 2, 2]
    }else if(index==2){
      return [0 ,3 ,3 ,3]
    }else if(index==3){
      return [3, 0, 3, 3]
    }else if(index==4){
      return [4, 3, 2, 2]
    }else{
      return [5, 5, 1, 1]
    }
  }
}
class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let gridCol = typeNode.createNode(uiContext, 'Column')
    gridCol.initialize({space: 5}).width('100%').margin({top: 5})
    let grid = typeNode.createNode(uiContext, 'Grid')

    grid.initialize(null, null)
    grid.initialize(scroller, layoutOptions1)
      .width('90%')
      .height(300)
      .columnsGap(4)
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsGap(4).backgroundColor(0xFAEEE0).padding('4vp')
      .scrollBarWidth(4).key('key_ grid_001')
    for (let a = 0; a < 25; a++) {
      let gridItem = typeNode.createNode(uiContext, 'GridItem');
      gridItem.initialize(undefined);
      gridItem.initialize({ style:GridItemStyle.NONE }).backgroundColor(0xF9CF93);
      let context = typeNode.createNode(uiContext, 'Text');
      context.initialize((a % 5).toString())
        .fontSize(16)
        .width('100%')
        .height(80)
        .textAlign(TextAlign.Center)
        .focusable(true);
      gridItem.appendChild(context);
      grid.appendChild(gridItem);
    }
    gridCol.appendChild(grid)
    col.appendChild(gridCol)
    node.appendChild(col)
    return node
  }
}
@Entry
@Component
struct grid {
  @State numberIndex: number = 0;
  @State number1: String[] = ['0', '1', '2', '3', '4']
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
      Text('origin')

      Grid(scroller, layoutOptions1) {
        ForEach(this.number1, (day: string,index:number) => {
          ForEach(this.number1, (day: string,index:number) => {
            GridItem({style:GridItemStyle.NONE}) {
              Text(day)
                .fontSize(16)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
                .focusable(true).key(index+'1')
            }.backgroundColor(0xF9CF93)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(4)
      .rowsGap(4)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .padding('4vp')
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}