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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function outline() {
  describe('outline', function () {
    beforeEach(async function (done) {
      console.info("outline beforeEach start");
      let options = {
        uri: 'MainAbility/pages/supplement/outline',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get outline state pages: " + JSON.stringify(pages));
        if (!("outline" == pages.name)) {
          console.info("get outline state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push outline success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push outline page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
     /**
     * @tc.number    SUB_ACE_outline_0100
     * @tc.name      outline_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('outlineStyle_0100', 0, async function (done) {
      console.info('outlineStyle_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline');
      let obj = JSON.parse(strJson);
      console.info("[outlineStyle_0100] component obj is: " + JSON.stringify(obj));
      console.info("[outlineStyle_0100] title: " + JSON.stringify(obj.$attrs.outlineStyle));
      expect(obj.$attrs.outlineStyle).assertEqual('OutlineStyle.DASHED');
      console.info('[outlineStyle_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_outline_0100
     * @tc.name      outline_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineWidth_0200', 0, async function (done) {
      console.info('outlineWidth_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline');
      let obj = JSON.parse(strJson);
      console.info("[outlineWidth_0200] component obj is: " + JSON.stringify(obj));
      console.info("[outlineWidth_0200] title: " + JSON.stringify(obj.$attrs.outlineWidth));
      expect(obj.$attrs.outlineWidth).assertEqual('5.00vp');
      console.info('[outlineWidth_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_outline_0100
     * @tc.name      outline_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineColor_0300', 0, async function (done) {
      console.info('outlineColor_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline');
      let obj = JSON.parse(strJson);
      console.info("[outlineColor_0300] component obj is: " + JSON.stringify(obj));
      console.info("[outlineColor_0300] title: " + JSON.stringify(obj.$attrs.outlineColor));
      expect(obj.$attrs.outlineColor).assertEqual('#FFAFEEEE');
      console.info('[outlineColor_0300] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_outline_0100
     * @tc.name      outline_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('outlineRadius_0400', 0, async function (done) {
      console.info('outlineRadius_0400 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('outline');
      let obj = JSON.parse(strJson);
      console.info("[outlineRadius_0400] component obj is: " + JSON.stringify(obj));
      console.info("[outlineRadius_0400] title: " + JSON.stringify(obj.$attrs.outlineRadius));
      expect(obj.$attrs.outlineRadius).assertEqual('10.00vp');
      console.info('[outlineRadius_0400] END');
      done();
    });
    

  })
}

