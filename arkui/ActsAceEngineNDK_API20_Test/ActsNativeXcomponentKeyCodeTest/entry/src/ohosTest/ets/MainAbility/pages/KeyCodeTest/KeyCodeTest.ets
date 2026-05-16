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
import nativexcomopnentkeycode from 'libnativexcomopnentkeycode.so';
import { NodeContent } from '@kit.ArkUI';
import { IntentionCode } from '@kit.InputKit';

@Entry
@Component
struct KeyCodeTest {
  private nodeContent: NodeContent = new NodeContent();
  aboutToAppear():void{
    // 通过C-API创建节点，并添加到管理器nodeContent上
    if (nativexcomopnentkeycode) {
      nativexcomopnentkeycode.XComponentCreate(this.nodeContent);
    }
  }

  onBackPress(): boolean | void {
    return true
  }

  build() {
    Column() {
      ContentSlot(this.nodeContent);
      Button('sendKeyEvent')
        .onClick(() => {
          let keyEvent: KeyEvent = {
            type: KeyType.Down,
            keyCode: globalThis.keyCode,
            keyText: 'key',
            keySource: 2,
            deviceId: 0,
            metaKey: 0,
            timestamp: 0,
            stopPropagation: () => {
            },
            intentionCode: IntentionCode.INTENTION_UNKNOWN
          };
          sendKeyEvent(keyEvent); // 发送按键事件
        })
        .id('send')
    }
    .width('100%')
    .height('100%')
  }
}