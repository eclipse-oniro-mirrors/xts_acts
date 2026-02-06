'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,
  Scroller,
  Color,
  BarState,
  Alignment,
  Margin,
  Reusable,
  NodeContainer,
  ListScroller,
  Builder,
  wrapBuilder,
  CustomBuilderT
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  PropRef
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BuilderNode, NodeController, FrameNode } from '@ohos.arkui.node';
import common from '@ohos.app.ability.common';
interface ParamsInterface {
  text: string;
  func: () => void;
}
class MyDataSource implements IDataSource<string> {
  private dataArray: string[] = []
  private listeners: DataChangeListener[] = []

  pushData(data: string): void {
    this.dataArray.push(data)
  }

  totalCount(): int {
    return this.dataArray.length;
  }

  getData(index: int): string {
    return this.dataArray[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}

class MyController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    console.log("======================================= build");
    let webviewBuilderNode = new BuilderNode<Param>(uiContext)
    const wrapBuilder1 = wrapBuilder<CustomBuilderT<Param>>(builderNode);
    webviewBuilderNode.build(wrapBuilder1, new Param())
    return webviewBuilderNode.getFrameNode()
  }
}



@Builder
function builderNode(param: Param) {
  ANode()
}

@Component
struct ANode {
  @StorageLink('visibleAreaChangeCount') visibleAreaChangeCount: int = 0

  build() {
    Column() {
      Text('啊啊啊啊啊啊啊啊')
        .fontSize(9)
        .height('7%')
    }
    .onVisibleAreaChange([0.5], (isVisible: boolean, currentRatio: number): void => {
      console.info('Node展示状态:', isVisible, '当前比率:', currentRatio)
      this.visibleAreaChangeCount++
    })
  }
}

class Param {
}

@Entry
@Component
struct LazyForEachVisibleAreaChangeDemo {
  private dataSource: MyDataSource = new MyDataSource()
  private scroller: ListScroller = new ListScroller()

  static { AppStorage.setOrCreate('visibleAreaChangeCount', 0) }

  @StorageLink('visibleAreaChangeCount') visibleAreaChangeCount: int = 0


  aboutToAppear(): void {
    for (let index = 0; index < 300; index++) {
      this.dataSource.pushData(`标题${index}`)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LazyForEachVisibleAreaChange', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button('scrollTo (0,800)')
        .id('scroll_to_800')
        .height('10%')
        .fontSize(9)
        .onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(11)
        })

      Button('scrollTo (0,1800)')
        .id('scroll_to_1800')
        .fontSize(9)
        .height('10%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollToIndex(100)
        })

      Text(String(this.visibleAreaChangeCount))
        .id('text_visible_area_change_count')
        .height('3%')
        .fontSize(9)

      List({ scroller: this.scroller }) {
        LazyForEach(this.dataSource, (item: string, index: int) => {
          ListItem() {
            if (item == '标题11') {
              NodeContainer(new MyController())
            } else {
              Row() {
                Text(item)
                  .fontSize(9)
                  .height('4%')
              }
            }
          }
        },
          (item: string) => item)
      }
      .width('100%')
      .layoutWeight(1)
      .divider({ strokeWidth: 1, color: Color.Gray })
      .scrollBar(BarState.Off)
      .align(Alignment.Center)
    }
  }
}
