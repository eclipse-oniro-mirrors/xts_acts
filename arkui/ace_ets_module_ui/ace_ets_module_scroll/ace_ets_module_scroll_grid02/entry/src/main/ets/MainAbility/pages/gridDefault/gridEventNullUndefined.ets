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
    // 获取Grid事件
    let gridEvent: UIGridEvent | undefined = typeNode.getEvent(frameNode, 'Grid');

    // 测试1: OnWillScroll事件 设置null
    try {
      gridEvent?.setOnWillScroll(null);
      AppStorage.setOrCreate('UIGridEvent_setOnWillScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnWillScroll_null', 'error');
    }
    console.info('[UIGridEvent_setOnWillScroll] null: ' + AppStorage.get('UIGridEvent_setOnWillScroll_null'));

    // 测试2: OnWillScroll事件 设置undefined
    try {
      gridEvent?.setOnWillScroll(undefined);
      AppStorage.setOrCreate('UIGridEvent_setOnWillScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnWillScroll_undefined', 'error');
    }
    console.info('[UIGridEvent_setOnWillScroll] undefined: ' + AppStorage.get('UIGridEvent_setOnWillScroll_undefined'));

    // 测试3: OnDidScroll事件 设置null
    try {
      gridEvent?.setOnDidScroll(null);
      AppStorage.setOrCreate('UIGridEvent_setOnDidScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnDidScroll_null', 'error');
    }
    console.info('[UIGridEvent_setOnDidScroll] null: ' + AppStorage.get('UIGridEvent_setOnDidScroll_null'));

    // 测试4: OnDidScroll事件 设置undefined
    try {
      gridEvent?.setOnDidScroll(undefined);
      AppStorage.setOrCreate('UIGridEvent_setOnDidScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnDidScroll_undefined', 'error');
    }
    console.info('[UIGridEvent_setOnDidScroll] undefined: ' + AppStorage.get('UIGridEvent_setOnDidScroll_undefined'));

    // 测试5: OnScrollIndex事件 设置null
    try {
      gridEvent?.setOnScrollIndex(null);
      AppStorage.setOrCreate('UIGridEvent_setOnScrollIndex_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnScrollIndex_null', 'error');
    }
    console.info('[UIGridEvent_setOnScrollIndex] null: ' + AppStorage.get('UIGridEvent_setOnScrollIndex_null'));

    // 测试6: OnScrollIndex事件 设置undefined
    try {
      gridEvent?.setOnScrollIndex(undefined);
      AppStorage.setOrCreate('UIGridEvent_setOnScrollIndex_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIGridEvent_setOnScrollIndex_undefined', 'error');
    }
    console.info('[UIGridEvent_setOnScrollIndex] undefined: ' + AppStorage.get('UIGridEvent_setOnScrollIndex_undefined'));

  }
}

@Entry
@Component
struct gridEventNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State numbers: string[] = [];

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i.toString());
    }
  }

  build() {
    Column() {
      Button('add CommonEvent to Grid')
        .id('gridEvent_nullUndefined_btn')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Grid() {
        ForEach(this.numbers, (day: string, index: number) => {
          GridItem() {
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
      .columnsTemplate('1fr 1fr')
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      NodeContainer(this.myNodeController)
    }
  }
}