/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextMarqueeOptionsTest() {
  describe('TextMarqueeOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMarqueeOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMarqueeOptionsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMarqueeOptionsTest state success " + JSON.stringify(pages));
        if (!('TextMarqueeOptionsTest' == pages.name)) {
          console.info('get TextMarqueeOptionsTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info('push TextMarqueeOptionsTest page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMarqueeOptionsTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   TextMarqueeOptionsTest001
     * @tc.number TextMarqueeOptionsTest001
     * @tc.desc   test marqueeOptions no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMarqueeOptionsTest001', Level.LEVEL2, async (done: Function) => {
      console.info('TextMarqueeOptionsTest001 START');
      await CommonFunc.sleep(1000);
      let strTextMarqueeOptions1 = getInspectorByKey('TextMarqueeOptionsTest1');
      console.log('TextMarqueeOptionsTest001'+ JSON.parse(JSON.parse(strTextMarqueeOptions1).$attrs.marqueeOptions).spacing)
      console.log('TextMarqueeOptionsTest001'+ JSON.parse(JSON.parse(strTextMarqueeOptions1).$attrs.marqueeOptions).updatePolicy)
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions1).$attrs.marqueeOptions).spacing).assertEqual('0.00px');
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions1).$attrs.marqueeOptions).updatePolicy).assertEqual('MarqueeUpdatePolicy.DEFAULT');
      console.info("[TextMarqueeOptionsTest001] end");
      done();
    });
    /**
     * @tc.name   TextMarqueeOptionsTest002
     * @tc.number TextMarqueeOptionsTest002
     * @tc.desc   test marqueeOptions set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMarqueeOptionsTest002', Level.LEVEL2, async (done: Function) => {
      console.info('TextMarqueeOptionsTest002 START');
      await CommonFunc.sleep(1000);
      let strTextMarqueeOptions2 = getInspectorByKey('TextMarqueeOptionsTest2');
      console.log('TextMarqueeOptionsTest002'+ JSON.parse(JSON.parse(strTextMarqueeOptions2).$attrs.marqueeOptions).spacing)
      console.log('TextMarqueeOptionsTest002'+ JSON.parse(JSON.parse(strTextMarqueeOptions2).$attrs.marqueeOptions).updatePolicy)
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions2).$attrs.marqueeOptions).spacing).assertEqual('0.00px');
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions2).$attrs.marqueeOptions).updatePolicy).assertEqual('MarqueeUpdatePolicy.DEFAULT');
      console.info("[TextMarqueeOptionsTest002] end");
      done();
    });
    /**
     * @tc.name   TextMarqueeOptionsTest003
     * @tc.number TextMarqueeOptionsTest003
     * @tc.desc   test marqueeOptions set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMarqueeOptionsTest003', Level.LEVEL2, async (done: Function) => {
      console.info('TextMarqueeOptionsTest003 START');
      await CommonFunc.sleep(1000);
      let strTextMarqueeOptions3 = getInspectorByKey('TextMarqueeOptionsTest3');
      console.log('TextMarqueeOptionsTest003'+ JSON.parse(JSON.parse(strTextMarqueeOptions3).$attrs.marqueeOptions).spacing)
      console.log('TextMarqueeOptionsTest003'+ JSON.parse(JSON.parse(strTextMarqueeOptions3).$attrs.marqueeOptions).updatePolicy)
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions3).$attrs.marqueeOptions).spacing).assertEqual('0.00px');
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions3).$attrs.marqueeOptions).updatePolicy).assertEqual('MarqueeUpdatePolicy.DEFAULT');
      console.info("[TextMarqueeOptionsTest003] end");
      done();
    });
    /**
     * @tc.name   TextMarqueeOptionsTest004
     * @tc.number TextMarqueeOptionsTest004
     * @tc.desc   test marqueeOptions spacing set 10vp  updatePolicy set PRESERVE_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMarqueeOptionsTest004', Level.LEVEL2, async (done: Function) => {
      console.info('TextMarqueeOptionsTest004 START');
      await CommonFunc.sleep(1000);
      let strTextMarqueeOptions4 = getInspectorByKey('TextMarqueeOptionsTest4');
      console.log('TextMarqueeOptionsTest004'+ JSON.parse(JSON.parse(strTextMarqueeOptions4).$attrs.marqueeOptions).spacing)
      console.log('TextMarqueeOptionsTest004'+ JSON.parse(JSON.parse(strTextMarqueeOptions4).$attrs.marqueeOptions).updatePolicy)
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions4).$attrs.marqueeOptions).spacing).assertEqual('10.00vp');
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions4).$attrs.marqueeOptions).updatePolicy).assertEqual('MarqueeUpdatePolicy.DEFAULT');
      console.info("[TextMarqueeOptionsTest004] end");
      done();
    });
    /**
     * @tc.name   TextMarqueeOptionsTest005
     * @tc.number TextMarqueeOptionsTest005
     * @tc.desc   test marqueeOptions spacing set 10px  updatePolicy set DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMarqueeOptionsTest005', Level.LEVEL2, async (done: Function) => {
      console.info('TextMarqueeOptionsTest005 START');
      await CommonFunc.sleep(1000);
      let strTextMarqueeOptions5 = getInspectorByKey('TextMarqueeOptionsTest5');
      console.log('TextMarqueeOptionsTest005'+ JSON.parse(JSON.parse(strTextMarqueeOptions5).$attrs.marqueeOptions).spacing)
      console.log('TextMarqueeOptionsTest005'+ JSON.parse(JSON.parse(strTextMarqueeOptions5).$attrs.marqueeOptions).updatePolicy)
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions5).$attrs.marqueeOptions).spacing).assertEqual('10.00px');
      expect(JSON.parse(JSON.parse(strTextMarqueeOptions5).$attrs.marqueeOptions).updatePolicy).assertEqual('MarqueeUpdatePolicy.PRESERVE_POSITION');
      console.info("[TextMarqueeOptionsTest005] end");
      done();
    });
  })
}