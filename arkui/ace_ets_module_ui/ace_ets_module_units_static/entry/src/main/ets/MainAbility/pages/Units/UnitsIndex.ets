/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Scroll,
  Button,
  ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics, LengthUnit, ColorMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct UnitsIndex {
  @State mVpValue: string = 'vp_val_init'
  @State mVpUnit: string = 'vp_unit_init'
  @State mPxValue: string = 'px_val_init'
  @State mPxUnit: string = 'px_unit_init'
  @State mFpValue: string = 'fp_val_init'
  @State mFpUnit: string = 'fp_unit_init'
  @State mPctValue: string = 'pct_val_init'
  @State mPctUnit: string = 'pct_unit_init'
  @State mColorRgba: string = 'color_rgba_init'
  @State mColorRed: string = 'color_red_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('UnitsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 4 } as ColumnOptions) {

        // LengthMetrics.vp(10) - value = 10, unit = LengthUnit.VP (1)
        Button(this.mVpValue)
          .id('btnLengthMetricsVpValue')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.vp(10);
            this.mVpValue = 'vp_val:' + len.value;
          })
        Button(this.mVpUnit)
          .id('btnLengthMetricsVpUnit')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.vp(10);
            this.mVpUnit = 'vp_unit:' + len.unit;
          })

        // LengthMetrics.px(20) - value = 20, unit = LengthUnit.PX (0)
        Button(this.mPxValue)
          .id('btnLengthMetricsPxValue')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.px(20);
            this.mPxValue = 'px_val:' + len.value;
          })
        Button(this.mPxUnit)
          .id('btnLengthMetricsPxUnit')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.px(20);
            this.mPxUnit = 'px_unit:' + len.unit;
          })

        // LengthMetrics.fp(14) - value = 14, unit = LengthUnit.FP (2)
        Button(this.mFpValue)
          .id('btnLengthMetricsFpValue')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.fp(14);
            this.mFpValue = 'fp_val:' + len.value;
          })
        Button(this.mFpUnit)
          .id('btnLengthMetricsFpUnit')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.fp(14);
            this.mFpUnit = 'fp_unit:' + len.unit;
          })

        // LengthMetrics.percent(0.5) - value = 0.5, unit = LengthUnit.PERCENT (3)
        Button(this.mPctValue)
          .id('btnLengthMetricsPctValue')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.percent(0.5);
            this.mPctValue = 'pct_val:' + len.value;
          })
        Button(this.mPctUnit)
          .id('btnLengthMetricsPctUnit')
          .width('90%')
          .onClick(() => {
            let len = LengthMetrics.percent(0.5);
            this.mPctUnit = 'pct_unit:' + len.unit;
          })

        // ColorMetrics.rgba - creates a valid ColorMetrics instance
        Button(this.mColorRgba)
          .id('btnColorMetricsRgba')
          .width('90%')
          .onClick(() => {
            let c = ColorMetrics.rgba(255, 0, 0, 1.0);
            this.mColorRgba = 'rgba:' + (c !== null && c !== undefined ? 'ok' : 'null');
          })

        // ColorMetrics.rgba - red channel readable
        Button(this.mColorRed)
          .id('btnColorMetricsRed')
          .width('90%')
          .onClick(() => {
            let c = ColorMetrics.rgba(200, 100, 50, 0.8);
            this.mColorRed = 'red:' + c.red;
          })

      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
