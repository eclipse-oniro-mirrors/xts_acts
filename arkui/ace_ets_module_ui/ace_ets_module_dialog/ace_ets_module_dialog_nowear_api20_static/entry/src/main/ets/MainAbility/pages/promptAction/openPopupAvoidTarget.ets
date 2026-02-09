'use static'
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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  ComponentContent,
  ColumnOptions,
  Row,
  wrapBuilder,
  AvoidanceMode,
  PopupCommonOptions,
  Scroll,
  Scroller,
  Margin,
  ForEach
} from '@ohos.arkui.component'
import window from '@ohos.window';
import { display } from '@kit.ArkUI';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { BusinessError } from '@kit.BasicServicesKit';
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Builder
function popupBuilder3() {
  let textContent: string = '';
  for (let i: Int = 0; i < 10000; i++) {
    textContent += 'openPopup_AVOID_AROUND_TARGET\n';
  }
  Scroll(new Scroller()) {
    Column({ space: 5 } as ColumnOptions) {
      Text(textContent)
    }
  }
}
@Builder
function popupBuilder4() {
  let textContent: string = '';
  for (let i: Int = 0; i < 10000; i++) {
    textContent += 'openPopup_COVER_TARGET\n';
  }
  Scroll(new Scroller()) {
    Column({ space: 5 } as ColumnOptions) {
      Text(textContent)
    }
  }
}
@Builder
function popupBuilder5() {
  let textContent: string = '';
  for (let i: Int = 0; i < 10000; i++) {
    textContent += 'openPopup_undefined\n';
  }
  Scroll(new Scroller()) {
    Column({ space: 5 } as ColumnOptions) {
      Text(textContent)
    }
  }
}

@Entry
@Component
struct OpenPopupAvoidTarget {
  @State maxW: Double = 365
  @State maxH: Double = 365
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private contentNode: ComponentContent = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder3));
  private contentNode1: ComponentContent = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder4));
  private contentNode2: ComponentContent = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder5));

  onPageShow(): void {
    const displayInfo = display.getDefaultDisplaySync();
    this.maxW = displayInfo.width / displayInfo.densityPixels;
    this.maxH = displayInfo.height / displayInfo.densityPixels;
    console.log('Display Width:', displayInfo.width, 'Density:', displayInfo.densityPixels);
  }

  build() {
    Column() {
      Row(){
        Button('AVOID_AROUND_TARGET')
          .onClick(() => {
            try {
              this.promptAction.openPopup(this.contentNode, { id: 'avoidID' } as TargetInfo, {
                avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
                targetSpace: 1
              } as 	PopupCommonOptions)
                .then(() => {
                  console.info('---1130---openPopup success');
                })
                .catch((err: Error) => {
                  console.info('---1130---openPopup error:' + err.code + '+' + err.message);
                })
            }catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`---1130---openPopup error code is ${code}, message is ${message}`);
            }
            ;
          })
          .id('avoidID')
          .margin({ top: '2%' } as Margin)
        Button('COVER_TARGET')
          .onClick(() => {
            try {
              this.promptAction.openPopup(this.contentNode1, { id: 'avoidID1' } as TargetInfo, {
                avoidTarget: AvoidanceMode.COVER_TARGET,
                targetSpace: 1
              } as 	PopupCommonOptions)
                .then(() => {
                  console.info('---1130---openPopup success');
                })
                .catch((err: Error) => {
                  console.info('---1130---openPopup error:' + err.code + '+' + err.message);
                })
            }catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`---1130---openPopup error code is ${code}, message is ${message}`);
            }
            ;
          })
          .id('avoidID1')
          .margin({ top: '2%' } as Margin)
      }

      Button('undefined')
        .onClick(() => {
          try {
            this.promptAction.openPopup(this.contentNode2, { id: 'avoidID2' } as TargetInfo, {
              avoidTarget: undefined,
              targetSpace: 1
            } as 	PopupCommonOptions)
              .then(() => {
                console.info('---1130---openPopup success');
              })
              .catch((err: Error) => {
                console.info('---1130---openPopup error:' + err.code + '+' + err.message);
              })
          }catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`---1130---openPopup error code is ${code}, message is ${message}`);
          }
          ;
        })
        .id('avoidID2')
        .margin({ top: '2%' } as Margin)
    }.width('100%').height('100%')
  }
}