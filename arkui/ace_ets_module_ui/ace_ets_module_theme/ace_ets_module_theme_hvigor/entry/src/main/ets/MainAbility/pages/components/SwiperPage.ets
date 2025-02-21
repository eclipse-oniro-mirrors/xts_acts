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
export const swiperThemeProperty = 'SwiperThemeProperty';

export class SwiperKeys {
  public static readonly dotIndicatorSystem = `Swiper_DotIndicator_System`;
  public static readonly dotIndicatorWithTheme = `Swiper_DotIndicator_WithTheme`;
  public static readonly digitIndicatorSystem = `Swiper_DigitIndicator_System`;
  public static readonly digitIndicatorWithTheme = `Swiper_DigitIndicator_WithTheme`;
}

@Entry
@Component
struct SwiperPage {
  @StorageLink(swiperThemeProperty) localTheme: CustomTheme | undefined = redCustomTheme;
  value: string = 'Text';

  data: string[] = ['1', '2', '3', '4', '5'];

  build() {
    Column() {
      Swiper() {
        ForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height('160vp')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize('30fp')
        })
      }
      .indicator(new DotIndicator())
      .displayArrow({ showBackground: true })
      .margin({ top: '10vp' })
      .key(SwiperKeys.dotIndicatorSystem)

      WithTheme({ theme: this.localTheme }) {
        Swiper() {
          ForEach(this.data, (item: string) => {
            Text(item)
              .width('90%')
              .height('160vp')
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize('30fp')
          })
        }
        .indicator(new DotIndicator())
        .displayArrow({ showBackground: true })
        .margin({ top: '10vp' })
        .key(SwiperKeys.dotIndicatorWithTheme)
      }

      Swiper() {
        ForEach(this.data, (item: string) => {
          Text(item)
            .width('90%')
            .height('160vp')
            .backgroundColor('#AFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize('30fp')
        })
      }
      .indicator(new DigitIndicator())
      .margin({ top: '10vp' })
      .key(SwiperKeys.digitIndicatorSystem)

      WithTheme({ theme: this.localTheme }) {
        Swiper() {
          ForEach(this.data, (item: string) => {
            Text(item)
              .width('90%')
              .height('160vp')
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize('30fp')
          })
        }
        .indicator(new DigitIndicator())
        .margin({ top: '10vp' })
        .key(SwiperKeys.digitIndicatorWithTheme)
      }
    }
    .width('100%')
  }
}