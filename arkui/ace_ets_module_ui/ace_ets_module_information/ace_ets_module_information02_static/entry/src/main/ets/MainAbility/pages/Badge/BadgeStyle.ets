'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color,ResourceColor,ColorContent, Alignment,
  AttributeModifier, Scroll, $r,
  Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock, TextClockAttribute,
  TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle, BadgePosition,
  QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker, TextOverflow,
  TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode,
  AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode,
  ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt ,ResourceStr} from '@ohos.arkui.component'
import { State, Link,  Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct ImageTest {
  build() {
    Column() {
      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { badgeSize: 'gerwbwer' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_badgeSize_0100')
        }
      }

      Column() {
        Badge({
          value: 'point',
          style: { badgeSize: 'undefined' }
        } as BadgeParamWithString) {
          Image($r('app.media.startIcon')).width(100).height(100)
        }.width(120).key('Badge_badgeSize_0200')
      }

      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { badgeSize: 20 }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_badgeSize_0300')
        }

        Column() {
          Badge({
            value: 'point',
            style: { badgeSize: '20' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_badgeSize_0400')
        }

        Column() {
          Badge({
            value: 'point',
            style: { badgeSize: $r('app.float.badgeSize') }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_badgeSize_0500')
        }
      }

      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { fontSize: 'gerwbwer' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_fontSize_0100')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontSize: 'undefined' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_fontSize_0200')
        }
      }

      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { fontSize: 20 }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_fontSize_0300')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontSize: '20' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_fontSize_0400')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontSize: $r('app.float.Badge_FontSize') }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_fontSize_0500')
        }
      }

      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { fontWeight: 'gerwbwer' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0100')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontWeight: 'undefined' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0200')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontWeight: FontWeight.Normal }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0300')
        }
      }

      Row() {
        Column() {
          Badge({
            value: 'point',
            style: { fontWeight: 900 }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0400')
        }

        Column() {
          Badge({
            value: 'point',
            style: { fontWeight: '900' }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0500')
        }

        Column() {
          Text('fontWeight').height(30).fontSize(18)
          Badge({
            value: 'point',
            style: { fontWeight: $r('app.float.FontWeight') }
          } as BadgeParamWithString) {
            Image($r('app.media.startIcon')).width(100).height(100)
          }.width(120).key('Badge_FontWeight_0600')
        }
      }
    }
  }
}
