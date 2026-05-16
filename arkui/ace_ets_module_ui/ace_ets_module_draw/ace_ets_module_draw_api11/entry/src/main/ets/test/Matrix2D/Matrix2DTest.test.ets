/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function Matrix2DTest() {
  describe('Matrix2DTest', () =>{
    beforeEach(async (done:Function) => {
      console.info("flex beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/Matrix2D/Matrix2DPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Matrix2DPage state success " + JSON.stringify(pages));
        if (!("Matrix2DPage" == pages.name)) {
          console.info("get Matrix2DPage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push Matrix2DPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Matrix2DPage page error: " + err);
      }
      done()
    });

    afterEach(async () =>{
      await Utils.sleep(1000);
      console.info("Matrix2D after each called");
    });

    /**
     * @tc.name   testMatrix2D_0010
     * @tc.number testMatrix2D_0010
     * @tc.desc   testMatrix2D_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrix2D_0010', Level.LEVEL0, async (done:Function) => {
      console.info('[testMatrix2D_0010] START');
      await Utils.sleep(2000);

      let strJson: string = getInspectorByKey('Matrix2DMultiplyCanvas');
      expect(JSON.parse(strJson).$type).assertEqual('Canvas');

      let strJson2: string = getInspectorByKey('Matrix2DRotateCanvas');
      expect(JSON.parse(strJson2).$type).assertEqual('Canvas');

      console.info('[testMatrix2D_0010] END');
      done();
    });
  })
}
