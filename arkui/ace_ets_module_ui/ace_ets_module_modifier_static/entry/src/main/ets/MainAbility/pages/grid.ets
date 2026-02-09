'use static';
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
  Component,
  $r,
  Padding,
  Column,
  Alignment,
  TextOverflow,
  ColumnOptions,
  Grid,
  GridItem,
  Gauge,

  FormComponent,
  Visibility,
  FormDimension,
  Divider,
  Counter,
  DataPanel,
  DatePicker,
  BorderImageOption,
  BorderOptions,
  AdaptiveColor,
  BackgroundEffectOptions,
  BorderStyle,
  RepeatMode,
  GradientDirection,
  Image,
  Checkbox,
  Blank,
  MarkStyle,
  ResourceColor,
  CheckboxGroup,
  Text,
  Toggle,
  ToggleType,
  FlexAlign,
  Color,
  Flex,
  ButtonType,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  EdgeEffect,
  Curve,
  SwiperDisplayMode,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  TextAlign,
  AlphabetIndexer,
  GridAttribute,
  NestedScrollMode,
  BarState,
  GridDirection
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { GridModifier } from "@ohos.arkui.modifier";


class CustomModifier extends GridModifier {
  applyNormalAttribute(instance: GridAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    console.log("================================ onChange1")
    this.rowsGap(5)
    console.log("================================ onChange1 this.rowsGap")
  }
}

@Entry
@Component
struct GridMaxCount {
  // @State Number: String[] = ['5', '6', '7', '8', '9']

    @State customModifier: GridModifier = new CustomModifier()
      .friction(1)
      .enableScrollInteraction(true)
      .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.PARENT_FIRST })
      .edgeEffect(EdgeEffect.Spring)
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .scrollBarWidth(5)
      .scrollBarColor(Color.Pink)
      .scrollBar(BarState.On)
      .cachedCount(1)
      .editMode(true)
      .multiSelectable(true)
      .maxCount(10)
      .minCount(2)
      .cellLength(12)
      .layoutDirection(GridDirection.Row)
      .supportAnimation(true)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
              (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

        Text("grid-MaxCount")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor('0xCCCCCC')
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("maxCountText")

        Column({ space: 5 } as ColumnOptions) {
          Grid() {
            GridItem() {
              Text('1')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('2')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('3')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('4')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('5')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('6')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('7')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('8')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('9')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('10')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('11')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('12')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('13')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('14')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('15')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('16')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('17')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('18')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('19')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('20')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('21')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('22')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('23')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('24')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('25')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }

            GridItem() {
              Text('26')
                .fontSize(16)
                .backgroundColor('0xF9CF93')
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }
          .key("GridKey1")

                  .attributeModifier(this.customModifier as CustomModifier)
        }
      }
      .width("100%")
      .height("100%")
    }
    .margin({ top: 5 } as Margin)
  }
}

