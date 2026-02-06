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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  UiDriver,
  Component,
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


export default function MovingPhotoViewApi18Test() {
  describe('MovingPhotoViewApi18Test', () => {
    beforeEach(async (done: Function) => {
      console.info("MovingPhotoViewApi18Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoViewApi18',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MovingPhotoViewApi18Test state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoViewApi18" == pages.name)) {
          console.info("get MovingPhotoViewApi18Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MovingPhotoViewApi18Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MovingPhotoViewApi18Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi18Test_0120
     * @tc.number MovingPhotoViewApi18Test_0120
     * @tc.desc   test the api of MovingPhotoViewApi18: enableAnalyzer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi18Test_0120', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi18Test_0120 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('MovingPhotoViewApi18_enableAnalyzer'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi18_enableAnalyzerFlag');
      console.log('MovingPhotoViewApi18Test_0120', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      console.info('MovingPhotoViewApi18Test_0120 END');
      done();
    });

    /**
     * @tc.name   MovingPhotoViewApi18Test_0130
     * @tc.number MovingPhotoViewApi18Test_0130
     * @tc.desc   test the api of MovingPhotoViewApi18: refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MovingPhotoViewApi18Test_0130', Level.LEVEL2, async (done: Function) => {
      console.info('MovingPhotoViewApi18Test_0130 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('MovingPhotoViewApi18_refreshButton'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('MovingPhotoViewApi18_refresh');
      console.log('MovingPhotoViewApi18Test_0130', JSON.parse(strJson).$attrs.content)
      expect(JSON.parse(strJson).$attrs.content).assertEqual("refresh succ");
      console.info('MovingPhotoViewApi18Test_0130 END');
      done();
    });
  })
}