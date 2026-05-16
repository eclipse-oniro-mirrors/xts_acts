/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export class AttrsManager {
  callBack;

  static change(caseName, setValue) {
    let eventData = { data: { src: JSON.stringify({ value: setValue }) } }
    this.emitEvent(caseName, Constants.EVENT_ID_CHANGE_DATA, eventData);
  }

  registerDataChange(callBack) {
    this.callBack = callBack
    this.onEvent(Constants.EVENT_ID_CHANGE_DATA);
  }

  static unRegisterDataChange() {
    events_emitter.off(Constants.EVENT_ID_CHANGE_DATA);
  }

  private onEvent(eventId: number) {
    let stateChangeEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.off(eventId);
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private static emitEvent(tag, eventId, eventData) {
    let innerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    console.info(tag + ' start to publish emit');
    events_emitter.emit(innerEvent, eventData);
  }

  private stateChangCallBack = (eventData) => {
    console.info('[stateChangCallBack] stateChangCallBack ');
    if (eventData != null) {
      console.info('[stateChangCallBack] state change called: ' + JSON.stringify(eventData));
      if (eventData.data.src != null) {
        let src = JSON.parse(eventData.data.src);
        this.callBack(src.value);
      }
    }
  }
}

let attrsManager = new AttrsManager();

export default attrsManager as AttrsManager;