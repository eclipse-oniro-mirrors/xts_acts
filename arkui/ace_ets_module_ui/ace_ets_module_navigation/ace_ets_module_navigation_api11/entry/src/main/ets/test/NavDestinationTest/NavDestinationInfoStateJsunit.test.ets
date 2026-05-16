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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function NavDestinationInfoStateJsunit() {
  describe('NavDestinationInfoStateJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavDestinationInfoStateJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestinationInfoState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestinationInfoStateJsunit state pages:" + JSON.stringify(pages));
        if (!("NavDestinationInfoState" == pages.name)) {
          console.info("get NavDestinationInfoStateJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavDestinationInfoStateJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavDestinationInfoStateJsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   NavDestinationInfoStateJsunit_0100
     * @tc.number NavDestinationInfoStateJsunit_0100
     * @tc.desc   NavDestinationInfoStateJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationInfoStateJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavDestinationInfoStateText01'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let strcontent = getInspectorByKey('NavDestinationInfoStateText02');
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_0100 component obj is: ' + JSON.parse(strcontent).$attrs.content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('ON_SHOWN');
      console.info('NavDestinationInfoStateJsunit_0100 END')
      done();
    });

    /**
     * @tc.name   NavDestinationInfoStateJsunit_0200
     * @tc.number NavDestinationInfoStateJsunit_0200
     * @tc.desc   NavDestinationInfoStateJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationInfoStateJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('NavDestinationInfoStateJsunit_0200 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavDestinationInfoStateButton'));
      await btn1.click();
      await CommonFunc.sleep(3500);
      let strcontent = getInspectorByKey('NavDestinationInfoStateText02');
      console.info('NavDestinationInfoStateJsunit_0200 component obj is: ' + JSON.parse(strcontent).$attrs.content);
      expect(JSON.parse(strcontent).$attrs.content).assertEqual('ON_HIDDEN');
      console.info('NavDestinationInfoStateJsunit_0200 END')
      done();
    });

  })
}