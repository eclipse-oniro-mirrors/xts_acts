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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function ModalBlurStyle() {
  describe('ModalBlurStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("ModalBlurStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menu/ModalBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ModalBlurStyle state pages: " + JSON.stringify(pages));
        if (!("ModalBlurStyle" == pages.name)) {
          console.info("get ModalBlurStyle state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ModalBlurStyle success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ModalBlurStyle page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('blurStyle_init'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });
    /**
     * @tc.name   ModalBlurStyle_0100
     * @tc.number SUB_ACE_MODALDEMO_BLUESTYLE_0010
     * @tc.desc   API11 adds a blurred background for half-modal panels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModalBlurStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ModalBlurStyle_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blurStyle_1');
      
      console.info("[ModalBlurStyle_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalBlurStyle_0100] bindSheet: " + JSON.stringify(JSON.parse(strJson).$attrs.bindSheet));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('BlurStyle 1');
      console.info('[ModalBlurStyle_0100] END');
      done();
    });
    /**
     * @tc.name   ModalBlurStyle_0200
     * @tc.number SUB_ACE_MODALDEMO_BLUESTYLE_0020
     * @tc.desc   API11 adds a blurred background for half-modal panels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModalBlurStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ModalBlurStyle_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blurStyle_2');
      console.info("[ModalBlurStyle_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalBlurStyle_0200] bindSheet: " + JSON.stringify(JSON.parse(strJson).$attrs.bindSheet));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('BlurStyle 2');
      console.info('[ModalBlurStyle_0200] END');
      done();
    });
    /**
     * @tc.name   ModalBlurStyle_0300
     * @tc.number SUB_ACE_MODALDEMO_BLUESTYLE_0030
     * @tc.desc   API11 adds a blurred background for half-modal panels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModalBlurStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ModalBlurStyle_0300 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blurStyle_3');
      console.info("[ModalBlurStyle_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalBlurStyle_0300] bindSheet: " + JSON.stringify(JSON.parse(strJson).$attrs.bindSheet));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('BlurStyle 3');
      console.info('[ModalBlurStyle_0300] END');
      done();
    });
    /**
     * @tc.name   ModalBlurStyle_0400
     * @tc.number SUB_ACE_MODALDEMO_BLUESTYLE_0040
     * @tc.desc   API11 adds a blurred background for half-modal panels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModalBlurStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ModalBlurStyle_0400 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blurStyle_4');
      console.info("[ModalBlurStyle_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalBlurStyle_0400] bindSheet: " + JSON.stringify(JSON.parse(strJson).$attrs.bindSheet));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('BlurStyle 4');
      console.info('[ModalBlurStyle_0400] END');
      done();
    });
    /**
     * @tc.name   ModalBlurStyle_0500
     * @tc.number SUB_ACE_MODALDEMO_BLUESTYLE_0050
     * @tc.desc   API11 adds a blurred background for half-modal panels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ModalBlurStyle_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ModalBlurStyle_0500 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('blurStyle_5');
      console.info("[ModalBlurStyle_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalBlurStyle_0500] bindSheet: " + JSON.stringify(JSON.parse(strJson).$attrs.bindSheet));
      expect(JSON.parse(strJson).$attrs.label).assertEqual('BlurStyle 5');
      console.info('[ModalBlurStyle_0500] END');
      done();
    });
  })
}