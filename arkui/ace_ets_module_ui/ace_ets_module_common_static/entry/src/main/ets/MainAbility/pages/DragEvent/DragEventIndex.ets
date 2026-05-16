'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { Entry, Component, Column, Text, DragEvent, DragItemInfo } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DragEventIndex {
  @State getDisplayIdStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('DragEventIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('drag_target')
        .id('dragEventTarget')
        .width('100%')
        .height('40%')
        .backgroundColor('#3300FF00')
        .margin({ top: '3%' })
        .allowDrop(['text/plain'])
        .onDrop((event: DragEvent) => {
          try {
            let displayId: number = event.getDisplayId();
            this.getDisplayIdStatus = displayId >= 0 ? 'getDisplayId_ok' : 'getDisplayId_fail';
          } catch (error) {
            this.getDisplayIdStatus = 'getDisplayId_fail';
          }
        });
      Text('drag_source')
        .id('dragEventSource')
        .width('100%')
        .height('20%')
        .backgroundColor('#33FF0000')
        .draggable(true)
        .onDragStart((event: DragEvent): DragItemInfo => {
          let _evt = event;
          return { extraInfo: 'dragEventTest' };
        });

      Text(this.getDisplayIdStatus).key('dragEventGetDisplayIdStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
