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

'use static';

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  Text,
  TextInput,
  FontWeight,
  CancelButtonStyle
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { UIObserver } from '@ohos.arkui.UIContext';
import type observer from '@ohos.arkui.observer';

@Entry
@Component
struct OhosArkuiObserverPage {
  @State globalOutput: string = '';
  @State globalEventId: string = '';
  @State globalEventUnique: string = '';
  @State localOutput: string = '';
  @State localEventId: string = '';
  @State localEventUnique: string = '';
  /** 与 offTextChange 配合：若底层未注销回调，仍忽略关闭后的文本变更 */
  private localTextObserverEnabled: boolean = false;

  private getObs(): UIObserver {
    return this.getUIContext().getUIObserver();
  }

  build() {
    Row() {
      Column() {
        Text('global:' + this.globalOutput)
          .id('globalOutputTextInput')
          .fontSize(24)
          .width('80%')
          .height('5%')
        Text('id:' + this.globalEventId)
          .id('observer_global_TextChangeEventInfo_id')
          .fontSize(14)
          .width('80%')
          .height('3%')
        Text('uid:' + this.globalEventUnique)
          .id('observer_global_TextChangeEventInfo_uniqueId')
          .fontSize(14)
          .width('80%')
          .height('3%')
        Text('local:' + this.localOutput)
          .id('localOutputTextInput')
          .fontSize(24)
          .width('80%')
          .height('5%')
        Text('id:' + this.localEventId)
          .id('observer_local_TextChangeEventInfo_id')
          .fontSize(14)
          .width('80%')
          .height('3%')
        Text('uid:' + this.localEventUnique)
          .id('observer_local_TextChangeEventInfo_uniqueId')
          .fontSize(14)
          .width('80%')
          .height('3%')
        Text('监听textChange开关按钮').fontSize(18).fontWeight(FontWeight.Bold).height('6%')
        Row() {
          Button('全局监听(开)')
            .id('全局监听(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick((): void => {
              this.getObs().onTextChange((info: observer.TextChangeEventInfo): void => {
                console.info(
                  '[TEST INFO] [uiObserver] [textChange] [global] [id: ' +
                    JSON.stringify(info.id) +
                    '] [uniqueId: ' +
                    JSON.stringify(info.uniqueId) +
                    '] [content: ' +
                    JSON.stringify(info.content) +
                    ']'
                );
                this.globalOutput = info.content;
                this.globalEventId = info.id;
                this.globalEventUnique = String(info.uniqueId);
              });
            })
          Button('全局监听(关)')
            .id('全局监听(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick((): void => {
              this.getObs().offTextChange();
            })
        }
        .height('7%')
        Row() {
          Button('局部Input(开)')
            .id('局部textInput(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick((): void => {
              const opt: observer.ObserverOptions = { id: 'textInput' };
              this.localTextObserverEnabled = true;
              this.getObs().onTextChange(opt, (info: observer.TextChangeEventInfo): void => {
                if (!this.localTextObserverEnabled) {
                  return;
                }
                console.info(
                  '[TEST INFO] [uiObserver] [textChange] [TextInput] [id: ' +
                    JSON.stringify(info.id) +
                    '] [uniqueId: ' +
                    JSON.stringify(info.uniqueId) +
                    '] [content: ' +
                    JSON.stringify(info.content) +
                    ']'
                );
                this.localOutput = info.content;
                this.localEventId = info.id;
                this.localEventUnique = String(info.uniqueId);
              });
            })
          Button('局部Input(关)')
            .id('局部textInput(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick((): void => {
              this.localTextObserverEnabled = false;
              const opt: observer.ObserverOptions = { id: 'textInput' };
              this.getObs().offTextChange(opt);
            })
        }
        .height('7%')
        Text('TextInput').height('5%')
        TextInput({ text: '' })
          .id('textInput')
          .width('80%')
          .height('15%')
          .cancelButton({ style: CancelButtonStyle.CONSTANT })
          .margin({ bottom: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
