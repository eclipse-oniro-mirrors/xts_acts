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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function pixelRoundTest() {
  describe('pixelRoundTest', () => {
    beforeEach(async (done: Function) => {
      console.info("pixelRoundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RenderNode/renderNode/pixelRound',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get pixelRoundTest state pages: " + JSON.stringify(pages));
        if (!("pixelRound" == pages.name)) {
          console.info("get pixelRoundTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push pixelRoundTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push pixelRoundTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_pixelRoundTest_001
       * @tc.name  : pixelRoundTest_001
       * @tc.desc  : pixelRoundTest_001
       * @tc.level : Level 2
       * @tc.type : xts
       * @tc.size : 1
       */
    it('pixelRoundTest_001', Level.LEVEL2, async (done: Function) => {
      await CommonFunc.sleep(1000);
      console.info('pixelRoundTest_001 START');
      let strcontent = getInspectorByKey('pixelRound_1');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('pixelRoundTest_001 component obj is: ' + obj);
      expect(obj.$attrs.pixelRound).assertEqual('{"start":"PixelRoundCalcPolicy.NO_FORCE_ROUND","top":"PixelRoundCalcPolicy.FORCE_CEIL","end":"PixelRoundCalcPolicy.NO_FORCE_ROUND","bottom":"PixelRoundCalcPolicy.FORCE_FLOOR"}');
      console.info('pixelRoundTest_001 END')
      done();
    });
  })
}