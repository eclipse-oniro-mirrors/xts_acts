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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function webGetTitleJsunit() {
  describe('webGetTitleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web/web2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get web state success " + JSON.stringify(pages));
        if (!("web" == pages.name)) {
          console.info("get web state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push web page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push web page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("webGetTitle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testwebGetTitle0001
     * @tc.desic         acewebGetTitleEtsTest0001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0001', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0001 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0001] component height strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.height).assertEqual("500.00vp");
        console.info("[testwebGetTitle0001] height value :" + JSON.parse(strJson).$attrs.height);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testwebGetTitle0002
     * @tc.desic         acewebGetTitleEtsTest0002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0002', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0002 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0002] component fileAccess strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.fileAccess).assertEqual(undefined);
        console.info("[testwebGetTitle0002] fileAccess value :" + JSON.parse(strJson).$attrs.fileAccess);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testwebGetTitle0003
     * @tc.desic         acewebGetTitleEtsTest0003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0003', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0003] component javaScriptAccess strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.javaScriptAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0003] javaScriptAccess value :" + JSON.parse(strJson).$attrs.javaScriptAccess);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testwebGetTitle0004
     * @tc.desic         acewebGetTitleEtsTest0004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0004', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0004 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0004] component padding strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.padding).assertEqual("20.00vp");
        console.info("[testwebGetTitle0004] padding value :" + JSON.parse(strJson).$attrs.padding);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testwebGetTitle0005
     * @tc.desic         acewebGetTitleEtsTest0005
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0005', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0005 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0005] component blur strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.blur).assertEqual(2);
        console.info("[testwebGetTitle0005] blur value :" + JSON.parse(strJson).$attrs.blur);
      } else {
        expect('null').assertEqual('null');
      }
    });


    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testwebGetTitle0006
     * @tc.desic         acewebGetTitleEtsTest0006
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testwebGetTitle0006', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0006 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0006] component userAgent strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.userAgent).assertEqual(undefined);
        console.info("[testwebGetTitle0006] userAgent value :" + JSON.parse(strJson).$attrs.userAgent);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testwebGetTitle0007
     * @tc.desic         acewebGetTitleEtsTest0007
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0007', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0007 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0007] component fileFromUrlAccess strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.fileFromUrlAccess).assertEqual(undefined);
        console.info("[testwebGetTitle0007] fileFromUrlAccess value :" + JSON.parse(strJson).$attrs.fileFromUrlAccess);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0008
     * @tc.name         testwebGetTitle0008
     * @tc.desic         acewebGetTitleEtsTest0008
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0008', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0008 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0008] component initialScale strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        expect(JSON.parse(strJson).$attrs.initialScale).assertEqual(undefined);
        console.info("[testwebGetTitle0008] initialScale value :" + JSON.parse(strJson).$attrs.initialScale);
      } else {
        expect('null').assertEqual('null');
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testwebGetTitle0009
     * @tc.desic         acewebGetTitleEtsTest0009
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */


    it('testwebGetTitle0009', Level.LEVEL0, async  () => {
      console.info('webGetTitle testwebGetTitle0009 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle0009] component strJson:" + strJson);
        let obj: Record<string, Object> = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Web');
        console.info("[testwebGetTitle0009] type value :" + obj.$type);
      } else {
        expect('null').assertEqual('null');
      }
    });
  })
}
