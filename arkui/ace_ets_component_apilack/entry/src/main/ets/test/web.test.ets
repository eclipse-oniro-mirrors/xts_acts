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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function webGetTitleJsunit() {
  describe('webGetTitleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/web',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get web state success " + JSON.stringify(pages));
        if (!("web" == pages.name)) {
          console.info("get web state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push web page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push web page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("webGetTitle after each called");
    });

    /**
     * @tc.name   testwebGetTitle0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testwebGetTitle0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0001', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0001] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("500.00vp");
      console.info("[testwebGetTitle0001] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testwebGetTitle0002
     * @tc.number testwebGetTitle0002
     * @tc.desc   testwebGetTitle0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0002', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0002] component fileAccess strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.fileAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0002] fileAccess value :" + JSON.parse(strJson).$attrs.fileAccess);

    });

    /**
     * @tc.name   testwebGetTitle0003
     * @tc.number testwebGetTitle0003
     * @tc.desc   testwebGetTitle0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0003', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0003] component javaScriptAccess strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.javaScriptAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0003] javaScriptAccess value :" + JSON.parse(strJson).$attrs.javaScriptAccess);

    });

    /**
     * @tc.name   testwebGetTitle0004
     * @tc.number testwebGetTitle0004
     * @tc.desc   testwebGetTitle0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0004', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0004] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("20.00vp");
      console.info("[testwebGetTitle0004] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testwebGetTitle0005
     * @tc.number testwebGetTitle0005
     * @tc.desc   testwebGetTitle0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0005', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0005] component blur strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.blur).assertEqual(2);
      console.info("[testwebGetTitle0005] blur value :" + JSON.parse(strJson).$attrs.blur);

    });

    /**
     * @tc.name   testwebGetTitle0006
     * @tc.number testwebGetTitle0006
     * @tc.desc   testwebGetTitle0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0006', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0006] component userAgent strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.userAgent).assertEqual(undefined);
      console.info("[testwebGetTitle0006] userAgent value :" + JSON.parse(strJson).$attrs.userAgent);

    });

    /**
     * @tc.name   testwebGetTitle0007
     * @tc.number testwebGetTitle0007
     * @tc.desc   testwebGetTitle0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0007', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0007] component fileFromUrlAccess strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.fileFromUrlAccess).assertEqual(undefined);
      console.info("[testwebGetTitle0007] fileFromUrlAccess value :" + JSON.parse(strJson).$attrs.fileFromUrlAccess);

    });

    /**
     * @tc.name   testwebGetTitle0008
     * @tc.number testwebGetTitle0008
     * @tc.desc   testwebGetTitle0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0008', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0008 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0008] component initialScale strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      expect(JSON.parse(strJson).$attrs.initialScale).assertEqual(undefined);
      console.info("[testwebGetTitle0008] initialScale value :" + JSON.parse(strJson).$attrs.initialScale);

    });

    /**
     * @tc.name   testwebGetTitle0009
     * @tc.number testwebGetTitle0009
     * @tc.desc   testwebGetTitle0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testwebGetTitle0009', Level.LEVEL0, async () => {
      console.info('webGetTitle testwebGetTitle0009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle0009] component strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Web');
      console.info("[testwebGetTitle0009] type value :" + obj.$type);

    });
  })
}
