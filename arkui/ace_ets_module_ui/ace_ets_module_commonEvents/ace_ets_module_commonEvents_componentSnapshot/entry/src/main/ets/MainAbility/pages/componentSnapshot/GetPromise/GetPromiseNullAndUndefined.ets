/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { componentSnapshot } from '@kit.ArkUI';

@Entry
@Component
struct GetPromiseNullAndUndefined {
  @State result: string = 'Init';

  build() {
    Column() {
      Text('ComponentSnapshot Get Promise Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('resultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Row() {
        Image($r('app.media.icon'))
          .width('20%')
          .height('10%')
          .id('targetComponent')
      }
      .width('100%')
      .height('15%')

      Scroll() {
        Column() {
          Button('get id empty').id('btnIdEmpty').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('');
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get id null').id('btnIdNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get id undefined').id('btnIdUndefined').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get options null').id('btnOptionsNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get options undefined').id('btnOptionsUndefined').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get wait false').id('btnWaitFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { waitUntilRenderFinished: false });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace SRGB').id('btnColorSpace4').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 4, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorMode isAuto true').id('btnColorModeIsAutoTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 4, isAuto: true } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get dynamicRangeMode HIGH').id('btnDrHIGH').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { dynamicRangeMode: { dynamicRangeMode: 0, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get dynamicRangeMode isAuto true').id('btnDrIsAutoTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: true } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get wait true').id('btnWaitTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { waitUntilRenderFinished: true });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorMode isAuto false').id('btnColorModeIsAutoFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 4, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get dynamicRangeMode CONSTRAINT').id('btnDrCONSTRAINT').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { dynamicRangeMode: { dynamicRangeMode: 1, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get dynamicRangeMode STANDARD').id('btnDrSTANDARD').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get dynamicRangeMode isAuto false').id('btnDrIsAutoFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace UNKNOWN').id('btnColorSpace0').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 0, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace ADOBE_RGB_1998').id('btnColorSpace1').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 1, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace DCI_P3').id('btnColorSpace2').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 2, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace DISPLAY_P3').id('btnColorSpace3').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 3, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace CUSTOM').id('btnColorSpace5').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 5, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT709').id('btnColorSpace6').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 6, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT601_EBU').id('btnColorSpace7').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 7, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT601_SMPTE_C').id('btnColorSpace8').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 8, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT2020_HLG').id('btnColorSpace9').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 9, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT2020_PQ').id('btnColorSpace10').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 10, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace P3_HLG').id('btnColorSpace11').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 11, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace P3_PQ').id('btnColorSpace12').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 12, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace ADOBE_RGB_1998_LIMIT').id('btnColorSpace13').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 13, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace DISPLAY_P3_LIMIT').id('btnColorSpace14').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 14, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace SRGB_LIMIT').id('btnColorSpace15').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 15, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT709_LIMIT').id('btnColorSpace16').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 16, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT601_EBU_LIMIT').id('btnColorSpace17').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 17, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT601_SMPTE_C_LIMIT').id('btnColorSpace18').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 18, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT2020_HLG_LIMIT').id('btnColorSpace19').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 19, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace BT2020_PQ_LIMIT').id('btnColorSpace20').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 20, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace P3_HLG_LIMIT').id('btnColorSpace21').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 21, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace P3_PQ_LIMIT').id('btnColorSpace22').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 22, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace LINEAR_P3').id('btnColorSpace23').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 23, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace LINEAR_SRGB').id('btnColorSpace24').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 24, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace LINEAR_BT2020').id('btnColorSpace25').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 25, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace H_LOG').id('btnColorSpace26').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 26, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('get colorSpace DISPLAY_BT2020_SRGB').id('btnColorSpace27').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.get('targetComponent', { colorMode: { colorSpace: 27, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('60%')
      .id('btnScroll')
    }
    .width('100%')
    .height('100%')
  }
}
