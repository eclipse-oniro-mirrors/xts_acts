'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import {
  Entry,
  Component,
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight,
  Flex,
  FlexAlign,
  List,
  ListItem,
  $r
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

export class MyDataSource_1 implements IDataSource<number> {
  private list: number[] = []
  private listener?: DataChangeListener = undefined

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperTest_1 {

  @State flag: boolean = false;
  @State selectedItemWidth: number = 12
  @State selectedItemHeight: number = 6
  @State itemWidth: number = 6
  @State itemHeight: number = 6
  @State selectedFontColor: Color = Color.Black
  @State fontColor: Color = Color.Black
  @State selectedWeight: FontWeight | number | string = FontWeight.Normal;
  @State itemWeight: FontWeight | number | string = FontWeight.Normal;
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource_1 = new MyDataSource_1([])

  build() {
    Row() {
      Column() {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0100')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 34, weight: '800' })
            )
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0200')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '20px', weight: 200 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0300')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '48%', weight: 900 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0400')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '', weight: FontWeight.Bolder }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0500')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: -2, weight: 1000 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0600')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 'abc' })
            )
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0700')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '1000%', weight: '' }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0800')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '100vp', weight: 'adf@$5' }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_0900')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 10, weight: 200 }))
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: '40lpx', weight: 500 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_1000')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 10, weight: 500 }))
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 'abc' })
            )
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_SelectedDigitFont_1100')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedDigitFont({ size: 10, weight: 600 }))
            // .size(null)
            // .layoutWeight(null)
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0100')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: 34, weight: '800' }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0200')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: '20px', weight: 200 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0300')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: '48%', weight: 900 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0400')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: '', weight: FontWeight.Bolder }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0500')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: -2, weight: 1000 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0600')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: 'abc' })
            )
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0700')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: '1000%', weight: '' }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0800')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: '100vp', weight: 'adf@$5' }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_0900')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: 10, weight: 200 }))
            .indicator(Indicator.digit()
              .digitFont({ size: '40lpx', weight: 500 }))
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_1000')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: 10, weight: 500 }))
            .indicator(Indicator.digit()
              // .digitFont({ size: 'abc', weight: null })
              .digitFont({ size: 'abc' })
            )
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .autoPlay(true, undefined)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key('ArkUX_Stage_Swiper_DigitFont_1100')
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .digitFont({ size: 10, weight: 600 }))
            // .size(null)
            // .layoutWeight(null)
            .onChange((index: int): void => {
              console.info(index.toString())
            })
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .key('ArkUX_Stage_Swiper_Indicator_0100')
            .indicator(Indicator.digit().top(1))
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .key('ArkUX_Stage_Swiper_Indicator_0200')
            .indicator(Indicator.digit().bottom(1))
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .key('ArkUX_Stage_Swiper_Indicator_0300')
            .indicator(Indicator.digit().left(1))
          }

          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: number, index: int) => {
                Text(item.toString())
                  .width('90%')
                  .height(160)
                  .backgroundColor('0xAFEEEE')
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, (item: number) => item.toString())
            }
            .key('ArkUX_Stage_Swiper_Indicator_0400')
            .indicator(Indicator.digit().right(1))
          }
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
