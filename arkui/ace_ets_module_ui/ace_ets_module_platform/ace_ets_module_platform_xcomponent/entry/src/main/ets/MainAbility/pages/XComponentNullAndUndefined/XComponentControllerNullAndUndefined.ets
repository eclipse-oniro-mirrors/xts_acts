/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

class TestXComponentController extends XComponentController {
  public lastSurfaceId: string = '';
  public lastRect: SurfaceRect | null = null;
  public onSurfaceCreatedCalled: boolean = false;
  public onSurfaceChangedCalled: boolean = false;
  public onSurfaceDestroyedCalled: boolean = false;

  onSurfaceCreated(surfaceId: string): void {
    this.lastSurfaceId = surfaceId;
    this.onSurfaceCreatedCalled = true;
    console.info(`[TestXComponentController] onSurfaceCreated surfaceId: ${surfaceId}`);
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    this.lastSurfaceId = surfaceId;
    this.lastRect = rect;
    this.onSurfaceChangedCalled = true;
    console.info(`[TestXComponentController] onSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}`);
  }

  onSurfaceDestroyed(surfaceId: string): void {
    this.lastSurfaceId = surfaceId;
    this.onSurfaceDestroyedCalled = true;
    console.info(`[TestXComponentController] onSurfaceDestroyed surfaceId: ${surfaceId}`);
  }

  resetState(): void {
    this.lastSurfaceId = '';
    this.lastRect = null;
    this.onSurfaceCreatedCalled = false;
    this.onSurfaceChangedCalled = false;
    this.onSurfaceDestroyedCalled = false;
  }
}

@Entry
@Component
struct XComponentControllerNullAndUndefined {
  @State resultText: string = 'Init';
  @State surfaceLoaded: boolean = false;
  xComponentController: TestXComponentController = new TestXComponentController();

  build() {
    Column() {
      Text('XComponentController Null/Undefined Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText')
        .width('90%')
        .height('5%')

      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      })
        .id('xcomponent')
        .width('100%')
        .height('10%')
        .onLoad(() => {
          this.surfaceLoaded = true;
          this.resultText = 'XComponent loaded';
          console.info('[XComponentController] onLoad called');
        })

      Scroll() {
        Column() {
          Text('setXComponentSurfaceSize Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('setSurfaceSize null')
            .id('btnSetSurfaceSizeNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceSize(null as ESObject);
                this.resultText = 'setSurfaceSize null called';
              } catch (err) {
                this.resultText = 'setSurfaceSize null error: ' + ((err as Error).message);
              }
            })

          Button('setSurfaceSize undefined')
            .id('btnSetSurfaceSizeUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceSize(undefined as ESObject);
                this.resultText = 'setSurfaceSize undefined called';
              } catch (err) {
                this.resultText = 'setSurfaceSize undefined error: ' + ((err as Error).message);
              }
            })

          Text('setXComponentSurfaceRect Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('setSurfaceRect null')
            .id('btnSetSurfaceRectNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceRect(null as ESObject);
                this.resultText = 'setSurfaceRect null called';
              } catch (err) {
                this.resultText = 'setSurfaceRect null error: ' + ((err as Error).message);
              }
            })

          Button('setSurfaceRect undefined')
            .id('btnSetSurfaceRectUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceRect(undefined as ESObject);
                this.resultText = 'setSurfaceRect undefined called';
              } catch (err) {
                this.resultText = 'setSurfaceRect undefined error: ' + ((err as Error).message);
              }
            })

          Button('getSurfaceRect')
            .id('btnGetSurfaceRect')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                let rect = this.xComponentController.getXComponentSurfaceRect();
                this.resultText =
                  `getSurfaceRect: offsetX=${rect.offsetX}, offsetY=${rect.offsetY}, width=${rect.surfaceWidth}, height=${rect.surfaceHeight}`;
              } catch (err) {
                this.resultText = 'getSurfaceRect error: ' + ((err as Error).message);
              }
            })

          Text('setXComponentSurfaceRotation Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('setSurfaceRotation lock true')
            .id('btnSetSurfaceRotationLockTrue')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceRotation({ lock: true });
                this.resultText = 'setSurfaceRotation lock true called';
              } catch (err) {
                this.resultText = 'setSurfaceRotation lock true error: ' + ((err as Error).message);
              }
            })

          Button('setSurfaceRotation null')
            .id('btnSetSurfaceRotationNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceRotation(null as ESObject);
                this.resultText = 'setSurfaceRotation null called';
              } catch (err) {
                this.resultText = 'setSurfaceRotation null error: ' + ((err as Error).message);
              }
            })

          Button('setSurfaceRotation undefined')
            .id('btnSetSurfaceRotationUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceRotation(undefined as ESObject);
                this.resultText = 'setSurfaceRotation undefined called';
              } catch (err) {
                this.resultText = 'setSurfaceRotation undefined error: ' + ((err as Error).message);
              }
            })

          Text('Callback Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('Check onSurfaceCreated')
            .id('btnCheckOnSurfaceCreated')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceCreatedCalled) {
                this.resultText = `onSurfaceCreated called, surfaceId: ${this.xComponentController.lastSurfaceId}`;
              } else {
                this.resultText = 'onSurfaceCreated not called yet';
              }
            })
          Button('Check onSurfaceCreated')
            .id('kongOnSurfaceCreated')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceCreatedCalled) {
                this.resultText = `onSurfaceCreated called, surfaceId: ''`;
              } else {
                this.resultText = 'onSurfaceCreated not called yet';
              }
            })

          Button('kongOnSurfaceChanged')
            .id('kongOnSurfaceChanged')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceChangedCalled) {
                let rectInfo = this.xComponentController.lastRect ?
                  JSON.stringify(this.xComponentController.lastRect) : 'null';
                this.resultText = `onSurfaceChanged called, surfaceId:'',rect: ${rectInfo}`;
              } else {
                this.resultText = 'onSurfaceChanged not called yet';
              }
            })

          Button('kongOnSurfaceDestroyed')
            .id('kongOnSurfaceDestroyed')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceDestroyedCalled) {
                this.resultText = `onSurfaceDestroyed called, surfaceId: ''`;
              } else {
                this.resultText = 'onSurfaceDestroyed not called yet';
              }
            })

          Button('Check onSurfaceChanged')
            .id('btnCheckOnSurfaceChanged')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceChangedCalled) {
                let rectInfo = this.xComponentController.lastRect ?
                  JSON.stringify(this.xComponentController.lastRect) : 'null';
                this.resultText = `onSurfaceChanged called, rect: ${rectInfo}`;
              } else {
                this.resultText = 'onSurfaceChanged not called yet';
              }
            })

          Button('Check onSurfaceDestroyed')
            .id('btnCheckOnSurfaceDestroyed')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              if (this.xComponentController.onSurfaceDestroyedCalled) {
                this.resultText = `onSurfaceDestroyed called, surfaceId: ${this.xComponentController.lastSurfaceId}`;
              } else {
                this.resultText = 'onSurfaceDestroyed not called yet';
              }
            })

          Text('startImageAnalyzer Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('startImageAnalyzer null')
            .id('btnStartImageAnalyzerNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(async () => {
              try {
                await this.xComponentController.startImageAnalyzer(null as ESObject);
                this.resultText = 'startImageAnalyzer null success';
              } catch (err) {
                this.resultText = 'startImageAnalyzer null error: ' + ((err as Error).message);
              }
            })

          Button('startImageAnalyzer undefined')
            .id('btnStartImageAnalyzerUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(async () => {
              try {
                await this.xComponentController.startImageAnalyzer(undefined as ESObject);
                this.resultText = 'startImageAnalyzer undefined success';
              } catch (err) {
                this.resultText = 'startImageAnalyzer undefined error: ' + ((err as Error).message);
              }
            })

          Text('unlockCanvasAndPost Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('unlockCanvasAndPost null')
            .id('btnUnlockCanvasNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.unlockCanvasAndPost(null as ESObject);
                this.resultText = 'unlockCanvasAndPost null called';
              } catch (err) {
                this.resultText = 'unlockCanvasAndPost null error: ' + ((err as Error).message);
              }
            })

          Button('unlockCanvasAndPost undefined')
            .id('btnUnlockCanvasUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.unlockCanvasAndPost(undefined as ESObject);
                this.resultText = 'unlockCanvasAndPost undefined called';
              } catch (err) {
                this.resultText = 'unlockCanvasAndPost undefined error: ' + ((err as Error).message);
              }
            })

          Text('setXComponentSurfaceConfig Tests')
            .fontWeight(FontWeight.Bold)
            .margin({ top: '1%', bottom: '1%' })

          Button('setSurfaceConfig null')
            .id('btnSetSurfaceConfigNull')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceConfig(null as ESObject);
                this.resultText = 'setSurfaceConfig null called';
              } catch (err) {
                this.resultText = 'setSurfaceConfig null error: ' + ((err as Error).message);
              }
            })

          Button('setSurfaceConfig undefined')
            .id('btnSetSurfaceConfigUndefined')
            .width('45%')
            .margin({ bottom: '1%' })
            .onClick(() => {
              try {
                this.xComponentController.setXComponentSurfaceConfig(undefined as ESObject);
                this.resultText = 'setSurfaceConfig undefined called';
              } catch (err) {
                this.resultText = 'setSurfaceConfig undefined error: ' + ((err as Error).message);
              }
            })
        }
      }
      .width('100%')
      .height('60%')
    }
    .width('100%')
    .height('100%')
  }
}
