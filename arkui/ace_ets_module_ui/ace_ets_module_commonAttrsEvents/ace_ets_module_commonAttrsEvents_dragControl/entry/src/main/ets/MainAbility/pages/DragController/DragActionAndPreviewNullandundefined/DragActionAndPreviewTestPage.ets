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
struct DragActionAndPreviewTestPage {
  @State message: string = 'DragAction and DragPreview API Tests';
  @State error1: string = 'init';
  @State error2: string = 'init';
  @State error3: string = 'init';
  @State error4: string = 'init';
  @State error5: string = 'init';
  @State error6: string = 'init';
  @State error7: string = 'init';
  @State error8: string = 'init';
  @State testPreviewNull: boolean = false;
  @State testPreviewUndefined: boolean = false;
  @State testAnimateNull: boolean = false;
  @State testAnimateUndefined: boolean = false;
  private dragAction: dragController.DragAction | null = null;

  @Builder
  DraggingBuilder() {
    Column() {
      Text('DraggingBuilder')
    }
    .width('20%')
    .height('10%')
    .backgroundColor(Color.Blue)
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('90%')
        .height('5%')
        .margin({ top: '2%', bottom: '2%' })

      // Test results for on/off (tested in aboutToAppear)
      Text('DragAction.on/off tests completed - see results below')
        .fontSize(14)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })

      // Test mode selection for preview/animate
      Text('Select test mode for DragPreview, then drag image to button')
        .fontSize(14)
        .width('90%')
        .height('4%')
        .margin({ top: '1%', bottom: '1%' })

      Row() {
        Button('Test preview(null)')
          .id('btn_test_preview_null')
          .width('30%')
          .height('5%')
          .fontSize(12)
          .onClick(() => {
            this.testPreviewNull = true;
            this.testPreviewUndefined = false;
            this.testAnimateNull = false;
            this.testAnimateUndefined = false;
          })

        Button('Test animate(null)')
          .id('btn_test_animate_null')
          .width('30%')
          .height('5%')
          .fontSize(12)
          .onClick(() => {
            this.testPreviewNull = false;
            this.testPreviewUndefined = false;
            this.testAnimateNull = true;
            this.testAnimateUndefined = false;
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: '1%' })

      Row() {
        Button('Test preview(undefined)')
          .id('btn_test_preview_undefined')
          .width('30%')
          .height('5%')
          .fontSize(12)
          .onClick(() => {
            this.testPreviewNull = false;
            this.testPreviewUndefined = true;
            this.testAnimateNull = false;
            this.testAnimateUndefined = false;
          })

        Button('Test animate(undefined)')
          .id('btn_test_animate_undefined')
          .width('30%')
          .height('5%')
          .fontSize(12)
          .onClick(() => {
            this.testPreviewNull = false;
            this.testPreviewUndefined = false;
            this.testAnimateNull = false;
            this.testAnimateUndefined = true;
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: '1%' })

      // Test area
      Text('Drag image below to target button')
        .fontSize(14)
        .width('90%')
        .height('4%')
        .margin({ top: '2%', bottom: '1%' })

      Row() {
        Image($r('app.media.icon'))
          .id('drag_image')
          .width('30%')
          .height('15%')
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
          .onDrop(() => {
          })
          .onDragEnter(() => {
            console.log('aaaa')
            // Test setForegroundColor with null
            if (this.testPreviewNull) {
              try {
                let preview = dragController.getDragPreview();
                preview.setForegroundColor(null);
                this.error5 = 'success';
                AppStorage.setOrCreate('drag_preview_set_foreground_null', 'success');
              } catch (e) {
                this.error5 = (e as Record<string, string>).code || 'error';
                AppStorage.setOrCreate('drag_preview_set_foreground_null', this.error5);
              }
            }
            // Test setForegroundColor with undefined
            if (this.testPreviewUndefined) {
              try {
                let preview = dragController.getDragPreview();
                preview.setForegroundColor(undefined);
                this.error6 = 'success';
                AppStorage.setOrCreate('drag_preview_set_foreground_undefined', 'success');
              } catch (e) {
                this.error6 = (e as Record<string, string>).code || 'error';
                AppStorage.setOrCreate('drag_preview_set_foreground_undefined', this.error6);
              }
            }
            // Test animate with null
            if (this.testAnimateNull) {
              try {
                let preview = dragController.getDragPreview();
                preview.animate(null, () => {
                  console.info('animate callback');
                });
                this.error7 = 'success';
                AppStorage.setOrCreate('drag_preview_animate_null', 'success');
              } catch (e) {
                this.error7 = (e as Record<string, string>).code || 'error';
                AppStorage.setOrCreate('drag_preview_animate_null', this.error7);
              }
            }
            // Test animate with undefined
            if (this.testAnimateUndefined) {
              try {
                let preview = dragController.getDragPreview();
                preview.animate(undefined, () => {
                  console.info('animate callback');
                });
                this.error8 = 'success';
                AppStorage.setOrCreate('drag_preview_animate_undefined', 'success');
              } catch (e) {
                this.error8 = (e as Record<string, string>).code || 'error';
                AppStorage.setOrCreate('drag_preview_animate_undefined', this.error8);
              }
            }
          })
      }
      .width('90%')
      .height('20%')
      .margin({ top: '1%' })
      .justifyContent(FlexAlign.Center)

      // Display error codes
      Row() {
        Text(`on null: ${this.error1}`)
          .id('error_1')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`on und: ${this.error2}`)
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
        Text(`off null: ${this.error3}`)
          .id('error_3')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`off und: ${this.error4}`)
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
        Text(`fg null: ${this.error5}`)
          .id('error_5')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`fg und: ${this.error6}`)
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
        Text(`anim null: ${this.error7}`)
          .id('error_7')
          .width('48%')
          .height('100%')
          .fontSize(12)
        Text(`anim und: ${this.error8}`)
          .id('error_8')
          .width('48%')
          .height('100%')
          .fontSize(12)
      }
      .width('90%')
      .height('5%')
      .margin('1%')
      .justifyContent(FlexAlign.SpaceBetween)

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

  aboutToAppear() {
    // Test DragAction.on/off in aboutToAppear since they need to be called after createDragAction
    let dragInfo: dragController.DragInfo = {
      pointerId: 0,
      extraParams: ''
    };
    let customBuilders = [this.DraggingBuilder];

    try {
      this.dragAction = dragController.createDragAction(customBuilders, dragInfo);

      // Test on with null type
      try {
        this.dragAction.on(null, (info: dragController.DragAndDropInfo) => {
          console.info('statusChange callback null');
        });
        this.error1 = 'success';
      } catch (e) {
        this.error1 = (e as Record<string, string>).code || 'error';
      }
      AppStorage.setOrCreate('drag_action_on_null', this.error1);

      // Test on with undefined type
      try {
        this.dragAction.on(undefined, (info: dragController.DragAndDropInfo) => {
          console.info('statusChange callback undefined');
        });
        this.error2 = 'success';
      } catch (e) {
        this.error2 = (e as Record<string, string>).code || 'error';
      }
      AppStorage.setOrCreate('drag_action_on_undefined', this.error2);

      // Test off with null type
      try {
        this.dragAction.off(null);
        this.error3 = 'success';
      } catch (e) {
        this.error3 = (e as Record<string, string>).code || 'error';
      }
      AppStorage.setOrCreate('drag_action_off_null', this.error3);

      // Test off with undefined type
      try {
        this.dragAction.off(undefined);
        this.error4 = 'success';
      } catch (e) {
        this.error4 = (e as Record<string, string>).code || 'error';
      }
      AppStorage.setOrCreate('drag_action_off_undefined', this.error4);

    } catch (e) {
      let errorCode = (e as Record<string, string>).code || 'error';
      this.error1 = errorCode;
      this.error2 = errorCode;
      this.error3 = errorCode;
      this.error4 = errorCode;

      AppStorage.setOrCreate('drag_action_on_null', this.error1);
      AppStorage.setOrCreate('drag_action_on_undefined', this.error2);
      AppStorage.setOrCreate('drag_action_off_null', this.error3);
      AppStorage.setOrCreate('drag_action_off_undefined', this.error4);
    }
  }
}
