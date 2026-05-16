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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
export default function PopupAlphaTest() {
  describe('PopupAlphaTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PopupAlphaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/PopupAlpha',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PopupAlphaTest state pages: " + JSON.stringify(pages));
        if (!("PopupAlpha" == pages.name)) {
          console.info("get PopupAlphaTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PopupAlphaTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PopupAlphaTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   PopupAlphaTest_0100
     * @tc.number PopupAlpha
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PopupAlphaTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('PopupAlphaTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PopupAlpha_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PopupAlphaTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.popupItemBorderRadius).assertEqual('24.00vp');
      console.info('[PopupAlphaTest_0100] END');
      done();
    });
    /**
     * @tc.name   PopupAlphaTest_0200
     * @tc.number PopupAlpha
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PopupAlphaTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('PopupAlphaTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PopupAlpha_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PopupAlphaTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.itemBorderRadius).assertEqual('14.00vp');
      console.info('[PopupAlphaTest_0200] END');
      done();
    });
    /**
     * @tc.name   PopupAlphaTest_0300
     * @tc.number PopupAlpha
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PopupAlphaTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('PopupAlphaTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PopupAlpha_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PopupAlphaTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual('BlurStyle.NONE');
      console.info('[PopupAlphaTest_0300] END');
      done();
    });
    /**
     * @tc.name   PopupAlphaTest_0400
     * @tc.number PopupAlpha
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PopupAlphaTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('PopupAlphaTest_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PopupAlpha_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PopupAlphaTest_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.popupTitleBackground).assertEqual('#FFCCCCCC');
      console.info('[PopupAlphaTest_0300] END');
      done();
    });
  })
}

