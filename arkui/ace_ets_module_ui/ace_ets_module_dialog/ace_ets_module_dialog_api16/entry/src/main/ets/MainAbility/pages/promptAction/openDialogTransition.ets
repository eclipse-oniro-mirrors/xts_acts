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

import { promptAction } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

const TAG: string = 'OpenDialogTest';

@Entry
@Component
struct Index {
  private customDialogComponentId: number = 0
  @State private isEnableTransition: boolean = false;
  @State private isEnableDialogTransition: boolean = false;
  @State private isEnableMaskTransition: boolean = false;
  private onCancel = () => {
    try {
      promptAction.closeCustomDialog(this.customDialogComponentId);
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      console.error(TAG, `closeCustomDialog error code is ${code}, message is ${message}`);
    }
  };
  private onConfirm = () => {
    try {
      promptAction.closeCustomDialog(this.customDialogComponentId);
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      console.error(TAG, `closeCustomDialog error code is ${code}, message is ${message}`);
    }
  };
  private openDialog = () => {
    promptAction.openCustomDialog({
      builder: () => {
        this.customDialogComponent()
      },
      transition: this.isEnableTransition ? TransitionEffect.move(TransitionEdge.TOP)
        .animation({ duration: 3000 })
        .combine(TransitionEffect.OPACITY) : undefined,
      dialogTransition: this.isEnableDialogTransition ? TransitionEffect.rotate({
        x: 0,
        y: 0,
        z: 1,
        angle: 360
      })
        .animation({ duration: 3000 })
        .combine(TransitionEffect.OPACITY)
        .combine(TransitionEffect.scale({ x: 0, y: 1.2 })) : undefined,
      maskTransition: this.isEnableMaskTransition ? TransitionEffect.move(TransitionEdge.TOP)
        .animation({ duration: 3000 })
        .combine(TransitionEffect.OPACITY)
        .combine(TransitionEffect.scale({ x: 0, y: 1.2 })) : undefined
    }).then((dialogId: number) => {
      this.customDialogComponentId = dialogId;
    })
      .catch((error: BusinessError) => {
        console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`);
      })
  };

  @Builder
  customDialogComponent(): void {
    Column() {
      Text('弹窗')
        .fontSize(30)
        .id('TextContent')
      Row({ space: 50 }) {
        Button('确认')
          .id('Confirm')
          .onClick(() => {
            this.onConfirm();
          })
        Button('取消')
          .id('Cancel')
          .onClick(() => {
            this.onCancel();
          })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .backgroundColor('#00FFFF')
  }

  build() {
    Column({ space: 20 }) {

      Button('OpenDialog')
        .width('50%')
        .id('OpenDialog')
        .onClick(() => {
          this.openDialog();
        })

      Button(this.isEnableTransition ? 'CloseTransition' : 'isEnableTransition')
        .width('50%')
        .id('EnableTransition')
        .onClick(() => {
          this.isEnableTransition = !this.isEnableTransition;
        })

      Button(this.isEnableDialogTransition ? 'CloseDialogTransition' : 'EnableDialogTransition')
        .width('50%')
        .id('EnableDialogTransition')
        .onClick(() => {
          this.isEnableDialogTransition = !this.isEnableDialogTransition;
        })

      Button(this.isEnableMaskTransition ? 'CloseMaskTransition' : 'EnableMaskTransition')
        .width('50%')
        .id('EnableMaskTransition')
        .onClick(() => {
          this.isEnableMaskTransition = !this.isEnableMaskTransition;
        })
    }
    .width('100%')
    .height('100%')
  }
}