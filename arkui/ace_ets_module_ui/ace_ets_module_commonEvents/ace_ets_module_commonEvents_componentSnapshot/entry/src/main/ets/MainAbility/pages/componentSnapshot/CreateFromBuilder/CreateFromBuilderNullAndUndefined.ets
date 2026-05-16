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
struct CreateFromBuilderNullAndUndefined {
  @State result: string = 'Init';

  @Builder
  TestBuilder() {
    Column() {
      Text('Test')
    }.width('100%').height('100%')
  }

  build() {
    Column() {
      Text('ComponentSnapshot CreateFromBuilder Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('resultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Button('builder null').id('btnBuilderNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('builder undefined').id('btnBuilderUndefined').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('delay null').id('btnDelayNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('delay undefined').id('btnDelayUndefined').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('checkImageStatus true').id('btnCheckTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, true);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('checkImageStatus false').id('btnCheckFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('options null').id('btnOptionsNull').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, null);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('options undefined').id('btnOptionsUndefined').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, undefined);
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('wait true').id('btnWaitTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { waitUntilRenderFinished: true });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('wait false').id('btnWaitFalse').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { waitUntilRenderFinished: false });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorMode isAuto true').id('btnColorModeIsAutoTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 4, isAuto: true } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorMode isAuto false')
            .id('btnColorModeIsAutoFalse')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await componentSnapshot.createFromBuilder(() => {
                  this.TestBuilder()
                }, 300, false, { colorMode: { colorSpace: 4, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('dynamicRangeMode HIGH').id('btnDrHIGH').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { dynamicRangeMode: { dynamicRangeMode: 0, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('dynamicRangeMode CONSTRAINT').id('btnDrCONSTRAINT').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { dynamicRangeMode: { dynamicRangeMode: 1, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('dynamicRangeMode STANDARD').id('btnDrSTANDARD').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('dynamicRangeMode isAuto true').id('btnDrIsAutoTrue').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: true } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('dynamicRangeMode isAuto false')
            .id('btnDrIsAutoFalse')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await componentSnapshot.createFromBuilder(() => {
                  this.TestBuilder()
                }, 300, false, { dynamicRangeMode: { dynamicRangeMode: 2, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('colorSpace SRGB').id('btnColorSpace4').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 4, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace UNKNOWN').id('btnColorSpace0').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 0, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace ADOBE_RGB_1998').id('btnColorSpace1').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 1, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace DCI_P3').id('btnColorSpace2').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 2, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace DISPLAY_P3').id('btnColorSpace3').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 3, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace CUSTOM').id('btnColorSpace5').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 5, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT709').id('btnColorSpace6').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 6, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT601_EBU').id('btnColorSpace7').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 7, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT601_SMPTE_C').id('btnColorSpace8').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 8, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT2020_HLG').id('btnColorSpace9').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 9, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT2020_PQ').id('btnColorSpace10').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 10, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace P3_HLG').id('btnColorSpace11').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 11, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace P3_PQ').id('btnColorSpace12').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 12, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace ADOBE_RGB_1998_LIMIT')
            .id('btnColorSpace13')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await componentSnapshot.createFromBuilder(() => {
                  this.TestBuilder()
                }, 300, false, { colorMode: { colorSpace: 13, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('colorSpace DISPLAY_P3_LIMIT').id('btnColorSpace14').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 14, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace SRGB_LIMIT').id('btnColorSpace15').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 15, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT709_LIMIT').id('btnColorSpace16').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 16, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT601_EBU_LIMIT').id('btnColorSpace17').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 17, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT601_SMPTE_C_LIMIT')
            .id('btnColorSpace18')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await componentSnapshot.createFromBuilder(() => {
                  this.TestBuilder()
                }, 300, false, { colorMode: { colorSpace: 18, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
          Button('colorSpace BT2020_HLG_LIMIT').id('btnColorSpace19').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 19, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace BT2020_PQ_LIMIT').id('btnColorSpace20').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 20, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace P3_HLG_LIMIT').id('btnColorSpace21').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 21, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace P3_PQ_LIMIT').id('btnColorSpace22').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 22, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace LINEAR_P3').id('btnColorSpace23').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 23, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace LINEAR_SRGB').id('btnColorSpace24').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 24, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace LINEAR_BT2020').id('btnColorSpace25').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 25, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace H_LOG').id('btnColorSpace26').width('100%').height('5%').onClick(async () => {
            try {
              let pixmap = await componentSnapshot.createFromBuilder(() => {
                this.TestBuilder()
              }, 300, false, { colorMode: { colorSpace: 26, isAuto: false } });
              this.result = 'Success';
            } catch (err) {
              this.result = 'Error: ' + err.code;
            }
          })
          Button('colorSpace DISPLAY_BT2020_SRGB')
            .id('btnColorSpace27')
            .width('100%')
            .height('5%')
            .onClick(async () => {
              try {
                let pixmap = await componentSnapshot.createFromBuilder(() => {
                  this.TestBuilder()
                }, 300, false, { colorMode: { colorSpace: 27, isAuto: false } });
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
            })
        }
        .width('100%')
      }
      .width('100%')
      .height('80%')
      .id('btnScroll')
    }
    .width('100%')
    .height('100%')
  }
}
