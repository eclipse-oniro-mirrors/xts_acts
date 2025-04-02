/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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


import { image } from '@kit.ImageKit';


@Concurrent
export function fillPixelMap(map: image.PixelMap, col: number, b: number, g: number, r: number): Promise<void> {

  let area: image.PositionArea = {
    pixels: new ArrayBuffer(4),
    offset: 0,
    stride: 16,
    region: { size: { height: 1, width: 1 }, x: col, y: 0 }
  }
  let buff = new Uint8Array(area.pixels);
  buff[0] = b;
  buff[1] = g;
  buff[2] = r;
  buff[3] = 255;

  let pv: Promise<void> = map.writePixels(area);
  return pv;
}

export function fillPixelMapSync(map: image.PixelMap, col: number, b: number, g: number, r: number): void {

  let area: image.PositionArea = {
    pixels: new ArrayBuffer(4),
    offset: 0,
    stride: 16,
    region: { size: { height: 1, width: 1 }, x: col, y: 0 }
  }
  let buff = new Uint8Array(area.pixels);
  buff[0] = b;
  buff[1] = g;
  buff[2] = r;
  buff[3] = 255;

  map.writePixelsSync(area);
}