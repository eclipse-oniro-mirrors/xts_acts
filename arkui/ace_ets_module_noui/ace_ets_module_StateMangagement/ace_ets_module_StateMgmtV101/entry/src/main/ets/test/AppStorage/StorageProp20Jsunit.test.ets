/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function StorageProp20Jsunit() {
  describe('StorageProp20Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("StorageProp20Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AppStorage/StorageProp20',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StorageProp20Jsunit state pages: " + JSON.stringify(pages));
        if (!("StorageProp20" == pages.name)) {
          console.info("get StorageProp20Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StorageProp20Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp20Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   StorageProp20Jsunit_0100
     * @tc.number StorageProp20Jsunit_0100
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp20Jsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[StorageProp20Jsunit_0100] START');
      let strJson1 = getInspectorByKey('text_state');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp20Jsunit_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('State:10');
      console.info('[StorageProp20Jsunit_0100] END');
      done();
    });
    
    /**
     * @tc.name   StorageProp20Jsunit_0200
     * @tc.number StorageProp20Jsunit_0200
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp20Jsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[StorageProp20Jsunit_0200] START');
      let strJson1 = getInspectorByKey('text_Link');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp20Jsunit_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Link:10');
      console.info('[StorageProp20Jsunit_0200] END');
      done();
    });
    
    /**
     * @tc.name   StorageProp20Jsunit_0300
     * @tc.number StorageProp20Jsunit_0300
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp20Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[StorageProp20Jsunit_0300] START');
      let strJson1 = getInspectorByKey('text_Prop');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp20Jsunit_0300] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Prop:10');
      console.info('[StorageProp20Jsunit_0300] END');
      done();
    });
    
    /**
     * @tc.name   StorageProp20Jsunit_0400
     * @tc.number StorageProp20Jsunit_0400
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StorageProp20Jsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[StorageProp20Jsunit_0400] START');
      let strJson1 = getInspectorByKey('text_Provide');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[StorageProp20Jsunit_0400] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Provide:10');
      console.info('[StorageProp20Jsunit_0400] END');
      done();
    });
  })
}
