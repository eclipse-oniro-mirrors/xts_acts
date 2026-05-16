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

import { uiMaterial, ComponentContent } from '@kit.ArkUI';

interface PopupParam {
  closeFunc?: () => void;
}

@Builder
function buildPopupText(param: PopupParam) {
  Column() {
    Text('Popup Content')
      .fontSize(20)
      .margin({ top: 20, bottom: 20 })
    Button('Close')
      .onClick(() => {
        param.closeFunc?.();
      })
  }
  .width('100%')
  .padding(20)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct PopupCommonOptionsSystemMaterial {
  contentUndefined: ComponentContent<PopupParam> | null = null;
  contentHdsThick: ComponentContent<PopupParam> | null = null;
  contentSemiTransparent: ComponentContent<PopupParam> | null = null;
  contentImmersiveThick: ComponentContent<PopupParam> | null = null;
  contentImmersiveUltraThin: ComponentContent<PopupParam> | null = null;
  contentNone: ComponentContent<PopupParam> | null = null;

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentUndefined = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentUndefined!);
            };
            await promptAction.openPopup(this.contentUndefined, { id: 'undefined' }, {
              systemMaterial: undefined
            });
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentHdsThick = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentHdsThick!);
            };
            let material: SystemUiMaterial | undefined = undefined;
            await promptAction.openPopup(this.contentHdsThick, { id: 'hds_thick' }, {
              systemMaterial: material
            });
          })
      }

      Row({ space: 5 }) {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentSemiTransparent = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentSemiTransparent!);
            };
            await promptAction.openPopup(this.contentSemiTransparent, { id: 'semi_transparent' }, {
              systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
            });
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentImmersiveThick = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentImmersiveThick!);
            };
            await promptAction.openPopup(this.contentImmersiveThick, { id: 'immersive_thick' }, {
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
            });
          })
      }

      Row({ space: 5 }) {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentImmersiveUltraThin = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentImmersiveUltraThin!);
            };
            await promptAction.openPopup(this.contentImmersiveUltraThin, { id: 'immersive_ultra_thin' }, {
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            });
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(async () => {
            let promptAction = this.getUIContext().getPromptAction();
            let popupParam: PopupParam = { closeFunc: undefined };
            this.contentNone = new ComponentContent(this.getUIContext(), wrapBuilder<[PopupParam]>(buildPopupText), popupParam);
            popupParam.closeFunc = () => {
              promptAction.closePopup(this.contentNone!);
            };
            await promptAction.openPopup(this.contentNone, { id: 'none' }, {
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