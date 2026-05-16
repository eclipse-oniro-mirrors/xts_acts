'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Constants } from '../../constants/Constants';
import events_emitter from '@ohos.events.emitter';
import { TextCase, TextDecorationType, Resource, AlignRuleOption } from '@ohos.arkui.component';
import {Leave,Enter} from './Utils'
import { RecordData } from '@ohos.base';
export interface Message {
  value: Leave | Enter
}

interface EventMessage {
  src: Message
}

export type Callback = (message: Leave | Enter) => void;

export class AttrsManager {
  callBack?: Callback = undefined;

  static change(caseName: string, setValue: Leave | Enter) {
    const message: Message = { value: setValue };

    const eventData: events_emitter.EventData = {
      data: {
        'src': message
      } as Record<String,RecordData>
    };
    AttrsManager.emitEvent(caseName, Constants.EVENT_ID_CHANGE_DATA, eventData);
  }

  registerDataChange(callBack: Callback) {
    this.callBack = callBack
    this.onEvent(Constants.EVENT_ID_CHANGE_DATA);
  }

  static unRegisterDataChange() {
    events_emitter.off(Constants.EVENT_ID_CHANGE_DATA);
  }

  private onEvent(eventId: int) {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.off(eventId);
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private static emitEvent(tag: string, eventId: int, eventData: events_emitter.EventData) {
    let innerEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    console.info(tag + ' start to publish emit');
    events_emitter.emit(innerEvent, eventData);
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info('[stateChangCallBack] stateChangCallBack ');
    if (eventData != null && eventData.data != null) {
      console.info('[stateChangCallBack] state change called: ' + JSON.stringify(eventData));
      const eventMessage = eventData.data as EventMessage | undefined;
      if (eventMessage?.src && this.callBack != undefined) {
        try {
          const message = eventMessage?.src as Message | null;
          if (message && message?.value) {
            this.callBack!(message!.value!)
          }
        } catch (e: Error) {
          console.error("fail :", e);
        }
      }
    }
  }
}

export let attrsManager = new AttrsManager();