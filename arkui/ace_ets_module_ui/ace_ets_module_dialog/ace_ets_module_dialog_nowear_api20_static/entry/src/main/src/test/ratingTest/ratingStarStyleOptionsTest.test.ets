'use static';
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

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function RatingStarStyleOptionsTest() {
  describe('RatingStarStyleOptionsTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(() => {
      console.info("RatingStarStyleOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("RatingStarStyleOptionsTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RatingStarStyleOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ratingStarStyleOptions" == pages.name)) {
          console.info("get  RatingStarStyleOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/rating/ratingStarStyleOptions',
          })
        }
      } catch (err) {
        console.error("push RatingStarStyleOptionsTest page error:" + err);
      }
      console.info("RatingStarStyleOptionsTest foreEach end");
    });

    /**
     * @tc.number   RatingStarStyle_static_0100
     * @tc.name     RatingStarStyle_static_0100
     * @tc.desc     Test the starStyle interface
     * @tc.level    LEVEL2
     */
    it('RatingStarStyle_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('rating_001');
      let obj = JSON.parseJsonElement(strJson);
      let starStyleStr = obj.getElement('$attrs').getString('starStyle');
      let starStyleObj = JSON.parseJsonElement(starStyleStr);
      console.info("[RatingStarStyle_static_0100] starStyle obj is: " + starStyleStr);
      expect(starStyleObj.getString('backgroundUri')).assertEqual('resource://RAWFILE/image1.png');
      expect(starStyleObj.getString('foregroundUri')).assertEqual('resource://RAWFILE/image2.png');
      expect(starStyleObj.getString('secondaryUri')).assertEqual('resource://RAWFILE/image3.png');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   RatingStarStyle_static_0200
     * @tc.name     RatingStarStyle_static_0200
     * @tc.desc     Test the starStyle interface
     * @tc.level    LEVEL2
     */
    it('RatingStarStyle_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('rating_002');
      let obj = JSON.parseJsonElement(strJson);
      let starStyleStr = obj.getElement('$attrs').getString('starStyle');
      let starStyleObj = JSON.parseJsonElement(starStyleStr);
      console.info("[RatingStarStyle_static_0100] starStyle obj is: " + starStyleStr);
      expect(starStyleObj.getString('backgroundUri')).assertEqual("resources/rawfile/image1.png");
      expect(starStyleObj.getString('foregroundUri')).assertEqual("resources/rawfile/image2.png");
      expect(starStyleObj.getString('secondaryUri')).assertEqual("resources/rawfile/image3.png");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   RatingStarStyle_static_0300
     * @tc.name     RatingStarStyle_static_0300
     * @tc.desc     Test the starStyle interface
     * @tc.level    LEVEL2
     */
    it('RatingStarStyle_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'RatingStarStyle_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('rating_003');
      let obj = JSON.parseJsonElement(strJson);
      let starStyleStr = obj.getElement('$attrs').getString('starStyle');
      let starStyleObj = JSON.parseJsonElement(starStyleStr);
      console.info("[RatingStarStyle_static_0100] starStyle obj is: " + starStyleStr);
      expect(starStyleObj.getString('backgroundUri')).assertEqual("");
      expect(starStyleObj.getString('foregroundUri')).assertEqual("");
      expect(starStyleObj.getString('secondaryUri')).assertEqual("");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}
