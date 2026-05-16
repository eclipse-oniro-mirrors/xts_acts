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
import { componentUtils } from '@kit.ArkUI';

@Entry
@Component
struct ComponentUtilsTestPage {
  @State testResults: string = 'Click buttons to test componentUtils APIs';
  @State error1: string = 'init';
  @State error2: string = 'init';
  @State error3: string = 'init';
  @State componentInfo: string = '';

  build() {
    Column() {
      Text('ComponentUtils API Tests')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(this.testResults)
        .fontSize(14)
        .margin({ bottom: 20 })
        .id('test_results_text')

      // Test button for getRectangleById
      Button('Test getRectangleById')
        .id('btn_get_rectangle_by_id')
        .width(250)
        .height(50)
        .margin(10)
        .onClick(() => {
          this.testGetRectangleById();
        })

      // Display error codes
      Row() {
        Text(`empty: ${this.error1}`)
          .id('error_1')
          .margin(10)
        Text(`null: ${this.error2}`)
          .id('error_2')
          .margin(10)
      }
      Row() {
        Text(`undefined: ${this.error3}`)
          .id('error_3')
          .margin(10)
      }

      // Display component info
      Text(this.componentInfo)
        .id('component_info_text')
        .fontSize(12)
        .margin(10)
        .width('90%')

      // Test target component
      Column() {
        Text('Target Component')
          .fontSize(16)
          .id('target_component')
      }
      .width(200)
      .height(100)
      .backgroundColor(Color.Blue)
      .margin(20)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  /**
   * Test componentUtils.getRectangleById
   * Tests: empty string, null, undefined id
   */
  testGetRectangleById(): void {
    console.info('[ComponentUtilsTestPage] testGetRectangleById START');

    // Test with empty string id - should get error code 100001
    try {
      let result = componentUtils.getRectangleById('');
      this.error1 = 'success';
      AppStorage.setOrCreate('get_rectangle_by_id_empty', 'success');
    } catch (e) {
      this.error1 = e.code || '100001';
      AppStorage.setOrCreate('get_rectangle_by_id_empty', this.error1);
    }

    // Test with null id - should get error code
    try {
      let result = componentUtils.getRectangleById(null);
      this.error2 = 'success';
      AppStorage.setOrCreate('get_rectangle_by_id_null', 'success');
    } catch (e) {
      this.error2 = e.code || 'error';
      AppStorage.setOrCreate('get_rectangle_by_id_null', this.error2);
    }

    // Test with undefined id - should get error code
    try {
      let result = componentUtils.getRectangleById(undefined);
      this.error3 = 'success';
      AppStorage.setOrCreate('get_rectangle_by_id_undefined', 'success');
    } catch (e) {
      this.error3 = e.code || 'error';
      AppStorage.setOrCreate('get_rectangle_by_id_undefined', this.error3);
    }

    // Test with valid id
    try {
      let result = this.getUIContext().getComponentUtils().getRectangleById('target_component');
      this.componentInfo = JSON.stringify(result);
      AppStorage.setOrCreate('get_rectangle_by_id_valid', 'success');
    } catch (e) {
      this.componentInfo = e.code || 'error';
      AppStorage.setOrCreate('get_rectangle_by_id_valid', this.componentInfo);
    }

    this.testResults = 'getRectangleById tests completed';
    console.info('[ComponentUtilsTestPage] testGetRectangleById END');
  }
}
