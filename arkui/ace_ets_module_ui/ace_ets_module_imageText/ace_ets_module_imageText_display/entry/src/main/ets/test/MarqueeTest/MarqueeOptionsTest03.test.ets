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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';

export default function MarqueeOptionsTest03() {
  describe('MarqueeOptionsTest03', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeOptionsTest03 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Marquee/MarqueeOptionsTest03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarqueeOptionsTest03 state pages:" + JSON.stringify(pages));
        if (!("MarqueeOptionsTest03" == pages.name)) {
          console.info("get MarqueeOptionsTest03 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MarqueeOptionsTest03 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarqueeOptionsTest03 page error:" + err);
      }
      console.info("MarqueeOptionsTest03 beforeEach end");
      done();
    });
    afterEach(async () => {
    });
    
    /**
     * @tc.name   MarqueeOptionsTest03_0010
     * @tc.number MarqueeOptionsTest03_0010
     * @tc.desc   test MarqueeOptions  spacing delay not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0010', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0010 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest1] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest1] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual('undefined');
      expect(obj.$attrs.delay).assertEqual(0);
      console.info('MarqueeOptionsTest03_0010 END');
      done();
    });

    /**
     * @tc.name   MarqueeOptionsTest03_0020
     * @tc.number MarqueeOptionsTest03_0020
     * @tc.desc   test MarqueeOptions  spacing delay  set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0020', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0020 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest2] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest2] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual('undefined');
      expect(obj.$attrs.delay).assertEqual(0);
      console.info('MarqueeOptionsTest03_0020 END');
      done();
    });

    /**
     * @tc.name   MarqueeOptionsTest03_0030
     * @tc.number MarqueeOptionsTest03_0030
     * @tc.desc   test MarqueeOptions  spacing delay  set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0030', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0030 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest3] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest3] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual('undefined');
      expect(obj.$attrs.delay).assertEqual(0);
      console.info('MarqueeOptionsTest03_0030 END');
      done();
    });

    /**
     * @tc.name   MarqueeOptionsTest03_0040
     * @tc.number MarqueeOptionsTest03_0040
     * @tc.desc   test MarqueeOptions  spacing delay  set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0040', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0040 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest4] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest4] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual("10.00vp");
      expect(obj.$attrs.delay).assertEqual(1);
      console.info('MarqueeOptionsTest03_0040 END');
      done();
    });

    /**
     * @tc.name   MarqueeOptionsTest03_0050
     * @tc.number MarqueeOptionsTest03_0050
     * @tc.desc   test MarqueeOptions  spacing delay  set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0050', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0050 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest5] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest5] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual("10.00px");
      expect(obj.$attrs.delay).assertEqual(0);
      console.info('MarqueeOptionsTest03_0050 END');
      done();
    });

    /**
     * @tc.name   MarqueeOptionsTest03_0060
     * @tc.number MarqueeOptionsTest03_0060
     * @tc.desc   test MarqueeOptions  spacing delay  set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MarqueeOptionsTest03_0060', Level.LEVEL0, async (done: Function) => {
      console.info('MarqueeOptionsTest03_0060 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('marqueeOptionsTest6');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[marqueeOptionsTest6] component obj is: ' + JSON.stringify(obj.$attrs.spacing));
      console.info('[marqueeOptionsTest6] component obj is: ' + JSON.stringify(obj.$attrs.delay));
      expect(obj.$attrs.spacing).assertEqual("undefined");
      expect(obj.$attrs.delay).assertEqual(0);
      console.info('MarqueeOptionsTest03_0060 END');
      done();
    });
  })
}