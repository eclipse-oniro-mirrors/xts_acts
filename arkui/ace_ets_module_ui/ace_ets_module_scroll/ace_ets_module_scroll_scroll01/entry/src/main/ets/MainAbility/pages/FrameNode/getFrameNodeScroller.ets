/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';

@Entry
@Component
struct GridNodeDeclare {
  private static readonly GRID_ID: string = 'GRID_ID';
  private defaultGridScroller: Scroller = new Scroller();

  @State private bindResult: string = 'Dynamic scroller not bound';
  @State private gridOffsetText: string = 'Grid default yOffset: 0';
  @State private items: number[] = [];

  aboutToAppear(): void {
    this.items = [];
    for (let i = 0; i < 40; i++) {
      this.items.push(i);
    }
  }

  onDidBuild(): void {
    if (this.defaultGridScroller.getFrameNode() != undefined) {
      console.log('defaultGridScroller getFrameNode is not empty, the nodeType is ' + this.defaultGridScroller.getFrameNode()?.getNodeType());
    } else {
      console.log('defaultGridScroller getFrameNode is empty');
    }
  }

  private bindGridController(): void {
    const frameNode = this.getUIContext().getFrameNodeById(GridNodeDeclare.GRID_ID);
    if (!frameNode) {
      this.bindResult = 'Bind failed: FrameNode is null';
      return;
    }
    try {
      typeNode.bindController(frameNode, this.defaultGridScroller, 'Grid');
      this.bindResult = 'Bind success：'+ this.defaultGridScroller.getFrameNode()?.getNodeType();
      this.refreshOffset();
    } catch (e) {
      this.bindResult = `Bind failed: code=${e.code}, msg=${e.message}`;
    }
  }

  private bindEmptyComponentController(): void {
    const frameNode = this.getUIContext().getFrameNodeById('NO_ID');
    try {
      typeNode.bindController(frameNode, this.defaultGridScroller, 'Grid');
      this.bindResult = 'Bind success';
      this.refreshOffset();
    } catch (e) {
      this.bindResult = `Bind failed: code=${e.code}, msg=${e.message}`;
    }
  }

  private refreshOffset(): void {
    const gridOffset = this.defaultGridScroller.currentOffset()?.yOffset ?? 0;
    this.gridOffsetText = `Grid default yOffset: ${gridOffset}`;
  }

  private scrollBy(scroller: Scroller): void {
    scroller.scrollBy(0, 120);
    this.refreshOffset();
  }

  private scrollTop(scroller: Scroller): void {
    scroller.scrollEdge(Edge.Top);
    this.refreshOffset();
  }

  build() {
    Column({ space: 2 }) {
      Text('Declarative Grid Demo')
        .fontWeight(FontWeight.Bold)

      Text(this.bindResult).fontSize(14)
        .id('bind_gridNode_result')
      Text(this.gridOffsetText).fontSize(14)
        .id('bind_grid_offset_text')

      Button('Bind Grid')
        .id('bind_grid_getFrameNode')
        .onClick(() => {
          this.bindGridController();
        })

      Row() {
        Button('Grid +120')
          .id('bind_grid_offy')
          .onClick(() => {
            this.scrollBy(this.defaultGridScroller);
          })
        Button('Grid Top')
          .id('bind_grid_offTop')
          .onClick(() => {
            this.scrollTop(this.defaultGridScroller);
          })
        Button('Read Offsets')
          .id('bind_grid_readOff')
          .onClick(() => {
            this.refreshOffset();
          })
      }

      Row() {
        Column() {
          Text('Grid Component')
          Grid(this.defaultGridScroller) {
            ForEach(this.items, (idx: number) => {
              GridItem() {
                Text('item_'+ idx)
                  .width('100%')
                  .height('10%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#f1f3f5')
              }
            })
          }
          .id(GridNodeDeclare.GRID_ID)
          .columnsTemplate('1fr 1fr')
          .columnsGap(8)
          .rowsGap(8)
          .layoutWeight(1)
          .width('100%')
          .borderWidth(1)
          .borderColor('#d0d7de')
        }

      }
      .layoutWeight(1)
      .width('100%')
      .alignItems(VerticalAlign.Top)
    }
    .padding(16)
    .width('100%')
    .height('100%')
  }
}