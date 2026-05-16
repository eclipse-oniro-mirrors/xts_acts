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
  Text,
  VerticalAlign,
  Video,
  VideoController,
  XComponent,
  XComponentController,
  XComponentParameters,
  XComponentType
} from '@ohos.arkui.component';
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';

let para: Record<string,string> = {
  'onSurfaceCreated': 'Init',
  'onSurfaceChanged': 'Init',
  'onSurfaceDestroyed': 'Init',
  } as Record<string,string>;
let storage: LocalStorage = new LocalStorage(para);


class CustomXComponentController extends XComponentController {
  onSurfaceCreated(surfaceId: string): void {
    console.log(`onSurfaceCreated surfaceId: ${surfaceId}`)
    AppStorage.setOrCreate<string>('onSurfaceCreated', 'onSurfaceCreated succ');
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    console.log(`onSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}`)
    AppStorage.setOrCreate<string>('onSurfaceChanged', 'onSurfaceChanged succ');
  }

  onSurfaceDestroyed(surfaceId: string): void {
    console.log(`onSurfaceDestroyed surfaceId: ${surfaceId}`)
    AppStorage.setOrCreate<string>('onSurfaceDestroyed', 'onSurfaceDestroyed succ');
  }
}

@Entry
@Component
struct onSurfaceCreated1 {
  xComponentController: XComponentController = new CustomXComponentController()
  @State xcWidth: string = "320px";
  @State xcHeight: string = "480px";
  @State createText: string = "Init";
  @State changeText: string = "Init";
  @State destroyText: string = "Init";
  @State flag: boolean = true

  onPageShow() {
    AppStorage.setOrCreate('onSurfaceCreated', 'Init');
    AppStorage.setOrCreate('onSurfaceChanged', 'Init');
    AppStorage.setOrCreate('onSurfaceDestroyed', 'Init');
  }

  build() {
    Column() {
      Text(this.createText).id('onSurfaceCreated_text')
        .onClick((e: ClickEvent) => {
          this.createText = AppStorage.get<string>('onSurfaceCreated')!
        })
      Text(this.changeText).id('onSurfaceChanged_text')
        .onClick((e: ClickEvent) => {
          this.changeText = AppStorage.get<string>('onSurfaceChanged')!
        })
      Text(this.destroyText).id('onSurfaceDestroyed_text')
        .onClick((e: ClickEvent) => {
          this.destroyText = AppStorage.get<string>('onSurfaceDestroyed')!
        })
      Button("change size").id('onSurfaceChanged_button')
        .onClick((e: ClickEvent) => {
          this.xcWidth = "640px"
          this.xcHeight = "960px"
        })
      Button("Destroyed").id('onSurfaceDestroyed_button')
        .onClick((e: ClickEvent) => {
          this.flag = false
        })
      if (this.flag) {
        XComponent({
          id: 'xcomponent_onSurface',
          type: XComponentType.TEXTURE,
          nativeXComponentHandler: ((value0: long): void => {
          }),
          controller: this.xComponentController
        } as XComponentParameters)
          .width(this.xcWidth)
          .height(this.xcHeight)
      }
    }
    .width("100%")
  }
}