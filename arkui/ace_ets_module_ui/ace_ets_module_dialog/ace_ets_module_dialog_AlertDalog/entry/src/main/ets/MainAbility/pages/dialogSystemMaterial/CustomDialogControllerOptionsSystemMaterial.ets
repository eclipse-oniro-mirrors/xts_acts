/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { uiMaterial } from '@kit.ArkUI';

@CustomDialog
struct CustomDialogContent {
  controller?: CustomDialogController;
  build() {
    Column() {
      Text('CustomDialog Content')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close();
          }
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct CustomDialogControllerOptionsSystemMaterial {
  dialogController1: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: undefined,
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  dialogController2: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: undefined,
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  dialogController3: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  dialogController4: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  dialogController5: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });
  dialogController6: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogContent(),
    systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  });

  aboutToDisappear() {
    this.dialogController1 = null;
    this.dialogController2 = null;
    this.dialogController3 = null;
    this.dialogController4 = null;
    this.dialogController5 = null;
    this.dialogController6 = null;
  }

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            if (this.dialogController1 != null) {
              this.dialogController1.open();
            }
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            if (this.dialogController2 != null) {
              this.dialogController2.open();
            }
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(() => {
            if (this.dialogController3 != null) {
              this.dialogController3.open();
            }
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            if (this.dialogController4 != null) {
              this.dialogController4.open();
            }
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(() => {
            if (this.dialogController5 != null) {
              this.dialogController5.open();
            }
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            if (this.dialogController6 != null) {
              this.dialogController6.open();
            }
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}