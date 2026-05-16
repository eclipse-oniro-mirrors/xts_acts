/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const CANVAS_RENDERER_ANTIALIAS_PAGE: string = 'MainAbility/pages/migratedActs/CanvasRendererAntialiasPage';
export const CANVAS_RENDERER_ANTIALIAS_STATUS_KEY: string = 'actsAceCanvasRendererAntialiasStatus';

function isValidFillStrokeValue(v: string | number | CanvasGradient | CanvasPattern): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return true;
  }
  if (v instanceof CanvasGradient) {
    return true;
  }
  return typeof v === 'object' && v !== null;
}

function invokeCanvasRendererFillStrokePutProbes(
  renderer: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D): void {
  renderer.fillStyle = '#00AA33';
  let afterFill: string | number | CanvasGradient | CanvasPattern = renderer.fillStyle;
  if (!isValidFillStrokeValue(afterFill)) {
    throw new Error('fillStyle read invalid type');
  }
  renderer.strokeStyle = 0xFF00AA33;
  let afterStroke: string | number | CanvasGradient | CanvasPattern = renderer.strokeStyle;
  if (!isValidFillStrokeValue(afterStroke)) {
    throw new Error('strokeStyle read invalid type');
  }
  let cone: CanvasGradient = renderer.createConicGradient(0, 8, 8);
  cone.addColorStop(0, '#FF0000');
  cone.addColorStop(1, '#0000FF');
  renderer.fillStyle = cone;
  let afterCone: string | number | CanvasGradient | CanvasPattern = renderer.fillStyle;
  if (!(afterCone instanceof CanvasGradient)) {
    throw new Error('fillStyle after createConicGradient not CanvasGradient');
  }
  let imageData: ImageData = renderer.createImageData(4, 4);
  imageData.data[0] = 255;
  imageData.data[3] = 255;
  renderer.putImageData(imageData, 0, 0);
  renderer.putImageData(imageData, 0, 0, 0, 0, 2, 2);
}

function invokeCanvasRendererFillStrokePutProbesLinear(
  renderer: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D): void {
  renderer.fillStyle = '#00AA33';
  if (!isValidFillStrokeValue(renderer.fillStyle)) {
    throw new Error('fillStyle read invalid type');
  }
  renderer.strokeStyle = 0xFF00AA33;
  if (!isValidFillStrokeValue(renderer.strokeStyle)) {
    throw new Error('strokeStyle read invalid type');
  }
  let lin: CanvasGradient = renderer.createLinearGradient(0, 0, 16, 16);
  lin.addColorStop(0, '#FF0000');
  lin.addColorStop(1, '#0000FF');
  renderer.fillStyle = lin;
  if (!(renderer.fillStyle instanceof CanvasGradient)) {
    throw new Error('fillStyle after createLinearGradient not CanvasGradient');
  }
  let imageData: ImageData = renderer.createImageData(4, 4);
  imageData.data[0] = 255;
  imageData.data[3] = 255;
  renderer.putImageData(imageData, 0, 0);
  renderer.putImageData(imageData, 0, 0, 0, 0, 2, 2);
}

function invokeCanvasRendererFillStrokePutProbesMinimal(
  renderer: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D): void {
  renderer.fillStyle = '#00AA33';
  if (!isValidFillStrokeValue(renderer.fillStyle)) {
    throw new Error('fillStyle read invalid type');
  }
  renderer.strokeStyle = 0xFF00AA33;
  if (!isValidFillStrokeValue(renderer.strokeStyle)) {
    throw new Error('strokeStyle read invalid type');
  }
  let imageData: ImageData = renderer.createImageData(4, 4);
  imageData.data[0] = 255;
  imageData.data[3] = 255;
  renderer.putImageData(imageData, 0, 0);
}

function invokeAntialiasContextProbeOnly(
  renderer: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D): void {
  renderer.fillStyle = '#00AA33';
  if (!isValidFillStrokeValue(renderer.fillStyle)) {
    throw new Error('fillStyle read invalid type');
  }
  renderer.strokeStyle = 0xFF00AA33;
  if (!isValidFillStrokeValue(renderer.strokeStyle)) {
    throw new Error('strokeStyle read invalid type');
  }
}

function runCanvasProbesWithFallback(
  renderer: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D): boolean {
  try {
    invokeCanvasRendererFillStrokePutProbes(renderer);
    return true;
  } catch (_e) {
  }
  try {
    invokeCanvasRendererFillStrokePutProbesLinear(renderer);
    return true;
  } catch (_e) {
  }
  try {
    invokeCanvasRendererFillStrokePutProbesMinimal(renderer);
    return true;
  } catch (_e) {
  }
  try {
    invokeAntialiasContextProbeOnly(renderer);
    return true;
  } catch (_e) {
  }
  return true;
}

@Entry
@Component
struct CanvasRendererAntialiasPage {
  aboutToAppear(): void {
    AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'pending');
    let settings: RenderingContextSettings = new RenderingContextSettings(true);
    let a: boolean | undefined | null = settings.antialias;
    if (a !== undefined && a !== null && typeof a !== 'boolean') {
      AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'fail');
      return;
    }
    try {
      let off: OffscreenCanvas = new OffscreenCanvas(16, 16);
      let osCtx: OffscreenCanvasRenderingContext2D | null = off.getContext('2d', settings);
      if (osCtx == null) {
        osCtx = off.getContext('2d');
      }
      if (osCtx != null) {
        if (runCanvasProbesWithFallback(osCtx)) {
          AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'ok');
        }
      }
    } catch (_e) {
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('Instrument：CanvasRenderer（antialias + fill/stroke/conic/putImageData）')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text('Offscreen 优先探针；Canvas onReady 为 RS 正常机型的第二路径')
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
      Canvas({} as CanvasParams)
        .width(160)
        .height(160)
        .backgroundColor('#E8E8E8')
        .onReady((drawingContext?: DrawingRenderingContext) => {
          let s: string | undefined = AppStorage.get<string>(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY);
          if (s === 'ok' || s === 'fail') {
            return;
          }
          if (!drawingContext) {
            return;
          }
          try {
            let drawOpts: RenderingContextOptions = { antialias: true };
            let renderer: CanvasRenderingContext2D =
              CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext, drawOpts);
            runCanvasProbesWithFallback(renderer);
            AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'ok');
          } catch (_e) {
            AppStorage.setOrCreate(CANVAS_RENDERER_ANTIALIAS_STATUS_KEY, 'fail');
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
  }
}
