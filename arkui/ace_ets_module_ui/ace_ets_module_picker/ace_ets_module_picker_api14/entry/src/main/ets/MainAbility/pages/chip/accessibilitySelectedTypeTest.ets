/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { AccessibilitySelectedType, Chip, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct accessibilitySelectedTypeTest {
  @State accessibilitySelectedType: AccessibilitySelectedType = AccessibilitySelectedType.CLICKED

  build() {
    Column({ space: 10 }) {
      Text('' + this.accessibilitySelectedType).id('text')
      Button('change accessibilitySelectedType')
        .id('btn')
        .onClick(()=>{
          this.accessibilitySelectedType = ( this.accessibilitySelectedType + 1 )% 3
        })
      Chip({
        prefixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red
        },
        label: {
          text: '操作块',
          fontSize: 12,
          fontColor: Color.Blue,
          labelMargin: { left: 20, right: 30 }
        },
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        accessibilitySelectedType: this.accessibilitySelectedType,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        borderRadius: $r('sys.float.ohos_id_corner_radius_button')
      })
      Chip({
        prefixIcon: {
          src: $r('app.media.icon'),
          size: { width: 16, height: 16 },
          fillColor: Color.Red
        },
        label: {
          text: '操作块',
          fontSize: 12,
          fontColor: Color.Blue,
          labelMargin: { left: 20, right: 30 }
        },
        size: ChipSize.NORMAL,
        allowClose: true,
        enabled: true,
        accessibilitySelectedType: this.accessibilitySelectedType,
        backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
        borderRadius: $r('sys.float.ohos_id_corner_radius_button')
      })
    }
    .height('100%')
    .width('100%')
  }
}
