/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import testapi from 'libavrecorderndk.so';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info('TestAbility index aboutToAppear')
  }
  @State message: string = 'Hello World'
  private mXComponentController: XComponentController = new XComponentController();
  @State previewId: string = '';
  @State cameraDeviceIndex: number = 0;
  @State sceneMode: number = 2;
  @State focusMode: number = 2;
  @State photoId: string = '';
  @State videoId: string = '';
  @State xComponentWidth: number = 384;
  @State xComponentHeight: number = 450;

  build() {
    Column() {
      XComponent({
        id: 'componentId',
        type: XComponentType.SURFACE,
        controller: this.mXComponentController
      })
        .onLoad(async () => {
          this.previewId = this.mXComponentController.getXComponentSurfaceId();

          AppStorage.setOrCreate('testsurfaceId', this.previewId);
        })
        .backgroundColor(Color.Red)
        .width('100%')
        .height('40%')
      Flex({direction: FlexDirection.Row}) {
        Button('CreatePrepareSetConfig', { type: ButtonType.Circle, stateEffect: true })
          .id('CreatePrepareSetConfig')
          .backgroundColor(0xF55A42)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.createPrepareAVRecorder();
            hilog.info(0x0000, 'testTag', 'Prepare AVRecorder %{public}d', result);
            const prepareCameraResult = testapi.prepareCamera( this.previewId, 1920,1080);
            hilog.info(0x0000, 'testTag', 'Prepare AVRecorder %{public}d', prepareCameraResult);
          })
        Button('Start', { type: ButtonType.Circle, stateEffect: true })
          .id('Start')
          .backgroundColor(0xF55A42)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.startAVRecorder();
            hilog.info(0x0000, 'testTag', 'startAVRecorder %{public}d', result);
          })
        Button('Pause', { type: ButtonType.Circle, stateEffect: true })
          .id('Pause')
          .backgroundColor(0x4287F5)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.pauseAVRecorder();
            hilog.info(0x0000, 'testTag', 'pauseAVRecorder %{public}d', result);
          })
        Button('Resume', { type: ButtonType.Circle, stateEffect: true })
          .id('Resume')
          .backgroundColor(0x4287F5)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.resumeAVRecorder();
            hilog.info(0x0000, 'testTag', 'resumeAVRecorder %{public}d', result);
          })
      }
      Flex({direction: FlexDirection.Row}){
        Button('Stop', {type: ButtonType.Circle, stateEffect: true})
          .id('Stop')
          .backgroundColor(0xF55A42)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.stopAVRecorder();
            hilog.info(0x0000, 'testTag', 'stopAVRecorder %{public}d', result);
          })
        Button('Reset', {type: ButtonType.Circle, stateEffect: true})
          .id('Reset')
          .backgroundColor(0xF55A42)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.resetAVRecorder();
            hilog.info(0x0000, 'testTag', 'resetAVRecorder %{public}d', result);
          })
        Button('Release', {type: ButtonType.Circle, stateEffect: true})
          .id('Release')
          .backgroundColor(0x4287F5)
          .width(90)
          .height(90)
          .onClick(() => {
            const result = testapi.releaseAVRecorder();
            hilog.info(0x0000, 'testTag', 'releaseAVRecorder %{public}d', result);
          })
      }
    }
  }
}