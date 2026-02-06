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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function shapeTest() {
  describe('shapeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("shapeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/shapePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get shapeTest state pages:" + JSON.stringify(pages));
        if (!("shapePage" == pages.name)) {
          console.info("get shapeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push shapeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push shapeTest page error:" + err);
      }
      console.info("shapeTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number shapeTest_0100
     * @tc.name testNavigation
     * @tc.desc
     */
    it('shapeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('shapeTest_0100 START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('shapePage_image');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[shapeTest_0100] strJson:" + obj.$type);
      expect(obj.$type).assertEqual('Image');

      console.info('shapeTest_0100 END');
      done();
    });
  })
}