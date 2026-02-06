/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webMessagePortIsExtentionTypeTest() {

  describe('WebMessagePortIsExtentionTypeTest', () => {
    let pageName = 'WebMessagePortIsExtentionTypeTest'
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/' + pageName,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${pageName} state success ` + JSON.stringify(pages));
        if (!(pageName == pages.name)) {
          console.info(`get ${pageName} state success ` + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info(`push ${pageName} page success ` + JSON.stringify(result));
        }
      } catch (err) {
        console.error(`push ${pageName} page error: ` + err);
      }
      await waitForComponent("IsExtentionTypeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info(`${pageName} beforeEach start`);
      done();
    })

    afterEach(async (done: Function) => {
      console.info(`${pageName} afterEach start`);
      console.info(`${pageName} afterEach end`);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBMESSAGEPORT_ISEXTENTIONTYPE_0100
    * @tc.name        : testIsExtentionType001
    * @tc.desc        : test isExtentionType
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testIsExtentionType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIsExtentionType001", 170360)
      Utils.registerEvent("testIsExtentionType001", "401", 170370, done);
      sendEventByKey('IsExtentionTypeButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_CREATEWEBMESSAGEPORTS_RETURN_ARRAY_0100
    * @tc.name        : testCreateWebMessagePortsReturnArrayLengthEqual0
    * @tc.desc        : test createWebMessagePorts return array length equal 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testCreateWebMessagePortsReturnArrayLengthEqual0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testCreateWebMessagePortsReturnArrayLengthEqual0", 170360)
      Utils.registerBaseEvent('testCreateWebMessagePortsReturnArrayLengthEqual0', 0, 2510228, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(0)
        })
      sendEventByKey('IsExtentionTypeButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_CREATEWEBMESSAGEPORTS_RETURN_ARRAY_0200
    * @tc.name        : testCreateWebMessagePortsReturnArrayLengthLarger0
    * @tc.desc        : test createWebMessagePorts return array length larger 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testCreateWebMessagePortsReturnArrayLengthLarger0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testCreateWebMessagePortsReturnArrayLengthLarger0", 170360)
      Utils.registerBaseEvent('testCreateWebMessagePortsReturnArrayLengthLarger0', 0, 25102209, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertLarger(0)
        })
      sendEventByKey('IsExtentionTypeButton', 10, '');
    })


  })
}
