/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/common/Common'

export default function ScrollToVisibleTest() {
  describe('ScrollToVisibleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollToVisibleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollToVisibleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollToVisibleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        console.info("push ScrollToVisibleTest page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push ScrollToVisibleTest page error: " + err);
      }
      done();
    });
    afterAll(async ()=>{
      AppStorage.delete('TextInputScrollToVisible')
      AppStorage.delete('TextAreaScrollToVisible')
      AppStorage.delete('SearchScrollToVisible')
    })

    /**
     * @tc.name   ScrollToVisibleTest001
     * @tc.number ScrollToVisibleTest001
     * @tc.desc   test ScrollToVisible set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToVisibleTest001', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('ScrollToVisibleTest001 START');
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('setScrollToVisible1'))
      await CommonFunc.sleep(500);
      await btn1.click();
      await CommonFunc.sleep(500);
      console.info('ScrollToVisibleTest001--TextInputScrollToVisible:' + AppStorage.get('TextInputScrollToVisible'));
      expect(AppStorage.get('TextInputScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest001--TextAreaScrollToVisible:' + AppStorage.get('TextAreaScrollToVisible'));
      expect(AppStorage.get('TextAreaScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest001--SearchScrollToVisible:' + AppStorage.get('SearchScrollToVisible'));
      expect(AppStorage.get('SearchScrollToVisible')).assertFalse();
      console.info("[ScrollToVisibleTest001] end");
      done();
    });
    /**
     * @tc.name   ScrollToVisibleTest002
     * @tc.number ScrollToVisibleTest002
     * @tc.desc   test ScrollToVisible set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToVisibleTest002', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('ScrollToVisibleTest002 START');
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('setScrollToVisible2'))
      await CommonFunc.sleep(500);
      await btn2.click();
      await CommonFunc.sleep(500);
      console.info('ScrollToVisibleTest002--TextInputScrollToVisible:' + AppStorage.get('TextInputScrollToVisible'));
      expect(AppStorage.get('TextInputScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest002--TextAreaScrollToVisible:' + AppStorage.get('TextAreaScrollToVisible'));
      expect(AppStorage.get('TextAreaScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest002--SearchScrollToVisible:' + AppStorage.get('SearchScrollToVisible'));
      expect(AppStorage.get('SearchScrollToVisible')).assertFalse();
      console.info("[ScrollToVisibleTest002] end");
      done();
    });
    /**
     * @tc.name   ScrollToVisibleTest003
     * @tc.number ScrollToVisibleTest003
     * @tc.desc   test ScrollToVisible set start 20 end 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToVisibleTest003', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('ScrollToVisibleTest003 START');
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('setScrollToVisible3'))
      await CommonFunc.sleep(500);
      await btn3.click();
      await CommonFunc.sleep(500);
      console.info('ScrollToVisibleTest003--TextInputScrollToVisible:' + AppStorage.get('TextInputScrollToVisible'));
      expect(AppStorage.get('TextInputScrollToVisible')).assertTrue();
      console.info('ScrollToVisibleTest003--TextAreaScrollToVisible:' + AppStorage.get('TextAreaScrollToVisible'));
      expect(AppStorage.get('TextAreaScrollToVisible')).assertTrue();
      console.info('ScrollToVisibleTest003--SearchScrollToVisible:' + AppStorage.get('SearchScrollToVisible'));
      expect(AppStorage.get('SearchScrollToVisible')).assertTrue();
      console.info("[ScrollToVisibleTest003] end");
      done();
    });
    /**
     * @tc.name   ScrollToVisibleTest004
     * @tc.number ScrollToVisibleTest004
     * @tc.desc   test ScrollToVisible set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToVisibleTest004', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('ScrollToVisibleTest004 START');
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('setScrollToVisible4'))
      await CommonFunc.sleep(500);
      await btn4.click();
      await CommonFunc.sleep(500);
      console.info('ScrollToVisibleTest004--TextInputScrollToVisible:' + AppStorage.get('TextInputScrollToVisible'));
      expect(AppStorage.get('TextInputScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest004--TextAreaScrollToVisible:' + AppStorage.get('TextAreaScrollToVisible'));
      expect(AppStorage.get('TextAreaScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest004--SearchScrollToVisible:' + AppStorage.get('SearchScrollToVisible'));
      expect(AppStorage.get('SearchScrollToVisible')).assertFalse();
      console.info("[ScrollToVisibleTest004] end");
      done();
    });

    /**
     * @tc.name   ScrollToVisibleTest005
     * @tc.number ScrollToVisibleTest005
     * @tc.desc   test ScrollToVisible not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollToVisibleTest005', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('ScrollToVisibleTest005 START');
      await CommonFunc.sleep(1000);
      let btn5 = await driver.findComponent(ON.id('setScrollToVisible5'))
      await CommonFunc.sleep(500);
      await btn5.click();
      await CommonFunc.sleep(500);
      console.info('ScrollToVisibleTest005--TextInputScrollToVisible:' + AppStorage.get('TextInputScrollToVisible'));
      expect(AppStorage.get('TextInputScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest005--TextAreaScrollToVisible:' + AppStorage.get('TextAreaScrollToVisible'));
      expect(AppStorage.get('TextAreaScrollToVisible')).assertFalse();
      console.info('ScrollToVisibleTest005--SearchScrollToVisible:' + AppStorage.get('SearchScrollToVisible'));
      expect(AppStorage.get('SearchScrollToVisible')).assertFalse();
      console.info("[ScrollToVisibleTest005] end");
      done();
    });
  })
}