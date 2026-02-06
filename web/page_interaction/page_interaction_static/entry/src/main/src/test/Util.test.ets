'use static'

/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import { expect } from '../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError, RecordData } from '@ohos.base';

export default class Utils {
  static async sleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    component?.click();
  }

  static async longClickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    component?.longClick();
  }

  static async emitEvent(actualValue: boolean | string | number | object, eventId: Long) {
    try {
      let backData: events_emitter.EventData = {
        data: {
          'ACTION': actualValue
        } as Record<string, RecordData>
      }

      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.emit(backEvent, backData);
    } catch (err) {
      err = err as BusinessError;
      console.info('webFlag emit action state err: ' + err.message);
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: Long,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          expectFunction(backData, expected);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          err = err as BusinessError;
          console.info(`[${testCaseName}] err:` + err.message);
        }
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack)
    } catch (err) {
      err = err as BusinessError;
      console.info(`[${testCaseName}] err:` + err.message);
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: Long, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
      (backData: events_emitter.EventData, expected: Object) => {
        const data = backData?.data as Record<string, RecordData>;
        const action = data['ACTION'];
        console.info(`Begin to assert [${action}] Equal [${expected}]`);
        expect(action).assertEqual(expected);
      });
  }
}