/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';

import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function enableClickSoundEffect() {
  describe('enableClickSoundEffect', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });
    beforeAll(async (done: Function) => {
      console.info("enableClickSoundEffect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/enableClickSoundEffect/enableClickSoundEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableClickSoundEffect state pages: " + JSON.stringify(pages));
        if (!("enableClickSoundEffect" == pages.name)) {
          console.info("get enableClickSoundEffect state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push enableClickSoundEffect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableClickSoundEffect page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   enableClickSoundEffect_0100
     * @tc.number enableClickSoundEffect_0100
     * @tc.desc   To test enableClickSoundEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enableClickSoundEffect_0100', Level.LEVEL1, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('enableClickSoundEffect_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enableClickSoundEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableClickSoundEffect_0100] component obj is: " + JSON.stringify(obj));
      console.info("[enableClickSoundEffect_0100] enableClickSoundEffect: " + JSON.stringify(obj.$attrs.enableClickSoundEffect));
      expect(obj.$attrs.enableClickSoundEffect).assertEqual(true);
      console.info('[enableClickSoundEffect_0100] END');
      done();
    });
    /**
     * @tc.name   enableClickSoundEffect_0200
     * @tc.number enableClickSoundEffect_0200
     * @tc.desc   To test enableClickSoundEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enableClickSoundEffect_0200', Level.LEVEL1, async (done: Function) => {
      console.info('enableClickSoundEffect_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('statusButton'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enableClickSoundEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableClickSoundEffect_0200] component obj is: " + JSON.stringify(obj));
      console.info("[enableClickSoundEffect_0200] enableClickSoundEffect: " + JSON.stringify(obj.$attrs.enableClickSoundEffect));
      expect(obj.$attrs.enableClickSoundEffect).assertEqual(false);
      console.info('[enableClickSoundEffect_0200] END');
      done();
    });
    /**
     * @tc.name   enableClickSoundEffect_0300
     * @tc.number enableClickSoundEffect_0300
     * @tc.desc   To test enableClickSoundEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('enableClickSoundEffect_0300', Level.LEVEL1, async (done: Function) => {
      console.info('enableClickSoundEffect_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column1 = await driver.findComponent(ON.id('statusButton'));
      await Column1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('enableClickSoundEffect');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[enableClickSoundEffect_0300] component obj is: " + JSON.stringify(obj));
      console.info("[enableClickSoundEffect_0300] enableClickSoundEffect: " + JSON.stringify(obj.$attrs.enableClickSoundEffect));
      expect(obj.$attrs.enableClickSoundEffect).assertEqual(true);

      await CommonFunc.sleep(1000);
      await Column1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('enableClickSoundEffect');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[enableClickSoundEffect_0300] component obj is: " + JSON.stringify(obj1));
      console.info("[enableClickSoundEffect_0300] enableClickSoundEffect: " + JSON.stringify(obj1.$attrs.enableClickSoundEffect));
      expect(obj1.$attrs.enableClickSoundEffect).assertEqual(true);
      console.info('[enableClickSoundEffect_0300] END');
      done();
    });
  })
}

