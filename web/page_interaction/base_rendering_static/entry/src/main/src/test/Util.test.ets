/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { expect } from "../../../hypium/index";
import { Driver, ON } from '@ohos.UiTest';
import { RecordData } from '@ohos.base';

export default class Utils{

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    if( component != null ){
      await component.click();
    }
  }

  static async emitEvent(actualValue: boolean | string | Int | object, eventId: Int) {
    try {
      console.info("Entry emitEvent, actualValue = " + actualValue);
      const tempData: Record<string, RecordData> = {
        "ACTION": actualValue as object
      };

      let backData: events_emitter.EventData = {
        data: tempData
      }

      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      const actionValue = (backData.data as Record<string, RecordData> )["ACTION"];
      console.info("webFlag start to emit action state, ackData.data[\"ACTION\"] = " + String(actionValue));
      events_emitter.emit(backEvent, backData);
      await Utils.msSleep(2000)
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: Int,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void) {
    console.info('registerBaseEvent start')
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        console.info('registerBaseEvent before second try')
        try {
          console.info(`${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
          console.info(`[${testCaseName}] END`);
        } catch (err) {
          console.info(`[${testCaseName}] err:` + JSON.stringify(err));
        }
        done()
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack)
      console.info("Finish registerBaseEvent, innerEvent.eventId=" + innerEvent.eventId + ", innerEvent.priority=" +
      innerEvent.priority);
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
    console.info('registerBaseEvent end')
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: Int, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
      const data = backData?.data as Record<string, RecordData>;
      const action = data['ACTION'];
      console.info(`Begin to assert [${action}] Equal [${expected}]`);
      expect(action).assertEqual(expected);
    });
  }
}