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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function precompileJavaScriptTest() {

  describe('precompileJavaScriptTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/precompileJavaScriptTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get precompileJavaScriptTest state success ' + JSON.stringify(pages));
        if (!("precompileJavaScriptTest" == pages.name)) {
          console.info('get precompileJavaScriptTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push precompileJavaScriptTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push precompileJavaScriptTest page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('precompileJavaScriptTest beforeEach start');
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0100
    * @tc.name       : testPrecompileJavaScript001
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript001", 148401)
      Utils.registerBaseEvent("testPrecompileJavaScript001", 0, 148410, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('precompileJavaScriptTestButton',driver)
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0500
    * @tc.name       : testPrecompileJavaScript005
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript005", 148401)
      Utils.registerBaseEvent("testPrecompileJavaScript005", "401", 148420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('precompileJavaScriptTestButton',driver)
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_0600
    * @tc.name       : testPrecompileJavaScript006
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript006", 148401)
      Utils.registerBaseEvent("testPrecompileJavaScript006", "401", 148430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('precompileJavaScriptTestButton',driver)
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PRECOMPILEJAVASCRIPT_1100
    * @tc.name       : testPrecompileJavaScript011
    * @tc.desc       : test precompileJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPrecompileJavaScript011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testPrecompileJavaScript011", 148401)
      Utils.registerBaseEvent("testPrecompileJavaScript011", 0, 148440, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected)
        });
      Utils.waitAndClickComponent('precompileJavaScriptTestButton',driver)
    })

  })
}
