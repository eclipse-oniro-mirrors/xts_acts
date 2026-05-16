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
import { GestureListenerType, GestureActionPhase, GestureTriggerInfo } from '@kit.ArkUI';

@Entry
@Component
struct UIContextGestureTestPage {
  @State testResults: string = 'Click buttons to test Gesture APIs';
  @State error1: string = 'init';
  @State error2: string = 'init';
  @State error3: string = 'init';

  build() {
    Column() {
      Text('UIContext Gesture API Tests')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('90%')
        .height('5%')
        .margin({ top: '2%', bottom: '2%' })

      Text(this.testResults)
        .fontSize(14)
        .width('90%')
        .height('5%')
        .id('test_results_text')

      // Test button for addGlobalGestureListener
      Button('Test addGlobalGestureListener')
        .id('btn_add_global_gesture')
        .width('60%')
        .height('6%')
        .margin('1%')
        .fontSize(16)
        .onClick(() => {
          this.testAddGlobalGestureListener();
        })

      // Display error codes
      Row() {
        Text(`gl null: ${this.error1}`)
          .id('error_1')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`gl und: ${this.error2}`)
          .id('error_2')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(`gl arr: ${this.error3}`)
          .id('error_3')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')

      // Target area for gesture testing
      Column() {
        Text('Gesture Test Area')
          .fontSize(16)
          .id('gesture_test_area')
          .width('100%')
          .height('100%')
          .textAlign(TextAlign.Center)
      }
      .width('80%')
      .height('20%')
      .backgroundColor(Color.Blue)
      .margin('2%')
    }
    .width('100%')
    .height('100%')
    .padding('2%')
  }

  /**
   * Test UIObserver.addGlobalGestureListener with null/undefined/empty array options
   */
  testAddGlobalGestureListener(): void {
    console.info('[UIContextGestureTestPage] testAddGlobalGestureListener START');

    // Test callback function
    let testCallback = (info: GestureTriggerInfo) => {
      console.info('[testAddGlobalGestureListener] callback triggered');
    };

    // Test with null options
    try {
      this.getUIContext().getUIObserver().addGlobalGestureListener(
        GestureListenerType.TAP,
        null,
        testCallback
      );
      this.error1 = 'success';
      AppStorage.setOrCreate('add_global_gesture_null', 'success');
    } catch (e) {
      this.error1 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('add_global_gesture_null', this.error1);
    }

    // Test with undefined options
    try {
      this.getUIContext().getUIObserver().addGlobalGestureListener(
        GestureListenerType.TAP,
        undefined,
        testCallback
      );
      this.error2 = 'success';
      AppStorage.setOrCreate('add_global_gesture_undefined', 'success');
    } catch (e) {
      this.error2 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('add_global_gesture_undefined', this.error2);
    }

    // Test with empty actionPhrases array
    try {
      this.getUIContext().getUIObserver().addGlobalGestureListener(
        GestureListenerType.TAP,
        { actionPhases: [] },
        testCallback
      );
      this.error3 = 'success';
      AppStorage.setOrCreate('add_global_gesture_empty_array', 'success');
    } catch (e) {
      this.error3 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('add_global_gesture_empty_array', this.error3);
    }

    this.testResults = 'addGlobalGestureListener tests completed';
    console.info('[UIContextGestureTestPage] testAddGlobalGestureListener END');
  }
}
