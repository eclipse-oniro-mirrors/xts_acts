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
import { NodeController, FrameNode, typeNode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    // 获取List事件
    let listEvent: UIListEvent | undefined = typeNode.getEvent(frameNode, 'List');

    // 测试1: OnWillScroll事件 设置null
    try {
      listEvent?.setOnWillScroll(null);
      AppStorage.setOrCreate('UIListEvent_setOnWillScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnWillScroll_null', 'error');
    }
    console.info('[UIListEvent_setOnWillScroll] null: ' + AppStorage.get('UIListEvent_setOnWillScroll_null'));

    // 测试2: OnWillScroll事件 设置undefined
    try {
      listEvent?.setOnWillScroll(undefined);
      AppStorage.setOrCreate('UIListEvent_setOnWillScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnWillScroll_undefined', 'error');
    }
    console.info('[UIListEvent_setOnWillScroll] undefined: ' + AppStorage.get('UIListEvent_setOnWillScroll_undefined'));

    // 测试3: OnDidScroll事件 设置null
    try {
      listEvent?.setOnDidScroll(null);
      AppStorage.setOrCreate('UIListEvent_setOnDidScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnDidScroll_null', 'error');
    }
    console.info('[UIListEvent_setOnDidScroll] null: ' + AppStorage.get('UIListEvent_setOnDidScroll_null'));

    // 测试4: OnDidScroll事件 设置undefined
    try {
      listEvent?.setOnDidScroll(undefined);
      AppStorage.setOrCreate('UIListEvent_setOnDidScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnDidScroll_undefined', 'error');
    }
    console.info('[UIListEvent_setOnDidScroll] undefined: ' + AppStorage.get('UIListEvent_setOnDidScroll_undefined'));

    // 测试5: OnScrollIndex事件 设置null
    try {
      listEvent?.setOnScrollIndex(null);
      AppStorage.setOrCreate('UIListEvent_setOnScrollIndex_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnScrollIndex_null', 'error');
    }
    console.info('[UIListEvent_setOnScrollIndex] null: ' + AppStorage.get('UIListEvent_setOnScrollIndex_null'));

    // 测试6: OnScrollIndex事件 设置undefined
    try {
      listEvent?.setOnScrollIndex(undefined);
      AppStorage.setOrCreate('UIListEvent_setOnScrollIndex_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnScrollIndex_undefined', 'error');
    }
    console.info('[UIListEvent_setOnScrollIndex] undefined: ' + AppStorage.get('UIListEvent_setOnScrollIndex_undefined'));

    // 测试7: OnScrollVisibleContentChange事件 设置null
    try {
      listEvent?.setOnScrollVisibleContentChange(null);
      AppStorage.setOrCreate('UIListEvent_setOnScrollVisibleContentChange_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnScrollVisibleContentChange_null', 'error');
    }
    console.info('[UIListEvent_setOnScrollVisibleContentChange] null: ' + AppStorage.get('UIListEvent_setOnScrollVisibleContentChange_null'));

    // 测试8: OnScrollVisibleContentChange事件 设置undefined
    try {
      listEvent?.setOnScrollVisibleContentChange(undefined);
      AppStorage.setOrCreate('UIListEvent_setOnScrollVisibleContentChange_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIListEvent_setOnScrollVisibleContentChange_undefined', 'error');
    }
    console.info('[UIListEvent_setOnScrollVisibleContentChange] undefined: ' + AppStorage.get('UIListEvent_setOnScrollVisibleContentChange_undefined'));

  }
}

@Entry
@Component
struct listEventNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State numbers: string[] = [];

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.numbers.push(i.toString());
    }
  }

  build() {
    Column() {
      Button('add CommonEvent to List')
        .id('listEvent_nullUndefined_btn')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      List() {
        ForEach(this.numbers, (day: string, index: number) => {
          ListItem() {
            Text(day)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('90%')
              .height('20%')
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }
        }, (day: string, index: number) => index.toString() + day)
      }
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      NodeContainer(this.myNodeController)
    }
  }
}