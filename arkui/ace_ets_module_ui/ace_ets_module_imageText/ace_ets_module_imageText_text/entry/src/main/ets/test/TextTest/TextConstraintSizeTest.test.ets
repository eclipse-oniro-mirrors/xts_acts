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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'
import events_emitter from '@ohos.events.emitter';

export default function TextConstraintSizeTest() {
  describe('TextConstraintSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextConstraintSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextConstraintSize state success " + JSON.stringify(pages));
        if (!("TextConstraintSize" == pages.name)) {
          console.info("get TextConstraintSize state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextConstraintSize page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextConstraintSize page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextConstraintSize after each called");
    });
    /**
     * @tc.name   testConstraintSize0001
     * @tc.number testConstraintSize0001
     * @tc.desc   test Text ConstraintSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConstraintSize0001', Level.LEVEL1, async (done: Function) => {
      console.info('TextConstraintSizeTest testConstraintSize0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('minWidthText');
      console.info("[testConstraintSize0001] component constraintSize strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info('[testConstraintSize0001] constraintSize value :' + JSON.parse(JSON.parse(strJson).$attrs.constraintSize).minWidth);
      expect(JSON.parse(JSON.parse(strJson).$attrs.constraintSize).minWidth).assertEqual('200.00vp');
      console.info("[testConstraintSize0001] constraintSize value :" + JSON.parse(strJson).$attrs.constraintSize);
      done();
    });
  })
}
