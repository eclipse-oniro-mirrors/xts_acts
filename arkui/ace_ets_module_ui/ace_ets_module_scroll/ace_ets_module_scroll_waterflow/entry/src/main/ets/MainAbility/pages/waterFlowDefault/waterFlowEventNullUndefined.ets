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
    // 获取WaterFlow事件
    let waterFlowEvent: UIWaterFlowEvent | undefined = typeNode.getEvent(frameNode, 'WaterFlow');

    // 测试1: OnWillScroll事件 设置null
    try {
      waterFlowEvent?.setOnWillScroll(null);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnWillScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnWillScroll_null', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnWillScroll] null: ' + AppStorage.get('UIWaterFlowEvent_setOnWillScroll_null'));

    // 测试2: OnWillScroll事件 设置undefined
    try {
      waterFlowEvent?.setOnWillScroll(undefined);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnWillScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnWillScroll_undefined', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnWillScroll] undefined: ' + AppStorage.get('UIWaterFlowEvent_setOnWillScroll_undefined'));

    // 测试3: OnDidScroll事件 设置null
    try {
      waterFlowEvent?.setOnDidScroll(null);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnDidScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnDidScroll_null', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnDidScroll] null: ' + AppStorage.get('UIWaterFlowEvent_setOnDidScroll_null'));

    // 测试4: OnDidScroll事件 设置undefined
    try {
      waterFlowEvent?.setOnDidScroll(undefined);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnDidScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnDidScroll_undefined', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnDidScroll] undefined: ' + AppStorage.get('UIWaterFlowEvent_setOnDidScroll_undefined'));

    // 测试5: OnScrollIndex事件 设置null
    try {
      waterFlowEvent?.setOnScrollIndex(null);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnScrollIndex_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnScrollIndex_null', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnScrollIndex] null: ' + AppStorage.get('UIWaterFlowEvent_setOnScrollIndex_null'));

    // 测试6: OnScrollIndex事件 设置undefined
    try {
      waterFlowEvent?.setOnScrollIndex(undefined);
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnScrollIndex_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIWaterFlowEvent_setOnScrollIndex_undefined', 'error');
    }
    console.info('[UIWaterFlowEvent_setOnScrollIndex] undefined: ' + AppStorage.get('UIWaterFlowEvent_setOnScrollIndex_undefined'));

  }
}

@Entry
@Component
struct waterFlowEventNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State numbers: number[] = [];

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i);
    }
  }

  build() {
    Column() {
      Button('add CommonEvent to WaterFlow')
        .id('waterFlowEvent_nullUndefined_btn')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      WaterFlow() {
        ForEach(this.numbers, (item: number) => {
          FlowItem() {
            Text('N' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }
          .width('100%')
        }, (item: string) => item)
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