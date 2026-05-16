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
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroll,
  GestureEvent,
  LongPressGesture,
  TapGesture,
  ClickEvent,
  FlexAlign,
  GestureInfo,
  BaseGestureEvent,
  DragEvent,
  GestureControl,
  GestureJudgeResult
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct getModifierKeyState1 {
  @State baseEventState: boolean = false;
  @State DragEventState: boolean = true;

  build() {
    Column() {
      Button("" + this.baseEventState).id("getModifierKeyState_BaseEvent")
        .onClick((event:ClickEvent)=>{
          this.baseEventState = event.getModifierKeyState?.(["getModifierKeyState_BaseEvent"]) as boolean || false
        })
      Button("" + this.DragEventState).id("getModifierKeyState_DragEvent")
        .onDragStart((event:DragEvent, extraParams?:String|undefined):DragItemInfo => {
          this.DragEventState = event.getModifierKeyState?.(["getModifierKeyState_DragEvent"]) as boolean || false
          return {} as DragItemInfo
        })
    }
  }
}