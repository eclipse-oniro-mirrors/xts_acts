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

import { FrameNode, NodeController, ReactiveBuilderNode, UIContext } from '@kit.ArkUI';

class MyDataSource {
  private dataArray: string[] = [];
  private listener: DataChangeListener | null = null;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number) {
    return this.dataArray[index];
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
}

@Builder
function buildNode(text: string) {
  Row() {
    Text(`C${text} -- `)
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  public builderNode: ReactiveBuilderNode<[string]> | null = null;
  public item: string = '';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let rootRenderNode = this.rootNode!.getRenderNode();
    if (this.builderNode == null) {
      this.builderNode = new ReactiveBuilderNode(uiContext, { selfIdealSize: { width: 300, height: 200 } });
      this.builderNode.build(wrapBuilder<[string]>(buildNode), {}, this.item);
      rootRenderNode?.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }
}

@Reusable
@Component
struct ReusableChildComponent {
  @Prop item: string = '';
  @Prop switch: string = '';
  private controller: MyNodeController = new MyNodeController();

  aboutToAppear() {
    this.controller.item = this.item;
  }

  aboutToRecycle(): void {
    console.info(`ReusableChildComponent aboutToRecycle ${this.item}`);

    if (this.switch === 'open') {
      this.controller?.builderNode?.recycle();
    }
  }

  aboutToReuse(params: object): void {
    console.info(`ReusableChildComponent aboutToReuse ${JSON.stringify(params)}`);

    if (this.switch === 'open') {
      this.controller?.builderNode?.reuse(params);
    }
  }

  build() {
    Row() {
      NodeContainer(this.controller);
    }
  }
}

@Entry
@Component
struct Index {
  @State data: MyDataSource = new MyDataSource();
  @State switch:boolean = true
  @State text: string=''

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column() {
      Button('switchButton')
        .id('switchButton')
        .height('5%')
        .padding(5)
        .fontSize(12)
        .onClick(() => {
          this.switch = !this.switch
          this.text = 'ReusableChildComponent reuseRecycle'
        })
      if(this.switch) {
        List({ space: 3 }) {
          LazyForEach(this.data, (item: string) => {
            ListItem() {
              ReusableChildComponent({
                item: item,
                switch: 'open'
              })
            }
          }, (item: string) => item)
        }
        .width(100)
        .height(100)
        Text(this.text).id('textReuseRecycle')
      }
    }
  }
}