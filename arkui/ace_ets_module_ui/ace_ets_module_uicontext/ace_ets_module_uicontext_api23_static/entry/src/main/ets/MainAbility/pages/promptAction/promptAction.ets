/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  wrapBuilder,
  TransitionEffect,
  DialogAlignment,
  PopupCommonOptions,
  MenuOptions,
  ClickEvent,
  FlexAlign
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, TargetInfo } from '@ohos.arkui.UIContext';
import { ComponentContent, AvoidanceMode } from '@kit.ArkUI';
import { FrameNode } from '@ohos.arkui.node';

// CustomDialog component for testing openCustomDialog
@Component
struct CustomDialogContent {
  build() {
    Column() {
      Text('Custom Dialog Content')
        .fontSize(20)
        .id('customDialogText')
    }
    .width('92%')
    .constraintSize({ maxWidth: 300 })
    .height(200)
    .padding(20)
  }
}

// CustomDialog content builder
@Builder
function buildCustomDialogContent() {
  CustomDialogContent();
}

// Popup content builder
@Builder
function buildPopupContent() {
  Column() {
    Text('Popup Content')
      .fontSize(24)
      .id('popupContentText')
  }
  .width(200)
  .height(100)
  .padding(10)
}

// Menu content builder
@Builder
function buildMenuContent() {
  Column() {
    Text('Menu Item 1')
      .fontSize(20)
      .id('menuItem1')
    Text('Menu Item 2')
      .fontSize(20)
      .id('menuItem2')
  }
  .width(200)
  .height(150)
  .padding(10)
}

@Entry
@Component
struct promptActionTest {

  aboutToAppear() {
    try {
      // Get target button uniqueId on page load
      let uiContext = this.getUIContext();
      // Wait for page render so target button has layout and uniqueId
      setTimeout(() => {
        try {
          let frameNode: FrameNode | null = uiContext.getFrameNodeByUniqueId(this.getUniqueId());
          if (!frameNode) {
            console.info('[ARKUI_NEW] promptAction aboutToAppear: frameNode is null');
            return;
          }
          let child = frameNode.getFirstChild();
          while (child) {
            let next = child.getNextSibling();
            if (!next) {
              let targetId = child.getUniqueId();
              if (targetId !== undefined) {
                AppStorage.setOrCreate<number>('targetButtonId', targetId);
                console.info('[ARKUI_NEW] promptAction aboutToAppear: targetButtonId set = ' + targetId);
              } else {
                console.info('[ARKUI_NEW] promptAction aboutToAppear: last child getUniqueId undefined');
              }
              break;
            }
            child = next;
          }
        } catch (error) {
          console.error('[ARKUI_NEW] get targetButtonId error: ' + error);
        }
      }, 800);
    } catch (error) {
      console.error('[ARKUI_NEW] aboutToAppear error: ' + error);
    }
  }

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('Toast开')
        .id('btnOpenToast')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          promptActionInstance.openToast({
            message: 'Test Toast',
            duration: 300
          }).then((toastId) => {
            AppStorage.setOrCreate<number>('promptActionToastId', Math.round(toastId) as number);
          }).catch((error) => {
            console.error('[ARKUI_NEW] openToast error: ' + error);
          });
        })

      Button('Toast关')
        .id('btnCloseToast')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          // Open a Toast first
          promptActionInstance.openToast({
            message: 'Test Toast',
            duration: 300
          }).then((toastId) => {
            // Then close it; toastId is Int, use directly
            promptActionInstance.closeToast(toastId);
            AppStorage.setOrCreate<boolean>('promptActionCloseToast', true);
          }).catch((error) => {
            console.error('closeToast error: ' + error);
          });
        })

      Button('序')
        .id('btnGetBottomOrder')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          try {
            let uiContext = this.getUIContext();
            let promptActionInstance = uiContext.getPromptAction();
            let bottomOrder = promptActionInstance.getBottomOrder();
            // getBottomOrder 返回 LevelOrder | undefined
            if (bottomOrder !== undefined) {
              // Store LevelOrder order value
              AppStorage.setOrCreate<number>('promptActionBottomOrder', bottomOrder.getOrder());
            } else {
              AppStorage.setOrCreate<number | undefined>('promptActionBottomOrder', undefined);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] getBottomOrder error: ' + error);
          }
        })

      Button('框开')
        .id('btnOpenCustomDialog')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildCustomDialogContent));
          promptActionInstance.openCustomDialog(contentNode, {
            onDidAppear: () => {
              AppStorage.setOrCreate<boolean>('promptActionOpenCustomDialog', true);
            }
          }).catch((error) => {
            console.error('[ARKUI_NEW] openCustomDialog error: ' + error);
          });
        })

      Button('框更')
        .id('btnUpdateCustomDialog')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          // Open a dialog first
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildCustomDialogContent));
          promptActionInstance.openCustomDialog(contentNode, {}).then(() => {
            // Then update it (same contentNode)
            // Set flag after updateCustomDialog succeeds
            return promptActionInstance.updateCustomDialog(contentNode, {
              alignment: DialogAlignment.CenterEnd,
              onDidAppear: () => {
                AppStorage.setOrCreate<boolean>('promptActionUpdateCustomDialog', true);
              }
            });
          }).then(() => {
            // updateCustomDialog executed, set flag
            AppStorage.setOrCreate<boolean>('promptActionUpdateCustomDialog', true);
          }).catch((error) => {
            console.error('[ARKUI_NEW] updateCustomDialog error: ' + error);
            AppStorage.setOrCreate<boolean>('promptActionUpdateCustomDialog', false);
          });
        })

      Button('泡开')
        .id('btnOpenPopup')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          AppStorage.setOrCreate<boolean>('promptActionOpenPopup', false);
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildPopupContent));
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            autoCancel: true,
            onDidAppear: () => {
              AppStorage.setOrCreate<boolean>('promptActionOpenPopup', true);
            }
          };
          let targetId = AppStorage.get<number>('targetButtonId');
          let target: TargetInfo = { id: 'targetButton' };
          console.info('[ARKUI_NEW] openPopup: targetButtonId=' + (targetId !== undefined ? targetId : 'undefined'));
          promptActionInstance.openPopup(contentNode, target, popupOptions).then(() => {
            console.info('[ARKUI_NEW] openPopup: then resolved');
            AppStorage.setOrCreate<boolean>('promptActionOpenPopup', true);
          }).catch((error) => {
            console.error('[ARKUI_NEW] openPopup error: ' + error);
            AppStorage.setOrCreate<boolean>('promptActionOpenPopup', false);
          });
        })

      Button('泡更')
        .id('btnUpdatePopup')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          AppStorage.setOrCreate<boolean>('promptActionUpdatePopup', false);
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildPopupContent));
          let popupOptions1: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            autoCancel: true
          };
          let targetId1 = AppStorage.get<number>('targetButtonId');
          let target1: TargetInfo = { id: 'targetButton' };
          console.info('[ARKUI_NEW] updatePopup: targetButtonId=' + (targetId1 !== undefined ? targetId1 : 'undefined'));
          promptActionInstance.openPopup(contentNode, target1, popupOptions1).then(() => {
            console.info('[ARKUI_NEW] updatePopup: openPopup resolved, calling updatePopup');
            let popupOptions2: PopupCommonOptions = {
              avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
              autoCancel: true,
              onDidAppear: () => {
                AppStorage.setOrCreate<boolean>('promptActionUpdatePopup', true);
              }
            };
            return promptActionInstance.updatePopup(contentNode, popupOptions2);
          }).then(() => {
            AppStorage.setOrCreate<boolean>('promptActionUpdatePopup', true);
          }).catch((error) => {
            console.error('[ARKUI_NEW] updatePopup error: ' + error);
            AppStorage.setOrCreate<boolean>('promptActionUpdatePopup', false);
          });
        })

      Button('泡关')
        .id('btnClosePopup')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          AppStorage.setOrCreate<boolean>('promptActionClosePopup', true);
        })

      Button('菜开')
        .id('btnOpenMenu')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildMenuContent));
          let menuOptions: MenuOptions = {
            onDidAppear: () => {
              AppStorage.setOrCreate<boolean>('promptActionOpenMenu', true);
            }
          };
          let targetMenu: TargetInfo = { id: 'targetButton' };
          console.info('[ARKUI_NEW] openMenu: target id=targetButton');
          promptActionInstance.openMenu(contentNode, targetMenu, menuOptions).then(() => {
            console.info('[ARKUI_NEW] openMenu: resolved');
          }).catch((error) => {
            console.error('[ARKUI_NEW] openMenu error: ' + error);
          });
        })

      Button('菜更')
        .id('btnUpdateMenu')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(8)
        .onClick(() => {
          let uiContext = this.getUIContext();
          let promptActionInstance = uiContext.getPromptAction();
          let contentNode = new ComponentContent<Object>(uiContext, wrapBuilder(buildMenuContent));
          let menuOptions1: MenuOptions = {
            enableArrow: true
          };
          let targetMenu1: TargetInfo = { id: 'targetButton' };
          console.info('[ARKUI_NEW] updateMenu: openMenu then updateMenu');
          promptActionInstance.openMenu(contentNode, targetMenu1, menuOptions1).then(() => {
            console.info('[ARKUI_NEW] updateMenu: openMenu resolved, calling updateMenu');
            let menuOptions2: MenuOptions = {
              enableArrow: false
            };
            return promptActionInstance.updateMenu(contentNode, menuOptions2, true);
          }).then(() => {
            AppStorage.setOrCreate<boolean>('promptActionUpdateMenu', true);
          }).catch((error) => {
            console.error('[ARKUI_NEW] updateMenu error: ' + error);
            AppStorage.setOrCreate<boolean>('promptActionUpdateMenu', false);
          });
        })

      // Target element for Popup and Menu
      Button('目标')
        .id('targetButton')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '7.2%' })
        .fontSize(9)
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
