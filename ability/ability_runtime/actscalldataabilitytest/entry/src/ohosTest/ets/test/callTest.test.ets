/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from "@ohos.base"
import featureAbility from "@ohos.ability.featureAbility";
import ability from '@ohos.ability.ability';
import commonEvent from '@ohos.commonEvent';
import commonEventManager from '@ohos.commonEventManager';
import Utils from './Utils';

export default function callTest() {
  let TAG = "";
  const URI_TEST = 'dataability:///ohos.acts.aafwk.test.fasupplement.DataAbility';
  let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);

  let dataAssert = "";
  let subscriber: commonEventManager.CommonEventSubscriber;
  let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: ["call_event"]
  };

  describe('callTest', () => {
    /*
     * @tc.number  CallTest_0100
     * @tc.name    The deviceid passed in is null, so the installation free process is implemented
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("CallTest_0100", Level.LEVEL0, async (done: Function) => {
      console.info("------------start CallTest_0100-------------");
      console.info("CallTest_0100 commonEvent.createSubscriber start!!!");
      commonEvent.createSubscriber(subscribeInfo, 
        (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
          if (err.code) {
            console.error("CallTest_0100 commonEvent createSubscriber failed " + JSON.stringify(err));
          } else {
            console.info("----CallTest_0100 commonEvent createSubscriber------");
            subscriber = data;
            commonEvent.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              if (err.code) {
                console.error("CallTest_0100 commonEvent subscribe failed " + JSON.stringify(err));
              } else {
                console.info("CallTest_0100 commonEvent subscribe service " + JSON.stringify(data));
                if (data.parameters?.assertData) {
                  dataAssert = data.parameters?.assertData
                  console.info("callTest dataAssert is : " + dataAssert);
                }
              }})
          }
        });
      await Utils.sleep(2000);
      TAG = "CallTest_0100";
      let details: ability.PacMap = {};
      dataAbilityHelper.call(URI_TEST, 'insert', '', {
        'group_name': 'test1',
        'ringtone_modify_time': 28
      }).then((data) => {
        console.info(TAG + ' call succeeded, data: ' + JSON.stringify(data));
        details = data;
      }).catch((error: BusinessError) => {
        console.error(TAG + ' call failed, error: ' + JSON.stringify(error));
      });
      await Utils.sleep(2000);
      let datas:string = JSON.stringify(details.result);
      expect(JSON.parse(JSON.parse(datas))?.group_name?.data).assertEqual("test1");
      expect(JSON.parse(JSON.parse(datas))?.group_name?.type).assertEqual(10);
      expect(JSON.parse(JSON.parse(datas))?.ringtone_modify_time?.type).assertEqual(9);
      expect(JSON.parse(JSON.parse(datas))?.ringtone_modify_time?.data).assertEqual("28wTypeToString");
      expect(JSON.parse(JSON.parse(dataAssert))?.group_name?.data).assertEqual("test1");
      expect(JSON.parse(JSON.parse(dataAssert))?.group_name?.type).assertEqual(10);
      expect(JSON.parse(JSON.parse(dataAssert))?.ringtone_modify_time?.type).assertEqual(9);
      expect(JSON.parse(JSON.parse(dataAssert))?.ringtone_modify_time?.data).assertEqual("28wTypeToString");
      console.info("------------end CallTest_0100-------------");
      done();
    });
  })
}