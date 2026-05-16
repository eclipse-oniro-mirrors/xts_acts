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

import { promptAction, uiMaterial } from '@kit.ArkUI';
import router from '@ohos.router';

@Entry
@Component
struct ShowToastOptionsTestPage {
  @State toastId: number = 0;
  @State resultText: string = '';

  async openToast(options: promptAction.ShowToastOptions): Promise<number> {
    let id = await promptAction.openToast(options);
    this.toastId = id;
    this.resultText = 'ToastId: ' + id;
    return id;
  }

  closeToast() {
    promptAction.closeToast(this.toastId);
    this.resultText = 'Toast Closed';
  }

  build() {
    Column({ space: 10 }) {
      Text('ShowToastOptions Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .id('title_text')

      Text(this.resultText)
        .fontSize(16)
        .id('result_text')
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Message String')
          .id('btn_message_string')
          .onClick(async () => {
            await this.openToast({ message: 'Test Message String' });
          })

        Button('Message Resource')
          .id('btn_message_resource')
          .onClick(async () => {
            await this.openToast({ message: $r('app.string.app_name') });
          })
      }

      Row({ space: 10 }) {
        Button('Duration 1500')
          .id('btn_duration_min')
          .onClick(async () => {
            await this.openToast({ message: 'Duration 1500ms', duration: 1500 });
          })

        Button('Duration 10000')
          .id('btn_duration_max')
          .onClick(async () => {
            await this.openToast({ message: 'Duration 10000ms', duration: 10000 });
          })
      }

      Row({ space: 10 }) {
        Button('Bottom 50vp')
          .id('btn_bottom_string')
          .onClick(async () => {
            await this.openToast({ message: 'Bottom 50vp', bottom: '50vp' });
          })

        Button('Bottom 100')
          .id('btn_bottom_number')
          .onClick(async () => {
            await this.openToast({ message: 'Bottom 100', bottom: 100 });
          })
      }

      Row({ space: 10 }) {
        Button('Align Top')
          .id('btn_align_top')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Top', alignment: Alignment.Top });
          })

        Button('Align Center')
          .id('btn_align_center')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Center', alignment: Alignment.Center });
          })
      }

      Row({ space: 10 }) {
        Button('Align Bottom')
          .id('btn_align_bottom')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment Bottom', alignment: Alignment.Bottom });
          })

        Button('Align TopStart')
          .id('btn_align_topstart')
          .onClick(async () => {
            await this.openToast({ message: 'Alignment TopStart', alignment: Alignment.TopStart });
          })
      }

      Row({ space: 10 }) {
        Button('Offset Positive')
          .id('btn_offset_positive')
          .onClick(async () => {
            await this.openToast({ message: 'Offset Positive', offset: { dx: 50, dy: 50 } });
          })

        Button('Offset Negative')
          .id('btn_offset_negative')
          .onClick(async () => {
            await this.openToast({ message: 'Offset Negative', offset: { dx: -50, dy: -50 } });
          })
      }

      Row({ space: 10 }) {
        Button('ShowMode DEFAULT')
          .id('btn_showmode_default')
          .onClick(async () => {
            await this.openToast({ message: 'ShowMode DEFAULT', showMode: promptAction.ToastShowMode.DEFAULT });
          })

        Button('ShowMode TOP_MOST')
          .id('btn_showmode_topmost')
          .onClick(async () => {
            await this.openToast({ message: 'ShowMode TOP_MOST', showMode: promptAction.ToastShowMode.TOP_MOST });
          })
      }

      Row({ space: 10 }) {
        Button('BG Color Red')
          .id('btn_bgcolor_red')
          .onClick(async () => {
            await this.openToast({ message: 'BG Color Red', backgroundColor: '#FF0000' });
          })

        Button('Text Color White')
          .id('btn_textcolor_white')
          .onClick(async () => {
            await this.openToast({ message: 'Text Color White', textColor: '#FFFFFF' });
          })
      }

      Row({ space: 10 }) {
        Button('BlurStyle NONE')
          .id('btn_blur_none')
          .onClick(async () => {
            await this.openToast({ message: 'BlurStyle NONE', backgroundBlurStyle: BlurStyle.NONE });
          })

        Button('BlurStyle THIN')
          .id('btn_blur_thin')
          .onClick(async () => {
            await this.openToast({ message: 'BlurStyle THIN', backgroundBlurStyle: BlurStyle.Thin });
          })
      }

      Row({ space: 10 }) {
        Button('Shadow Style')
          .id('btn_shadow_style')
          .onClick(async () => {
            await this.openToast({ message: 'Shadow Style', shadow: ShadowStyle.OUTER_DEFAULT_MD });
          })

        Button('Shadow Options')
          .id('btn_shadow_options')
          .onClick(async () => {
            await this.openToast({ 
              message: 'Shadow Options', 
              shadow: { radius: 10, color: Color.Black, offsetX: 5, offsetY: 5 }
            });
          })
      }

      Row({ space: 10 }) {
        Button('HoverMode False')
          .id('btn_hover_false')
          .onClick(async () => {
            await this.openToast({ message: 'HoverMode False', enableHoverMode: false });
          })

        Button('HoverMode True')
          .id('btn_hover_true')
          .onClick(async () => {
            await this.openToast({ message: 'HoverMode True', enableHoverMode: true });
          })
      }

      Row({ space: 10 }) {
        Button('SystemMaterial')
          .id('btn_system_material')
          .onClick(async () => {
            await this.openToast({ 
              message: 'SystemMaterial', 
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            });
          })

        Button('All Parameters')
          .id('btn_all_params')
          .onClick(async () => {
            await this.openToast({
              message: 'All Parameters Test',
              duration: 5000,
              bottom: '50vp',
              alignment: Alignment.Center,
              offset: { dx: 10, dy: 10 },
              showMode: promptAction.ToastShowMode.DEFAULT,
              backgroundColor: '#333333',
              textColor: '#FFFFFF',
              backgroundBlurStyle: BlurStyle.NONE,
              shadow: ShadowStyle.OUTER_DEFAULT_MD,
              enableHoverMode: false
            });
          })
      }

      Button('Close Toast')
        .id('btn_close')
        .onClick(() => {
          this.closeToast();
        })

      Button('Back')
        .id('btn_back')
        .onClick(() => {
          router.back();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}