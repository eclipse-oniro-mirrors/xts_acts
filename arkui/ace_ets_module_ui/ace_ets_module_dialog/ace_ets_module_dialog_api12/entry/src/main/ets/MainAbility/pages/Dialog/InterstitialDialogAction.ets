/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { InterstitialDialogAction, IconStyle, TitlePosition, BottomOffset } from '@ohos.atomicservice.InterstitialDialogAction';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct InterstitialDialogAction1 {
  @State dialogFlag: string = 'start'
  build() {
    Row() {
      Column() {
        Button(this.dialogFlag).id('interstitialDialogAction_id')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let ctx: UIContext | null = this.getUIContext();
            let interstitialDialogAction: InterstitialDialogAction = new InterstitialDialogAction({
              uiContext: ctx as UIContext,
              title: 'Main Title',
              subtitle: 'Sub Title',
              titleColor: 'rgb(255, 192, 0)',
              subtitleColor: Color.Red,
              backgroundImage: $r('app.media.icon'),
              foregroundImage: $r('app.media.icon'),
              iconStyle: IconStyle.DARK,
              titlePosition: TitlePosition.TOP,
              bottomOffsetType: BottomOffset.OFFSET_FOR_NONE,
              onDialogClick: () => { console.log('outer dialog click action') },
              onDialogClose: () => { console.log('outer close action') }
            });
            interstitialDialogAction.openDialog();
            this.dialogFlag = 'openDialog succ'
            setTimeout(() => {
              interstitialDialogAction.closeDialog();
              this.dialogFlag = 'closeDialog succ'
            }, 5000)
          })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('rgba(0, 0, 0, 0.1)')
  }
}