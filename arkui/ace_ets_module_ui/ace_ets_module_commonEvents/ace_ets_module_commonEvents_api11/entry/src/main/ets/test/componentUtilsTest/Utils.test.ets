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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function UtilsTest() {

  describe('UtilsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/componentUtils/Utils",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Utils state pages: " + JSON.stringify(pages));
        if (!("NormalEts" == pages.name)) {
          console.info("get Utils state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push Utils success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Utils page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Utils after each called");
    });

    /**
     * @tc.name   UtilsTest_0010
     * @tc.number UtilsTest_0010
     * @tc.desc   api for test translate,scale,rotate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UtilsTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('Utils_0010 START');
      let driver : Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let onClick = await driver.findComponent(ON.id('onClick'));
      await onClick.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[Utils_0010] Obj: ' + JSON.stringify(obj.$attrs.content));
      let con: ESObject = JSON.parse(obj.$attrs.content);
      expect(con.translate.x).assertEqual(20);
      expect(con.translate.y).assertEqual(20);
      expect(con.translate.z).assertEqual(20);

      expect(con.scale.x).assertEqual(0.5);
      expect(con.scale.y).assertEqual(0.5);
      expect(con.scale.z).assertEqual(1);
      expect(con.scale.centerX).assertEqual(150);
      expect(con.scale.centerY).assertEqual(50);

      expect(con.rotate.x).assertEqual(1);
      expect(con.rotate.y).assertEqual(1);
      expect(con.rotate.z).assertEqual(1);
      expect(con.rotate.angle).assertEqual(300);
      expect(con.rotate.centerX).assertEqual(150);
      expect(con.rotate.centerY).assertEqual(50);

      console.info('[Utils_0010] END');
      done();
    });
  })
}