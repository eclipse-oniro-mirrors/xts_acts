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
import featureAbility from "@ohos.ability.featureAbility";
import commonEvent from '@ohos.commonEvent';
import Utils from './Utils';

export default function callTest() {
  let TAG = "";
  const URI_TEST = 'dataability:///ohos.acts.aafwk.test.fasupplement.DataAbility';
  let dataAbilityHelper = featureAbility.acquireDataAbilityHelper(URI_TEST);
  let pacMap = {
    'group_name': 'test1',
    'ringtone_modify_time': 28
  };
  let dataAssert = "";
  let subscriber;
  let subscribeInfo = {
    events: ["call_event"]
  };

  function SubscribeCallBack(err, data) {
    if (err.code) {
      console.error("commonEvent subscribe failed " + JSON.stringify(err));
    } else {
      console.info("commonEvent subscribe service " + JSON.stringify(data));
      for (var key in data.parameters) {
        if (data.parameters[key]) {
          dataAssert = data.parameters[key]
          console.info("callTest dataAssert is : " + dataAssert);
        }
      }
    }
  }

  function CreateSubscriberCallBack(err, commonEventSubscriber) {
    if (err.code) {
      console.error("commonEvent createSubscriber failed " + JSON.stringify(err));
    } else {
      console.info("----commonEvent createSubscriber------");
      subscriber = commonEventSubscriber;
      commonEvent.subscribe(subscriber, SubscribeCallBack);
    }
  }

  describe('callTest', Level.LEVEL0, () => {
    /*
     * @tc.number  CallTest_0100
     * @tc.name    The deviceid passed in is null, so the installation free process is implemented
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("CallTest_0100", Level.LEVEL0, async  (done: Function) => {
      console.info("------------start CallTest_0100-------------");
      console.info("CallTest_0100 commonEvent.createSubscriber start!!!");
      commonEvent.createSubscriber(subscribeInfo, CreateSubscriberCallBack);
      await Utils.sleep(2000);
      TAG = "CallTest_0100";
      let details;
      dataAbilityHelper.call(URI_TEST, 'insert', '', pacMap).then((data) => {
        console.info(TAG + ' call succeeded, data: ' + JSON.stringify(data));
        details = data;
      }).catch((error) => {
        console.error(TAG + ' call failed, error: ' + JSON.stringify(error));
      });
      await Utils.sleep(2000);
      expect(details.result).assertEqual("{\"group_name\":{\"data\":\"test1\",\"type\":10}," +
        "\"ringtone_modify_time\":{\"data\":\"28wTypeToString\",\"type\":9}}");
      expect(dataAssert).assertEqual("{\"group_name\":{\"data\":\"test1\",\"type\":10}" +
        ",\"ringtone_modify_time\":{\"data\":\"28wTypeToString\",\"type\":9}}");
      console.info("------------end CallTest_0100-------------");
      done();
    });
  })
}