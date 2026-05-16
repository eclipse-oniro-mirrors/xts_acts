/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  AtomicServiceWeb,
  AtomicServiceWebController,
  OnErrorReceiveEvent,
  OnHttpErrorReceiveEvent,
  OnPageBeginEvent,
  OnPageEndEvent,
  OnMessageEvent,
  OnLoadInterceptEvent,
  OnProgressChangeEvent
} from '@ohos.atomicservice.AtomicServiceWeb';

@Entry
@Component
struct AtomicServiceWebTest {
  @State darkMode: WebDarkMode = WebDarkMode.On;
  @State forceDarkAccess: boolean = true;
  @State mixedMode: MixedMode = MixedMode.None;
  @State controller: AtomicServiceWebController = new AtomicServiceWebController();
  @State num: number = 1;

  build() {
    Column() {
      Button('accessForward').onClick(() => {
        console.info(`AtomicServiceWebLog accessForward = ${this.controller.accessForward()}`);
      })
      Button('accessBackward').onClick(() => {
        console.info(`AtomicServiceWebLog accessBackward = ${this.controller.accessBackward()}`);
      })
      Button('accessStep').onClick(() => {
        console.info(`AtomicServiceWebLog accessStep = ${this.controller.accessStep(1)}`);
      })
      Button('forward').onClick(() => {
        console.info(`AtomicServiceWebLog forward = ${this.controller.forward()}`);
      })
      Button('backward').onClick(() => {
        console.info(`AtomicServiceWebLog backward = ${this.controller.backward()}`);
      })
      Button('refresh').onClick(() => {
        console.info(`AtomicServiceWebLog refresh = ${this.controller.refresh()}`);
      })
      Button('loadUrl').onClick(() => {
        console.info(`AtomicServiceWebLog loadUrl = ${this.controller.loadUrl('test')}`);
      })
      Button('深色模式').onClick(() => {
        this.forceDarkAccess = !this.forceDarkAccess;
      })
      Button('mixedMode').onClick(() => {
        this.mixedMode = this.mixedMode == MixedMode.None ? MixedMode.All : MixedMode.None;
      })
      Button('点击').onClick(() => {
        console.info(`AtomicServiceWebLog getUserAgent = ${this.controller.getUserAgent()}`);
        console.info(`AtomicServiceWebLog getCustomUserAgent = ${this.controller.getCustomUserAgent()}`);
        this.controller.setCustomUserAgent('test' + this.num++);

        console.info(`AtomicServiceWebLog getUserAgent after set = ${this.controller.getUserAgent()}`);
        console.info(`AtomicServiceWebLog getCustomUserAgent after set = ${this.controller.getCustomUserAgent()}`);
      })
      AtomicServiceWeb({
        src: 'test',
        mixedMode: this.mixedMode,
        darkMode: this.darkMode,
        forceDarkAccess: this.forceDarkAccess,
        controller: this.controller,
        onControllerAttached: () => {
          console.info('AtomicServiceWebLog onControllerAttached call back success');
        },
        onLoadIntercept: (event: OnLoadInterceptEvent) => {
          console.info('AtomicServiceWebLog onLoadIntercept call back success ' + JSON.stringify({
            getRequestUrl: event.data.getRequestUrl(),
            getRequestMethod: event.data.getRequestMethod(),
            getRequestHeader: event.data.getRequestHeader(),
            isRequestGesture: event.data.isRequestGesture(),
            isMainFrame: event.data.isMainFrame(),
            isRedirect: event.data.isRedirect(),
          }))
          return false;
        },
        onProgressChange: (event: OnProgressChangeEvent) => {
          console.info('AtomicServiceWebLog onProgressChange call back success ' + JSON.stringify(event));
        },
        onMessage: (event: OnMessageEvent) => {
          console.info('onMessage call back success ' + JSON.stringify(event));
        },
        onPageBegin: (event: OnPageBeginEvent) => {
          console.info('onPageBegin call back success ' + JSON.stringify(event));
        },
        onPageEnd: (event: OnPageEndEvent) => {
          console.info('onPageEnd call back success ' + JSON.stringify(event));
        },
        onHttpErrorReceive: (event: OnHttpErrorReceiveEvent) => {
          console.info('onHttpErrorReceive call back success ' + JSON.stringify(event));
        },
        onErrorReceive: (event: OnErrorReceiveEvent) => {
          console.info('onErrorReceive call back success ' + JSON.stringify(event));
        }
      })
    }
  }
}
