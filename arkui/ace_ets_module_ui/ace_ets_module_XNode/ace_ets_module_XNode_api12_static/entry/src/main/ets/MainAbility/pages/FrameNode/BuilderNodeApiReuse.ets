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
import { FrameNode, NodeController, BuilderNode } from "@ohos.arkui.node"
import { UIContext } from "@ohos.arkui.UIContext"
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer,
  wrapBuilder,
  DataChangeListener,
  Reusable,
  List,
  ListItem,
  LazyForEach,
  IDataSource,
  CustomBuilderT,
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';

class MyDataSource implements IDataSource<string>{
  private dataArray: Array<string> = new Array<string>();
  private listener: DataChangeListener | null = null

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int) {
    return this.dataArray[index.toInt()];
  }

  public pushData(data: string) {
    this.dataArray.push(data);
  }

  public reloadListener(): void {
    this.listener?.onDataReloaded();
  }

  public registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener;
  }

  public unregisterDataChangeListener(): void {
    this.listener = null;
  }
  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

class Params {
  item: string = '';

  constructor(item: string) {
    this.item = item;
  }
}

@Builder
function buildNode(param: Params = new Params("hello")) {
  ReusableChildComponent2({ item: param.item });
}

class MyNodeController extends NodeController {
  public builderNode: BuilderNode<Params> | null = null;
  public item: string = "";

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.builderNode == null) {
      this.builderNode = new BuilderNode<Params>(uiContext, { selfIdealSize: { width: 300, height: 200 } });
      this.builderNode?.build(wrapBuilder<CustomBuilderT<Params>>(buildNode), new Params(this.item));
    }
    return this.builderNode?.getFrameNode()!;
  }
}

@Reusable
@Component
struct ReusableChildComponent {
  @State item: string = '';
  private controller: MyNodeController = new MyNodeController();
  aboutToAppear() {
    this.controller.item = this.item;
  }
  aboutToReuse(params: object): void {
    console.log("ReusableChildComponentAboutToReuse " + JSON.stringify(params));
    this.controller?.builderNode?.reuse(params);
  }
  build() {
    NodeContainer(this.controller);
  }
}

@Component
struct ReusableChildComponent2 {
  @State item: string = "false";

  aboutToReuse(params: Record<string, object>) {
    console.log("ReusableChildComponent2 Reusable 2 " + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log("ReusableChildComponent2 aboutToRecycle 2 " + this.item);
  }

  build() {
    Row() {
      Text(this.item).id(`BuilderNodeApiReuse_item${this.item}`)
        .fontSize(50)
        .backgroundColor(Color.Yellow)
        .margin({ left: 10 } as Margin)
    }.margin({ left: 10, right: 10 } as Margin)
  }
}


@Entry
@Component
struct BuilderNodeApiReuse {
  @State data: MyDataSource = new MyDataSource();

  aboutToAppear() {
    for (let i = 0;i < 100; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column() {
      List({ space: 3 }) {
        LazyForEach(this.data, (item: String, index:int):void => {
          ListItem() {
            ReusableChildComponent({ item: item })
          }
        }, (item: String, index:int):string => item)
      }
      .width('100%')
      .height('100%')
    }
  }
}