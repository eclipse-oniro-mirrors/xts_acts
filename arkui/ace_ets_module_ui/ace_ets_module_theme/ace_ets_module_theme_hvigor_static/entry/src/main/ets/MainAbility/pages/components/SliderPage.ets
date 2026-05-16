'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
  AlphabetIndexer,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  Slider,
  SliderChangeMode,
  SliderStyle,
  Text,
  WithTheme
} from '@ohos.arkui.component'
import { brownCustomTheme, redCustomTheme } from '../../themes/CustomTheme1';
import { State, StorageLink } from '@ohos.arkui.stateManagement'
import { CustomTheme } from '@ohos.arkui.theme';

export const sliderThemeProperty: string = `SliderThemeProperty`;

export const sliderThemeSetProperty: string = `SliderThemeSetProperty`

export class SliderKeys {
  public static readonly sliderOutSetSystem: string = `Slider_Out_Set_System`;
  public static readonly sliderInSetSystem: string = `Slider_In_Set_System`;
  public static readonly sliderOutSetStepsSystem: string = `Slider_Out_Set_Steps_System`;
  public static readonly sliderInSetStepsSystem: string = `Slider_In_Set_Steps_System`;
  public static readonly sliderOutSetSystemCustomAttrs: string = `Slider_Out_Set_System_CustomAttrs`
  public static readonly sliderInSetSystemCustomAttrs: string = `Slider_In_Set_System_CustomAttrs`
  public static readonly sliderOutSetStepsSystemCustomAttrs: string = `Slider_Out_Set_Steps_System_CustomAttrs`
  public static readonly sliderInSetStepsSystemCustomAttrs: string = `Slider_In_Set_Steps_System_CustomAttrs`
  public static readonly sliderOutSetWithTheme: string = `Slider_Out_Set_WithTheme`;
  public static readonly sliderInSetWithTheme: string = `Slider_In_Set_WithTheme`;
  public static readonly sliderOutSetStepsWithTheme: string = `Slider_Out_Set_Steps_WithTheme`;
  public static readonly sliderInSetStepsWithTheme: string = `Slider_In_Set_Steps_WithTheme`;
  public static readonly sliderOutSetWithThemeCustomAttrs: string = `Slider_Out_Set_WithTheme_CustomAttrs`
  public static readonly sliderInSetWithThemeCustomAttrs: string = `Slider_In_Set_WithTheme_CustomAttrs`
  public static readonly sliderOutSetStepsWithThemeCustomAttrs: string= `Slider_Out_Set_Steps_WithTheme_CustomAttrs`
  public static readonly sliderInSetStepsWithThemeCustomAttrs: string = `Slider_In_Set_Steps_WithTheme_CustomAttrs`
}

@Entry
@Component
struct SliderThemePage {
  @StorageLink(sliderThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  @StorageLink(sliderThemeSetProperty) themeSet: boolean | undefined = true
  count: int = 0;
  @State val1: number = 50;
  @State val2: number = 50;
  @State val3: number = 50;
  @State val4: number = 50;
  @State val5: number = 50;
  @State val6: number = 50;
  @State val7: number = 50;
  @State val8: number = 50;

  build() {
    Row() {
      Scroll() {
        Column({ space: '8vp' } as ColumnOptions) {
          Text('OutSet, SystemTheme')
          Slider({ value: this.val1 }).onChange((value: number, mode: SliderChangeMode): void => {
            this.val1 = value
          })
            .key(SliderKeys.sliderOutSetSystem)

          Text('InSet, SystemTheme')
          Slider({ value: this.val2, style: SliderStyle.InSet })
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val2 = value
            })
            .key(SliderKeys.sliderInSetSystem)

          Text('OutSet, SystemTheme, Steps on')
          Slider({ value: this.val3, step: 5 })
            .showSteps(true)
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val3 = value
            })
            .key(SliderKeys.sliderOutSetStepsSystem)

          Text('InSet, SystemTheme, Steps on')
          Slider({ value: this.val4, step: 5, style: SliderStyle.InSet })
            .showSteps(true)
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val4 = value
            })
            .key(SliderKeys.sliderInSetStepsSystem)

          Text('OutSet, SystemTheme, Custom attrs')
          Slider({ value: this.val1 })
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val1 = value
            })
            .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
            .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
            .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .key(SliderKeys.sliderOutSetSystemCustomAttrs)

          Text('InSet, SystemTheme, Custom attrs')
          Slider({ value: this.val2, style: SliderStyle.InSet })
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val2 = value
            })
            .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
            .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
            .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .key(SliderKeys.sliderInSetSystemCustomAttrs)

          Text('OutSet, SystemTheme, Steps on, Custom attrs')
          Slider({ value: this.val3, step: 5 })
            .showSteps(true)
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val3 = value
            })
            .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
            .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
            .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .key(SliderKeys.sliderOutSetStepsSystemCustomAttrs)

          Text('InSet, SystemTheme, Steps on, Custom attrs')
          Slider({ value: this.val4, step: 5, style: SliderStyle.InSet })
            .showSteps(true)
            .onChange((value: number, mode: SliderChangeMode): void => {
              this.val4 = value
            })
            .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
            .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
            .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
            .key(SliderKeys.sliderInSetStepsSystemCustomAttrs)

          WithTheme({ theme: this.themeSet ? this.localTheme : undefined }) {
            Column({ space: '8vp' } as ColumnOptions) {
              Text('OutSet, CustomTheme')
              Slider({ value: this.val5 }).onChange((value) => {
                this.val5 = value
              })
                .key(SliderKeys.sliderOutSetWithTheme)

              Text('InSet, CustomTheme')
              Slider({ value: this.val6, style: SliderStyle.InSet }).onChange((value) => {
                this.val6 = value
              })
                .key(SliderKeys.sliderInSetWithTheme)

              Text('InSet, CustomTheme, Steps on')
              Slider({ value: this.val7, step: 5 }).showSteps(true).onChange((value) => {
                this.val7 = value
              })
                .key(SliderKeys.sliderOutSetStepsWithTheme)

              Text('InSet, CustomTheme, Steps on')
              Slider({ value: this.val8, step: 5, style: SliderStyle.InSet }).showSteps(true).onChange((value) => {
                this.val8 = value
              })
                .key(SliderKeys.sliderInSetStepsWithTheme)

              Text('OutSet, CustomTheme, Custom attrs')
              Slider({ value: this.val5 })
                .onChange((value) => {
                  this.val5 = value
                })
                .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
                .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
                .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .key(SliderKeys.sliderOutSetWithThemeCustomAttrs)

              Text('InSet, CustomTheme, Custom attrs')
              Slider({ value: this.val6, style: SliderStyle.InSet })
                .onChange((value) => {
                  this.val6 = value
                })
                .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
                .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
                .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .key(SliderKeys.sliderInSetWithThemeCustomAttrs)

              Text('InSet, CustomTheme, Steps on, Custom attrs')
              Slider({ value: this.val7, step: 5 })
                .showSteps(true)
                .onChange((value) => {
                  this.val7 = value
                })
                .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
                .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
                .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .key(SliderKeys.sliderOutSetStepsWithThemeCustomAttrs)

              Text('InSet, CustomTheme, Steps on, Custom attrs')
              Slider({ value: this.val8, step: 5, style: SliderStyle.InSet })
                .showSteps(true)
                .onChange((value) => {
                  this.val8 = value
                })
                .trackColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .selectedColor(brownCustomTheme.colors?.backgroundEmphasize)
                .blockColor(brownCustomTheme.colors?.compBackgroundPrimaryContrary)
                .stepColor(brownCustomTheme.colors?.compBackgroundSecondary)
                .key(SliderKeys.sliderInSetStepsWithThemeCustomAttrs)
            }
            .width('100%')
          }
        }
        .width('100%')
      }
    }
    .height('100%')
  }
}