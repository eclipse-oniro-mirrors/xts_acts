/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebviewPressureLevel() {
  describe('ActsAceWebviewPressureLevel', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewPressureLevel',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webViewPressureLevel state success " + JSON.stringify(pages));
        if (!("webViewPressureLevel" == pages.name)) {
          console.info("get webViewPressureLevel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webViewPressureLevel state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewPressureLevel page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      done();
    })

    afterEach(async (done: Function) => {
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent : events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.error("emit emitKey error:" + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    /*
    *@tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0001
    *@tc.name testWebviewPressureLevelModerate
    *@tc.desc test testWebviewPressureLevelModerate
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 0
    */
    it('testWebviewPressureLevelModerate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebviewPressureLevelModerate"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebviewPressureLevelModerate", "success", 20001,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewPressureLevelButton', 10, '');
    })


    /*
    *@tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0002
    *@tc.name testWebviewPressureLevelCritical
    *@tc.desc test testWebviewPressureLevelCritical
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level 1
    */
    it('testWebviewPressureLevelCritical', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewPressureLevelCritical"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebviewPressureLevelCritical", "success", 20002,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewPressureLevelButton', 10, '');
    })
  })
}
