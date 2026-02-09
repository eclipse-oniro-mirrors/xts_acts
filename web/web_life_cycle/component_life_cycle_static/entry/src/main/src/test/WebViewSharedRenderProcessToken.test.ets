/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import { RecordData } from '@ohos.base';

let emitKey = ''

export default function ActsAcewebViewSharedRenderProcessToken() {
  describe('ActsAcewebViewSharedRenderProcessToken', () => {

    beforeAll(async (): Promise<void> => {

    });

    beforeEach(async () => {
        await Utils.msSleep(2000);
    })

    afterEach(async () => {
      try {
        let tempData: Record<string, RecordData> = {};
        tempData['ACTION'] = emitKey;
        let backData: events_emitter.EventData = {
          data: tempData
        }
        let backEvent : events_emitter.InnerEvent = {
            eventId: 10,
            priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent, backData);
      } catch (err) {
          console.error('emit emitKey error:' + JSON.stringify(err));
      }
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   testWebViewSharedRenderProcessTokenStatic
     * @tc.number SUB_ACE_WEB_SharedRenderProcessToken_API_0001
     * @tc.desc   test SharedRenderProcessToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSharedRenderProcessTokenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      emitKey = 'emitWebViewSharedRenderProcessToken'
      await Utils.msSleep(2000);
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testWebViewSharedRenderProcessToken', true, 1600, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
          expect(action).assertEqual(expected);
        });
      inspector.sendEventByKey('webViewSharedRenderProcessToken', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
