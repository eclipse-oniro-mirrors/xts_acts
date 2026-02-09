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
import { FrameCallback } from '@ohos.arkui.UIContext';
import {
  Entry, Component,
  Column, ColumnOptions, Row,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint,
} from '@ohos.arkui.component'
import { State, LocalStorage, LocalStorageLink, SubscribedAbstractProperty } from '@ohos.arkui.stateManagement';

// let para: Record<string, string> = { 'message': 'init' }
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate<string>('message', 'init');

class IdleCallback extends FrameCallback {
  static str: string = 'init'
  link: SubscribedAbstractProperty<string> = storage!.link<string>('message')! as SubscribedAbstractProperty<string>

  constructor() {
    super()
  }

  onIdle(idleTimeInNano:long): void { //未执行
    console.log('++++++++++++++onIdle')
    this.link!.set('OnIdle')
  }
}

@Entry
@Component
struct onIdleTest {
  callback: IdleCallback = new IdleCallback();
  @State switch_: boolean = false;
  @LocalStorageLink('message') str: string = storage!.get<string>('message')!

  build() {
    Column() {
      Text(this.str)
        .id('OnIdleText')

      Button('idle callback')
        .id('OnIdle')
        .onClick((e:ClickEvent) => {
          this.switch_ = !this.switch_
          if (this.switch_) {
            console.log('++++++++++++++this.switch_',this.switch_)
            this.getUIContext().postFrameCallback(this.callback)
          }
          this.str = storage!.get<string>('message')!
        })
    }
  }
}