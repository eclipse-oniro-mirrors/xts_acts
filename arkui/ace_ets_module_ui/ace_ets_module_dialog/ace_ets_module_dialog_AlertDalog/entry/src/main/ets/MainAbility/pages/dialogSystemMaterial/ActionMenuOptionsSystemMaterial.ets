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
struct ActionMenuOptionsSystemMaterial {

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu Undefined',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
              ],
              systemMaterial: undefined
            });
          })

        // 未开源暂用undefined
        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            let material: SystemUiMaterial | undefined = undefined;
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu HDS THICK',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
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
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu SEMI_TRANSPARENT',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
            });
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu Immersive THICK',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
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
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu Immersive ULTRA_THIN',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
              ],
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            });
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            this.getUIContext().getPromptAction().showActionMenu({
              title: 'ActionMenu NONE',
              buttons: [
                { text: 'Button1', color: '#000000' },
                { text: 'Button2', color: '#000000' }
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