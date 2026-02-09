'use static';
/**
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
// import worker from '@ohos.worker';
import {
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  HorizontalAlign,
  RouteType,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct WorkerUseCurves {
  content: string = 'texttext';
  @State result: string = '111';

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.result).id('workTextId')
      Button('Click').id('workClickId')
      //   .onClick((e: ClickEvent) => {
      //   const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/worker.ets');
      //   workerInstance.onmessage = (event: MessageEvents): void | undefined => {
      //     this.result = e.data;
      //   }
      //   workerInstance.postMessage(this.content);
      // })
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}