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
    // 获取Scroll事件
    let scrollEvent: UIScrollEvent | undefined = typeNode.getEvent(frameNode, 'Scroll');

    // 测试1: OnWillScroll事件 设置null
    try {
      scrollEvent?.setOnWillScroll(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnWillScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnWillScroll_null', 'error');
    }
    console.info('[UIScrollEvent_setOnWillScroll] null: ' + AppStorage.get('UIScrollEvent_setOnWillScroll_null'));

    // 测试2: OnWillScroll事件 设置undefined
    try {
      scrollEvent?.setOnWillScroll(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnWillScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnWillScroll_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnWillScroll] undefined: ' + AppStorage.get('UIScrollEvent_setOnWillScroll_undefined'));

    // 测试3: OnDidScroll事件 设置null
    try {
      scrollEvent?.setOnDidScroll(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnDidScroll_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnDidScroll_null', 'error');
    }
    console.info('[UIScrollEvent_setOnDidScroll] null: ' + AppStorage.get('UIScrollEvent_setOnDidScroll_null'));

    // 测试4: OnDidScroll事件 设置undefined
    try {
      scrollEvent?.setOnDidScroll(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnDidScroll_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnDidScroll_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnDidScroll] undefined: ' + AppStorage.get('UIScrollEvent_setOnDidScroll_undefined'));

    // 测试5: OnReachStart事件 设置null
    try {
      scrollEvent?.setOnReachStart(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnReachStart_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnReachStart_null', 'error');
    }
    console.info('[UIScrollEvent_setOnReachStart] null: ' + AppStorage.get('UIScrollEvent_setOnReachStart_null'));

    // 测试6: OnReachStart事件 设置undefined
    try {
      scrollEvent?.setOnReachStart(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnReachStart_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnReachStart_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnReachStart] undefined: ' + AppStorage.get('UIScrollEvent_setOnReachStart_undefined'));

    // 测试7: OnReachEnd事件 设置null
    try {
      scrollEvent?.setOnReachEnd(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnReachEnd_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnReachEnd_null', 'error');
    }
    console.info('[UIScrollEvent_setOnReachEnd] null: ' + AppStorage.get('UIScrollEvent_setOnReachEnd_null'));

    // 测试8: OnReachEnd事件 设置undefined
    try {
      scrollEvent?.setOnReachEnd(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnReachEnd_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnReachEnd_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnReachEnd] undefined: ' + AppStorage.get('UIScrollEvent_setOnReachEnd_undefined'));

    // 测试9: OnScrollStart事件 设置null
    try {
      scrollEvent?.setOnScrollStart(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStart_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStart_null', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollStart] null: ' + AppStorage.get('UIScrollEvent_setOnScrollStart_null'));

    // 测试10: OnScrollStart事件 设置undefined
    try {
      scrollEvent?.setOnScrollStart(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStart_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStart_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollStart] undefined: ' + AppStorage.get('UIScrollEvent_setOnScrollStart_undefined'));

    // 测试11: OnScrollStop事件 设置null
    try {
      scrollEvent?.setOnScrollStop(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStop_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStop_null', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollStop] null: ' + AppStorage.get('UIScrollEvent_setOnScrollStop_null'));

    // 测试12: OnScrollStop事件 设置undefined
    try {
      scrollEvent?.setOnScrollStop(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStop_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollStop_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollStop] undefined: ' + AppStorage.get('UIScrollEvent_setOnScrollStop_undefined'));

    // 测试13: OnScrollFrameBegin事件 设置null
    try {
      scrollEvent?.setOnScrollFrameBegin(null);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollFrameBegin_null', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollFrameBegin_null', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollFrameBegin] null: ' + AppStorage.get('UIScrollEvent_setOnScrollFrameBegin_null'));

    // 测试14: OnScrollFrameBegin事件 设置undefined
    try {
      scrollEvent?.setOnScrollFrameBegin(undefined);
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollFrameBegin_undefined', 'success');
    } catch (e) {
      AppStorage.setOrCreate('UIScrollEvent_setOnScrollFrameBegin_undefined', 'error');
    }
    console.info('[UIScrollEvent_setOnScrollFrameBegin] undefined: ' + AppStorage.get('UIScrollEvent_setOnScrollFrameBegin_undefined'));

  }
}

@Entry
@Component
struct scrollEventNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State numbers: string[] = [];

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.numbers.push(i.toString());
    }
  }

  build() {
    Column() {
      Button('add CommonEvent to Scroll')
        .id('scrollEvent_nullUndefined_btn')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Scroll() {
        Column() {
          ForEach(this.numbers, (day: string, index: number) => {
            Column() {
              Text(day)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('90%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }, (day: string, index: number) => index.toString() + day)
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      NodeContainer(this.myNodeController)
    }
  }
}