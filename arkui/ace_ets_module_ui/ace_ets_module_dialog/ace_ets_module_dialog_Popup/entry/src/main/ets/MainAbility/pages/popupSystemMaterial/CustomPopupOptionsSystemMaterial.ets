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
struct CustomPopupOptionsSystemMaterial {
  @State isShowPopupUndefined: boolean = false;
  @State isShowPopupHdsThick: boolean = false;
  @State isShowPopupSemiTransparent: boolean = false;
  @State isShowPopupImmersiveThick: boolean = false;
  @State isShowPopupImmersiveUltraThin: boolean = false;
  @State isShowPopupNone: boolean = false;

  @Builder
  customPopupBuilder(closeCallback: () => void) {
    Column() {
      Text('CustomPopupOptions Test')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close')
        .id('close_popup')
        .onClick(() => {
          closeCallback();
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .bindPopup(this.isShowPopupUndefined, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupUndefined = false;
            }),
            systemMaterial: undefined,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupUndefined = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupUndefined = !this.isShowPopupUndefined;
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .bindPopup(this.isShowPopupHdsThick, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupHdsThick = false;
            }),
            systemMaterial: undefined,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupHdsThick = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupHdsThick = !this.isShowPopupHdsThick;
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .bindPopup(this.isShowPopupSemiTransparent, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupSemiTransparent = false;
            }),
            systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupSemiTransparent = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupSemiTransparent = !this.isShowPopupSemiTransparent;
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .bindPopup(this.isShowPopupImmersiveThick, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupImmersiveThick = false;
            }),
            systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupImmersiveThick = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupImmersiveThick = !this.isShowPopupImmersiveThick;
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .bindPopup(this.isShowPopupImmersiveUltraThin, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupImmersiveUltraThin = false;
            }),
            systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupImmersiveUltraThin = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupImmersiveUltraThin = !this.isShowPopupImmersiveUltraThin;
          })

        Button('NONE')
          .id('materialTypeNone')
          .height('8%')
          .bindPopup(this.isShowPopupNone, {
            builder: () => this.customPopupBuilder(() => {
              this.isShowPopupNone = false;
            }),
            systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupNone = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupNone = !this.isShowPopupNone;
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}