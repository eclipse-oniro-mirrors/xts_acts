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

const TAG: string = 'EventBus';
const DOMAIN = 0x0000;

type Event = () => void;

class EventBus {
  private eventMap: Map<string, Event> = new Map<string, Event>();

  onWait(key: string, timeout: number = 2000): Promise<void> {
    return new Promise((resolve) => {
      hilog.info(DOMAIN, TAG, `onWait key: ${key}`);
      let lock: boolean = false;
      let timeoutId: number = -1;

      const event: Event = () => {
        if (lock) {
          return;
        }
        lock = true;

        clearTimeout(timeoutId);

        hilog.info(DOMAIN, TAG, `onWait ${key} resolve`);
        resolve();

        hilog.info(DOMAIN, TAG, `onWait eventMap delete ${key}`);
        this.eventMap.delete(key);
        hilog.info(DOMAIN, TAG, `onWait eventMap length: ${this.eventMap.size}`);
      }

      this.eventMap.set(key ,event);
      hilog.info(DOMAIN, TAG, `onWait eventMap length: ${this.eventMap.size}`);

      timeoutId = setTimeout(() => {
        if (!lock) {
          hilog.info(DOMAIN, TAG, `onWait timeout trigger`);
          event();
        }
      }, timeout);
    })
  }

  emit(key: string) {
    hilog.info(DOMAIN, TAG, `emit key: ${key}`);
    const event = this.eventMap.get(key);
    hilog.info(DOMAIN, TAG, `emit has event: ${!!event}`);
    if(event) {
      event();
    }
  }
}

// export eventBus
export default new EventBus();