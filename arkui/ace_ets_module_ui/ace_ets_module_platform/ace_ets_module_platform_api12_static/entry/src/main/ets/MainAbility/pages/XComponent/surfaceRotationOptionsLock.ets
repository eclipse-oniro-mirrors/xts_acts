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
import { Entry,Column,Component,Position,Button,FlexAlign,FlexDirection,ItemAlign,Flex,SurfaceRotationOptions,ImageAnalyzerConfig,XComponentParameters,XComponentType,VideoController,XComponent,XComponentController,SurfaceRect,ImageFit,Video,VerticalAlign,ImageAnalyzerType,ColumnOptions,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SurfaceRotationOptionsLock{
  @State isLock: boolean = true;
  @State xc_width: number = 500;
  @State xc_height: number = 700;
  @State flagLock: string = "Init";
  myXComponentController: XComponentController = new XComponentController();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      XComponent({
        id: 'xComponentId',
        type: XComponentType.SURFACE,
        //libraryname: 'nativerender',
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.myXComponentController
      } as XComponentParameters)
        .width(this.xc_width)
        .height(this.xc_height)
        .onLoad((): void => {
          let surfaceRotation: SurfaceRotationOptions = { lock: this.isLock };
          this.myXComponentController.setXComponentSurfaceRotation(surfaceRotation);
          console.log("Surface getXComponentSurfaceRotation lock = " +
          this.myXComponentController.getXComponentSurfaceRotation().lock);
          this.flagLock = 'Lock:' + this.myXComponentController.getXComponentSurfaceRotation().lock
        })
      Button(this.flagLock).id("SurfaceRotationOptionsLock")
    }
    .width('100%')
    .height('100%')
  }
}