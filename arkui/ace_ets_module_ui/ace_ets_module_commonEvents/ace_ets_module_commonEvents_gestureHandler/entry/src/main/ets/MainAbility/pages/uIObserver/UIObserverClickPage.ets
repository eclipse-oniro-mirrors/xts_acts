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
import { UIObserver } from '@kit.ArkUI';

@Entry
@Component
struct UIObserverClickPage {
  @State testResults: string = 'Click buttons to trigger UIObserver callbacks';
  @State clickCount: number = 0;
  private observer: UIObserver | null = null;

  aboutToAppear(): void {
    console.info('[UIObserverClickPage] aboutToAppear START');
    this.observer = this.getUIContext().getUIObserver();

    // 正常注册 willClick 事件监听器 - GestureEventListenerCallback
    // 当用户点击按钮时，这些回调会被触发
    this.observer.on('willClick', (event: GestureEvent, node?: FrameNode) => {
      console.info('[UIObserverClickPage] willClick callback triggered (GestureEvent)');

      // 在回调中测试 null/undefined 参数
      try {
        this.observer?.on(null, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_gesture_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_gesture_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_gesture_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_gesture_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_gesture_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_gesture_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_gesture_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_gesture_off_undefined', 'error');
      }
    });

    // 正常注册 didClick 事件监听器 - GestureEventListenerCallback
    this.observer.on('didClick', (event: GestureEvent, node?: FrameNode) => {
      console.info('[UIObserverClickPage] didClick callback triggered (GestureEvent)');

      try {
        this.observer?.on(null, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_gesture_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_gesture_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_gesture_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_gesture_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_gesture_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_gesture_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_gesture_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_gesture_off_undefined', 'error');
      }
    });

    // 正常注册 willClick 事件监听器 - ClickEventListenerCallback
    this.observer.on('willClick', (event: ClickEvent, node?: FrameNode) => {
      console.info('[UIObserverClickPage] willClick callback triggered (ClickEvent)');

      try {
        this.observer?.on(null, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_click_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_click_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_click_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_click_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_click_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_click_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('willClick_click_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('willClick_click_off_undefined', 'error');
      }
    });

    // 正常注册 didClick 事件监听器 - ClickEventListenerCallback
    this.observer.on('didClick', (event: ClickEvent, node?: FrameNode) => {
      console.info('[UIObserverClickPage] didClick callback triggered (ClickEvent)');

      try {
        this.observer?.on(null, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_click_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_click_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_click_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_click_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_click_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_click_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: ClickEvent, node?: FrameNode) => {});
        AppStorage.setOrCreate('didClick_click_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('didClick_click_off_undefined', 'error');
      }
    });

    console.info('[UIObserverClickPage] aboutToAppear END');
  }

  build() {
    Column() {
      Text('UIObserver Click Event Tests')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(this.testResults)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('test_results_text')

      // 测试按钮 - 点击会触发 willClick 和 didClick 事件
      Button('Test Button (Click Me)')
        .id('test_button')
        .width(250)
        .height(60)
        .margin(20)
        .onClick(() => {
          this.clickCount++;
          this.testResults = `Button clicked ${this.clickCount} times\nUIObserver callbacks should have been triggered`;
          console.info('[UIObserverClickPage] Test Button clicked, count: ' + this.clickCount);
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
