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

import emitter from '@ohos.events.emitter';
import { expect } from "../../../hypium/index";
import { RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: Long, done: () => void) {
    hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " start expectValue=" + JSON.stringify(expectedValue));
    try {
      let callBack = (backData: emitter.EventData) => {
        try {
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " get result is: " + JSON.stringify(backData));
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expectedValue);
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " END");
        } catch (err) {
          hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " err: " + JSON.stringify(err));
        }
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: eventId
      }
      emitter.on(innerEvent, callBack)
    } catch (err) {
      hilog.info(0x0000, 'testTag', "testCaseName=" + testCaseName + " err: " + JSON.stringify(err));
    }
  }

  static emitEvent(actVal: boolean | string | number | object, eId: Long) {
    try {
      let recordData: Record<string, RecordData> = {
        "ACTION": actVal
      }
      let backData: emitter.EventData = {
        data: recordData
      }
      let backEvent: emitter.InnerEvent = {
        eventId: eId
      }
      hilog.info(0x0000, 'testTag', "webFlag start to emit action state, eventId=" + eId + " actVal=" + actVal);
      emitter.emit(backEvent, backData);
    } catch (err) {
      hilog.info(0x0000, 'testTag', "webFlag emit action state err: " + JSON.stringify(err));
    }
  }



}