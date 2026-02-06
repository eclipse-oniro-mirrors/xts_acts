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
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import events_emitter from '@ohos.events.emitter';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();
export default function WebCameraApiNoCrash() {

  describe('WebCameraApiNoCrash', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCameraApiNoCrash',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCameraApiNoCrash state success " + JSON.stringify(pages));
        if (!("WebCameraApiNoCrash" == pages.name)) {
          console.info("get WebCameraApiNoCrash state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebCameraApiNoCrash page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCameraApiNoCrash page error: " + err);
      }
      await waitForComponent('WebCameraApiNoCrash')
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_100
    * @tc.name       : testWebCameraApiNoCrash0100
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('WebCameraApiNoCrash0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0100", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0100", true, 300410, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_200
    * @tc.name       : testWebCameraApiNoCrash0200
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0200", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0200", true, 300420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_300
    * @tc.name       : testWebCameraApiNoCrash0300
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0300", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0300", true, 300430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_400
    * @tc.name       : testWebCameraApiNoCrash0400
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0400", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0400", true, 300440, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_500
    * @tc.name       : testWebCameraApiNoCrash0500
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0500", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0500", true, 300450, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_600
    * @tc.name       : testWebCameraApiNoCrash0600
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0600", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0600", true, 300460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_700
    * @tc.name       : testWebCameraApiNoCrash0700
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0700", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0700", true, 300470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_800
    * @tc.name       : testWebCameraApiNoCrash0800
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0800", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0800", true, 300480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_900
    * @tc.name       : testWebCameraApiNoCrash0900
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash0900", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash0900", true, 300490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCAMERAAPINOCRASH_1000
    * @tc.name       : testWebCameraApiNoCrash1000
    * @tc.desc       : test WebCameraApiNoCrash
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebCameraApiNoCrash1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebCameraApiNoCrash1000", 300400)
      Utils.registerBaseEvent("WebCameraApiNoCrash1000", true, 300500, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebCameraApiNoCrash');
    })
  })
}
