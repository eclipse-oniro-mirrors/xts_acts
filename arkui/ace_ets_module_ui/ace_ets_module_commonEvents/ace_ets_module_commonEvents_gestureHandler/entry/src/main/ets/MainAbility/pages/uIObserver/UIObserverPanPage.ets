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
struct UIObserverPanPage {
  @State testResults: string = 'Drag the area to trigger UIObserver callbacks';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  private observer: UIObserver | null = null;

  aboutToAppear(): void {
    console.info('[UIObserverPanPage] aboutToAppear START');
    this.observer = this.getUIContext().getUIObserver();

    // 正常注册 beforePanStart 事件监听器
    this.observer.on('beforePanStart', (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {
      console.info('[UIObserverPanPage] beforePanStart callback triggered');

      try {
        this.observer?.on(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanStart_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanStart_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanStart_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanStart_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanStart_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanStart_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanStart_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanStart_off_undefined', 'error');
      }
    });

    // 正常注册 beforePanEnd 事件监听器
    this.observer.on('beforePanEnd', (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {
      console.info('[UIObserverPanPage] beforePanEnd callback triggered');

      try {
        this.observer?.on(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanEnd_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanEnd_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanEnd_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanEnd_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanEnd_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanEnd_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('beforePanEnd_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('beforePanEnd_off_undefined', 'error');
      }
    });

    // 正常注册 afterPanStart 事件监听器
    this.observer.on('afterPanStart', (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {
      console.info('[UIObserverPanPage] afterPanStart callback triggered');

      try {
        this.observer?.on(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanStart_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanStart_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanStart_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanStart_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanStart_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanStart_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanStart_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanStart_off_undefined', 'error');
      }
    });

    // 正常注册 afterPanEnd 事件监听器
    this.observer.on('afterPanEnd', (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {
      console.info('[UIObserverPanPage] afterPanEnd callback triggered');

      try {
        this.observer?.on(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanEnd_on_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanEnd_on_null', 'error');
      }

      try {
        this.observer?.on(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanEnd_on_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanEnd_on_undefined', 'error');
      }

      try {
        this.observer?.off(null, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanEnd_off_null', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanEnd_off_null', 'error');
      }

      try {
        this.observer?.off(undefined, (event: GestureEvent, current: GestureRecognizer, node?: FrameNode) => {});
        AppStorage.setOrCreate('afterPanEnd_off_undefined', 'success');
      } catch (e) {
        AppStorage.setOrCreate('afterPanEnd_off_undefined', 'error');
      }
    });

    console.info('[UIObserverPanPage] aboutToAppear END');
  }

  build() {
    Column() {
      Text('UIObserver Pan Event Tests')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(this.testResults)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('test_results_text')

      Text('Pan Gesture Area (Drag Me)')
        .fontSize(16)
        .margin({ bottom: 10 })

      // 可拖动区域 - 执行 Pan 手势会触发 UIObserver 回调
      Column() {
        Text('Drag Me')
          .fontSize(20)
      }
      .width(300)
      .height(200)
      .backgroundColor('#E0E0E0')
      .border({ width: 2, color: '#999999' })
      .justifyContent(FlexAlign.Center)
      .translate({ x: this.offsetX, y: this.offsetY })
      .id('pan_area')
      .gesture(
        PanGesture({ direction: PanDirection.All })
          .onActionStart((event: GestureEvent) => {
            console.info('[UIObserverPanPage] Pan start');
          })
          .onActionUpdate((event: GestureEvent) => {
            this.offsetX = event.offsetX;
            this.offsetY = event.offsetY;
            this.testResults = `Pan gesture detected\nOffset: (${this.offsetX.toFixed(0)}, ${this.offsetY.toFixed(0)})`;
          })
          .onActionEnd((event: GestureEvent) => {
            console.info('[UIObserverPanPage] Pan end');
          })
      )

      Button('Reset Position')
        .id('reset_button')
        .width(200)
        .height(50)
        .margin({ top: 20 })
        .onClick(() => {
          this.offsetX = 0;
          this.offsetY = 0;
          this.testResults = 'Position reset. Drag again to test.';
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
