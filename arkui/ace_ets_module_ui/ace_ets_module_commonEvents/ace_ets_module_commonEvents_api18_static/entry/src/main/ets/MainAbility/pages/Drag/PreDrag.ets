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
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Image,
  Checkbox,
  ForEach,
  PreDragStatus,
  DragEvent,
  Margin,
  Button,
  DragItemInfo,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import dragController from '@ohos.arkui.dragController'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct PreDrag {
  @State flag: string = 'Init'
  build() {
    Column({ space: 50 } as ColumnOptions) {
      Column({ space: 10 } as ColumnOptions) {
        Image($r('app.media.icon'))
          .width('50%')
          .height('50%')
          .id('drag')
          .draggable(true)
          .onPreDrag((status: PreDragStatus): void => {
            if (status == PreDragStatus.PREPARING_FOR_DRAG_DETECTION) {
              this.flag = '350s'
            }
          })
          .onDragStart((event:DragEvent, extraParams?:String|undefined):DragItemInfo => {
            this.getUIContext().getDragController()
              .notifyDragStartRequest(dragController.DragStartRequestStatus.WAITING)
            return {} as DragItemInfo
          })
        Button(this.flag)
          .id('button')
      }.width('100%')
    }
  }
}