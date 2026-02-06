'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  $r,
  $rawfile,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FlexAlign,
  ImageAnalyzerType,
  ImageFit,
  PlaybackSpeed,
  Position,
  Resource,
  Row,
  SeekMode,
  SurfaceRect,
  SurfaceRotationOptions,
  Text,
  VerticalAlign,
  Video,
  VideoController,
  XComponent,
  XComponentController,
  XComponentParameters,
  XComponentType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SetXComponentSurfaceRotation1 {
  xComponentController: XComponentController = new XComponentController()
  @State SurfaceRotation: Required<SurfaceRotationOptions> | null = null
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {} as Record<string, () => void>

  build() {
    Column() {
      Text(JSON.stringify(this.SurfaceRotation)).id("setXComponentSurfaceRotation_text")
        .fontSize(12)
      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        nativeXComponentHandler: ((value0: long): void => {
        }),
        controller: this.xComponentController
      } as XComponentParameters)
        .onLoad((): void => {
          this.SurfaceRotation = { lock: false }
          this.xComponentController.setXComponentSurfaceRotation(this.SurfaceRotation as SurfaceRotationOptions)
          this.SurfaceRotation = this.xComponentController.getXComponentSurfaceRotation()

          let a: Required<SurfaceRotationOptions> = { lock: false }
          console.log("===================================== " + JSON.stringify(a));
          console.log("===================================== " + a);
          console.log("===================================== " + a!.lock);

        })
        .width('640px')
        .height('480px')
    }
    .position({ x: 0, y: 48 } as Position)
  }
}