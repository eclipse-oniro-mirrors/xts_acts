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

@Entry
@Component
struct AlertDialogSystemMaterial {

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog Undefined',
              message: 'systemMaterial undefined test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: undefined,
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog Undefined button clicked');
                }
              }
            });
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            let material: SystemUiMaterial | undefined = undefined;
            
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog HDS THICK',
              message: 'systemMaterial hdsMaterial.Material THICK test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: material,
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog HDS THICK button clicked');
                }
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog SEMI_TRANSPARENT',
              message: 'systemMaterial uiMaterial.Material SEMI_TRANSPARENT test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog SEMI_TRANSPARENT button clicked');
                }
              }
            });
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog Immersive THICK',
              message: 'systemMaterial uiMaterial.ImmersiveMaterial THICK test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog Immersive THICK button clicked');
                }
              }
            });
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog Immersive ULTRA_THIN',
              message: 'systemMaterial uiMaterial.ImmersiveMaterial ULTRA_THIN test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog Immersive ULTRA_THIN button clicked');
                }
              }
            });
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            this.getUIContext().showAlertDialog({
              title: 'AlertDialog NONE',
              message: 'systemMaterial uiMaterial.Material NONE test',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
              confirm: {
                value: 'OK',
                action: () => {
                  console.info('AlertDialog NONE button clicked');
                }
              }
            });
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}