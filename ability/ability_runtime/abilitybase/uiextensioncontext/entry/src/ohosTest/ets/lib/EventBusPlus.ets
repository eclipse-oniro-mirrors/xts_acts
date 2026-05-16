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
import hilog from '@ohos.hilog';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'EventBusPlus';
const DOMAIN = 0x0000;
type Event = (data: commonEventManager.CommonEventData) => void;

class EventBusPlus {
  private eventMap: Map<string, Event> = new Map<string, Event>();
  /*
   * The method handles low-level event subscription with timeout control and automatic unsubscribe logic.
   * key: Event name to subscribe to.
   * timeout: Skip the current event reception once the timeout expires.
   */
  private onEvent(key: string, timeout: number): void {
    try {
      let lock: boolean = false;
      let timeoutId: number = -1;
      const subscriber: commonEventManager.CommonEventSubscriber =
        commonEventManager.createSubscriberSync({ events: [key] });

      const handleUnsubscribe = (
        err: BusinessError<void> | null,
        data: commonEventManager.CommonEventData,
        eventKey: string
      ): void => {
        hilog.info(DOMAIN, TAG, `onEvent unsubscribe ${JSON.stringify(err)}`);
        if (err?.code) {
          return;
        };
        const event: Event = this.eventMap.get(eventKey) as Event;
        event(data);
      };

      const cb = (err: BusinessError<void> | null, data: commonEventManager.CommonEventData): void => {
        if (lock) {
          return;
        };
        lock = true;
        clearTimeout(timeoutId);

        hilog.info(DOMAIN, TAG, `onEvent error code: ${err?.code}, msg: ${err?.message}`);
        if (err?.code) {
          return;
        };

        commonEventManager.unsubscribe(subscriber, (unsubErr: BusinessError<void> | null) => {
          handleUnsubscribe(unsubErr, data, key);
        });
      };

      commonEventManager.subscribe(subscriber, cb);
      timeoutId = setTimeout(() => {
        cb(null, { event: key });
      }, timeout);
    } catch (e) {
      let err: BusinessError = e as BusinessError;
    };
  }
  /*
  * The method waits for an event and continues execution after the timeout period expires.
  * event: Event name.
  * timeout: Skip the current event reception once the timeout expires.
  */
  onWait(key: string, timeout: number = 2000): Promise<commonEventManager.CommonEventData> {
    return new Promise<commonEventManager.CommonEventData>((resolve, reject) => {
      const event: Event = (data: commonEventManager.CommonEventData) => {
        resolve(data);
      };
      this.eventMap.set(key, event);
      this.onEvent(key, timeout);
    });
  };
  /*
  * Emit an event.
  * event: Event name.
  */
  emit(event: string): Promise<void> {
    return new Promise((resolve, reject) => {
      hilog.info(DOMAIN, TAG, `emit event: ${event}`);

      const callback = (err: BusinessError | null): void => {
        if (err?.code) {
          hilog.info(DOMAIN, TAG, `emit ${event} error code: ${err?.code}, msg: ${err?.message}`);
          reject(err);
        } else {
          hilog.info(DOMAIN, TAG, `emit ${event} success`);
          resolve();
        }
      };

      try {
        commonEventManager.publish(event, callback);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        hilog.info(DOMAIN, TAG, `emit ${event} fail. error code: ${err?.code}, msg: ${err?.message}`);
        reject(err);
      };
    });
  };
  /*
  * Emit an event carrying message data.
  * event: Event name.
  * data： message data.
  */
  emitWithData(event: string, data: commonEventManager.CommonEventData): Promise<void> {
    return new Promise((resolve, reject) => {
      hilog.info(DOMAIN, TAG, `emitWithData event: ${event}`);

      const callback = (err: BusinessError | null): void => {
        if (err?.code) {
          hilog.info(DOMAIN, TAG, `emitWithData ${event} error code: ${err?.code}, msg: ${err?.message}`);
          reject(err);
        } else {
          hilog.info(DOMAIN, TAG, `emitWithData ${event} success`);
          resolve();
        }
      };

      try {
        commonEventManager.publish(event, data, callback);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        hilog.info(DOMAIN, TAG, `emitWithData ${event} fail. error code: ${err?.code}, msg: ${err?.message}`);
        reject(err);
      }
    });
  }
}

export default new EventBusPlus();