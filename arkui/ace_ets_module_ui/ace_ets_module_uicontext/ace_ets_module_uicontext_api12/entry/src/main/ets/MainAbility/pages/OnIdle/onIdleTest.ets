/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

let para: Record<string, string> = { 'message': 'init' }
let storage: LocalStorage = new LocalStorage(para);

class IdleCallback extends FrameCallback {
  static str: string = 'init'
  link: SubscribedAbstractProperty<string> = storage.link('message')

  constructor() {
    super()
  }

  onIdle(idleTimeInNano: number): void {
    this.link.set('OnIdle')
  }
}

@Entry
@Component
struct onIdleTest {
  callback: IdleCallback = new IdleCallback();
  @State switch: boolean = false
  @LocalStorageLink('message') str: string | undefined = storage.get('message')

  build() {
    Column() {
      Text(this.str)
        .id('OnIdleText')

      Button('idle callback')
        .id('OnIdle')
        .onClick(() => {
          this.switch = !this.switch
          if (this.switch) {
            (this.getUIContext().postFrameCallback(this.callback))
          }
          this.str = storage.get('message')
        })
    }
  }
}