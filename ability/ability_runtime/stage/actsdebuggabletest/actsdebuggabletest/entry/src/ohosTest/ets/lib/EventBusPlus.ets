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

class EventBusPlus {
  onWait(event: string, timeout: number = 2000): Promise<commonEventManager.CommonEventData> {
    return new Promise((resolve, reject) => {
      hilog.info(DOMAIN, TAG, `onWait event: ${event}`);
      try {
        let lock: boolean = false;
        let timeoutId: number = -1;

        const subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync({ events: [ event ] });
        const cb = (err: BusinessError|null, data: commonEventManager.CommonEventData) => {
          if (lock) {
            return;
          }
          lock = true;

          clearTimeout(timeoutId);

          if (err?.code) {
            hilog.info(DOMAIN, TAG, `onWait ${event} error code: ${err?.code}, msg: ${err?.message}`);
            reject(err);
          } else {
            commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
              if (err?.code) {
                hilog.info(DOMAIN, TAG, `onWait unsubscribe error code: ${err?.code}, msg: ${err?.message}`);
                reject(err);
              } else {
                hilog.info(DOMAIN, TAG, `onWait ${event} success`);
                resolve(data);
              }
            });
          }
        };
        commonEventManager.subscribe(subscriber, cb);

        timeoutId = setTimeout(() => {
          if (!lock) {
            hilog.info(DOMAIN, TAG, `onWait timeout trigger`);
            cb(null, { event });
          }
        }, timeout);
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        hilog.info(DOMAIN, TAG, `onWait ${event} fail. error code: ${err?.code}, msg: ${err?.message}`);
        reject(err);
      }
    })
  }

  emit(event: string): Promise<void> {
    return new Promise((resolve, reject) => {
      hilog.info(DOMAIN, TAG, `emit event: ${event}`);
      try {
        commonEventManager.publish(event, (err: BusinessError) => {
          if (err?.code) {
            hilog.info(DOMAIN, TAG, `emit ${event} error code: ${err?.code}, msg: ${err?.message}`);
            reject(err);
          } else {
            hilog.info(DOMAIN, TAG, `emit ${event} success`);
            resolve();
          }
        });
      } catch(e) {
        let err: BusinessError = e as BusinessError;
        hilog.info(DOMAIN, TAG, `emit ${event} fail. error code: ${err?.code}, msg: ${err?.message}`);
        reject(err);
      }
    })
  }

  emitWithData(event: string, data: commonEventManager.CommonEventData): Promise<void> {
    return new Promise((resolve, reject) => {
      hilog.info(DOMAIN, TAG, `emitWithData event: ${event}`);
      try {
        commonEventManager.publish(event, data, (err: BusinessError) => {
          if (err?.code) {
            hilog.info(DOMAIN, TAG, `emitWithData ${event} error code: ${err?.code}, msg: ${err?.message}`);
            reject(err);
          } else {
            hilog.info(DOMAIN, TAG, `emitWithData ${event} success`);
            resolve();
          }
        });
      } catch(e) {
        let err: BusinessError = e as BusinessError;
        hilog.info(DOMAIN, TAG, `emitWithData ${event} fail. error code: ${err?.code}, msg: ${err?.message}`);
        reject(err);
      }
    })
  }
}

// export EventBusPlus
export default new EventBusPlus();