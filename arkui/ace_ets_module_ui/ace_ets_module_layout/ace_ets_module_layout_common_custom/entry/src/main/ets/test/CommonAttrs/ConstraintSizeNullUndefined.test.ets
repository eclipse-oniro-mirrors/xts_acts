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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function ConstraintSizeNullUndefinedTest() {
  describe('ConstraintSizeNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ConstraintSizeNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/ConstraintSizeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ConstraintSizeNullUndefined state success " + JSON.stringify(pages));
        if (!("ConstraintSizeNullUndefined" == pages.name)) {
          console.info("get ConstraintSizeNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ConstraintSizeNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConstraintSizeNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   ConstraintSizeNullUndefinedTest_0100
     * @tc.number ConstraintSizeNullUndefinedTest_0100
     * @tc.desc   test constraintSize with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConstraintSizeNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ConstraintSizeNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('ConstraintSizeNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ConstraintSizeNullUndefinedTest_0100] obj.$attrs.constraintSize:' + obj.$attrs.constraintSize);
      expect(JSON.parse(obj.$attrs.constraintSize).minWidth).assertEqual("0.00vp");
      expect(JSON.parse(obj.$attrs.constraintSize).minHeight).assertEqual("0.00vp");
      expect(JSON.parse(obj.$attrs.constraintSize).maxWidth).assertEqual("Infinityvp");
      expect(JSON.parse(obj.$attrs.constraintSize).maxHeight).assertEqual("Infinityvp");
      console.info('ConstraintSizeNullUndefinedTest_0100 END');
      done();
    });

        /**
     * @tc.name   ConstraintSizeNullUndefinedTest_0200
     * @tc.number ConstraintSizeNullUndefinedTest_0200
     * @tc.desc   test constraintSize with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConstraintSizeNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ConstraintSizeNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('ConstraintSizeNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ConstraintSizeNullUndefinedTest_0200] obj.$attrs.constraintSize:' + obj.$attrs.constraintSize);
      expect(JSON.parse(obj.$attrs.constraintSize).minWidth).assertEqual("0.00vp");
      expect(JSON.parse(obj.$attrs.constraintSize).minHeight).assertEqual("0.00vp");
      expect(JSON.parse(obj.$attrs.constraintSize).maxWidth).assertEqual("Infinityvp");
      expect(JSON.parse(obj.$attrs.constraintSize).maxHeight).assertEqual("Infinityvp");
      console.info('ConstraintSizeNullUndefinedTest_0200 END');
      done();
    });
  })
}

