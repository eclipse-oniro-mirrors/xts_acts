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
struct ShowDialogOptionsSystemMaterial {

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog Undefined',
              message: 'systemMaterial undefined test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: undefined
            });
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            let material: SystemUiMaterial | undefined = undefined;
            
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog HDS THICK',
              message: 'systemMaterial hdsMaterial.Material THICK test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: material
            });
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog SEMI_TRANSPARENT',
              message: 'systemMaterial uiMaterial.Material SEMI_TRANSPARENT test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
            });
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog Immersive THICK',
              message: 'systemMaterial uiMaterial.ImmersiveMaterial THICK test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
            });
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog Immersive ULTRA_THIN',
              message: 'systemMaterial uiMaterial.ImmersiveMaterial ULTRA_THIN test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            });
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showDialog({
              title: 'ShowDialog NONE',
              message: 'systemMaterial uiMaterial.Material NONE test',
              buttons: [
                { text: 'OK', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE })
            });
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}