/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { componentUtils } from '@kit.ArkUI';
import { AVPlayer } from '../player/AVPlayer';

class MyXComponentController extends XComponentController {
  onSurfaceCreated(surfaceId: string): void {
    console.log(`onSurfaceCreated surfaceId: ${surfaceId}`);
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    console.log(`onSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}}`);
  }

  onSurfaceDestroyed(surfaceId: string): void {
    console.log(`onSurfaceDestroyed surfaceId: ${surfaceId}`);
  }
}

@Entry
@Component
struct XComponentHDRBrightnessPage {
  @State currentStatus: string = 'index';
  xComponentController: XComponentController = new MyXComponentController();
  xComponentController2: XComponentController = new MyXComponentController();
  @State xc_hdrBrightness: Array<number | null | undefined> = [0.0, 0.5, 1.0, -0.5, 1.5, null, undefined]
  @State xc_hdrBrightness_index: number = 0
  @State hdrBrightness_value: string = ''
  player?: AVPlayer;
  surfaceId = '';

  aboutToDisappear(): void {
    console.error('[jyy] aboutToDisappear');
    this.player?.stop();
    this.player = undefined;
  }

  build() {
    Column() {
      Text(this.hdrBrightness_value).id('xcomponent_hdrBrightness_value')

      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      }).onLoad(()=>{
        this.surfaceId = this.xComponentController.getXComponentSurfaceId();
        this.player = new AVPlayer(this.surfaceId);
        this.player.init()
      })
        .id('hdrBrightness_xcomponent')
        .height('50%')
        .width('90%')
        .hdrBrightness(this.xc_hdrBrightness[this.xc_hdrBrightness_index])

      Button('set hdrBrightness: ' + this.xc_hdrBrightness[this.xc_hdrBrightness_index])
        .onClick(() => {
          this.xc_hdrBrightness_index = (this.xc_hdrBrightness_index + 1) % this.xc_hdrBrightness.length
        })
        .id('hdrBrightness_bth')
    }
    .width('100%')
    .height('100%')
  }
}