'use static'

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

import {
  Entry,
  Component,
  Column,
  Canvas,
  Scroll,
  Button,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  DrawingRenderingContext,
  LengthMetricsUnit,
  ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CanvasIndex {
  // Bound context objects used with actual Canvas components
  private ctx2dBound: CanvasRenderingContext2D =
    new CanvasRenderingContext2D(new RenderingContextSettings(true));
  private drcBound: DrawingRenderingContext = new DrawingRenderingContext();

  // @State labels updated by onReady callbacks (no button click needed)
  @State mCtxBound: string = 'ctx_bound_init'
  @State mDrcBound: string = 'drc_bound_init'

  // @State labels for button-triggered tests
  @State mAntiAliasDefault: string = 'antialias_default_init'
  @State mAntiAliasCtor: string = 'antialias_ctor_init'
  @State mAntiAliasSetTrue: string = 'antialias_set_true_init'
  @State mAntiAliasSetFalse: string = 'antialias_set_false_init'
  @State mCtx2dCanvasNull: string = 'ctx2d_canvas_null_init'
  @State mCtx2dUnit: string = 'ctx2d_unit_init'
  @State mDrcSize: string = 'drc_size_init'
  @State mDrcCanvas: string = 'drc_canvas_init'
  @State mDrcUnit: string = 'drc_unit_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('CanvasIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 4 } as ColumnOptions) {

        // Canvas bound to CanvasRenderingContext2D — onReady updates mCtxBound
        Canvas(this.ctx2dBound)
          .width('100%')
          .height('15%')
          .key('canvas2d')
          .onReady(() => {
            this.mCtxBound = 'ctx_bound:' +
              (this.ctx2dBound.canvas !== null && this.ctx2dBound.canvas !== undefined ? 'notNull' : 'null');
          })

        // Canvas bound to DrawingRenderingContext — onReady updates mDrcBound
        Canvas(this.drcBound)
          .width('100%')
          .height('15%')
          .key('canvasDrawing')
          .onReady(() => {
            this.mDrcBound = 'drc_bound:' +
              (this.drcBound.canvas !== null && this.drcBound.canvas !== undefined ? 'notNull' : 'null');
          })

        // Label buttons showing onReady results (read by test without clicking)
        Button(this.mCtxBound).id('btnCtxBound').width('90%')
        Button(this.mDrcBound).id('btnDrcBound').width('90%')

        // RenderingContextSettings: antialias default (no arg)
        Button(this.mAntiAliasDefault)
          .id('btnAntiAliasDefault')
          .width('90%')
          .onClick(() => {
            let rcs = new RenderingContextSettings();
            this.mAntiAliasDefault = 'antialias_default:' + rcs.antialias;
          })

        // RenderingContextSettings: constructor with antialias=true
        Button(this.mAntiAliasCtor)
          .id('btnAntiAliasCtor')
          .width('90%')
          .onClick(() => {
            let rcs = new RenderingContextSettings(true);
            this.mAntiAliasCtor = 'antialias_ctor:' + rcs.antialias;
          })

        // RenderingContextSettings: setter = true
        Button(this.mAntiAliasSetTrue)
          .id('btnAntiAliasSetTrue')
          .width('90%')
          .onClick(() => {
            let rcs = new RenderingContextSettings();
            rcs.antialias = true;
            this.mAntiAliasSetTrue = 'antialias_set_true:' + rcs.antialias;
          })

        // RenderingContextSettings: setter = false
        Button(this.mAntiAliasSetFalse)
          .id('btnAntiAliasSetFalse')
          .width('90%')
          .onClick(() => {
            let rcs = new RenderingContextSettings(true);
            rcs.antialias = false;
            this.mAntiAliasSetFalse = 'antialias_set_false:' + rcs.antialias;
          })

        // CanvasRenderingContext2D: canvas getter when unbound
        Button(this.mCtx2dCanvasNull)
          .id('btnCtx2dCanvasNull')
          .width('90%')
          .onClick(() => {
            let ctx2d = new CanvasRenderingContext2D(new RenderingContextSettings(true));
            this.mCtx2dCanvasNull = 'ctx2d_canvas:' +
              (ctx2d.canvas === null || ctx2d.canvas === undefined ? 'null' : 'notNull');
          })

        // CanvasRenderingContext2D with LengthMetricsUnit
        Button(this.mCtx2dUnit)
          .id('btnCtx2dUnit')
          .width('90%')
          .onClick(() => {
            let ctx2d = new CanvasRenderingContext2D(new RenderingContextSettings(true), LengthMetricsUnit.DEFAULT);
            this.mCtx2dUnit = 'ctx2d_unit:' + (ctx2d !== null && ctx2d !== undefined ? 'ok' : 'null');
          })

        // DrawingRenderingContext: size getter
        Button(this.mDrcSize)
          .id('btnDrcSize')
          .width('90%')
          .onClick(() => {
            let drc = new DrawingRenderingContext();
            this.mDrcSize = 'drc_size:' + (drc.size !== null && drc.size !== undefined ? 'notNull' : 'null');
          })

        // DrawingRenderingContext: canvas getter when unbound
        Button(this.mDrcCanvas)
          .id('btnDrcCanvas')
          .width('90%')
          .onClick(() => {
            let drc = new DrawingRenderingContext();
            this.mDrcCanvas = 'drc_canvas:' +
              (drc.canvas === undefined || drc.canvas === null ? 'null' : 'notNull');
          })

        // DrawingRenderingContext with LengthMetricsUnit
        Button(this.mDrcUnit)
          .id('btnDrcUnit')
          .width('90%')
          .onClick(() => {
            let drc = new DrawingRenderingContext(LengthMetricsUnit.DEFAULT);
            this.mDrcUnit = 'drc_unit:' + (drc !== null && drc !== undefined ? 'ok' : 'null');
          })
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
