/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
const waitUiReadyMs = 1000;

export default function LoadingProgressJsunit() {
  describe('LoadingProgressJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("LoadingProgressJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/LoadingProgressJsunit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LoadingProgressJsunit state pages:" + JSON.stringify(pages));
        if (!("LoadingProgressJsunit" == pages.name)) {
          console.info("get LoadingProgressJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push LoadingProgressJsunit success" + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push LoadingProgressJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   loadingProgressJsunit_0100
     * @tc.number loadingProgressJsunit_0100
     * @tc.desc   Test loadingProgress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadingProgressJsunit_0100', Level.LEVEL2, async (done: Function) => {
       console.info('loadingProgressJsunit_0100 START');
       await CommonFunc.sleep(1000);
       // get the gauge component and test attribute
       let strJson = getInspectorByKey('loadingProgress');
       let obj: ESObject = JSON.parse(strJson);
       console.info('loadingProgressJsunit_0100 component obj is:' + JSON.stringify(obj));
       expect(obj.$attrs.color).assertEqual('#FF0000FF');
       done();
    });
   /**
    * @tc.name   loadingProgressJsunit_0200
    * @tc.number loadingProgressJsunit_0200
    * @tc.desc   Test loadingProgress
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('loadingProgressJsunit_0200', Level.LEVEL2, async (done: Function) => {
      console.info('loadingProgressJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the color attribute normal value of loadingProgress dynamically
      globalThis.value.message.notify({name:'color',value:Color.Green})
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = getInspectorByKey('loadingProgress');
      let obj: ESObject = JSON.parse(strJson);
      console.info('loadingProgressJsunit_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#FF008000');
      done();
    });
  /**
   * @tc.name   loadingProgressJsunit_0300
   * @tc.number loadingProgressJsunit_0300
   * @tc.desc   Test loadingProgress
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('loadingProgressJsunit_0300', Level.LEVEL2, async (done: Function) => {
      console.info('loadingProgressJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of loadingProgress dynamically
      globalThis.value.message.notify({name:'color',value:'-20'})
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('loadingProgress');
      let obj: ESObject = JSON.parse(strJson);
	  let resourceColor = getContext().resourceManager.getColorSync($r('sys.color.ohos_id_color_progress').id).toString(16).toUpperCase()
      console.info('loadingProgressJsunit_0300  component obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.color).assertEqual('#'+resourceColor);
      done();
   });
    
  })
}