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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function rowJsunit2() {
  describe('rowJsunit2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/row2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get row state success " + JSON.stringify(pages));
        if (!("row2" == pages.name)) {
          console.info("get row state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push row page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push row page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("row after each called");
    });

    /**
     * @tc.name   testRow_100
     * @tc.number testRow_100
     * @tc.desc   test Row align
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_100',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_100] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_100 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.align).assertEqual("Alignment.Center");
      console.info('testRow_100 END');
      done();
    });

    /**
     * @tc.name   testRow_200
     * @tc.number testRow_200
     * @tc.desc   test Row direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_200',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_200] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_200 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual("Direction.Auto");
      console.info('testRow_200 END');
      done();
    });

    /**
     * @tc.name   testRow_300
     * @tc.number testRow_300
     * @tc.desc   test Row width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_300',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_300] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_300 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual("90.00%");
      console.info('testRow_300 END');
      done();
    });

    /**
     * @tc.name   testRow_400
     * @tc.number testRow_400
     * @tc.desc   test Row alignSelf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_400',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_400] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_400 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.alignSelf).assertEqual("ItemAlign.Auto");
      console.info('testRow_400 END');
      done();
    });

    /**
     * @tc.name   testRow_500
     * @tc.number testRow_500
     * @tc.desc   test Row height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_500',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_500] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_500 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.height).assertEqual("107.00vp");
      console.info('testRow_500 END');
      done();
    });

    /**
     * @tc.name   testRow_600
     * @tc.number testRow_600
     * @tc.desc   test Row borderStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRow_600',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRow_600] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('Row');
      let obj: ESObject = JSON.parse(strJson);
      console.info("testRow_600 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.borderStyle).assertEqual("BorderStyle.Solid");
      console.info('testRow_600 END');
      done();
    });
  })
}