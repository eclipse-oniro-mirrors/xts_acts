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
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct BaseDialogOptionsSystemMaterial {
  @State dialogId1: number = -1;
  @State dialogId2: number = -1;
  @State dialogId3: number = -1;
  @State dialogId4: number = -1;
  @State dialogId5: number = -1;
  @State dialogId6: number = -1;
 
  @Builder
  customDialogBuilder() {
    Column() {
      Text('CustomDialog Content')
        .fontSize(16)
        .margin({ top: 10, bottom: 10 })
      Button('Close')
        .onClick(() => {
          if (this.dialogId1 > 0) {
            promptAction.closeCustomDialog(this.dialogId1);
            this.dialogId1 = -1;
          }
          if (this.dialogId2 > 0) {
            promptAction.closeCustomDialog(this.dialogId2);
            this.dialogId2 = -1;
          }
          if (this.dialogId3 > 0) {
            promptAction.closeCustomDialog(this.dialogId3);
            this.dialogId3 = -1;
          }
          if (this.dialogId4 > 0) {
            promptAction.closeCustomDialog(this.dialogId4);
            this.dialogId4 = -1;
          }
          if (this.dialogId5 > 0) {
            promptAction.closeCustomDialog(this.dialogId5);
            this.dialogId5 = -1;
          }
          if (this.dialogId6 > 0) {
            promptAction.closeCustomDialog(this.dialogId6);
            this.dialogId6 = -1;
          }
        })
    }
    .width(200)
    .height(100)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: undefined,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions Undefined onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId1 = dialogId;
              console.info('BaseDialogOptions Undefined opened with id: ' + dialogId);
            });
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            let material: SystemUiMaterial | undefined = undefined;
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: material,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions HDS THICK onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId2 = dialogId;
              console.info('BaseDialogOptions HDS THICK opened with id: ' + dialogId);
            });
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions SEMI_TRANSPARENT onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId3 = dialogId;
              console.info('BaseDialogOptions SEMI_TRANSPARENT opened with id: ' + dialogId);
            });
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions Immersive THICK onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId4 = dialogId;
              console.info('BaseDialogOptions Immersive THICK opened with id: ' + dialogId);
            });
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions Immersive ULTRA_THIN onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId5 = dialogId;
              console.info('BaseDialogOptions Immersive ULTRA_THIN opened with id: ' + dialogId);
            });
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogBuilder()
              },
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('BaseDialogOptions NONE onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              }
            }).then((dialogId: number) => {
              this.dialogId6 = dialogId;
              console.info('BaseDialogOptions NONE opened with id: ' + dialogId);
            });
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}