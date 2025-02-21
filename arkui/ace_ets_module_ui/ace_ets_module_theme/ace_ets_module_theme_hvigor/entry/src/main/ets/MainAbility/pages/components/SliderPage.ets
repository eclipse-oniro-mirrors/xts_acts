/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { redCustomTheme } from '../../themes/CustomTheme';
import { CustomTheme } from '@ohos.arkui.theme';

export const sliderThemeProperty: string = `SliderThemeProperty`;

export class SliderKeys {
  public static readonly sliderOutSetSystem = `Slider_Out_Set_System`;
  public static readonly sliderInSetSystem = `Slider_In_Set_System`;
  public static readonly sliderOutSetStepsSystem = `Slider_Out_Set_Steps_System`;
  public static readonly sliderInSetStepsSystem = `Slider_In_Set_Steps_System`;
  public static readonly sliderOutSetWithTheme = `Slider_Out_Set_WithTheme`;
  public static readonly sliderInSetWithTheme = `Slider_In_Set_WithTheme`;
  public static readonly sliderOutSetStepsWithTheme = `Slider_Out_Set_Steps_WithTheme`;
  public static readonly sliderInSetStepsWithTheme = `Slider_In_Set_Steps_WithTheme`;
}
@Entry
@Component
struct SliderThemePage {
  @StorageLink(sliderThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  count = 0;

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
        Column({ space: '8vp' }) {
          Text('Slider, OutSet, SystemTheme')
          Slider({ value: this.val1 }).onChange((value) => {
            this.val1 = value
          })
            .key(SliderKeys.sliderOutSetSystem)

          Text('Slider, InSet, SystemTheme')
          Slider({ value: this.val2, style: SliderStyle.InSet }).onChange((value) => {
            this.val2 = value
          })
            .key(SliderKeys.sliderInSetSystem)

          Text('Slider, OutSet, SystemTheme, Steps on')
          Slider({ value: this.val3, step: 5 }).showSteps(true).onChange((value) => {
            this.val3 = value
          })
            .key(SliderKeys.sliderOutSetStepsSystem)

          Text('Slider, InSet, SystemTheme, Steps on')
          Slider({ value: this.val4, step: 5, style: SliderStyle.InSet }).showSteps(true).onChange((value) => {
            this.val4 = value
          })
            .key(SliderKeys.sliderInSetStepsSystem)

          WithTheme({ theme: this.localTheme }) {
            Column({ space: '8vp' }) {
              Text('Slider, OutSet, CustomTheme')
              Slider({ value: this.val5 }).onChange((value) => {
                this.val5 = value
              })
                .key(SliderKeys.sliderOutSetWithTheme)

              Text('Slider, InSet, CustomTheme')
              Slider({ value: this.val6, style: SliderStyle.InSet }).onChange((value) => {
                this.val6 = value
              })
                .key(SliderKeys.sliderInSetWithTheme)

              Text('Slider, InSet, CustomTheme, Steps on')
              Slider({ value: this.val7, step: 5 }).showSteps(true).onChange((value) => {
                this.val7 = value
              })
                .key(SliderKeys.sliderOutSetStepsWithTheme)

              Text('Slider, InSet, CustomTheme, Steps on')
              Slider({ value: this.val8, step: 5, style: SliderStyle.InSet }).showSteps(true).onChange((value) => {
                this.val8 = value
              })
                .key(SliderKeys.sliderInSetStepsWithTheme)
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