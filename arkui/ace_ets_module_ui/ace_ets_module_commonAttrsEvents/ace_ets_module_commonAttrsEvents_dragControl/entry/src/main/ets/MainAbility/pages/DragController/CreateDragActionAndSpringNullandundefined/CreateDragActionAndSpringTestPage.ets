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
import dragController from '@ohos.arkui.dragController';
import router from '@ohos.router';

@Entry
@Component
struct CreateDragActionAndSpringTestPage {
  @State message: string = 'createDragAction and SpringLoadingContext API Tests';
  @State error1: string = 'init';
  @State error2: string = 'init';
  @State error3: string = 'init';
  @State error4: string = 'init';
  @State error5: string = 'init';
  @State error6: string = 'init';
  @State error7: string = 'init';
  @State error8: string = 'init';
  @State error9: string = 'init';
  @State testUpdateNull: boolean = false;
  @State testUpdateUndefined: boolean = false;

  @Builder
  DragItemBuilder1() {
    Column() {
      Text('Item1')
    }
    .width('20%')
    .height('10%')
    .backgroundColor(Color.Blue)
  }

  @Builder
  DragItemBuilder2() {
    Column() {
      Text('Item2')
    }
    .width('20%')
    .height('10%')
    .backgroundColor(Color.Green)
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('90%')
        .height('5%')
        .margin({ top: '2%', bottom: '2%' })

      // createDragAction tests
      Text('createDragAction Tests')
        .fontSize(18)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })
        .fontWeight(FontWeight.Bold)

      Button('Test createDragAction with null array')
        .id('btn_create_action_null_array')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          this.testCreateDragActionNullArray();
        })

      Button('Test createDragAction with undefined array')
        .id('btn_create_action_undefined_array')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          this.testCreateDragActionUndefinedArray();
        })

      Button('Test createDragAction with empty array')
        .id('btn_create_action_empty_array')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          this.testCreateDragActionEmptyArray();
        })

      Button('Test createDragAction with null dragInfo')
        .id('btn_create_action_null_draginfo')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          this.testCreateDragActionNullDragInfo();
        })

      Button('Test createDragAction with undefined dragInfo')
        .id('btn_create_action_undefined_draginfo')
        .width('90%')
        .height('5%')
        .margin({ top: '1%' })
        .onClick(() => {
          this.testCreateDragActionUndefinedDragInfo();
        })

      // SpringLoadingContext.updateConfiguration tests
      Text('SpringLoadingContext.updateConfiguration Tests')
        .fontSize(18)
        .width('90%')
        .height('4%')
        .margin({ top: '2%', bottom: '1%' })
        .fontWeight(FontWeight.Bold)

      Text('Drag image to button below to test')
        .fontSize(14)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })

      // Test area with draggable image and target button
      Row() {
        Image($r('app.media.icon'))
          .id('drag_image')
          .width('30%')
          .height('30%')
          .draggable(true)
          .onDragStart((event: DragEvent) => {
            console.log('Drag Start Image')
          })
          .margin({ right: '2%' })

        Button('Target Area')
          .id('target_button')
          .width('30%')
          .height('15%')
          .type(ButtonType.Normal)
          .backgroundColor(Color.Pink)
          .onDrop((event) => {
            console.log('Drag Drop');
          })
          .onDragSpringLoading((context: dragController.SpringLoadingContext) => {
            if (context.state == dragController.DragSpringLoadingState.BEGIN) {
              // Test with null config
              if (this.testUpdateNull) {
                try {
                  context.updateConfiguration(null);
                  this.error6 = 'success';
                  AppStorage.setOrCreate('update_config_null', 'success');
                } catch (e) {
                  this.error6 = (e as Record<string, string>).code || 'error';
                  AppStorage.setOrCreate('update_config_null', this.error6);
                }
              }
              // Test with undefined config
              if (this.testUpdateUndefined) {
                try {
                  context.updateConfiguration(undefined);
                  this.error7 = 'success';
                  AppStorage.setOrCreate('update_config_undefined', 'success');
                } catch (e) {
                  this.error7 = (e as Record<string, string>).code || 'error';
                  AppStorage.setOrCreate('update_config_undefined', this.error7);
                }
              }
            }
          }, {
            stillTimeLimit: 0,
            updateInterval: 100,
            updateNotifyCount: 3,
            updateToFinishInterval: 100
          })
      }
      .width('90%')
      .height('20%')
      .margin({ top: '1%' })
      .justifyContent(FlexAlign.Center)

      Row() {
        Button('Test null config')
          .id('btn_set_test_null')
          .width('45%')
          .height('5%')
          .margin({ top: '1%', right: '1%' })
          .onClick(() => {
            this.testUpdateNull = true;
            this.testUpdateUndefined = false;
            AppStorage.setOrCreate('update_config_test_mode', 'null');
          })

        Button('Test undefined config')
          .id('btn_set_test_undefined')
          .width('45%')
          .height('5%')
          .margin({ top: '1%' })
          .onClick(() => {
            this.testUpdateNull = false;
            this.testUpdateUndefined = true;
            AppStorage.setOrCreate('update_config_test_mode', 'undefined');
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)

      // Display error codes
      Row() {
        Text(`null arr: ${this.error1}`)
          .id('error_1')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`und arr: ${this.error2}`)
          .id('error_2')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin({ top: '2%', bottom: '1%' })
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(`empty arr: ${this.error3}`)
          .id('error_3')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`null info: ${this.error4}`)
          .id('error_4')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(`und info: ${this.error5}`)
          .id('error_5')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`null cfg: ${this.error6}`)
          .id('error_6')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text(`und cfg: ${this.error7}`)
          .id('error_7')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')

      Button('Back')
        .id('btn_back')
        .width('50%')
        .height('5%')
        .margin({ top: '2%' })
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .padding('2%')
  }

  /**
   * Test createDragAction with null customArray
   */
  testCreateDragActionNullArray(): void {
    let dragInfo: dragController.DragInfo = {
      pointerId: 0,
      extraParams: ''
    };

    try {
      let dragAction = dragController.createDragAction(null, dragInfo);
      this.error1 = 'success';
      AppStorage.setOrCreate('create_drag_action_null_array', 'success');
    } catch (e) {
      this.error1 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('create_drag_action_null_array', this.error1);
    }
  }

  /**
   * Test createDragAction with undefined customArray
   */
  testCreateDragActionUndefinedArray(): void {
    let dragInfo: dragController.DragInfo = {
      pointerId: 0,
      extraParams: ''
    };

    try {
      let dragAction = dragController.createDragAction(undefined, dragInfo);
      this.error2 = 'success';
      AppStorage.setOrCreate('create_drag_action_undefined_array', 'success');
    } catch (e) {
      this.error2 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('create_drag_action_undefined_array', this.error2);
    }
  }

  /**
   * Test createDragAction with empty customArray
   */
  testCreateDragActionEmptyArray(): void {
    let dragInfo: dragController.DragInfo = {
      pointerId: 0,
      extraParams: ''
    };

    try {
      let dragAction = dragController.createDragAction([], dragInfo);
      this.error3 = 'success';
      AppStorage.setOrCreate('create_drag_action_empty_array', 'success');
    } catch (e) {
      this.error3 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('create_drag_action_empty_array', this.error3);
    }
  }

  /**
   * Test createDragAction with null dragInfo
   */
  testCreateDragActionNullDragInfo(): void {
    try {
      let dragAction = dragController.createDragAction([this.DragItemBuilder1, this.DragItemBuilder2], null);
      this.error4 = 'success';
      AppStorage.setOrCreate('create_drag_action_null_draginfo', 'success');
    } catch (e) {
      this.error4 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('create_drag_action_null_draginfo', this.error4);
    }
  }

  /**
   * Test createDragAction with undefined dragInfo
   */
  testCreateDragActionUndefinedDragInfo(): void {
    try {
      let dragAction = dragController.createDragAction([this.DragItemBuilder1, this.DragItemBuilder2], undefined);
      this.error5 = 'success';
      AppStorage.setOrCreate('create_drag_action_undefined_draginfo', 'success');
    } catch (e) {
      this.error5 = (e as Record<string, string>).code || 'error';
      AppStorage.setOrCreate('create_drag_action_undefined_draginfo', this.error5);
    }
  }

}
