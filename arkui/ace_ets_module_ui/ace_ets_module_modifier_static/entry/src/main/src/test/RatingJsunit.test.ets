'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import events_emitter from '@ohos.events.emitter';

export default function RatingJsunit() {
  describe('ratingTest', () => {
     beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility");

    });

    beforeEach(async () => {
      console.info("RatingJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rating',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RatingJsunit state pages: " + JSON.stringify(pages));
        if (!("rating" == pages.name)) {
          console.info("get RatingJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
         await UtilsTest.msSleep(2000);
        }
      } catch (err) {
        console.error("push RatingJsunit page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   RatingJsunit_static_0100
     * @tc.name     RatingJsunit_static_0100
     * @tc.desc     RatingJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RatingJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RatingJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('stars')).assertEqual('5');
      console.info('[RatingJsunit_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   RatingJsunit_static_0200
     * @tc.name     RatingJsunit_static_0200
     * @tc.desc     RatingJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('RatingJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[RatingJsunit_static_0200] START');
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual('0.500000');
      console.info('[RatingJsunit_static_0200] END');
      done();
    });

    
    
    /**
     * @tc.number   RatingJsunit_static_0300
     * @tc.name     RatingJsunit_static_0300
     * @tc.desc     RatingJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('RatingJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RatingJsunit_static_0300] START');
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('starStyle')).getString('backgroundUri')).assertEqual("resources/base/media/star_1.png");
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('starStyle')).getString('foregroundUri')).assertEqual("resources/base/media/star_2.png");
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('starStyle')).getString('secondaryUri')).assertEqual("resources/base/media/star_3.png");
      console.info('[RatingJsunit_static_0300] END');
      done();
    });

    
    
    /**
     * @tc.number   RatingJsunit_static_0400
     * @tc.name     RatingJsunit_static_0400
     * @tc.desc     RatingJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('RatingJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[RatingJsunit_static_0400] START');
      let driver = Driver.create();
      let button =  await (driver.findComponent(ON.id('changeButton')) as Promise<Component>);
      await button.click();
     await UtilsTest.msSleep(2000)
      let strJson = inspector.getInspectorByKey('rating1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RatingJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('stepSize')).assertEqual('0.400000');
      console.info('[RatingJsunit_static_0400] END');
      done();
    });

  })
}
