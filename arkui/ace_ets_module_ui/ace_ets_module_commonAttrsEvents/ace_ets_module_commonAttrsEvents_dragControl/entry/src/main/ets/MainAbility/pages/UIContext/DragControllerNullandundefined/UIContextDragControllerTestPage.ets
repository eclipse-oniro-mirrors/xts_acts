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
import { dragController } from '@kit.ArkUI';
import { unifiedDataChannel } from '@kit.ArkData';

@Entry
@Component
struct UIContextDragControllerTestPage {
  @State testResults: string = 'Click buttons to test DragController APIs';
  @State error1: string = 'init';
  @State error2: string = 'init';
  @State error3: string = 'init';
  @State error4: string = 'init';
  @State error5: string = 'init';
  @State error6: string = 'init';
  @State error7: string = 'init';
  @State error8: string = 'init';
  @State error9: string = 'init';
  @State error10: string = 'init';
  @State error11: string = 'init';
  @State error12: string = 'init';
  @State error13: string = 'init';
  @State error14: string = 'init';

  @Builder
  DraggingBuilder() {
    Column() {
      Text('DraggingBuilder')
        .fontColor(Color.White)
        .fontSize(12)
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  build() {
    Column() {
      Text('UIContext DragController API Tests')
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

      // Test button for executeDrag
      Button('Test executeDrag')
        .id('btn_execute_drag')
        .width('60%')
        .height('6%')
        .margin('1%')
        .fontSize(16)
        .onClick(() => {
          this.testExecuteDrag();
        })

      // Test button for setDragEventStrictReportingEnabled
      Button('Test setDragEventStrictReportingEnabled')
        .id('btn_set_strict_reporting')
        .width('60%')
        .height('6%')
        .margin('1%')
        .fontSize(16)
        .onClick(() => {
          this.testSetDragEventStrictReportingEnabled();
        })

      // Test button for cancelDataLoading
      Button('Test cancelDataLoading')
        .id('btn_cancel_data_loading')
        .width('60%')
        .height('6%')
        .margin('1%')
        .fontSize(16)
        .onClick(() => {
          this.testCancelDataLoading();
        })

      // Test button for enableDropDisallowedBadge
      Button('Test enableDropDisallowedBadge')
        .id('btn_enable_badge')
        .width('60%')
        .height('6%')
        .margin('1%')
        .fontSize(16)
        .onClick(() => {
          this.testEnableDropDisallowedBadge();
        })

      // Display error codes - Row 1
      Row() {
        Text(`ex null: ${this.error1}`)
          .id('error_1')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`ex und: ${this.error2}`)
          .id('error_2')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`ex und1: ${this.error3}`)
          .id('error_3')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`ex null2: ${this.error4}`)
          .id('error_4')
          .width('24%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      // Display error codes - Row 2
      Row() {
        Text(`str true: ${this.error5}`)
          .id('error_5')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`str false: ${this.error6}`)
          .id('error_6')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`can empty: ${this.error7}`)
          .id('error_7')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`can null: ${this.error8}`)
          .id('error_8')
          .width('24%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      // Display error codes - Row 3
      Row() {
        Text(`can und: ${this.error9}`)
          .id('error_9')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`badg true: ${this.error10}`)
          .id('error_10')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`badg false: ${this.error11}`)
          .id('error_11')
          .width('24%')
          .height('100%')
          .fontSize(12)
        Text(`ret: ${this.error12}`)
          .id('error_12')
          .width('24%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      // Display error codes - Row 4
      Row() {
        Text(`cdl empty: ${this.error13}`)
          .id('error_13')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`cdl null: ${this.error14}`)
          .id('error_14')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('100%')
    .padding('2%')
  }

  /**
   * Test DragController.executeDrag with null/undefined parameters
   */
  testExecuteDrag(): void {
    console.info('[UIContextDragControllerTestPage] testExecuteDrag START');

    // Test with null custom
    try {
      let validDragInfo: dragController.DragInfo = {
        pointerId: 0,
        extraParams: ''
      };
      this.getUIContext().getDragController().executeDrag(null, validDragInfo, (err, data) => {
      });
      this.error1 = 'success';
      AppStorage.setOrCreate('execute_drag_null_custom', 'success');
    } catch (e) {
      this.error1 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('execute_drag_null_custom', this.error1);
    }

    // Test with undefined dragInfo
    try {
      this.getUIContext().getDragController().executeDrag(() => {
        this.DraggingBuilder()
      }, undefined, (err, data) => {
      });
      this.error2 = 'success';
      AppStorage.setOrCreate('execute_drag_undefined_draginfo', 'success');
    } catch (e) {
      this.error2 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('execute_drag_undefined_draginfo', this.error2);
    }

    // Test with undefined custom
    try {
      let validDragInfo: dragController.DragInfo = {
        pointerId: 0,
        extraParams: ''
      };
      this.getUIContext().getDragController().executeDrag(undefined, validDragInfo, (err, data) => {
      });
      this.error3 = 'success';
      AppStorage.setOrCreate('execute_drag_undefined_custom', 'success');
    } catch (e) {
      this.error3 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('execute_drag_undefined_custom', this.error3);
    }

    // Test with null dragInfo
    try {
      this.getUIContext().getDragController().executeDrag(() => {
        this.DraggingBuilder()
      }, null, (err, data) => {
      });
      this.error4 = 'success';
      AppStorage.setOrCreate('execute_drag_null_draginfo', 'success');
    } catch (e) {
      this.error4 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('execute_drag_null_draginfo', this.error4);
    }

    this.testResults = 'executeDrag tests completed';
    console.info('[UIContextDragControllerTestPage] testExecuteDrag END');
  }

  /**
   * Test setDragEventStrictReportingEnabled with true/false
   */
  testSetDragEventStrictReportingEnabled(): void {
    console.info('[UIContextDragControllerTestPage] testSetDragEventStrictReportingEnabled START');

    // Test with true
    try {
      this.getUIContext().getDragController().setDragEventStrictReportingEnabled(true);
      this.error5 = 'success';
      AppStorage.setOrCreate('set_strict_reporting_true', 'success');
    } catch (e) {
      this.error5 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('set_strict_reporting_true', this.error5);
    }

    // Test with false
    try {
      this.getUIContext().getDragController().setDragEventStrictReportingEnabled(false);
      this.error6 = 'success';
      AppStorage.setOrCreate('set_strict_reporting_false', 'success');
    } catch (e) {
      this.error6 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('set_strict_reporting_false', this.error6);
    }

    this.testResults = 'setDragEventStrictReportingEnabled tests completed';
    console.info('[UIContextDragControllerTestPage] testSetDragEventStrictReportingEnabled END');
  }

  /**
   * Test cancelDataLoading with empty string/null/undefined
   */
  testCancelDataLoading(): void {
    console.info('[UIContextDragControllerTestPage] testCancelDataLoading START');

    // Test with empty string
    try {
      this.getUIContext().getDragController().cancelDataLoading('');
      this.error7 = 'success';
      AppStorage.setOrCreate('cancel_data_loading_empty', 'success');
    } catch (e) {
      this.error7 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('cancel_data_loading_empty', this.error7);
    }

    // Test with null
    try {
      this.getUIContext().getDragController().cancelDataLoading(null);
      this.error8 = 'success';
      AppStorage.setOrCreate('cancel_data_loading_null', 'success');
    } catch (e) {
      this.error8 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('cancel_data_loading_null', this.error8);
    }

    // Test with undefined
    try {
      this.getUIContext().getDragController().cancelDataLoading(undefined);
      this.error9 = 'success';
      AppStorage.setOrCreate('cancel_data_loading_undefined', 'success');
    } catch (e) {
      this.error9 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('cancel_data_loading_undefined', this.error9);
    }

    this.testResults = 'cancelDataLoading tests completed';
    console.info('[UIContextDragControllerTestPage] testCancelDataLoading END');
  }

  /**
   * Test enableDropDisallowedBadge with true/false
   */
  testEnableDropDisallowedBadge(): void {
    console.info('[UIContextDragControllerTestPage] testEnableDropDisallowedBadge START');

    // Test with true
    try {
      this.getUIContext().getDragController().enableDropDisallowedBadge(true);
      this.error10 = 'success';
      AppStorage.setOrCreate('enable_badge_true', 'success');
    } catch (e) {
      this.error10 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('enable_badge_true', this.error10);
    }

    // Test with false
    try {
      this.getUIContext().getDragController().enableDropDisallowedBadge(false);
      this.error11 = 'success';
      AppStorage.setOrCreate('enable_badge_false', 'success');
    } catch (e) {
      this.error11 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('enable_badge_false', this.error11);
    }

    this.testResults = 'enableDropDisallowedBadge tests completed';
    console.info('[UIContextDragControllerTestPage] testEnableDropDisallowedBadge END');
  }
}
