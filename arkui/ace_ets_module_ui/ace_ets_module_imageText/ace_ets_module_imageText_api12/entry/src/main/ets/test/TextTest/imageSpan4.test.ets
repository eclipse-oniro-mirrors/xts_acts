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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function imageSpanTest4() {
  describe('imageSpanTest4', () => {
    beforeEach(async (done: Function) => {
      console.info("imageSpanTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/imageSpan4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageSpanTest4 state pages: " + JSON.stringify(pages));
        if (!("imageSpan4" == pages.name)) {
          console.info("get imageSpanTest4 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push imageSpanTest4 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageSpanTest4 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_imageSpanTest4_0100
     * @tc.name      imageSpanTest4_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('imageSpanTest4_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest4_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_41');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest4_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('png onComplete succ');
      console.info('[imageSpanTest4_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0200
     * @tc.name      imageSpanTest4_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest4_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_42');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest4_0200] component obj is: " + JSON.stringify(obj));
      console.info("[imageSpanTest4_0200] title: " + JSON.stringify(obj.$attrs.imageSpanTest4Width));
      expect(obj.$attrs.content).assertEqual('jpg onComplete succ');
      console.info('[imageSpanTest4_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0300
     * @tc.name      imageSpanTest4_0300
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest4_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_43');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest4_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('gif onComplete succ');
      console.info('[imageSpanTest4_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0400
     * @tc.name      imageSpanTest4_0400
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest4_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_44');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest4_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('svg onComplete succ');
      console.info('[imageSpanTest4_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_imageSpanTest4_0500
     * @tc.name      imageSpanTest4_0500
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('imageSpanTest4_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('imageSpanTest4_0500 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ImageSpan_onComplete_45');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[imageSpanTest4_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('bmp onComplete succ');
      console.info('[imageSpanTest4_0500] END');
      done();
    });
  })
}

